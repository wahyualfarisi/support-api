<?php
    
    function validate_form_auth()
    {
        $CI =& get_instance();
        $CI->load->library('form_validation');

        $config = array(
            array(
                'field' => 'email_admin',
                'label' => 'email_admin',
                'rules' => 'required'
            ),
            array(
                'field' => 'password',
                'label' => 'password',
                'rules' => 'required'
            )
        );
       
        $CI->form_validation->set_rules($config);

        if($CI->form_validation->run() === FALSE)
        {
             return false;
        }else{
             return true;
        }
    }