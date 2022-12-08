<?php

namespace App\Http\Livewire\Admin\Website\Page;

use Livewire\Component;
use App\Models\Website\Page;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $page_id;

    public function deleteRecord($page_id)
    {
        $this->page_id = $page_id;
    }

    public function destroyRecord()
    {
        $pages =  Page::find($this->page_id);
        $pages->is_delete = '0';
        $pages->update();

        return redirect('admin/website/pages')->with('message','Page Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }

    public function render()
    {
        $pages = Page::where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        // return view('livewire.admin.website.page.index', ['pages' => $pages]);
        return view('livewire.admin.website.page.index', compact('pages'));
    }
}
