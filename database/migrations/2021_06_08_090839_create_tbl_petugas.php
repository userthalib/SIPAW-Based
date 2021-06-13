<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblPetugas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_petugas', function (Blueprint $table) {
            $table->increments('id_petugas');
            $table->string('nama_petugas');
            $table->string('username');
            $table->string('password');
            $table->string('telp')->nullable();
            $table->enum('status', ['admin', 'petugas']);
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
        Schema::dropIfExists('tbl_petugas');
    }
}
