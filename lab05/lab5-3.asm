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

    mov eax,4     ;Системный вызов для записи (sys_write)
    mov ebx,1
    mov ecx,msg     ;Описатель файла 1 - стандартный вывод
    mov edx,msgLen
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 80
    int 80h

 
