<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHbRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hb_rooms', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('hotel_id');
            $table->string('slug');
            $table->mediumText('short_description');
            $table->longText('long_description')->nullable();
            $table->integer('max_adults')->nullable();
            $table->integer('max_childs')->nullable();
            $table->integer('quantity')->nullable();
            $table->integer('price')->nullable();

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
        Schema::dropIfExists('hb_rooms');
    }
}
