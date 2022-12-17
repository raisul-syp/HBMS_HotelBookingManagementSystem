<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHbSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hb_settings', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('hotel_id');
            $table->string('phone');
            $table->string('email');
            $table->string('address');
            $table->string('google_map')->nullable();
            $table->string('phone_sales')->nullable();
            $table->string('phone_reservation')->nullable();
            $table->string('email_sales')->nullable();
            $table->string('email_reservation')->nullable();
            $table->string('logo')->nullable();
            $table->string('icon')->nullable();
            $table->string('social_fb')->nullable();
            $table->string('social_tw')->nullable();
            $table->string('social_insta')->nullable();
            $table->string('social_yt')->nullable();
            $table->string('display_order')->nullable();

            $table->string('meta_title');
            $table->string('meta_keyword');
            $table->mediumText('meta_decription')->nullable();

            $table->tinyInteger('is_active')->default('1')->comment('0=Deactive, 1=Active');
            $table->tinyInteger('is_delete')->default('1')->comment('0=Delete, 1=Not Delete');
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();

            $table->foreign('hotel_id')->references('id')->on('hb_hotels')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hb_settings');
    }
}