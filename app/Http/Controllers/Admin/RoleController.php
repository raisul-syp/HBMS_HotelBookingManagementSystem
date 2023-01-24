<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\Controller;

class RoleController extends Controller
{
    public function index()
    {
        return view('admin.role.index');
    }

    public function create()
    {
        $permissions = Permission::all();
        return view('admin.role.create', compact('permissions'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100|unique:roles',
        ]);

        $role = Role::create([
            'name' => $request->name,
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
            'name' => 'required|max:100|unique:roles',
        ]);

        $role = Role::findOrFail($role);

        $role->update([
            'name' => $request->name,
        ]);

        return redirect('admin/role-permission/role')->with('message','Congratulations! New Role Has Been Updated Successfully.');
    }
}
