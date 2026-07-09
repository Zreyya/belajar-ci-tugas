<?php

namespace App\Controllers;

use App\Models\ProductModel; 
use App\Models\DiscountModel;

class Home extends BaseController
{   
    protected $productModel;
    protected $discountModel;
    function __construct(){
        helper(['number', 'form']);
        $this->productModel = new ProductModel();
        $this->discountModel = new DiscountModel();
}
    public function index()
    {
        $products = $this->productModel->findAll();

        $hariIni = date('Y-m-d');

        $diskon = $this->discountModel->where('tanggal', $hariIni)->first();
        $data['products'] = $products;
        $data['diskon'] = $diskon;

        return view('v_home', $data);
    }

    public function contact(): string
    {
        return view('v_contact');
    }
        public function faq()
    {
        return view('v_faq');
    }
}
