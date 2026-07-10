<?php

namespace App\Controllers\Api;

use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\API\ResponseTrait;

class DiscountController extends ResourceController
{
    use ResponseTrait;

    // Menghubungkan langsung ke Model Diskon
    protected $modelName = 'App\Models\DiscountModel';
    protected $format    = 'json';

    // 1. GET: Menampilkan semua data diskon (Read)
    public function index()
    {
        $data = $this->model->findAll();
        return $this->respond($data, 200);
    }

    // 2. GET: Menampilkan satu data diskon berdasarkan ID (Read)
    public function show($id = null)
    {
        $data = $this->model->find($id);
        if ($data) {
            return $this->respond($data, 200);
        }
        return $this->failNotFound("Data diskon dengan ID $id tidak ditemukan.");
    }

    // 3. POST: Menambahkan data diskon baru (Create)
    public function create()
    {
        // Validasi input
        $rules = [
            'tanggal' => 'required|is_unique[discounts.tanggal]',
            'nominal' => 'required|numeric'
        ];

        if (!$this->validate($rules)) {
            return $this->failValidationErrors($this->validator->getErrors());
        }

        $data = [
            'tanggal' => $this->request->getVar('tanggal'),
            'nominal' => $this->request->getVar('nominal')
        ];

        $this->model->insert($data);
        return $this->respondCreated([
            'status'   => 201,
            'messages' => ['success' => 'Data diskon berhasil ditambahkan.']
        ]);
    }

    // 4. PUT: Mengubah data diskon berdasarkan ID (Update)
    public function update($id = null)
    {
        $cek = $this->model->find($id);
        if (!$cek) {
            return $this->failNotFound("Data diskon tidak ditemukan.");
        }

        // Ambil data dari request PUT berupa JSON
        $data = $this->request->getJSON(true);

        $updateData = [
            'nominal' => $data['nominal']
        ];
        
        // Opsional: Jika tanggal juga ingin diubah
        if(isset($data['tanggal'])) {
            $updateData['tanggal'] = $data['tanggal'];
        }

        $this->model->update($id, $updateData);
        return $this->respond([
            'status'   => 200,
            'messages' => ['success' => 'Data diskon berhasil diubah.']
        ]);
    }

    // 5. DELETE: Menghapus data diskon berdasarkan ID (Delete)
    public function delete($id = null)
    {
        $data = $this->model->find($id);
        if ($data) {
            $this->model->delete($id);
            return $this->respondDeleted([
                'status'   => 200,
                'messages' => ['success' => 'Data diskon berhasil dihapus.']
            ]);
        }
        return $this->failNotFound("Data diskon dengan ID $id tidak ditemukan.");
    }
}