<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

class Lokasi extends REST_Controller {

    public function __construct($config = 'rest'){
        parent::__construct($config);
        $this->tbl_lokasi     = 'tbl_lokasi';
        $this->tbl_lokasi_key = 'kode_lokasi';
        $this->load->model('m_core');
        $this->load->helper(['jwt', 'authorization']);
        $this->token = $this->verify_request();

        $this->load->helper('validation/lokasi_validate_helper');
        $this->load->helper('model/check_db_helper');

        //status code API
        $this->bad  = parent::HTTP_BAD_REQUEST;
        $this->good = parent::HTTP_OK;
        $this->server_error = parent::HTTP_INTERNAL_SERVER_ERROR;
        $this->noauth = parent::HTTP_UNAUTHORIZED;
        $this->notfound = parent::HTTP_NOT_FOUND;

    }

    public function index_get()
    {
        if(!$this->token) {
            $status = $this->noauth;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }
        
        try{
            $query = "";
            if($this->input->get('query') ){
                $query = $this->input->get('query');
            }
            $data = $this->m_core->gettablesearch($query, $this->tbl_lokasi, 'lokasi');
            $status = $this->good;
            $res['status'] = $status;
            $res['data']   = $data->result();
            $this->response($res, $status);
        }catch(Exception $e){
            $status = $this->server_error;
            $res['status'] = $status;
            $res['msg']    = 'internal server error;';
            $this->response($res, $status);
        }
       
    }


    public function index_post()
    {
        if(!$this->token){ //check token for jwt
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Authorized denied ';
            $this->response($res, $status);
            return;
        }

        if(!$this->token->akses == 1)
        {
            $status = $this->bad; //check akses = top level
            $res['status'] = $status;
            $res['msg']    = 'Akses Tidak Sesuai';
            $this->response($res, $status);
            return;
        }

        if(!lokasi_validate() ){
            $status = $this->bad;
            $res['status'] = $status;
            $res['errors'] = $this->form_validation->error_array();
            $this->response($res, $status);
            return;
        }

        try{
            $data_lokasi['kode_lokasi'] = rand(0, 645635);
            $data_lokasi['lokasi']      = $this->input->post('lokasi');

            $insert_lokasi = $this->m_core->add_data($this->tbl_lokasi, $data_lokasi);
            if(!$insert_lokasi){

                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'Gagal Menyimpan Lokasi';
                $this->response($res, $status);
                return;
            }

                $status = $this->good;
                $res['status'] = $status;
                $res['msg']    = 'Berhasil Menambahkan Data Lokasi';
                $this->response($res, $status);

        }catch(Exception $e)
        {
            $status = $this->server_error;
            $res['status'] = $status;
            $res['msg']    = 'internal server error;';
            $this->response($res, $status);
        }
    }

    public function index_delete($target)
    {
        if(!$this->token->akses == 1){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }
             if(!$target){
                 $status = $this->bad;
                 $res['status'] = $status;
                 $res['msg']    = 'Parameter is required';
                 $this->response($res, $status);
                 return;
             }

            try{
                $where_delete['kode_lokasi'] = $target;

                if(check_field_value_exists($this->tbl_lokasi, $where_delete) != 1){
                    $status = $this->notfound;
                    $res['status'] = $status;
                    $res['msg']    = 'ID Not Found';
                    $this->response($res, $status);
                    return;
                }

                $delete = $this->m_core->delete_rows($this->tbl_lokasi, $where_delete);

                if(!$delete){
                    $status = $this->bad;
                    $res['status'] = $status;
                    $res['msg']    = 'Failed To remove resource';
                    $this->response($res, $status);
                    return;
                }

                $status = $this->good;
                $res['status'] = $status;
                $res['msg']    = 'Deleted Successfully';
                $this->response($res, $status);

            }catch(Exception $e)
            {
                $status = $this->server_error;
                $res['status'] = $status;
                $res['msg']    = 'Internal Server Error';
                $this->response($res, $status);
            }
    }

    public function update_post($target)
    {
        if(!$this->token->akses == 1){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Accedd Denied';
            $this->response($res, $status);
            return;
        }

        if(!$target){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Parameter is required';
            $this->response($res, $status);
            return;
        }

        if(!lokasi_validate() ){
            $status = $this->bad;
            $res['status'] = $status;
            $res['errors'] = $this->form_validation->error_array();
            $this->response($res, $status);
            return;
        }

        try{
            $where_delete['kode_lokasi'] = $target;

            if(check_field_value_exists($this->tbl_lokasi, $where_delete) != 1){
                $status = $this->notfound;
                $res['status'] = $status;
                $res['msg']    = 'ID Not Found';
                $this->response($res, $status);
                return;
            }

            $data_update['lokasi'] = $this->input->post('lokasi');
            $update_data = $this->m_core->update_rows($this->tbl_lokasi, $data_update, $where_delete);
            if(!$update_data){
                $status      = $this->bad;
                $res['msg']  = 'Failed To Update Data';
                $res['status'] = $status;
                $this->response($res, $status);
                return;
            }

            $status        = $this->good;
            $res['msg']    = 'Update Successfully';
            $res['status'] = $status;
            $this->response($res, $status);
            
        }catch(Exception $e)
        {
            $status = $this->server_error;
            $res['status'] = $status;
            $res['msg']    = 'Internal Server Error';
            $this->response($res, $status);
        }
    }


    private function verify_request()
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
