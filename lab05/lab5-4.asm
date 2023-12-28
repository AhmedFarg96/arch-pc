%include 'in_out.asm'

SECTION .data ;  Секция инициированных данных
msg: DB 'Ведите строку: ',10 ; сообщение плюс
                             ; cимвол перевода строки
msgLen: EQU $-msg               ;длина переменной 'msg'

SECTION   .bas     ; Секция не инициированных данных
buf1:     RESB 80  ; буфер размером 80байт

;--------------  Texct программы  ------------------

SECTION .text      ; Код программы
   GLOBAL _start      ; начало прогрммы
   _start:           ; точка входа в программу


;--------------  Системный вызов 'write' --------------
; После вызова инструкции  'int 80h' на экран будет
; выведено сообщение  из  переменной  'msg' длиной  'msgLen'

    mov  eax, msg     ;Системный вызов для записи (sys_write)
    call sprint

    mov  ecx, buf1     ;Описатель файла 1 - стандартный вывод
    mov edx, 80

    call sread
    mov eax,4
    mov ebx,1
    mov ecx,buf1
    int 80h    

    call quit

