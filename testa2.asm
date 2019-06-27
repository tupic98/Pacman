; ---------------------------------------<Directivas>---------------------------------------
; Procesador
;.386
; Segmento de Pila
;Stack Segment Para Stack Use16 'STACK'
      ;db 256 dup(0)
;Stack Ends
; Segmento de C�digo
;Code Segment Para Use16 'Code' 
;      Assume CS:Code
;      Assume DS:Code
; Direcci�n de Inicio:
Org 0100H
Start:		;Comienzo de Programa
; ------------------------------------------------------------------------------------------------
;modo video
            mov ah, 00
            mov al, 12h
            int 10h

                mov bp, 010h
            call perimetro
            call pacman

loopazo:
            call delay
            cmp bp, 00H
            jne loopazo
        ;     call espera


;---Laberinto---
perimetro:  ;dibuja el perimetro 
            call cuadro_mayor
            call cuadro_menor
            call cuadro_menor1
            call primer_cuadro_1
            call primer_cuadro_2
            call primer_cuadro_3
            call segundo_cuadro_1
            call segundo_cuadro_2
            call segundo_cuadro_3
            call tercer_cuadro_1
            call tercer_cuadro_2
            call tercer_cuadro_3
            call cuarto_cuadro_1
            call cuarto_cuadro_2
            call cuarto_cuadro_3
                call comida_izquierda
            call comida_centro
            call comida_derecha
            call comida_arriba
            call comida_enmedio
            call comida_abajo
            ret

cuadro_mayor:
            ;coordenadas iniciales
            mov cx, 50d ;columna
            mov dx, 35d ;fila
                        
sigo:  call pixel
            inc cx
            cmp cx, 580d
            jne sigo
            mov cx, 50d
            
sigo1: call pixel
            inc dx
            cmp dx, 470d
            jne sigo1
            ret



cuadro_menor:
            ;coordenadas iniciales
            mov cx, 580d ;columna
            mov dx, 35d ;fila

sigo2:call pixel
            inc dx
            cmp dx, 470d
            jne sigo2
            ret



cuadro_menor1:
            ;coordenadas iniciales
            mov cx, 50d ;columna
            mov dx, 470d ;fila

sigo3:  call pixel
            inc cx
            cmp cx, 580d
            jne sigo3
            mov cx, 50d
;Primer cuadro de adentro

primer_cuadro_1: 
            mov cx, 100d
            mov dx, 80d

sigo_primero_1_1:
            call pixel
            inc cx
            cmp cx, 290d
            jne sigo_primero_1_1
            mov cx, 100d

sigo_primero_1_2:
            call pixel
            inc dx
            cmp dx, 225d
            jne sigo_primero_1_2
            ret

primer_cuadro_2:
            mov cx, 290d
            mov dx, 80d

sigo_primero_1_3:
            call pixel
            inc dx
            cmp dx, 225d
            jne sigo_primero_1_3
            ret

primer_cuadro_3:
            mov cx, 100d
            mov dx, 225d

sigo_primero_1_4:
            call pixel
            inc cx
            cmp cx, 290d
            jne sigo_primero_1_4
            mov cx, 100d

;Segundo cuadro de adentro

segundo_cuadro_1: 
            mov cx, 340d
            mov dx, 80d

sigo_segundo_1_1:
            call pixel
            inc cx
            cmp cx, 530d
            jne sigo_segundo_1_1
            mov cx, 340d

sigo_segundo_1_2:
            call pixel
            inc dx
            cmp dx, 225d
            jne sigo_segundo_1_2
            ret

segundo_cuadro_2:
            mov cx, 530d
            mov dx, 80d

sigo_segundo_1_3:
            call pixel
            inc dx
            cmp dx, 225d
            jne sigo_segundo_1_3
            ret

segundo_cuadro_3:
            mov cx, 340d
            mov dx, 225d

sigo_segundo_1_4:
            call pixel
            inc cx
            cmp cx, 530d
            jne sigo_segundo_1_4
            mov cx, 340d

;Dibujar tercer cuadro de adentro

tercer_cuadro_1: 
            mov cx, 100d
            mov dx, 275d

sigo_tercer_1_1:
            call pixel
            inc cx
            cmp cx, 290d
            jne sigo_tercer_1_1
            mov cx, 100d

sigo_tercer_1_2:
            call pixel
            inc dx
            cmp dx, 420d
            jne sigo_tercer_1_2
            ret

tercer_cuadro_2:
            mov cx, 290d
            mov dx, 275d

sigo_tercer_1_3:
            call pixel
            inc dx
            cmp dx, 420d
            jne sigo_tercer_1_3
            ret

tercer_cuadro_3:
            mov cx, 100d
            mov dx, 420d

sigo_tercer_1_4:
            call pixel
            inc cx
            cmp cx, 290d
            jne sigo_tercer_1_4
            mov cx, 100d

;cuarto cuadro de adentro

cuarto_cuadro_1: 
            mov cx, 340d
            mov dx, 275d

sigo_cuarto_1_1:
            call pixel
            inc cx
            cmp cx, 530d
            jne sigo_cuarto_1_1
            mov cx, 340d

sigo_cuarto_1_2:
            call pixel
            inc dx
            cmp dx, 420d
            jne sigo_cuarto_1_2
            ret

cuarto_cuadro_2:
            mov cx, 530d
            mov dx, 275d

sigo_cuarto_1_3:
            call pixel
            inc dx
            cmp dx, 420d
            jne sigo_cuarto_1_3
            ret

cuarto_cuadro_3:
            mov cx, 340d
            mov dx, 420d

sigo_cuarto_1_4:
            call pixel
            inc cx
            cmp cx, 530d
            jne sigo_cuarto_1_4
            mov cx, 340d


