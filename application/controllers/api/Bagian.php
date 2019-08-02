<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

class Bagian extends REST_Controller {

    public function __construct($config = 'rest'){
        parent::__construct($config);
        $this->tbl_bagian     = 'tbl_bagian';
        $this->tbl_bagian_key = 'id_bagian';
        $this->load->model('m_core');
        $this->load->model('m_bagian');
        $this->load->helper(['jwt', 'authorization']);
        $this->token = $this->verify_request();

        $this->load->helper('validation/bagian_validate_helper');
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
        if(!$this->token){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }

        try{
            $query = '';
            if($this->input->get('query') ){
                $query = $this->input->get('query');
            }

            $data    = $this->m_bagian->get_bagian($query);

            $status  = $this->good;
            $res['data']   = $data->result();
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

    public function index_post()
    {
        if(!$this->token->akses == 1){
            $res['status'] = $this->bad;
            $res['msg']    = 'Access denied';
            $this->response($res, $status);
            return;
        }

        if(!bagian_validate()){
            $status = $this->bad;
            $res['status'] = $status;
            $res['errors'] = $this->form_validation->error_array();
            $this->response($res, $status);
            return; 
        }

        try{
            $data_insert['kode_lokasi'] = $this->input->post('kode_lokasi');
            $data_insert['bagian']      = $this->input->post('bagian');

            $insert_data = $this->m_core->add_data($this->tbl_bagian, $data_insert);
            if(!$insert_data){
                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'Failed to save tbl bagian';
                $this->response($res, $status);
                return;
            }

            $status = $this->good;
            $res['status'] = $status;
            $res['msg']    = 'Insert succesfully';
            $this->response($res, $status);


        }catch(Exception $e)
        {
            $status = $this->server_error;
            $res['status'] = $status;
            $res['msg']    = 'Internal Server Error';
            $this->response($res, $status);   
        }


    }

    public function index_delete($target)
    {
        if(!$this->token->akses == 1)
        {
            $status = $this->noauth;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }

        if(!$target){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Parameters is required';
            $this->response($res, $status);
            return;
        }

        try{
            $where_id['id_bagian'] = $target;

            if(!check_field_value_exists($this->tbl_bagian, $where_id ) > 0){
                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'ID Not Found';
                $this->response($res, $status);
                return;
            }

            $delete_bagian = $this->m_core->delete_rows($this->tbl_bagian, $where_id );
            if(!$delete_bagian) {
                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'Failed to delete resource';
                $this->response($res, $status);
                return;
            }

            $status = $this->good;
            $res['status'] = $status;
            $res['msg']    = 'Delete Successfully';
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
            $status = $this->noauth;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }

        if(!$target){
            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'Parameters is required';
            $this->response($res, $status);
            return;
        }

             $where_id['id_bagian'] = $target;

            if(!check_field_value_exists($this->tbl_bagian, $where_id ) > 0 ){
                $status = $this->notfound;
                $res['status'] = $status;
                $res['msg']    = 'ID not found';
                $this->response($res, $status);
                return;
            }

            if(!bagian_validate()){
                $status = $this->bad;
                $res['status'] = $status;
                $res['errors'] = $this->form_validation->error_array();
                $this->response($res, $status);
                return;
            }

            try{

                $data_update = array(
                    'kode_lokasi' => $this->input->post('kode_lokasi'),
                    'bagian'      => $this->input->post('bagian')
                );
                $update_bagian = $this->m_core->update_rows($this->tbl_bagian, $data_update, $where_id);
                
                if(!$update_bagian){
                    $status = $this->bad;
                    $res['status'] = $status;
                    $res['msg']    = 'Failed to update resource';
                    $this->response($res, $status);
                    return;
                }

                $status = $this->good;
                $res['status'] = $status;
                $res['msg']    = 'Update successfully';
                $this->response($res, $status);
        
            }catch(Exception $e)
            {
                $status = $this->server_error;
                $res['status'] = $status;
                $res['msg']    = 'Internal Server Error';
                $this->response($res, $status); 
            }



        try{
            

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