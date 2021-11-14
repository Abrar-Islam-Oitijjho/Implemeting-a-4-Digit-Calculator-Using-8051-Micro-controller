     ORG 00H
     MOV A,#38H
		ORG	00H
		
		RS	EQU	P3.5	
		RW	EQU	P3.6	
		E	EQU	P3.7	
		
		MOV	SP, #70H
		MOV	PSW, #00H
		
LCD_IN:		MOV	A, #38H			
		ACALL	COMNWRT		
		ACALL 	DELAY			
		MOV 	A, #0EH		
		ACALL	COMNWRT			
		ACALL 	DELAY			
		MOV	A, #01			
		ACALL	COMNWRT			
		ACALL 	DELAY	
		MOV	A, #06H			
		ACALL	COMNWRT			
		ACALL 	DELAY			
		MOV	A, #80H		
		ACALL	COMNWRT			
		ACALL 	DELAY
              				
	MOV R1,#0	
        MOV R2,#0
        MOV R3,#0
        MOV R6,#0
        MOV R5,#0
        MOV R7,#0
        MOV R4,#11
	MOV P2,#0FFH
START:	
	DJNZ R4,K1
	LJMP RESULT
K1:	MOV P3,#0
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B,K1
K2:	ACALL DELAY
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B,OVER
	SJMP K2
	
OVER:	ACALL DELAY
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B,OVER1
	SJMP K2
OVER1:	MOV P3,#11111110B
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B, ROW_0
	MOV P3,#11111101B
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B,ROW_1
	MOV P3,#11111011B
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B, ROW_2
	MOV P3,#11110111B
	MOV A,P2
	ANL A,#00001111B
	CJNE A,#00001111B, ROW_3
	LJMP K2
ROW_0: MOV DPTR,#KCODE0
	SJMP FIND
ROW_1: MOV DPTR,#KCODE1
	SJMP FIND
ROW_2: MOV DPTR,#KCODE2
	SJMP FIND
ROW_3: MOV DPTR,#KCODE3
FIND:	RRC A
	JNC MATCH
	INC DPTR
	SJMP FIND
MATCH:  CLR A
	MOVC A,@A+DPTR
	ACALL DATAWRT
	CJNE R4,#10,CHECKIFNINE
	LJMP FIRSTPRESS
CHECKIFNINE: CJNE R4,#9,CHECKIFEIGHT
	     LJMP SECONDPRESS
CHECKIFEIGHT: CJNE R4,#8,CHECKIFSEVEN
             LJMP THIRDPRESS
CHECKIFSEVEN: CJNE R4,#7,CHECKIFSIX
             LJMP FORTHPRESS
CHECKIFSIX: CJNE R4,#6,CHECKIFFIVE
             LJMP FIVTHPRESS
CHECKIFFIVE: CJNE R4,#5,CHECKIFFOUR
              LJMP SIXTHPRESS
CHECKIFFOUR: CJNE R4,#4,CHECKIFTHREE
              LJMP SEVENTHPRESS
CHECKIFTHREE: CJNE R4,#3,CHECKIFTWO
              LJMP EIGTHPRESS
CHECKIFTWO: CJNE R4,#2,CHECKIFONE
              LJMP NINTHPRESS
