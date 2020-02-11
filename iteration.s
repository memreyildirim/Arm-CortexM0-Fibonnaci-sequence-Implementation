;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;									         ;									 ;
;	ARM Cortex M0 processor is utilized. Array implementation is done in     ;
;       fibonacci series. Program is designed to calculate the indexed  	 ;
;	fibonnacci number which is declared as global variable.                  ;
;										 ;											 ;
;	R6 is assigned as result register.					 ;						 ;
;										 ;										 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					


Index       	EQU	10					;Index number
ArraySize   	EQU	(Index)*4				;Array size , due to addresses -> *4

		AREA     My_Array, DATA, READWRITE		;Define this part will write in data area
		ALIGN	
y_array SPACE    ArraySize					;Allocate space from memory for y
y_end

		AREA copy_array, code, readonly			;Define this part will write as code
		ENTRY
		THUMB
		ALIGN 
__main		FUNCTION
		EXPORT __main	
		MOVS	r3,#ArraySize				;Load array size
		MOVS 	r0,#0					;i=0 as index value
devam	LDR 	r1,=y_array					;Load start address of the allocated space for y
		CMP 	r0,#4					;Compare for extracting n<=2 
		BLE 	NEW					; IF true branch new
Copy	CMP		r0,r3					;Check i<array_size
		BGE		stop				;if not finish loop
		SUBS	r7,r0, #4				;substraction to get first previous adress to r7
		LDR     r5, [r1,r7]				;first element to r5
		
		SUBS	r7,r7, #4				;second adress to r7
		LDR     r4, [r1,r7]				;load it to r4
		ADDS    r6 , r4,r5				;adding two numbers
		STR     r6,[r1,r0]				;storing it into current address , r6 is result register
		ADDS 	r0,r0,#4				;next address
		B 		Copy  				;branch
NEW	
		MOVS    r2 , #1					;1 to r2
		MOVS    r6, #1					;r6 is result register, label for n<2
		STR     r2, [r1,r0]				;storing it into array
		ADDS 	r0,r0,#4				;next address
		B		devam				;branch
stop	B stop							;stop infinite loop
		ALIGN
		ENDFUNC


		END
