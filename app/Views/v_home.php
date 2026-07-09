<?= $this->extend('layout') ?>
<?= $this->section('content') ?>

<?php if (session()->getFlashData('success')) { ?>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('success') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php } ?>

<div class="row">
    <?php foreach ($products as $key => $item) : ?>
        
        <?php 
        // Logika penghitungan harga
        $hargaAkhir = $item['harga'];
        if (isset($diskon) && !empty($diskon)) {
            $hargaAkhir = $item['harga'] - $diskon['nominal'];
        }
        ?>

        <div class="col-lg-6">
            <?= form_open('keranjang') ?>
            <?php
                echo form_hidden('id', $item['id']);
                echo form_hidden('nama', $item['nama']);
                echo form_hidden('harga', (string) $hargaAkhir); // Harga yang dikirim ke keranjang harus harga akhir
                echo form_hidden('foto', $item['foto']);
            ?>
            <div class="card">
                <div class="card-body">
                    <img src="<?= base_url() . "img/" . $item['foto'] ?>" width="100px"><br>
                    
                    <h5 class="card-title">
                        <?= $item['nama'] ?><br>
                        
                        <?php if (isset($diskon) && !empty($diskon)): ?>
                            <del class="text-danger" style="font-size: 0.9rem;">
                                <?= number_to_currency($item['harga'], 'IDR') ?>
                            </del> 
                            <span class="text-dark fw-bold">
                                <?= number_to_currency($hargaAkhir, 'IDR') ?>
                            </span>
                        <?php else: ?>
                            <span class="text-dark fw-bold">
                                <?= number_to_currency($item['harga'], 'IDR') ?>
                            </span>
                        <?php endif; ?>
                        
                    </h5>
                    
                    <button type="submit" class="btn btn-info rounded-pill">Beli</button>
                </div>
            </div>
            <?= form_close() ?>
        </div>
    <?php endforeach ?>
</div>
<?= $this->endSection() ?>