CHECKIFONE: CJNE R4,#1,ERROR
              LJMP TENTHPRESS
 
 
 ERROR: MOV DPTR,#MYDATA_
 FIRSTPRESS: CLR C
             SUBB A,#48
             MOV R1,A
             CLR A
             LJMP START
 SECONDPRESS: 
              CLR C
              SUBB A,#48
              MOV R2,A
              CLR A
              MOV A,R1
              MOV B,#10
              MUL AB 
              ADD A,R2
              MOV R1,A
              MOV R2,#0
              LJMP START

     
 THIRDPRESS: 
 	       CLR C
               SUBB A,#48
               MOV R2,A
               LJMP START


 FORTHPRESS:
 	      CLR C
              SUBB A,#48
              MOV R3,A
              CLR A
              MOV A,R2
              MOV B,#10
              MUL AB 
              ADD A,R3
              MOV R2,A
              MOV R3,#0
              LJMP START
 
 
            
 FIVTHPRESS:   CLR C
               MOV R3,A
               LJMP START
 		
 
 SIXTHPRESS:  
 	       CLR C
               SUBB A,#48
               MOV R5,A
               LJMP START
 SEVENTHPRESS:
 	      CLR C
              SUBB A,#48
              MOV R6,A
              CLR A
              MOV A,R5
              MOV B,#10
              MUL AB 
              ADD A,R6
              MOV R5,A
              MOV R6,#0
              LJMP START
 EIGTHPRESS:
 		CLR C
               SUBB A,#48
               MOV R6,A
               LJMP START
               LJMP START
 NINTHPRESS:
 	      CLR C
              SUBB A,#48
              MOV R7,A
              CLR A
              MOV A,R6
              MOV B,#10
              MUL AB 
              ADD A,R7
              MOV R6,A
              MOV R7,#0
              LJMP START
 TENTHPRESS:
 		LJMP ISITEQUAL3
 		
 ISITEQUAL3:  CJNE A,#61,ISITCLR4
              SJMP RESULT
 RETURN11:     MOV DPTR,#MYDATA_
  ISITCLR4:  CJNE A,#35,RETURN11
              MOV A,#01
              ACALL COMNWRT
 RESULT:      LCALL ISITADD3
              
              
 
 ISITADD3:  CJNE R3,#43,ISITSUBB3
            MOV A,R2
            ADD A,R6
            
            mov b,#100
            div ab
            mov 41h,a
            mov a,b
            mov b,#10
            div ab
            add a,#30h
            mov 42h,a
            mov a,b
            add a,#30h
            mov 43h,a
            CLR A
            MOV A,R1
            ADD A,R5
            add a,41h
            mov b,#100
            div ab
            mov 46h,a
            mov a,b
            mov b,#10
            div ab
            add a,#30h
            mov 45h,a
            mov a,b
            add a,#30h
            mov 44h,a
            
 	mov a,46h
 	add a,#30h
          ACALL DATAWRT
         mov a,45h
          ACALL DATAWRT
          mov a,44h
          ACALL DATAWRT
          mov a,42h
          ACALL DATAWRT
          mov a,43h
          ACALL DATAWRT
            LJMP k1
 NUM2ASCII: 
            MOV A,41H
            MOV B,#10
            DIV AB
            ADD A,#48
            MOV R3,A
            MOV A,B
            ADD A,#48
            MOV R4,A 
            MOV A,42H 
            MOV B,#10
            DIV AB
            ADD A,#48
            MOV R1,A
            MOV A,B
            ADD A,#48
            MOV R2,A 
            MOV A,R1
            ACALL DATAWRT
            MOV A,R2
            ACALL DATAWRT
            MOV A,R3
            ACALL DATAWRT
            MOV A,R4
            ACALL DATAWRT
            CLR PSW.3 
            LJMP K1 
 
     
           
ISITSUBB3:CJNE R3,#45,ISITDIV3
          MOV A,R1
          MOV 40H,#0
          MOV 40H,R5
          CJNE A,40H,HELLO
HELLO:    JNC HELLO_;check whether first two digits of first number is greater or smaller than first two digits of second number;
	  CLR C
          MOV A,R6
          SUBB A,R2
          MOV 41H,A
          CLR A
          MOV A,R5
          SUBB A,R1
          MOV 42H,A
          MOV A,#45
          ACALL DATAWRT
          SJMP NUM2ASCII
HELLO_:   MOV A,R2
	  MOV 40H,#0
          MOV 40H,R6
          CJNE A,40H,HELLO1
;;if the second number is greater than first number the subtract will take place in HELLO1	    
HELLO1:    JNC NORMAL;check whether second  two digits of first number is greater or smaller than second two digits of second number //this is for two or one digit input
	   CLR C
           MOV A,R6
           SUBB A,R2
           MOV 41H,A
           CLR A
           MOV A,R5     
           SUBB A,R1
           MOV 42H,A
           MOV A,#45
           ACALL DATAWRT
           SJMP NUM2ASCII
           ;;if the second number is greater than first number the subtract will take place in NORMAL  
NORMAL:     
            MOV A,R2
            SUBB A,R6
            MOV 41H,A
            CLR A
            MOV A,R1
            SUBB A,R5
            MOV 42H,A
            LJMP NUM2ASCII          
ISITDIV3: CJNE R3,#47,ISITMUL3
            MOV 41H,#00H
	    MOV 42H,#00H
	    MOV 50H,R1
	    MOV 51H,R2
	    MOV 52H,R5
            MOV 53H,R6
            CLR A
            MOV A,52H
            CJNE A,#00,CHECK_RESULT
            SJMP CHECK_ZERO
CHECK_ZERO:  CLR A
	     MOV A,53H
	     CJNE A,#00,CHECK_RESULT
	     MOV DPTR,#MYDATA_
	     MOV R1,#05
	     SJMP ERROR_	     
ERROR_:  CLR A
	MOVC A,@A+DPTR
	LCALL DATAWRT
	INC DPTR 
	DJNZ R1,ERROR_
	
	LJMP K1

CHECK_RESULT: MOV A,50H
              CJNE A,52H,CHECK_RESULT_ZERO
              SJMP CHECK_NEXT_RESULT_ZERO
CHECK_NEXT_RESULT_ZERO:CLR A
			MOV A,51H
			CJNE A,53H,CHECK_RESULT_ZERO
CHECK_RESULT_ZERO:JNC DIVIDE
		  MOV 41H,#00
		  MOV 42H,#00
		  LJMP NUM2ASCII

