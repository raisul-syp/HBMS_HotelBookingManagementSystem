<?php

namespace App\Http\Livewire\Admin\Role;

use Livewire\Component;
use Livewire\WithPagination;
use Spatie\Permission\Models\Role;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $role_id;

    public function deleteRecord($role_id)
    {
        $this->role_id = $role_id;
    }

    public function destroyRecord()
    {
        $role = Role::find($this->role_id);
        // $role->is_delete = '0';
        // $role->update();
        $role->delete();
        return redirect('admin/role-permission/role')->with('message','Role Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $roles = Role::all();
        // $serialNo = ($roles->perPage() * ($roles->currentPage() - 1)) + 1;
        $serialNo = 1;
        return view('livewire.admin.role.index', compact('roles', 'serialNo'));
    }
}
