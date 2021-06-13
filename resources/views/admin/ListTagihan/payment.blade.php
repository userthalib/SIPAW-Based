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
                        <h5><span class="text-dark">{{ $data->atas_nama }} | </span>
                            @if ($data->status == 'belum')
                            <span class="text-danger">BELUM DI BAYAR</span>
                            @else
                            <span class="text-success">SUDAH DI BAYAR</span>
                            @endif
                        </h5>
                        <form action="{{ route('bayar',$data->id_transaksi) }}" method="POST" class="row">
                        @csrf
                        <div class="col-md-6 mt-3">
                                <label class="text-dark" for="">No Pembayaran</label>
                                <input type="text" value="{{ $data->no_pembayaran }}" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 mt-3"></div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Jenis Pembayaran</label>
                            <input type="text" value="{{ $data->jenis_pembayaran }}" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Nominal</label>
                            <input type="number" id="total" name="total_bayar" value="{{ $data->nominal }}" class="form-control" disabled>
                        </div>
                        @if ($payment == '')
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">bayar</label>
                            <input name="jumlah_pembayaran" onkeyup="hitung()" id="jumlah_pembayaran" type="number" class="form-control" placeholder="Masukan nominal disini...">
                        </div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Kembalian</label>
                            <input type="text" name="kembalian" id="kembalian" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 mt-3">
                            <button class="btn btn-danger px-5" type="submit">Bayar</button>
                            <a href="/list" class="btn btn-secondary px-4 ml-3">Kembali</a>
                        </div>
                        @else
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">bayar</label>
                            <input name="jumlah_pembayaran" value="{{ $payment->bayar }}" onkeyup="hitung()" id="jumlah_pembayaran" type="number" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 mt-3">
                            <label class="text-dark" for="">Kembalian</label>
                            <input type="text" value="{{ $payment->kembalian }}" name="kembalian" id="kembalian" class="form-control" disabled>
                        </div>
                        <div class="col-md-6 mt-3">
                            <a target="_blank" href="{{ route('invoice',$data->id_transaksi) }}" class="btn btn-success px-5">Invoice</a>
                            <a href="/list" class="btn btn-secondary px-4 ml-3">Kembali</a>
                        </div>
                        @endif
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection