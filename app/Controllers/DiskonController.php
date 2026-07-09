<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\DiscountModel;

class DiskonController extends BaseController
{
    protected $discountModel;

    public function __construct()
    {
        $this->discountModel = new DiscountModel();
        helper(['form', 'url']);
    }

    //READ: Menampilkan halaman utama Diskon
    public function index()
    {
        // Proteksi: Hanya bisa diakses jika role = admin
        if (session()->get('role') != 'admin') {
            return redirect()->to(base_url())->with('error', 'Akses ditolak! Hanya admin yang dapat mengakses menu ini.');
        }

        $data = [
            'discounts' => $this->discountModel->findAll(),
            'validation' => \Config\Services::validation() // Untuk menampilkan pesan error validasi
        ];

        return view('v_discount', $data);
    }

    //CREATE: Menyimpan data baru
    public function create()
    {
        // 1. Aturan Validasi: Tanggal wajib diisi & harus unik di tabel 'discounts'
        $rules = [
            'tanggal' => [
                'rules'  => 'required|is_unique[discounts.tanggal]',
                'errors' => [
                    'required'  => 'Tanggal wajib diisi.',
                    'is_unique' => 'The tanggal field must contain a unique value.'
                ]
            ],
            'nominal' => 'required|numeric'
        ];

        // 2. Jika validasi GAGAL
        if (!$this->validate($rules)) {
            return redirect()->to('diskon')->withInput()->with('validation', $this->validator);
        }

        // 3. Jika validasi BERHASIL, simpan ke database
        $this->discountModel->save([
            'tanggal' => $this->request->getPost('tanggal'),
            'nominal' => $this->request->getPost('nominal')
        ]);

        return redirect()->to('diskon')->with('success', 'Data diskon berhasil ditambahkan.');
    }

    //UPDATE: Mengubah nominal diskon
    public function update($id)
    {
        $this->discountModel->save([
            'id'      => $id,
            'nominal' => $this->request->getPost('nominal')
        ]);

        return redirect()->to('diskon')->with('success', 'Data diskon berhasil diubah.');
    }

    //DELETE: Menghapus data diskon
    public function delete($id)
    {
        $this->discountModel->delete($id);
        return redirect()->to('diskon')->with('success', 'Data diskon berhasil dihapus.');
    }
}