DIVIDE:
	    MOV A,51H
            SUBB A,53H
            MOV 45H,A
            CLR A
            MOV A,50H
            SUBB A,52H
            MOV 46H,A
            INC 41H
            MOV A,41H
            CJNE A,#255,OK
            SJMP ANOTHER_MEMORY
ANOTHER_MEMORY:INC 42H
	       SJMP OK

OK:          MOV A,46H
            CJNE A,52H,CHECK2
            SJMP CHECK1
CHECK1: MOV A,45H
	CJNE A,53H,CHECK2
	
CHECK2:JNC DIVIDE_
	LJMP NUM2ASCII
DIVIDE_:MOV 51H,45H
	MOV 50H,46H
	SJMP DIVIDE

 RETURN5:    MOV DPTR,#MYDATA_
            
           
ISITMUL3: CJNE R3,#42,RETURN5
          MOV A,r2
          MOV B,r6
          mul AB
          
          MOV 70h,A ;DOSOK GHOR FIRST NUMBER ER
          
          MOV 71h,B
          MOV a,r1 ;EKOK GHOR FIRST NUMBER ER
	  mov b,r6
	  mul ab
	  mov 72h,a
	  mov 73h,b
          CLR A
          
          MOV A,R2
          MOV B,r5
          mul AB
          
          MOV 74h,A ;DOSOK GHOR SECOND NUMBER ER
          CLR A
          MOV 75h,B
          MOV a,r1 ;EKOK GHOR SECOND NUMBER ER
          mov b,r5
          mul ab
          mov 76h,a
          mov 77h,b
          MOV A,70h
          MOV B,#10
          div ab
          add a,#30h
          mov 61h,a
          mov a,b
          add a,#30h
          mov 60h,a
          mov a,71h
          add a,72h
          add a,74h
          
          mov b,#100
          div ab
          mov 21h,a
          mov a,b
          mov b,#10
          div ab
          add a,#30h
          mov 63h,a
          mov a,b
          add a,#30h
          mov 62h,a
          mov a,21h
          add a,73h
          add a,75h
          add a,76h
          mov b,#100
          div ab
          mov 22h,a
          mov a,b
          mov b,#10
          div ab
          add a,#30h
          mov 65h,a
          mov a,b
          add a,#30h
          mov 64h,a
          mov a,22h
          add a,77h
          mov b,#10
          div ab
          
          
          add a,#30h
          mov 67h,a
          mov a,b
          add a,#30h
          mov 66h,a
          
          
         
          mov a,67h
          ACALL DATAWRT
          mov a,66h
          ACALL DATAWRT
          mov a,65h
          ACALL DATAWRT
          mov a,64h
          ACALL DATAWRT
          mov a,63h
          ACALL DATAWRT
          mov a,62h
          ACALL DATAWRT
          mov a,61h
          ACALL DATAWRT
          mov a,60h
          ACALL DATAWRT
          LJMP K1         
          
          
          
  SOM:    SETB PSW.3
          CLR PSW.4
          MOV A,R5
          MOV B,#10
          DIV AB
          SETB PSW.4
          SETB PSW.3
          MOV R0,A
          CLR PSW.3
          SETB PSW.4
          MOV A,B
          MOV R1,A
          CLR PSW.4
          SETB PSW.3
          MOV A,R7
          ADD A,#48
          ACALL DATAWRT
          SETB PSW.3
          SETB PSW.4
          MOV A,R0
          ADD A,#48
          ACALL DATAWRT
          CLR PSW.3
          SETB PSW.4
          MOV A,R1
          ADD A,#48
          ACALL DATAWRT
          CLR A
          MOV A,R5
          ADD A,#48
          ACALL DATAWRT
          CLR PSW.4  
          CLR PSW.3
          LJMP K1         
                                     	
	ORG 300H
KCODE0: DB '/','9','8','7'
KCODE1: DB '*','6','5','4'
KCODE2: DB '-','3','2','1'
KCODE3: DB '+','=','0',' '



COMNWRT:	LCALL	READY			
		MOV	P1, A		
		CLR	RS			
		CLR	RW	
		SETB	E				
		ACALL	DELAY			
		CLR	E			
		RET
DATAWRT:	LCALL	READY			
		MOV	P1,A
		SETB	RS			
		CLR	RW		
		SETB	E			
		ACALL	DELAY			
		CLR	E			
		RET

		
READY:		SETB	P1.7			
		CLR	RS			
		SETB	RW			

WAIT:		CLR	E			
		LCALL	DELAY
		SETB	E
		JB	P1.7, WAIT
		RET                	

DELAY:		MOV	R0, #50			
HERE2:		MOV	R7, #255
HERE:		DJNZ	R7, HERE		
		DJNZ 	R0, HERE2
		RET
MYDATA_:         DB "ERROR",0
		
	        END
	        
;first input R1 R2
;second input R5 R6
;output memory location 41 and 42