// Importa la interfaz y el trait para interactuar con el contrato SetterGetter.
use setter_getter::{ISetterGetterDispatcher, ISetterGetterDispatcherTrait};
// Herramientas para declarar contratos y manejar resultados en el entorno de pruebas.
use snforge_std::{ContractClassTrait, DeclareResultTrait, declare};
// Define el tipo para representar direcciones de contratos en StarkNet.
use starknet::ContractAddress;

// Función que despliega el contrato SetterGetter en la red de pruebas y retorna su dirección.
fn deploy_setter_getter() -> ContractAddress {
    // Declara el contrato SetterGetter y obtiene su clase.
    let contract = declare("SetterGetter").unwrap().contract_class();
    // Despliega el contrato sin constructor y obtiene su dirección.
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address // Retorna la dirección del contrato desplegado.
}

// Prueba unitaria para verificar el comportamiento del contrato SetterGetter.
#[test]
fn test_increase_balance() {
    // Despliega el contrato y obtiene su dirección.
    let setter_getter_address = deploy_setter_getter();
    // Crea un despachador para interactuar con el contrato.
    let setter_getter = ISetterGetterDispatcher { contract_address: setter_getter_address };

    // Llama a la función set_number para establecer el valor en 10.
    setter_getter.set_number(10);
    // Llama a la función get_number para obtener el valor almacenado.
    let contract_number = setter_getter.get_number();

    // Verifica que el valor obtenido sea igual al establecido.
    assert(contract_number == 10, 'wrong number');
}
