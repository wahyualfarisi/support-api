<?php

    function post_validate()
    {
        $CI =& get_instance();
        $CI->load->library('form_validation');

        $config = array(
            array(
                'field' => 'email_admin',
                'label'  => 'email_admin',
                'rules' => 'required',
            ),
            array(
                'field' => 'password',
                'label' => 'password',
                'rules' => 'required'
            ),
            array(
                'field' => 'name',
                'label' => 'name',
                'rules' => 'required'
            ),
            array(
                'field' => 'akses',
                'label' => 'akses',
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

    function update_validate()
    {
        $CI =& get_instance();
        $CI->load->library('form_validation');

        $config = array(
            array(
                'field' => 'name',
                'label' => 'name',
                'rules' => 'required'
            ),
            array(
                'field' => 'akses',
                'label' => 'akses',
                'rules' => 'required'
            )
        );

        $CI->form_validation->set_rules($config);
        if($CI->form_validation->run() == FALSE )
        {
            return false;
        }else{
            return true;
        }

    }