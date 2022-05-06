<?php 
namespace App\Controllers\API;
use App\Models\ClienteModel;
use App\Models\TransaccionesModel;
use App\Models\CuentaModel;
use CodeIgniter\RESTful\ResourceController;

class Transacciones extends ResourceController
{
    public function __construct() {
        $this->model = $this->setModel(new TransaccionesModel());
    }
    public function index()
    { 
       
        $transacciones = $this->model->findAll();
        return $this->respond($transacciones);
    }
    public function create()
    {
        try {
        $transaccion = $this->request->getJSON();
        if($this->model->insert($transaccion)):
          $transaccion->id = $this->model->insertID();
         $transaccion->resultado = $this->actualizarFondoCuenta($transaccion->tipo_transaccion_id,$transaccion->cuenta_id, $transaccion->monto);

          return $this->respondCreated($transaccion);
        else:
             return $this->failValidationError($this->model->validation->listErrors());
        endif;
        } catch (\Exception $e) {
            return $this->failServerError('Ha ocurrido un error en el servidor');
        }
        
    }
    
    public function edit($id = null)
    {
        try {
            
            if($id == null)
            return $this->failValidationError('No se ha pasado un Id valido');
            $$transiccion = $this->model->find($id);

            if($transiccion == null)
            return $this->failNotFound('No se ha encontrado un cliente con el id:' .$id); 
          return $this->respond($transiccion);
            } catch (\Exception $e) {
                return $this->failServerError('Ha ocurrido un error en el servidor');
            }
    }

    public function update($id = null)
    {
        try {
            
            if($id == null)
            return $this->failValidationError('No se ha pasado un Id valido');
            $transiccionVerificado = $this->model->find($id);
            if($transiccionVerificado == null)
            return $this->failNotFound('No se ha encontrado un cliente con el id:' .$id); 
            $transiccion = $this->request->getJSON();

            if($this->model->update($id,$transiccion)):
               $transiccion->id = $id;
                  return $this->respondUpdated($transiccion);
              else:
                   return $this->failValidationError($this->model->validation->listErrors());
              endif;
            } catch (\Exception $e) {
                return $this->failServerError('Ha ocurrido un error en el servidor');
            }
    }

    public function delete($id = null)
    {
        try {
            
            if($id == null)
            return $this->failValidationError('No se ha pasado un Id valido');
            $transiccionVerificado = $this->model->find($id);
            if($transiccionVerificado == null)
            return $this->failNotFound('No se ha encontrado un cliente con el id:' .$id); 


            if($this->model->delete($id)):
                  return $this->respondDeleted($transiccionVerificado);
              else:
                return $this->failServerError('No se ha podido eliminar el registro');
              endif;
            } catch (\Exception $e) {
                return $this->failServerError('Ha ocurrido un error en el servidor');
            }
    }

    public function getTransaccionesByCliente($id = null)
    {
        try {
            $modelCliente = new ClienteModel();

            if($id == null)
            return $this->failValidationError('No se ha pasado un Id valido');

            $cliente = $modelCliente->find($id);

            if($cliente == null)
            return $this->failNotFound('No se ha encontrado un cliente con el id:' .$id); 
         $transacciones = $this->model->TransiccionesPorCliente($id);
            return $this->respond($transacciones);
            } catch (\Exception $e) {
                return $this->failServerError('Ha ocurrido un error en el servidor');
            }
    }
    private function actualizarFondoCuenta($tipoTransaccionId, $monto, $cuentaId)
    {
    $modelCuenta = new CuentaModel();
    $cuenta = $modelCuenta->find($cuentaId);
    switch ($tipoTransaccionId)
    {
        case 1:
            $cuenta["fondo"] += $monto;
            break;
        case 2:
            $cuenta["fondo"] -= $monto;
            break;
    }
    if($modelCuenta->update($cuentaId , $cuenta)) :
        return array('TransaccionExistosa' => true, 'Nuevofondo' => $cuenta["fondo"]);
   else :
    return array('TransaccionExistosa' => false, 'Nuevofondo' => $cuenta["fondo"]);
   endif;
    }

  

}

