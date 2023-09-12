.data # Sección para declarar variables

# declarar una cadena de caracteres almacenados 
prompt: .asciiz "Ingrese un número: " 
result: .asciiz "El número mayor es: "

.text # Sección para declarar variables
.globl main
main:
    # Pedir el primer número
    li $v0, 4 # Código de servicio 4 para imprimir una cadena
    la $a0, prompt # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    # Leer el primer número
    li $v0, 5 # Código de servicio 5 para imprimir una cadena
    syscall # Llama al sistema para imprimir
    move $t0, $v0 # copiar el contenido de un registro en otro registro

    # Pedir el segundo número
    li $v0, 4 # Código de servicio 4 para imprimir una cadena 
    la $a0, prompt # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    # Leer el segundo número
    li $v0, 5 # Código de servicio 5 para imprimir una cadena 
    syscall # Llama al sistema para imprimir
    move $t1, $v0 # copiar el contenido de un registro en otro registro

    # Pedir el tercer número
    li $v0, 4 # Código de servicio 4 para imprimir una cadena
    la $a0, prompt # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    # Leer el tercer número
    li $v0, 5 # Código de servicio 5 para imprimir una cadena 
    syscall # Llama al sistema para imprimir
    move $t2, $v0 # copiar el contenido de un registro en otro registro

    # Comparar los números
    move $t3, $t0 # copiar el contenido de un registro en otro registro
    slt $t4, $t3, $t1 # comparar dos valores
    beqz $t4, check_t1_t2 # Salto si igual
    move $t3, $t1 # copiar el contenido de un registro en otro registro

check_t1_t2:
    slt $t4, $t3, $t2 # Inicializar si menor que
    beqz $t4, print_result # Salto si igual
    move $t3, $t2 # copiar el contenido de un registro en otro registro

print_result:
    # Mostrar el resultado
    li $v0, 4 # Código de servicio 4 para imprimir una cadena 
    la $a0, result # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    li $v0, 1 # Código de servicio 4 para imprimir una cadena 
    move $a0, $t3 # copiar el contenido de un registro en otro registro
    syscall # Llama al sistema para imprimir

    # Terminar el programa
    li $v0, 10 # Código de servicio 10 para terminar la ejecución
    syscall # Llama al sistema para imprimir