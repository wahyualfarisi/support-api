<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

class Auth extends REST_Controller {

    public function __construct($config = 'rest'){
        parent::__construct($config);
        $this->tbl_admin     = 'tbl_admin';
        $this->tbl_admin_key = 'email_admin';
        $this->load->model('m_core');
        $this->load->helper(['jwt', 'authorization']);
        
        //load form validation
        $this->load->helper('validation/auth_validate_helper');

        //status code API
        $this->bad  = parent::HTTP_BAD_REQUEST;
        $this->good = parent::HTTP_OK;
        $this->server_error = parent::HTTP_INTERNAL_SERVER_ERROR;
        $this->noauth = parent::HTTP_UNAUTHORIZED;
    }

    public function index_post()
    {
        if(!validate_form_auth())
        {
            $this->response(array(
                'error' => $this->form_validation->error_array(),
                'status' => $this->bad
            ), $this->bad); 
            return;
        }

       try{
            $login_data['email_admin'] = $this->input->post('email_admin');
            $login_data['password']    = md5($this->input->post('password'));

            if($this->check_auth($login_data)->num_rows() == 1)
            {
                foreach($this->check_auth($login_data)->result() as $k)
                {
                    $token['email']        = $k->email_admin;
                    $token['nama_lengkap'] = $k->name;
                    $token['akses']        = $k->akses;
                    $yourToken['token']    = AUTHORIZATION::generateToken($token);
                    $yourToken['status']   = $this->good;

                    $this->response($yourToken, $this->good);
                }
            }else{
                $res['msg'] = 'incorrect email and password';
                $res['status'] = $this->bad;
                $this->response($res, $this->bad);
            }

       }catch(Exception $e)
       {
            $res['status'] = $this->server_error;
            $res['msg']    = 'something wrong!';
            $this->response($res, $res['status']);
       }
    }

    public function whoAmI_get()
    {
        $data = $this->verify_request();
        if(count($data) > 0)
        {
            if($this->check_auth(array('email_admin' => $data->email))->num_rows() == 1 )
            {
                $status = $this->good;
                $res['status']     = $status;
                $res['payload']    = $data;
                $this->response($res, $status);

                return;
            }

            $status = $this->bad;
            $res['status'] = $status;
            $res['msg']    = 'no token available';
            $this->response($res, $status);
           
        }else{
            $res['status'] = $this->noauth;
            $res['msg']    = 'unauthorized access';
            $this->response($res, $this->noauth);
         }
    }

    private function check_auth($where = [])
    {
        $check_to_source = $this->m_core->get_where($this->tbl_admin, $where);
        return $check_to_source;
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
