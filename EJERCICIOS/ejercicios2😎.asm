
Ejercicio 1-

.data

dato1: .word 2
dato2: .word 10
dato3: .word 50
dato4: .word 70
dato5: .word 34

res: .space 4

.text

lw $t0, dato1($0) #Cargamos los datos
lw $t1, dato2($0)
lw $t2, dato3($0)
lw $t3, dato4($0)
lw $t4, dato5($0)

and $t5, $t5, $0 #Limpiamos $t5

blt $t4, $t0, primerfalso #Si $t4 < $t0 no pertenece a este rango
ble $t4, $t1, verdadero #Si $t4 > $t1 ya se cumple queda verdadero

primerfalso: blt $t4, $t2, falso #Es falso si $t4 < $t2
ble $t4, $t3, verdadero #Es verdadero si $t4 < $t4 

falso:
 
j finend #Terminamos y guardamos el resultado

verdadero:
ori $t5, $t5, 1 #Guardamos un 1 en $t5

finend:

sw $t5, res($0) #Guardamos el resultado en rs ($t5)


Ejercicio 2-

.data

vector: .word 1,0,2,0,3,0,0,10
numcount: .word 8

total: .space 4
.text


la $t0, vector($0)

and $t5, $t5, $0

lw $s2, numcount($0) #Cargamos el numero ed elementos
li $s3, 0 #Inicializamos el contador

bucle: bge $s3, $s2, finbucle

lw $t1, 0($t0)

beq $t1, $0, verdadero

resto:
addi $t0, $t0, 4
addi $s3, $s3, 1

j bucle

verdadero:
addi $t5, $t5, 1

j resto

finbucle:

sw $t5, total($0)

Ejercicio 3-


.data

vector: .word 1, 2, 3, 4, 5, 6
numelem: .word 6

rango1: .word 3
rango2: .word 5

total: .space 24

.text

la $t0, vector($0) #Cargamos las direcciones de los vectores
la $t2, total($0)

lw $s0, rango1($0) #Cargamos los rangos
lw $s1, rango2($0) 

lw $s2, numelem($0) #Cargamos el numero ed elementos
li $s3, 0 #Inicializamos el contador

bucle: bge $s3, $s2, finbucle 

lw $t1, 0($t0)

bgt $t1, $s1, resto
bge $t1, $s0, verdadero

resto:
addi $t0, $t0, 4
addi $s3, $s3, 1
j bucle

verdadero:
sw $t1, 0($t2)
addi $t2, $t2, 4
j resto

finbucle:

Ejercicio 4-

.data

vector: .asciiz "a", "b", "a", "b", "a", "c", ""
determined: .asciiz "a"
numcount: .word 8

res: .space 1
.text

la $t0, vector($0)
lb $t1, determined($0)

and $s0, $s0, $0

bucle: lb $t3, 0($t0)
beq $t3, $0, finbucle


bne $t1, $t3, falso
addi $s0, $s0, 1

falso: 
addi $t0, $t0, 4
j bucle

finbucle:
sb $s0, res($0)

