#[starknet::interface]
pub trait ISetterGetter<TContractState> {
    // Define una interfaz genérica para interactuar con el estado del contrato.
    // Incluye dos funciones:
    // 1. `set_number`: Establece un valor para el número almacenado.
    // 2. `get_number`: Obtiene el valor del número almacenado.
    fn set_number(ref self: TContractState, number: u256);
    fn get_number(self: @TContractState) -> u256;
}

#[starknet::contract]
mod SetterGetter {
    use core::starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
    // Importa funciones para leer y escribir en el almacenamiento del contrato StarkNet.

    #[storage]
    struct Storage {
        // Define la estructura de almacenamiento para el contrato.
        // Contiene un único campo `number` para almacenar un número de tipo `u256`.
        number: u256,
    }

    #[abi(embed_v0)]
    impl SetterGettertImpl of super::ISetterGetter<ContractState> {
        // Implementa la interfaz `ISetterGetter` para el contrato.
        fn set_number(ref self: ContractState, number: u256) {
            // Escribe el valor `number` en el campo `number` del almacenamiento del contrato.
            self.number.write(number);
        }

        fn get_number(self: @ContractState) -> u256 {
            // Lee y devuelve el valor del campo `number` del almacenamiento del contrato.
            self.number.read()
        }
    }
}
