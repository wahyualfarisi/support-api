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

    }

    public function index_delete()
    {

    }

    public function update_post()
    {

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