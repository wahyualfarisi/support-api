<?php 

    function activity_post_validate()
    {
        $CI =& get_instance();
        $CI->load->library('form_validation');

        $config = array(
            array(
                'field' => 'tanggal_permintaan',
                'label' => 'tanggal_permintaan',
                'rules' => 'required'
            ),
            array(
                'field' => 'user',
                'label' => 'user',
                'rules' => 'required',
            ),
            array(
                'field' => 'id_bagian',
                'label' => 'id_bagian',
                'rules' => 'required'
            ),
            array(
                'field' => 'keterangan',
                'label' => 'keterangan',
                'rules' => 'required'
            ),
            array(
                'field' => 'tanggal_selesai',
                'label' => 'tanggal_selesai',
                'rules' => 'required'
            )
        );
        $CI->form_validation->set_rules($config);
        if($CI->form_validation->run() == FALSE){
            return false;
        }else{
            return true;
        }
    }