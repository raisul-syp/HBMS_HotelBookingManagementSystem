<?php

namespace App\Http\Livewire\Admin\Website\Testimonial;

use App\Models\Website\Testimonial;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';

    public $testimonial_id;

    public function deleteRecord($testimonial_id)
    {
        $this->testimonial_id = $testimonial_id;
    }

    public function destroyRecord()
    {
        $testimonials =  Testimonial::find($this->testimonial_id);
        $testimonials->is_delete = '0';
        $testimonials->update();

        return redirect('admin/website/testimonials')->with('message','Testimonial Has Been Deleted Successfully.');
        $this->dispatchBrowserEvent('close-modal');
    }
    
    public function render()
    {
        $testimonials = Testimonial::where('is_active','1')->where('is_delete','1')->orderBy('id','ASC')->paginate(10);
        return view('livewire.admin.website.testimonial.index', ['testimonials' => $testimonials]);
    }
}
