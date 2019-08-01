<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

class Admin extends REST_Controller {

    public function __construct($config = 'rest'){
        parent::__construct($config);
        $this->tbl_admin     = 'tbl_admin';
        $this->tbl_admin_key = 'id_petugas';
        $this->load->model('m_core');
        $this->load->helper(['jwt', 'authorization']);
        $this->token = $this->verify_request();

        $this->load->helper('validation/admin_validate_helper');

        //status code API
        $this->bad  = parent::HTTP_BAD_REQUEST;
        $this->good = parent::HTTP_OK;
        $this->server_error = parent::HTTP_INTERNAL_SERVER_ERROR;
        $this->noauth = parent::HTTP_UNAUTHORIZED;
        $this->notfound = parent::HTTP_NOT_FOUND;

    }

    public function index_get()
    {
       if($this->token)
       {
           try{
            $data_admin = $this->m_core->get_all($this->tbl_admin);

            foreach($data_admin->result() as $row)
            {
                $result[] = array(
                    'email'     => $row->email_admin,
                    'name'      => $row->name,
                    'log_login' => $row->log_login,
                    'akses'     => $row->akses
                );
            }
            $this->response($result, $this->good);

           }catch(Exception $e)
           {

                $res['msg'] = 'something Wrong';
                $res['status'] = $this->bad;
                $this->response($res, $this->bad);

           }
       }
    }

    public function index_post()
    {
        if($this->token->akses == 1)
        {
            if(!post_validate())
            {
                $res['error'] = $this->form_validation->error_array();
                $res['status'] = $this->bad;
                $this->response($res, $this->bad);
                return;
            }

            try{
                $data['email_admin'] = $this->input->post('email_admin');
                $data['name']        = $this->input->post('name');
                $data['password']    = md5($this->input->post('password') );
                $data['akses']       = $this->input->post('akses');

                if($this->check_db( array('email_admin' => $data['email_admin'] ) )->num_rows() > 0)
                {
                    $status     = $this->bad;
                    $res['msg'] = 'Email is Already use';
                    $this->response($res, $status);
                    return;
                }

                $insert = $this->m_core->add_data($this->tbl_admin, $data);
                if($insert)
                {
                    $res['msg']    = ' '.$data['name'].' Berhasil Di Tambahkan';
                    $res['status'] = $this->good;
                    $this->response($res, $this->good);
                }else{
                    $res['msg'] = 'something Wrong';
                    $res['status'] = $this->bad;
                    $this->response($res, $this->bad);
                }

            }catch(Exception $e)
            {
                $res['msg'] = 'something Wrong';
                $res['status'] = $this->bad;
                $this->response($res, $this->bad);
            }

        }else
        {
            $res['status'] = $this->noauth;
            $res['msg']    = 'Anda Tidak Mempunyai Akses Yang Sesuai';
            $this->response($res, $this->noauth);
        }
    }

    public function index_delete($target = null)
    {
        if($this->token)
        {
            if($this->token->akses == 1)
            {
                if($target)
                {
                    $where['email_admin'] = $target;
                    if($this->check_db( $where )->num_rows() > 0 )
                    {
                        $delete = $this->m_core->delete_rows( $this->tbl_admin, $where );
                        if($delete)
                        {
                            $res['status'] = $this->good;
                            $res['msg']    = ' '.$target.' Berhasil Di Hapus ';
                            $this->response($res, $this->good);
                            return;
                        }

                        $res['status'] = $this->bad;
                        $res['msg']    = ' something wrong ! ';
                        $this->response($res, $this->bad);
                        return;

                    }else{
                            $res['status'] = $this->bad;
                            $res['msg']    = 'Email Tidak Di Temukan';
                            $this->response($res, $this->bad);
                            return;
                    }
                }else{
                    $res['status'] = $this->bad;
                    $res['msg']    = 'Email is required to be a parameters ';
                    $this->response($res, $this->bad);
                }
               
            }else
            {
                $res['status'] = $this->noauth;
                $res['msg']    = 'Anda Tidak Mempunyai Akses Yang Sesuai';
                $this->response($res, $this->noauth);
            }
        }
    }

    public function update_post($target)
    {
        if($this->token)
        {
            

            if(!$this->token->akses == 1)
            {
                $res['status'] = $this->noauth;
                $res['msg']    = 'Anda Tidak Mempunyai Akses Yang Sesuai';
                $this->response($res, $this->noauth);
                return;
            }

            try{

                if(!$target){
                    $res['status'] = $this->bad;
                    $res['msg']    = 'Email is required to be a parameters ';
                    $this->response($res, $this->bad);
                    return;
                }

                if(!update_validate())
                {
                    $errors['error']  = $this->form_validation->error_array();
                    $errors['status'] = $this->bad;
                    $this->response($errors, $status);
                    return;
                }
            
                $where['email_admin'] = $target;

                if($this->check_db( $where )->num_rows() < 1)
                {
                    $res['status'] = $this->notfound;
                    $res['msg']    = 'Email Tidak Di Temukan';
                    $this->response($res, $this->notfound);
                    return;
                }

                $data_update = array(
                    'name' => $this->input->post('name'),
                    'akses' => $this->input->post('akses')
                );

                $update_table = $this->m_core->update_rows($this->tbl_admin, $data_update, $where);
                if(!$update_table){
                    $status = $this->bad;
                    $res['msg'] = 'Admin Gagal Di Update';
                    $res['status'] = $status;
                    $this->response($res, $status);
                }

                $status = $this->good;
                $res['msg'] = 'Admin Berhasil Di Update';
                $res['status'] = $status;
                $this->response($res, $status);
                
            }catch(Exception $e)
            {
                $res['msg'] = 'something Wrong';
                $res['status'] = $this->bad;
                $this->response($res, $this->bad);
            }


        }
    }


    private function check_db($where = [])
    {
        return $this->m_core->get_where($this->tbl_admin, $where);
    }


    public function verify_request()
    {
        //get all the headers 
        try{
            $headers = $this->input->request_headers();
            $token   = $headers['X-API-KEY'];
            if(!$token) {
                $status = parent::HTTP_UNAUTHORIZED;
                $res    = ['status' => $status, 'msg' => 'Unauthorized access!'];
                $this->response($res, $status);
                return;
            }

            $data = AUTHORIZATION::validateToken($token);
            if($data === false){
                $status = parent::HTTP_UNAUTHORIZED;
                $res    = ['status' => $status, 'msg' => 'Unauthorized accesss'];
                $this->response($res, $status);
                exit();
            }else{
                return $data;
            }

        }catch(Exception $e){
            $status = parent::HTTP_UNAUTHORIZED;
            $res    = ['status' => $status, 'msg' => 'Unauthorized access!'];
            $this->response($res, $status);
        }
    }

}
