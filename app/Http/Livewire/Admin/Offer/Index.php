<?php

namespace App\Http\Livewire\Admin\Offer;

use App\Models\Offer;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $offer_id;

    public function deleteRecord($offer_id)
    {
        $this->offer_id = $offer_id;
    }

    public function destroyRecord()
    {
        $offer =  Offer::find($this->offer_id);
        $offer->is_delete = '0';
        $offer->update();
        return redirect('admin/offer')->with('message','Offer Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $offers = Offer::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        $serialNo = ($offers->perPage() * ($offers->currentPage() - 1)) + 1;
        return view('livewire.admin.offer.index', compact('offers', 'serialNo'));
    }
}
