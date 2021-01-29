<?php
	class Model_kategori extends CI_Model {
		public function data_kaos() {
			return $this->db->get_where('tbbarang', array('kategori' => 'kaos'));
		}

		public function data_jaket() {
			return $this->db->get_where('tbbarang', array('kategori' => 'jaket'));
		}

		public function data_celana_pendek() {
			return $this->db->get_where('tbbarang', array('kategori' => 'celana pendek'));
		}
	}
?>