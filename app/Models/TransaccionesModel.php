<?php namespace App\Models;
use CodeIgniter\Model ;
    class TransaccionesModel extends Model{
        protected $table = 'transaccion';
        protected $primaryKey = 'id';
        protected $returnType ='array';
        protected $allowedFields = ['cuenta_id','tipo_transaccion_id','monto'];

        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedFiel = 'updated_at';
        
        protected $validationRules = [
            'cuenta_id' => 'required|integer',
            'tipo_transaccion_id' => 'required|integer',
            'monto' => 'required|numeric',
        ];
       
        protected $skypValidation = false;
    public function TransiccionesPorCliente($clienteId = null){
      $builder = $this->db->table($this->table);
      $builder ->select('cuenta.id AS NumeroCuenta, cliente.nombre, cliente.apellido');
      $builder ->select('tipo_transaccion.descripcion AS Tipo, transaccion.monto');
      $builder->join('cuenta','transaccion.cuenta_id = cuenta.id');  
      $builder->join('tipo_transaccion','transaccion.tipo_transaccion_id = tipo_transaccion.id');  
      $builder->join('cliente','cuenta.cliente_id = cliente.id');
 $builder->where('cliente.id',$clienteId);
      $query = $builder->get();
 return $query->getResult();
    }
        
      
    }