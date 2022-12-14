<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHbWebtestimonialsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hb_webtestimonials', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('designation')->nullable();
            $table->string('company')->nullable();
            $table->mediumText('message');
            $table->string('image')->nullable();
            $table->string('slug')->nullable();
            $table->unsignedBigInteger('hotel_id');
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
        Schema::dropIfExists('hb_webtestimonials');
    }
}