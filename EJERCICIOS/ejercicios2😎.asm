Ejercicio 1-

.data
V: .byte 0, 1, 1, 1, 0
res: .space 3
.text

lb $s0, V
lb $s1, V+1
lb $s2, V+2
lb $s3, V+3
lb $s4, V+4

and $t0, $s0, $s4

sb $t0, res

or $t1, $s1, $s3

sb $t1, res+1

and $t0, $s1, $s2
or $t1, $t0, $s0

sb $t1, res+2

Ejercicio 2-

.data
V: .word 2, -4, -6
res: .space 12
.text

lw $s0, V
lw $s1, V+4
lw $s2, V+8

sge $t0, $s0, $0
sge $t1, $s1, $0
sge $t2, $s2, $0

sw $t0, res
sw $t1, res+4
sw $t2, res+8

Ejercicio 3-

.data
V: .word 1, -4, -5, 2
res: .space 1
.text

lw $s0, V
lw $s1, V+4
lw $s2, V+8
lw $s3, V+12

sge $t0, $s0, $0
sge $t1, $s1, $0
sge $t2, $s2, $0
sge $t3, $s3, $0

and $s4, $t0, $t1
and $s5, $t2, $t3
and $t4, $s4, $s5

sw $t4, res($0)


Ejercicio 4-

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


Ejercicio 5-

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

Ejercicio 6-


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

Ejercicio 7-

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

