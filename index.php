<?php
    include "databases/koneksi.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>tugas basisdata</title>
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }
        header{
            background-color: #121212;
            color: white;
        }
        center{
            padding-bottom: 2px;
        }
        center h3{
            color : black;
        }
        div{
            margin-bottom: 100px;
            margin-left:2px;
        }
        content{
            /* display: flex;
            box-sizing: border-box;
            justify-content: center;
            flex-wrap: wrap; */

        }
        table {
            border-collapse: collapse;
            width: 70%;
            align-items: center;
        }
       
        th, td {
            text-align: center;
            padding: 8px;
            border: 1px dotted black;
        }
            
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <header>
        <center><h1>percetakan cerdas</h1></center>
        <center><hr></center>
        <center><h2>tugas database</h2></center>
    </header>
    <br>
    <content>
        <!-- data pelanggan -->
        <div>
            <center><h3 color='black'>data pelanggan</h3>
            <table>
                <thead>
                    <tr>
                        <th>id pelanggan</th>
                        <th>Nama</th>
                        <th>alamat</th>
                        <th>tanggal lahir</th>
                        <th>no telpon</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                    $query = mysqli_query($koneksi, 'SELECT * FROM pelanggan');
                    while($row = mysqli_fetch_array($query)) { ?>
                    <tr>
                        <td><?= $row['id_pelanggan'] ?></td>
                        <td><?= $row['nama'] ?></td>
                        <td><?= $row['alamat'] ?></td>
                        <td><?= $row['tanggal_lahir'] ?></td>
                        <td><?= $row['nomer_telpon'] ?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table></center>
        </div>
        <br>
        <!-- data pegawai -->
        <div>
        <center><h3 color='black'>data pegawai</h3>
        <table>
            <thead>
                <tr>
                    <th>id pegawai</th>
                    <th>Nama</th>
                    <th>jabatan</th>
                    <th>no telpon</th>
                </tr>
            </thead>
            <tbody>
            <?php 
            $query = mysqli_query($koneksi, 'SELECT * FROM pegawai');
            while($row = mysqli_fetch_array($query)) { ?>
                <tr>
                    <td><?= $row['id_pegawai'] ?></td>
                    <td><?= $row['nama'] ?></td>
                    <td><?= $row['jabatan'] ?></td>
                    <td><?= $row['nomer_telpon'] ?></td>
                </tr>
            <?php } ?>
            </tbody>
        </table></center>
        </div>
                <!-- layanan -->
                <div>
            <center><h3 color='black'>data layanan</h3>
            <table>
                <thead>
                    <tr>
                        <th>id layanan</th>
                        <th>Nama layanan</th>
                        <th>harga</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                    $query = mysqli_query($koneksi, 'SELECT * FROM layanan');
                    while($row = mysqli_fetch_array($query)) { ?>
                        <tr>
                            <td><?= $row['id_layanan'] ?></td>
                            <td><?= $row['nama_layanan'] ?></td>
                            <td><?= $row['harga'] ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table></center>   
        </div>
        
        <!-- pesanan -->
        <div>
            <center><h3 color='black'>pesanan</h3>
            <table>
                <thead>
                    <tr>
                        <th>id pesanan</th>
                        <th>id pelanggan</th>
                        <th>id pegawai</th>
                        <th>tanggal pesanan</th>
                        <th>total biaya</th>
                        <th>setatus</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                    $query = mysqli_query($koneksi, 'SELECT * FROM pesanan');
                    while($row = mysqli_fetch_array($query)) { ?>
                        <tr>
                            <td><?= $row['id_pesanan'] ?></td>
                            <td><?= $row['id_pelanggan'] ?></td>
                            <td><?= $row['id_pegawai'] ?></td>
                            <td><?= $row['tanggal_pesanan'] ?></td>
                            <td><?= $row['total_biaya'] ?></td>
                            <td><?= $row['status'] ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table></center>
        </div>
        <!-- keanggotaan -->
        <div>
            <center><h3 color='black'>keanggotaan</h3>
            <table>
                <thead>
                    <tr>
                        <th>id anggota</th>
                        <th>id pelanggan</th>
                        <th>nama keanggotaan</th>
                        <th>tanggal bergabung</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                    $query = mysqli_query($koneksi, 'SELECT * FROM keanggotaan');
                    while($row = mysqli_fetch_array($query)) { ?>
                        <tr>
                            <td><?= $row['id_keanggotaan'] ?></td>
                            <td><?= $row['id_pelanggan'] ?></td>
                            <td><?= $row['nama_keanggotaan'] ?></td>
                            <td><?= $row['tanggal_bergabung'] ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table></center>
        </div>
        <!-- detail pesanan -->
        <div>
            <center><h3 color='black'>detail pesanan</h3>
            <table>
                <thead>
                    <tr>
                        <th>id pesanan</th>
                        <th>id layanan</th>
                        <th>jumlah</th>
                    </tr>
                </thead>
                <tbody>
                <?php 
                    $query = mysqli_query($koneksi, 'SELECT * FROM detail_pesanan');
                    while($row = mysqli_fetch_array($query)) { ?>
                        <tr>
                            <td><?= $row['id_pesanan'] ?></td>
                            <td><?= $row['id_layanan'] ?></td>
                            <td><?= $row['jumlah'] ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table></center>
        </div>
    </content>

</body>
</html>