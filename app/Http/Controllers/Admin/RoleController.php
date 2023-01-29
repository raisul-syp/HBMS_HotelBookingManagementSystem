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
        $all_permissions = Permission::all();
        $permission_groups = Admin::getPermissionGroups();
        return view('admin.role.create', compact('all_permissions', 'permission_groups'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100|unique:roles',
        ]);

        $role = Role::create([
            'name' => $request->name,
            'guard_name' => 'admin',
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
        $all_permissions = Permission::all();
        $permission_groups = Admin::getPermissionGroups();
        return view('admin.role.edit', compact('role', 'all_permissions', 'permission_groups'));
    }

    public function update(Request $request, $role)
    {
        $request->validate([
            'name' => 'required|max:100|unique:roles,name,'.$role,
        ]);

        $role = Role::findOrFail($role);

        $role->update([
            'name' => $request->name,
            'guard_name' => 'admin',
            'is_active' => $request->is_active == true ? '1':'0',
            'updated_by' => $request->updated_by,
        ]);

        $permission = $request->input('permissions');

        if(!empty($permission)) {
            $role->syncPermissions($permission);
        }

        return redirect('admin/role-permission/role')->with('message','Congratulations! New Role Has Been Updated Successfully.');
    }
}
