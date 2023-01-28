<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
    public function index()
    {
        return view('admin.permission.index');
    }

    public function create()
    {
        return view('admin.permission.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:100|unique:permissions',
            'group_name' => 'required|max:100',
        ]);

        Permission::create([
            'name' => $request->name,
            'group_name' => $request->group_name,
            'is_active' => $request->is_active == true ? '1':'0',
            'created_by' => $request->created_by,
        ]);

        return redirect('admin/role-permission/permission')->with('message','Congratulations! New Permission Has Been Created Successfully.');
    }

    public function edit(Permission $permission)
    {
        return view('admin.permission.edit', compact('permission'));
    }

    public function update(Request $request, $permission)
    {
        $request->validate([
            'name' => 'required|max:100|unique:permissions,name,'.$permission,
            'group_name' => 'required|max:100',
        ]);

        $permission = Permission::findOrFail($permission);

        $permission->update([
            'name' => $request->name,
            'group_name' => $request->group_name,
            'is_active' => $request->is_active == true ? '1':'0',
            'updated_by' => $request->updated_by,
        ]);

        return redirect('admin/role-permission/permission')->with('message','Congratulations! New Permission Has Been Updated Successfully.');
    }
}
