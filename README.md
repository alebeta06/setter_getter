# SetterGetter Contract 🧙‍♂️✨

Este repositorio contiene un contrato inteligente llamado **SetterGetter**, implementado en StarkNet, junto con pruebas de integración para verificar su funcionalidad. 

## Descripción del Proyecto

El proyecto demuestra cómo implementar un contrato sencillo que permita establecer y recuperar un valor almacenado en el contrato. Además, incluye pruebas para garantizar que el contrato funciona correctamente.

---

## Archivos Principales 📂

### 1. **Archivo `lib.cairo`**

El archivo principal del contrato **SetterGetter** incluye:

- **Interfaz `ISetterGetter`:**
  - Define dos métodos:
    - `set_number`: Permite establecer un valor en el almacenamiento del contrato.
    - `get_number`: Recupera el valor almacenado.

- **Módulo `SetterGetter`:**
  - Implementa la lógica del contrato.
  - Almacena el valor mediante la estructura `Storage`, que contiene un único campo `number` de tipo `u256`.
  - Usa los métodos `write` y `read` de `StoragePointer` para manipular directamente el almacenamiento.

🚀 **Este contrato es ideal para aprender sobre operaciones básicas de almacenamiento en la blockchain StarkNet.**

---

### 2. **Archivo `tests/test_contract.cairo`**

Este archivo contiene una prueba de integración para el contrato **SetterGetter**. 

- **Funciones clave:**
  - `deploy_setter_getter`: Despliega el contrato en un entorno simulado y retorna su dirección.
  - Prueba unitaria `test_increase_balance`:
    - Verifica que el contrato puede almacenar y recuperar correctamente un valor.
    - Usa la interfaz `ISetterGetterDispatcher` para interactuar con el contrato.

✅ **La prueba asegura que el contrato funcione como se espera en un entorno de prueba.**

---

## Comandos Utilizados en Terminal 🖥️

### 1. **Crear el Proyecto**
```
scarb new setter_getter
```
```
✔ Which test runner do you want to set up? · Starknet Foundry (default)
    Updating git repository https://github.com/foundry-rs/starknet-foundry
Created `setter_getter` package.
```
Resultado:
Creó una estructura básica del proyecto con los siguientes archivos y carpetas:
```
.
├── Scarb.lock
├── Scarb.toml
├── snfoundry.toml
├── src
└── tests
```
### 2. Compilar el Proyecto
```
scarb build
```
```
   Compiling snforge_scarb_plugin v0.33.0 (git+https://github.com/foundry-rs/starknet-foundry?tag=v0.33.0#221b1dbff42d650e9855afd4283508da8f8cacba)
Finished `release` profile [optimized] target(s) in 34m 37s
   Compiling setter_getter v0.1.0 (/home/alebeta/setter_getter/Scarb.toml)
    Finished `dev` profile target(s) in 35 minutes
```
Resultado:
Compiló el proyecto y generó el ejecutable, asegurándose de que no hubiera errores.

### 3. Ejecutar Pruebas
```
snforge test
```
```
Collected 1 test(s) from setter_getter package
Running 1 test(s) from tests/
[PASS] setter_getter_integrationtest::test_contract::test_increase_balance (gas: ~170)
Running 0 test(s) from src/
Tests: 1 passed, 0 failed, 0 skipped, 0 ignored, 0 filtered out
```
Resultado:

Compiló las pruebas.
Ejecutó la prueba unitaria test_increase_balance con éxito:
Gas utilizado: ~170.
Resultado: 1 prueba pasada, 0 fallidas.
