<?php 

    function lokasi_validate()
    {
        $CI =& get_instance();
        $CI->load->library('form_validation');

        $config = array(
            array(
                'field' => 'lokasi',
                'label' => 'lokasi',
                'rules' => 'required'
            )
        );
        $CI->form_validation->set_rules($config);
        if($CI->form_validation->run() == FALSE)
        {
            return false;
        }else{
            return true;
        }
    }

