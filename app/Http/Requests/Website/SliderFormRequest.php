<?php

namespace App\Http\Requests\Website;

use Illuminate\Foundation\Http\FormRequest;

class SliderFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => [
                'required',
                'string'
            ],
            'url' => [
                'nullable'
            ],
            'desktop_image' => [
                'string',
                'mimes:jpg,jpeg,png'
            ],
            'mobile_image' => [
                'string',
                'mimes:jpg,jpeg,png'
            ],
            'content_1' => [
                'required',
                'string'
            ],
            'content_2' => [
                'required',
                'string'
            ],
            'content_3' => [
                'required',
                'string'
            ],
            'content_4' => [
                'nullable'
            ],
            'content_5' => [
                'nullable'
            ],
            'button_1' => [
                'required',
                'string'
            ],
            'button_2' => [
                'nullable'
            ],
            'button_1_url' => [
                'required',
                'string'
            ],
            'button_2_url' => [
                'nullable'
            ],
            'meta_title' => [
                'required',
                'string'
            ],
            'meta_keyword' => [
                'required',
                'string'
            ],
            'meta_decription' => [
                'nullable'
            ],
            'created_by' => [
                'nullable'
            ],
            'updated_by' => [
                'nullable'
            ],
        ];
    }
}
