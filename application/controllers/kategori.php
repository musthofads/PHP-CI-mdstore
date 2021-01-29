<?php
	class kategori extends CI_Controller {
		public function kaos()
		{
			$data['kaos'] = $this->model_kategori->data_kaos()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('kaos',$data);
			$this->load->view('templates/footer');
		}
		public function jaket()
		{
			$data['jaket'] = $this->model_kategori->data_jaket()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('jaket',$data);
			$this->load->view('templates/footer');
		}
		public function celana_pendek()
		{
			$data['celana_pendek'] = $this->model_kategori->data_celana_pendek()->result();
			$this->load->view('templates/header');
			$this->load->view('templates/sidebar');
			$this->load->view('celana_pendek',$data);
			$this->load->view('templates/footer');
		}
	}
?>