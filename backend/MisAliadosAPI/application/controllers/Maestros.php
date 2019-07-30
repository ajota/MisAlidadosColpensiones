<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Maestros extends \Restserver\Libraries\REST_Controller {

	function __construct () {

		parent::__construct();
		$this->load->database();
	}

	public function index_get( $maestro = '' )
	{
        if( $maestro !== '' )
        {
            //identificar maestro
            $consulta = $this->db->get('maestros');
            $maestros = $consulta->result_array();
            $indexMaestro = array_search( $maestro, array_column( $maestros, 'Nombre') );
            $idMaestro = $maestros[ $indexMaestro ]['IdMaestro'];
    
            //Obtiene los item de maestros;
            $consulta = $this->db->get_where('datos_maestros', array( 'IdMaestro' => $idMaestro ));
            $listaMaestro =  $consulta->result();
            
            $this->response( $listaMaestro );

        }else{
            throw new Exception('Se debe especificar un nombre de maestro a consultar.');
        }
	}

	public function obtener_get( $maestro = '' )
	{
		$this->index_get( $maestro );
	}

}
