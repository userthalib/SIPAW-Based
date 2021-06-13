<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTblPengaduan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_pengaduan', function (Blueprint $table) {
            $table->increments('id_pengaduan');
            $table->date('tanggal_pengaduan');
            $table->string('nik_id');
            $table->text('isi_laporan');
            $table->string('foto');
            $table->enum('status', ['terkirim', 'proses','selesai']);
            // $table->foreign('nik_id')->references('nik')->on('tbl_mahasiswa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_pengaduan');
    }
}
