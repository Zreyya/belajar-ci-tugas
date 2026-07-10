<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\TransactionModel;
use App\Models\TransactionDetailModel;

class PembelianController extends BaseController
{
    protected $transactionModel;
    protected $transactionDetailModel;

    public function __construct()
    {
        $this->transactionModel = new TransactionModel();
        $this->transactionDetailModel = new TransactionDetailModel();
        helper(['number', 'form', 'url']);
    }

    public function index()
    {
        // Proteksi: Hanya admin yang boleh akses
        if (session()->get('role') != 'admin') {
            return redirect()->to(base_url())->with('error', 'Akses ditolak!');
        }

        $transactions = $this->transactionModel->findAll();
        
        // Mengambil ID dari semua transaksi yang ada
        $transactionIds = array_column($transactions, 'id');
        
        // Mengambil detail produk berdasarkan ID transaksi
        $products = [];
        if (!empty($transactionIds)) {
            $products = $this->transactionDetailModel->getProductsByTransactionIds($transactionIds);
        }

        $data = [
            'transactions' => $transactions,
            'products'     => $products
        ];

        return view('v_pembelian', $data);
    }

    // Fungsi untuk toggle status pesanan
    public function ubah_status($id)
    {
        if (session()->get('role') != 'admin') {
            return redirect()->to(base_url());
        }

        // Cari transaksi berdasarkan ID
        $transaksi = $this->transactionModel->find($id);
        
        if ($transaksi) {
            // Jika status 0 (Belum Selesai), ubah jadi 1. Jika 1, ubah jadi 0.
            $statusBaru = ($transaksi['status'] == 0) ? 1 : 0;
            
            $this->transactionModel->save([
                'id'     => $id,
                'status' => $statusBaru
            ]);
            
            return redirect()->to(base_url('pembelian'))->with('success', 'Status pesanan berhasil diubah!');
        }

        return redirect()->to(base_url('pembelian'));
    }
}