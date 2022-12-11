<?php

namespace App\Http\Livewire\Admin\Website\Address;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Website\Address;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $address_id;

    public function deleteRecord($address_id)
    {
        $this->address_id = $address_id;
    }

    public function destroyRecord()
    {
        $addresses =  Address::find($this->address_id);
        $addresses->is_delete = '0';
        $addresses->update();

        return redirect('admin/website/addresses')->with('message','Address Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $addresses = Address::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.address.index', compact('addresses'));
    }
}
