;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;										 ;										 ;
;   ARM Cortex M0 processor is utilized. Recursion process is carried out by     ;
;   implementing fibonacci series. Program is designed to calculate the indexed  ;
;   fibonnacci number which is declared as global variable.                      ;
;										 ;										 ;
;	R1 is assigned as result register.					 ;						 ;
;										 ;										 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					

		AREA firstcode, code, readonly 			;Declare new area
		ENTRY						;Declare as entry poin
		ALIGN 2						;Ensures that __main addresses the following instruction.
		THUMB
		GLOBAL	__main
		
index	EQU   9							;Declare symbolic value

__main	FUNCTION
		MOVS R0, #index+1				;Taking index num.
		BL L						;Linked Branch
		B stop

L		PUSH {R4,R5,R6,LR}         			;pushing registers
		MOV R4, R0                       		
		CMP R0, #2                       		;i <= 2 condition for branch
		BGT L2						;branch if grater
		MOVS R0, #1					;if less and equal it is 1
		B	F_END                      		;branch popping
L2		SUBS R0, R4, #2                         	;subs 2 for fibbo(n-2)
		BL L                         		    	;branch for fibbo(n-2)
		MOV R5, R0                      		;previous value
		SUBS R0, R4, #1                   		;subs 1 for fibbo(n-1)
		BL L                           			;branch for fibbo(n-1)
		ADD R0, R0, R5                   		;adding values
F_END                         					;with link returrn value                        
		POP {R4,R5,R6,PC} 				;popping register
		
		
stop 	MOVS r1,r0						;having result in r1
		B	stop

		ENDFUNC						;Finish Function
		END						;Finish Assebly File
