<?php

namespace App\Http\Livewire\Admin\Guest;

use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $guest_id;

    public function deleteRecord($guest_id)
    {
        $this->guest_id = $guest_id;
    }

    public function destroyRecord()
    {
        $guests =  User::find($this->guest_id);
        $guests->is_delete = '0';
        $guests->update();
        return redirect('admin/guest')->with('message','Guest Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $guests = User::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        $serialNo = ($guests->perPage() * ($guests->currentPage() - 1)) + 1;
        return view('livewire.admin.guest.index', compact('guests', 'serialNo'));
    }
}
