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
        // $path = 'uploads/facilities/'.$facility->image;
        // if(File::exists($path)){
        //     File::delete($path);
        // }
        // $facility->delete();
        $users->is_delete = '0';
        $users->update();
        // session()->flash('message','Facility Has Been Deleted Successfully.');
        return redirect('admin/user')->with('message','User Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function passwordRecord($user_id)
    {
        $this->user_id = $user_id;
    }

    public function changePassword(Request  $request)
    {
        $users = Admin::find($this->user_id);

        $request->validate([
            'old_password' => [
                'required',
                'string',
                'min:8',
            ],
            'new_password' => [
                'required',
                'string',
                'min:8',
                'confirmed',
            ],
        ]);

        $oldPasswordStatus = Hash::check($request->old_password, $users);
        if($oldPasswordStatus){
            $users->new_password = $request->new_password;
            $users->update();

            return redirect('admin/user')->with('message','Congratulations! Password Has Been Changed.');
            $this->dispatchBrowserEvent('close-modal');
        }
        else{
            return redirect('admin/user')->with('message','Sorry! Failed.');
        }
    }

    public function render()
    {
        $users = Admin::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.user.index',['users' => $users]);
    }
}
