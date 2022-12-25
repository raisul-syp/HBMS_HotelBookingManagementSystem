<?php

namespace App\Http\Livewire\Admin\User;

use App\Models\Admin;
use Livewire\Component;
use Illuminate\Http\Request;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Hash;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $user_id;

    public function deleteRecord($user_id)
    {
        $this->user_id = $user_id;
    }

    public function destroyRecord()
    {
        $users =  Admin::find($this->user_id);
        $users->is_delete = '0';
        $users->update();
        return redirect('admin/user')->with('message','User Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $users = Admin::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.user.index', compact('users'));
    }
}
