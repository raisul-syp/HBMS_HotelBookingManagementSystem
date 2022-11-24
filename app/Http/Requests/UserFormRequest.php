<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules;

class UserFormRequest extends FormRequest
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
            'first_name' => [
                'required',
                'string',
                'max:255'
            ],
            'last_name' => [
                'required',
                'string',
                'max:255'
            ],
            'email' => [
                'required',
                'string',
                'email',
                'max:255',
                'unique:users'
            ],
            'password' => [
                'required',
                'string',
                'min:8',
                'confirmed',
                Rules\Password::defaults()
            ],
            'gender' => [
                'nullable',
            ],
            'date_of_birth' => [
                'nullable',
            ],
            'phone' => [
                'nullable',
            ],
            'address' => [
                'nullable',
            ],
            'city' => [
                'nullable',
            ],
            'state' => [
                'nullable',
            ],
            'postal_code' => [
                'nullable',
            ],
            'country' => [
                'nullable',
            ],
            'admin_comment' => [
                'nullable',
            ],
            'profile_photo' => [
                'nullable',
            ],
            'cover_photo' => [
                'nullable',
            ],
            'created_by' => [
                'nullable',
            ],
            'role_as' => [
                'nullable',
            ],
        ];
    }
}