pixel: ;dibuja un pixelito
            mov ah, 0Ch
            mov al, 1001b
            mov bh, 00
            int 10h
            ret 


;-------Comida

;Horizontal izquierda

comida_izquierda:
            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 06d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 09d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 12d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

                        mov ah, 02h ;funcion
            mov dh, 18d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

                        mov ah, 02h ;funcion
            mov dh, 21d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

                        mov ah, 02h ;funcion
            mov dh, 24d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

comida_arriba:
            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 15d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 21d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 27d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 33d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 45d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 51d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

                        mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 57d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 63d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

comida_centro:
            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 06d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 09d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 12d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 18d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 21d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 24d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

comida_enmedio:
            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 15d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 21d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 27d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 33d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 45d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 51d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 57d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 63d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

comida_derecha:
            mov ah, 02h ;funcion
            mov dh, 03d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 06d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 09d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 12d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 18d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 21d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 24d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

comida_abajo:
            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 09d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 15d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 21d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 27d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 33d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 45d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 51d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 57d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 63d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            mov ah, 02h ;funcion
            mov dh, 27d ;fila
            mov dl, 69d ;columna
            mov bh, 00h ;pagina
            int 10h
            mov al, "."
            call caracter

            ret

caracter:
            mov ah, 09h ;funcion
            mov bh, 00h ;pagina
            mov bl, 07h ;color
            mov cx, 01d ;veces que se repite
            int 10h
            ;mov ah, 0Eh
            ;mov bh, 00
            ;mov bl, 07h
            ;int 10h
            ret

;Movimieno del Pacman
            
; clear_screen:
;             mov AH,06H; Funcion scroll up
;             mov al,00H; Clear
;             mov BH,00H; Atributo
;             mov CL,00H; Columna inicial
;             mov CH,00d; Fila inicial
;             mov DL,79d; Columna final
;             mov DH,24d; Fila final
;             int 10H
;             ret

delay:
        mov AH, 00H ;Obtengo contador de reloj en CX:DX
        int 1AH
        mov si,dx; Guardo el tiempo inicial
timer:  call mover_pacman
        mov AH, 00H; Obtengo tiempo actual
        int 1AH
        
        sub dx,si; Tiempo actual - tiempo inicial
        cmp dx,00fH; intervalo de tiempo que debo esperar
        jb timer
        ret

pacman: 
            mov ah, 02h ;funcion
            mov dh, 15d ;fila
            mov dl, 39d ;columna
            mov bh, 00h ;pagina
            int 10h

            mov [0512h], dh; guardando en dirección de memoria la posicion y del pacman
            mov [0514h], dl; guardando en dirección de memoria la posición x del pacman

            mov al, "O"
            call dibujar_pacman
            ret
      
; Dibujando pacman

dibujar_pacman:
            mov ah, 09h
            mov bh, 00h
            mov bl, 0Eh
            mov cx, 01h
            int 10h

            mov ah, 0eh
            mov bh, 00h,
            mov bl, 0eh
            int 10h

            ret

mover_pacman:
        call esperar;llama la funcion de teclado
        mov [0700h], al;guarda en la direccion 0700h el valor ASCII de la tecla presionada
        call elegir_lado;manda a llamar la funcion que decide a que lado moverse
        ret

;Funcion que determina a que lado se va a mover la nave
elegir_lado: 
        mov bl, [0700h]; se obtiene el valor ASCII ingresado
        cmp bl, "d"
        je moverN_derecha;Se compara si es d y si lo es se mueve la nave a la derecha
        ;cmp bl, "a"
        ;je moverN_izquierda;Se compara si es a y si lo es se mueve la nave a la izquierda
        ;jne mover_nave;Si no es ninguna de las 3 se llama a la funcion de mover nave de nuevo
        ret

moverN_derecha: 
        call clear_pacman
        mov bl, [0514H];obteniendo ultima posicion en x del pacman
        add bl, 06d
        cmp bl, 69d
        jb pintarMas
        mov bl, 69d
        pintarMas:
        mov [0514h], bl
        mov ah, 02h
        mov dh, [0512H]
        mov dl, bl
        mov bh, 00h
        int 10h
        mov [0512H], dh; guardando en una dirección de memoria posición en y del pacman
        mov [0514H], dl; guardando en una dirección de memoria posición en x del pacman
        mov al, "O"
        call dibujar_pacman
        ;call mover_nave
        ret

moverN_izquierda: 
        call clear_pacman
        mov bl, [0514H];obteniendo ultima posicion en x del pacman
        sub bl, 2d
        cmp bl, 22d
        ja pintarMenos
        mov bl, 22d
        pintarMenos:
        mov [0514h], bl
        mov ah, 02h
        mov dh, 25d
        mov dl, bl
        mov bh, 00h
        int 10h

        mov [0512H], dh; guardando en una dirección de memoria posición en y del pacman
        mov [0514H], dl; guardando en una dirección de memoria posición en x del pacman
        
        mov al, "A"
        call dibujar_pacman
        ;call mover_nave

        ret

clear_pacman:
        mov ah,06H; Funcion scroll up
        mov al,00H; Clear
        mov bh,00H; Atributo
        mov cl,00H; Columna inicial
        mov ch,00d; Fila inicial
        mov dl,79d; Columna final
        mov dh,29d; Fila final
        int 10h
        ret


esperar:
	mov ah, 01h
	int 16h
	jz tecret
	mov ah, 00h
	int 16h
tecret:
	ret



; espera:
;             mov ah, 00
;             int 16h
;             ret
; ------------------------------------------------------------------------------------------------
;Code Ends
;End Start		;Fin de Programa



