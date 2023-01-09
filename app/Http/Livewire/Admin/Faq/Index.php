<?php

namespace App\Http\Livewire\Admin\Faq;

use App\Models\Faq;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $faq_id;

    public function deleteRecord($faq_id)
    {
        $this->faq_id = $faq_id;
    }

    public function destroyRecord()
    {
        $faq =  Faq::find($this->faq_id);
        $faq->is_delete = '0';
        $faq->update();
        return redirect('admin/faq')->with('message','FAQ Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $faqs = Faq::where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        $serialNo = ($faqs->perPage() * ($faqs->currentPage() - 1)) + 1;
        return view('livewire.admin.faq.index', compact('faqs', 'serialNo'));
    }
}
