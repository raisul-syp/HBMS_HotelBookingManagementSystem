<?php

namespace App\Http\Livewire\Admin\Permission;

use Livewire\Component;
use Livewire\WithPagination;
use Spatie\Permission\Models\Permission;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $permission_id;

    public function deleteRecord($permission_id)
    {
        $this->permission_id = $permission_id;
    }

    public function destroyRecord()
    {
        $permission = Permission::find($this->permission_id);
        // $permission->is_delete = '0';
        // $permission->update();
        $permission->delete();
        return redirect('admin/role-permission/permission')->with('message','Permission Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $permissions = Permission::all();
        // $serialNo = ($roles->perPage() * ($roles->currentPage() - 1)) + 1;
        $serialNo = 1;
        return view('livewire.admin.permission.index', compact('permissions', 'serialNo'));
    }
}
