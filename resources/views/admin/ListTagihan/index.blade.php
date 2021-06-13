@extends('admin/layout.master')

@section('title','Transaksi')
@section('title2','index')
@section('transaksi','active')

 @section('konten')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 offset-1">
                <a href="/tambah" class="btn btn-danger px-3 mb-2">Tambah Transaksi</a>
                <div class="card">
                    <div class="row">
                        @foreach ($data as $item)
                        <div class="col-md-2">
                            <img src="{{ asset('Gambar/nonimage.jpg') }}" alt="nonimg" width="130px" class="p-3">
                        </div>
                        <div class="col-md-5 pt-4">
                            <span class="text-dark">{{ $item->atas_nama }} |</span>  
                            @if ($item->status == 'belum')
                            <span class="text-danger">belum dibayar</span>
                            @else
                            <span class="text-success">sudah dibayar</span>
                            @endif<br>
                            <span class="text-danger">Rp {{ $item->nominal }}</span>
                        </div>
                        <div class="col-md-1 offset-3 ">
                            @if ($item->status == 'sudah')
                            <a href="{{ route('payment',$item->id_transaksi) }}" class="btn btn-success mt-5 px-4">Detail</a>
                            @else
                            <a href="{{ route('payment',$item->id_transaksi) }}" class="btn btn-danger mt-5 px-4">Bayar</a>  
                            @endif
                        </div>
                        @endforeach
                        {{ $data->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection
