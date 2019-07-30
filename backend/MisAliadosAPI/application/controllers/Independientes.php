<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Independientes extends \Restserver\Libraries\REST_Controller {

	function __construct () {

		parent::__construct();
		$this->load->database();
	}

	public function index_get()
	{

		$consulta = $this->db->get('independientes');
		$independientes = $consulta->result_array();

		$this->response( $independientes );
		
	}

	public function obtener_get()
	{
		$this->index_get();
	}

	public function index_post()
	{
		$independiente_POST  = $this->post();

		if ( isset( $independiente_POST ) ) 
		{

			$independiente = $this->post();
			$consulta = $this->db->insert('independientes', $independiente);
			$resultadoCreacion = $consulta;

			if ( $resultadoCreacion )
			{	
				$this->response( $consulta->result() );
			}
			else
			{
				$this->response( FALSE, 400 );
			}

		}
		else
		{
			throw new Exception("No se pudo identificar ningun objeto de independiente para gestionar", 1);
			
		}
	}

	public function guardar_post()
	{
		$this->index_post();
	}

}
