<?= $this->extend('layout') ?>
<?= $this->section('content') ?>

<?php if (session()->getFlashData('success')) : ?>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?= session()->getFlashData('success') ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<?php endif; ?>

<div class="card">
    <div class="card-body">
        <h5 class="card-title">History Transaksi Pembelian</h5>
        
        <table class="table datatable">
            <thead>
                <tr>
                    <th>#</th>
                    <th>ID Pembelian</th>
                    <th>Pembeli</th>
                    <th>Waktu Pembelian</th>
                    <th>Total Bayar</th>
                    <th>Alamat</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1; foreach ($transactions as $t) : ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $t['id'] ?></td>
                        <td><?= $t['username'] ?></td>
                        <td><?= $t['created_at'] ?></td>
                        <td><?= number_to_currency($t['total_harga'], 'IDR') ?></td>
                        <td><?= $t['alamat'] ?></td>
                        <td>
                            <?php if ($t['status'] == 0) : ?>
                                <span class="badge bg-warning text-dark">Belum Selesai</span>
                            <?php else : ?>
                                <span class="badge bg-primary">Sudah Selesai</span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#detailModal-<?= $t['id'] ?>">Detail</button>
                            
                            <a href="<?= base_url('pembelian/ubah_status/' . $t['id']) ?>" class="btn btn-info btn-sm text-white">Ubah Status</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<?php if (!empty($transactions)) : ?>
    <?php foreach ($transactions as $item) : ?>
        <div class="modal fade" id="detailModal-<?= $item['id'] ?>" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Detail Transaksi #<?= $item['id'] ?></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"> 
                        <?php if (!empty($products[$item['id']])) : ?>
                            <?php foreach ($products[$item['id']] as $index2 => $item2) : ?>
                                <?= $index2 + 1 . ")" ?>
                                
                                <?php
                                $imagePath = FCPATH . 'img/' . $item2['foto'];

                                if (!empty($item2['foto']) && file_exists($imagePath)) :
                                ?>
                                    <div class="my-2">
                                        <img src="<?= base_url('img/' . $item2['foto']) ?>" width="100" class="img-thumbnail">
                                    </div>
                                <?php endif; ?>

                                <strong><?= $item2['nama'] ?></strong>
                                <?= number_to_currency($item2['harga'], 'IDR') ?>
                                <br>
                                <?= "(" . $item2['jumlah'] . " pcs)" ?><br>
                                <?= number_to_currency($item2['subtotal_harga'], 'IDR') ?>
                                <hr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                        Ongkir <?= number_to_currency($item['ongkir'], 'IDR') ?>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
<?php endif; ?>

<?= $this->endSection() ?>