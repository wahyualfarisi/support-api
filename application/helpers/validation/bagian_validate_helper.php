<?php

function bagian_validate()
{
    $CI =& get_instance();
    $CI->load->library('form_validation');


    $config = array(
        array(
            'field' => 'kode_lokasi',
            'label' => 'kode_lokasi',
            'rules' => 'required'
        ),
        array(
            'field' => 'bagian',
            'label' => 'bagian',
            'rules' => 'required'
        )
    );
    $CI->form_validation->set_rules($config);
    if($CI->form_validation->run() == FALSE)
    {
        return false;
    }else
    {
        return true;
    }

}