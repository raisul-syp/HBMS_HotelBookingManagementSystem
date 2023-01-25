<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    public function index()
    {
        return view('admin.role.index');
    }

    public function create()
    {
        $permissions = Permission::all();
        $permission_groups = Admin::getPermissionGroups();
        // $permission_groups = DB::table('permissions')->select('group_name')->groupBy('group_name')->get();
        return view('admin.role.create', compact('permissions', 'permission_groups'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100|unique:roles',
        ]);

        $role = Role::create([
            'name' => $request->name,
            'is_active' => $request->is_active == true ? '1':'0',
            'created_by' => $request->created_by,
        ]);

        $permission = $request->input('permissions');

        if(!empty($permission)) {
            $role->syncPermissions($permission);
        }

        return redirect('admin/role-permission/role')->with('message','Congratulations! New Role Has Been Created Successfully.');
    }

    public function edit(Role $role)
    {
        return view('admin.role.edit', compact('role'));
    }

    public function update(Request $request, $role)
    {
        $request->validate([
            'name' => 'required|max:100',
        ]);

        $role = Role::findOrFail($role);

        $role->update([
            'name' => $request->name,
            'is_active' => $request->is_active == true ? '1':'0',
            'updated_by' => $request->updated_by,
        ]);

        return redirect('admin/role-permission/role')->with('message','Congratulations! New Role Has Been Updated Successfully.');
    }
}
