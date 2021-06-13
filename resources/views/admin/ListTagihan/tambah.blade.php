@extends('admin/layout.master')

@section('title','Transaksi')
@section('title2','index')
@section('transaksi','active')

    @section('konten')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 offset-1">
                <div class="card">
                    <div class="card-body">
                        <form action="/store_tagihan" method="POST" class="row">
                        @csrf
                        <div class="col-md-6 mt-3">
                                <label class="text-dark" for="">Nama</label>
                                <input name="nama" type="text" class="form-control" >
                        </div>
                        <div class="col-md-6 mt-3"></div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Jenis Pembayaran</label>
                            <input name="jenis" type="text" class="form-control" >
                        </div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Nominal</label>
                            <input name="nominal" type="number" class="form-control" >
                        </div>
                        <div class="col-md-6"><br>
                            <button class="btn btn-danger px-3" type="submit">Submit</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @endsection