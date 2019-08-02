<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_bagian extends CI_Model{

    function get_bagian($query)
    {
        $query = "SELECT a.id_bagian, a.bagian,
                         b.kode_lokasi, b.lokasi 
                  FROM tbl_bagian a LEFT JOIN tbl_lokasi b ON a.kode_lokasi = b.kode_lokasi 
                  WHERE a.bagian LIKE '%$query%' OR b.lokasi LIKE '%$query%'
        ";
        return $this->db->query($query);
    }


}
