<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PDF;

class TagihanController extends Controller
{
    // Halaman depan list
    public function index()
    {
        $data = DB::table('transaksis')->paginate(10);
        return view('admin.ListTagihan.index', ['data' => $data]);
    }

    // Tambah tagihan
    public function store(Request $request)
    {
        $now = date('Y-m-d');
        $count = DB::table('transaksis')->count();
        $no = $count + 1;
        DB::table('transaksis')->insert([
            'tgl_tagihan' => $now,
            'atas_nama' => $request->nama,
            'no_pembayaran' => $no,
            'jenis_pembayaran' => $request->jenis,
            'nominal' => $request->nominal,
            'status' => 'belum'
        ]);

        return redirect('/list')->with('message', 'Data berhasil ditambahakan');
    }

    // bayar
    public function payment($id)
    {
        $data = DB::table('transaksis')->where('id_transaksi', $id)->first();
        $payment = DB::table('payments')->where('transaksi_id', $id)->first();
        return view('admin.ListTagihan.payment', ['data' => $data, 'payment' => $payment]);
    }

    // proses bayar
    public function bayar(Request $request, $id)
    {
        DB::table('transaksis')->where('id_transaksi', $id)->update([
            'status' => 'sudah'
        ]);
        $tran = DB::table('transaksis')->where('id_transaksi', $id)->first();
        $get = DB::table('payments')->count();
        $count = $get + 1;
        $code = 'PYM' . $count;
        $now = date('Y-m-d');
        $kembalian = $request->jumlah_pembayaran - $tran->nominal;
        DB::table('payments')->insert([
            'noPayment' => $code,
            'tglPayment' => $now,
            'transaksi_id' => $id,
            'bayar' => $request->jumlah_pembayaran,
            'kembalian' => $kembalian
        ]);
        return redirect('/list')->with('message', 'berhasil melakukan pembayaran');
    }

    // invoice
    public function invoice($id)
    {
        $data = DB::table('transaksis')->where('id_transaksi', $id)->first();
        $payment = DB::table('payments')->where('transaksi_id', $id)->first();
        $pdf = PDF::loadview('admin.ListTagihan.invoice', ['data' => $data, 'payment' => $payment]);
        return $pdf->stream('struk-pdf');
    }
}
