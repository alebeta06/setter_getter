use setter_getter::{ISetterGetterDispatcher, ISetterGetterDispatcherTrait};
use snforge_std::{ContractClassTrait, DeclareResultTrait, declare};
use starknet::ContractAddress;


fn deploy_setter_getter() -> ContractAddress {
    let contract = declare("SetterGetter").unwrap().contract_class();
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}

#[test]
fn test_increase_balance() {
    let setter_getter_address = deploy_setter_getter();
    let setter_getter = ISetterGetterDispatcher { contract_address: setter_getter_address };

    setter_getter.set_number(10);
    let contract_number = setter_getter.get_number();

    assert(contract_number == 10, 'wrong number');
}

