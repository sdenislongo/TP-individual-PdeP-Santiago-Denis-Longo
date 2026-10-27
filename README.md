# PDEP Entertainment

**Alumno:** Santiago Denis Longo

## Justificaciones y conceptos

### 1. Clases y objetos

Utilicé clases para representar asistentes, entradas y bandas, porque
necesitamos crear varios objetos que compartan comportamiento, pero
tengan sus propios datos.

La productora está representada mediante un objeto (WKO), ya
que el sistema trabaja con una única productora.

También utilicé un objeto para el abono fan, porque no tiene descuento
y su comportamiento puede compartirse entre los asistentes.
En cambio, AbonoVip es una clase para poder crear abonos separados,
cada uno con el porcentaje de descuento de su asistente.

### 2. Herencia y clases abstractas

Banda reúne el nombre y el comportamiento común de las bandas,
como el cálculo del presupuesto. BandaRock, BandaTrap y BandaIndie
heredan de esa clase y definen sus particularidades.

Banda es abstracta porque deja sin implementar gastoExtra() y
popularidad(): cada tipo de banda debe resolver esos cálculos.

En BandaTrap se redefine canon() utilizando super() para aprovechar
el canon de la superclase y multiplicarlo por su popularidad.
Así se evita repetir el valor base.

### 3. Composición y delegación

Cada asistente conoce a su abono mediante un atributo y le consulta
su porcentaje de descuento para calcular cuánto debe pagar.

Esta relación permite separar el comportamiento del abono del
comportamiento del asistente, sin crear clases distintas de
asistentes para cada tipo de abono.

La referencia al abono es constante porque la consigna no exige
cambiar de abono durante la ejecución. El descuento del abono VIP
sí puede modificarse mediante una bonificación.

### 4. Polimorfismo

El asistente puede consultar porcentajeDeDescuento() tanto al abono
fan como a un abono VIP, sin preguntar cuál de los dos tiene.

Además, la productora puede enviar bonificar() a ambos: el abono VIP
aumenta su descuento en un punto porcentual y el fan no realiza cambios.

También hay polimorfismo cuando la productora solicita el presupuesto
de las bandas, utilizando el mismo mensaje para los distintos tipos.

### 5. Colecciones: listas y conjuntos

Utilicé conjuntos para los asistentes y las bandas de la productora,
porque no interesa su orden y no deben registrarse objetos repetidos.

El historial de entradas es una lista que conserva el orden en que
se agregan las compras. Los instrumentos de las bandas indies también
se representan mediante una lista.

### 6. Manejo de errores

Antes de comprar una entrada se verifica que el asistente tenga
saldo positivo. Si no cumple esa condición, se lanza una excepción
con un mensaje que indica el motivo del rechazo.

La validación se realiza antes de agregar la entrada al historial
o descontar dinero, evitando registrar una compra rechazada.

Utilicé Exception porque en esta solución no necesito distinguir
tipos de errores para recuperarme de ellos.
