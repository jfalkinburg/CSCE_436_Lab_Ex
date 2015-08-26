;-------------------------------------------------------------------------------
; CompEx 1 - Introduction to the MSP430 and Code Composer Studio
; Capt Jeff Falkinburg, USAF / 16 Jun 2015 / 16 Jun 2015
;
; This program is a demonstration of using the CCS IDE to
; program, assemble, flash, and debug the MSP430.

;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section
            .retainrefs                     ; Additionally retain any sections
                                            ; that have references to current
                                            ; section
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
                                            ; Main loop here
;-------------------------------------------------------------------------------
            mov.w   #0x0200, r9
            mov.w   #10, r10

            mov.w   #0, r11
            mov.w   r11, 0(r9)

            mov.w   #1, r12
            incd    r9
            mov.w   r12, 0(r9)

loop        tst     r10
            jz      forever

            incd    r9
            dec     r10

            mov.w   r12, r13
            add.w   r11, r12
            mov.w   r12, 0(r9)
            mov.w   r13, r11
            jmp     loop

forever     jmp     forever
;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
