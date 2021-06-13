<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblTanggapan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_tanggapan', function (Blueprint $table) {
            $table->increments('id_tanggapan');
            $table->integer('pengaduan_id');
            $table->text('tanggapan');
            $table->integer('petugas_id');
            $table->date('tgl_tanggapan');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_tanggapan');
    }
}
