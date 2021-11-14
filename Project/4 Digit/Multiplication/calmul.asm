 
		ORG	00H
		
		RS	EQU	P3.5	
		RW	EQU	P3.6	
		E	EQU	P3.7	
		
		MOV	SP, #70H
		MOV	PSW, #00H
		
	
	MOV R1,#99	
        MOV R2,#99
        MOV R3,#0
        MOV R6,#99
        MOV R5,#99
        MOV R7,#0
        MOV R4,#11
	MOV P2,#0FFH
            
           
ISITMUL3:
	 
	 
	 mov a,r1
	 mov b,#10
	 div ab
	 mov 70h,a
	 mov 71h,b
	 
	 mov a,r2
	 mov b,#10
	 div ab
	 mov 72h,a
	 mov 73h,b
	 
	 mov a,r5
	 mov b,#10
	 div ab
	 mov 60h,a
	 mov 61h,b
	 
	 mov a,r6
	 mov b,#10
	 div ab
	 mov 62h,a
	 mov 63h,b
	 
	 
	
         mov a,73h
	 mov b,63h
	 mul ab
	 
	 mov b,#10
	 div ab
	 mov 020h,b
	 mov 05fh,a
	 
	 mov a,72h
	 mov b,63h
	 mul ab
	 add a,05Fh
	 mov b,#10
	 div ab
	 mov 021h,b
	 mov 05fh,a
	 
	 mov a,71h
	 mov b,63h
	 mul ab
	 add a,05fh
	 
	 mov b,#10
	 div ab
	 mov 022h,b
	 mov 05Fh,a
	 
	 mov a,70h
	 mov b,63h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 023h,b
	 mov 024h,a
	
         mov a,73h
	 mov b,62h
	 mul ab
	 
	 mov b,#10
	 div ab
	 mov 025h,b
	 mov 05fh,a
	 
	 mov a,72h
	 mov b,62h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 026h,b
	 mov 05fh,a
	 
	 mov a,71h
	 mov b,62h
	 mul ab
	 add a,05fh
	 
	 mov b,#10
	 div ab
	 mov 027h,b
	 mov 05fh,a
	 
	 mov a,70h
	 mov b,62h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 028h,b
	 mov 029h,a	 
	 
	 mov a,73h
	 mov b,61h
	 mul ab
	 
	 mov b,#10
	 div ab
	 mov 02ah,b
	 mov 05fh,a
	 
	 mov a,72h
	 mov b,61h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 02bh,b
	 mov 05fh,a
	 
	 mov a,71h
	 mov b,61h
	 mul ab
	 add a,05fh
	 
	 mov b,#10
	 div ab
	 mov 2ch,b
	 mov 05fh,a
	 
	 mov a,70h
	 mov b,61h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 02dh,b
	 mov 02eh,a	 
	 
	 mov a,73h
	 mov b,60h
	 mul ab
	 
	 mov b,#10
	 div ab
	 mov 030h,b
	 mov 05fh,a
	 
	 mov a,72h
	 mov b,60h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 031h,b
	 mov 05fh,a
	 
	 mov a,71h
	 mov b,60h
	 mul ab
	 add a,05fh
	 
	 mov b,#10
	 div ab
	 mov 032h,b
	 mov 05fh,a
	 
	 mov a,70h
	 mov b,60h
	 mul ab
	 add a,05fh
	 mov b,#10
	 div ab
	 mov 033h,b
	 mov 034h,a
	 
	 
	 mov a,020h
	 add a,#30h
	 mov 060h,a
	 
	 mov a,021h
	 add a,025h
	 
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 061h,a
	 
	 mov a,03fh
	 add a,022h
	 add a,026h
	 add a,02ah
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 062h,a
	 
	 mov a,03fh
	 add a,023h
	 add a,027h
	 add a,02bh
	 add a,030h
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 063h,a
	 
	 mov a,03fh
	 add a,024h
	 add a,028h
	 add a,02ch
	 add a,031h
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 064h,a
	 
	 mov a,03fh
	 add a,029h
	 add a,02dh
	 add a,032h
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 065h,a
	 
	 mov a,03fh
	 add a,02eh
	 add a,033h
	 mov b,#10
	 div ab
	 mov 03fh,a
	 mov a,b
	 add a,#30h
	 mov 066h,a	
	 
	 mov a,03fh
	 add a,034h
	  mov b,#10
	 div ab
	 mov 068h,a
	 mov a,b
	 add a,#30h
	 mov 067h,a
	 
	      
HERE222:        
	 SJMP HERE222        
          
          
          
                                     	
	        END
	        
