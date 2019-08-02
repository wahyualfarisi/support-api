<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

class Activity extends REST_Controller {

    public function __construct($config = 'rest'){
        parent::__construct($config);
        $this->tbl_activity     = 'tbl_kegiatan';
        $this->tbl_activity_key = 'id_kegiatan';

        $this->tbl_log = 'tbl_log';
        
        $this->load->model('m_core');
        $this->load->helper(['jwt', 'authorization']);
        $this->token = $this->verify_request();

        $this->load->helper('validation/activity_validate_helper');

        //status code API
        $this->bad  = parent::HTTP_BAD_REQUEST;
        $this->good = parent::HTTP_OK;
        $this->server_error = parent::HTTP_INTERNAL_SERVER_ERROR;
        $this->noauth = parent::HTTP_UNAUTHORIZED;
        $this->notfound = parent::HTTP_NOT_FOUND;
    }

    public function index_get()
    {

    }

    public function index_post()
    {
        if(!$this->token){
            $status = $this->noauth;
            $res['status'] = $status;
            $res['msg']    = 'Access Denied';
            $this->response($res, $status);
            return;
        }

        if(!activity_post_validate() ){
            $status = $this->bad;
            $res['errors'] = $this->form_validation->error_array();
            $res['status'] = $status;
            $this->response($res , $status);
            return;
        }

        try{

            $data_activity = array(
                'tanggal_permintaan' => $this->input->post('tanggal_permintaan'),
                'user'               => $this->input->post('user'),
                'id_bagian'          => $this->input->post('id_bagian'),
                'keterangan'         => $this->input->post('keterangan'),
                'email_admin'        => $this->token->email,
                'tanggal_selesai'    => $this->input->post('tanggal_selesai')
            );

            $insert_act = $this->m_core->add_data($this->tbl_activity, $data_activity );
            if(!$insert_act){
                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'Failed to add activity';
                $this->response($res, $status);
                return;
            }

            $data_log = array(
                'tgl_log' => date('Y-m-d'),
                'name' => $this->token->nama_lengkap,
                'log_detail' => ' <b>'.$this->token->nama_lengkap.'</b> telah menambahkan kegiatan , permintaan oleh '.$data_activity['user'].' pada tanggal '.$data_activity['tanggal_permintaan'].' '
            );

            $insert_log = $this->m_core->add_data($this->tbl_log, $data_log);


            if(!$insert_log){
                $status = $this->bad;
                $res['status'] = $status;
                $res['msg']    = 'Failed to add Log';
                $this->response($res, $status);
                return;
            }

            $status = $this->good;
            $res['status'] = $status;
            $res['msg']    = 'Activity added successfullty';
            $res['data']   = $data_log['log_detail'];
            $this->response($res, $status);

        }catch(Exception $e){
            $status = $this->server_error;
            $res['msg']    = 'Internal Server Error';
            $res['status'] = $status;
            $this->response($res, $status);
        }

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
