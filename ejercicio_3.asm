.data # Sección para declarar variables

# declarar una cadena de caracteres almacenados 
prompt: .asciiz "Ingrese el número de términos de la serie Fibonacci: "
result: .asciiz "La serie Fibonacci es: "

.text # Sección para declarar variables
.globl main
main:
    # Imprimir el prompt
    li $v0, 4 # Código de servicio 4 para imprimir una cadena
    la $a0, prompt # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    # Leer el número de términos de la serie Fibonacci
    li $v0, 5 # Código de servicio 5 para imprimir una cadena
    syscall # Llama al sistema para imprimir
    move $t0, $v0 # copiar el contenido de un registro en otro registro

    # Inicializar los primeros dos términos de la serie
    li $t1, 0 # Código de servicio 0 para imprimir una cadena
    li $t2, 1 # Código de servicio 1 para imprimir una cadena

    # Imprimir el resultado inicial
    li $v0, 4 # Código de servicio 4 para imprimir una cadena
    la $a0, result # Carga la dirección de la cadena en $a0
    syscall # Llama al sistema para imprimir

    # Imprimir los primeros dos términos de la serie
    li $v0, 1 # Código de servicio 1 para imprimir una cadena
    move $a0, $t1 # copiar el contenido de un registro en otro registro
    syscall # Llama al sistema para imprimir
    li $v0, 1 # Código de servicio 1 para imprimir una cadena
    move $a0, $t2 # copiar el contenido de un registro en otro registro
    syscall # Llama al sistema para imprimir

    # Calcular y mostrar los términos restantes de la serie
    addi $t0, $t0, -2 # Suma inmediata
    loop: # marca el comienzo de un bucle
        add $t3, $t1, $t2 # Suma dos registros y almacena el resultado en un tercero
        li $v0, 1 # Código de servicio 1 para imprimir una cadena
        move $a0, $t3 # copiar el contenido de un registro en otro registro
        syscall # Llama al sistema para imprimir
        li $v0, 11 # Cargar el código del servicio de impresión de cadenas
        la $a0, 44 # Cargar la dirección de la coma
        syscall # Imprimir la coma
        move $t1, $t2 # copiar el contenido de un registro en otro registro
        move $t2, $t3 # copiar el contenido de un registro en otro registro
        addi $t0, $t0, -1 # Suma inmediata
        bgtz $t0, loop # salto condicional para realizar comparaciones concero
        
    # Salir del programa
    li $v0, 10 # Código de servicio 10 para terminar la ejecución
    syscall # Llama al sistema para imprimir