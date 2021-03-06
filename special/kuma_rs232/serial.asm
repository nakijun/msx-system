;  
;   SERIAL -> Source re-created by Z80DIS 2.2
;      Z80DIS was written by Kenneth Gielow
;                            Palo Alto, CA
        .Z80
        ORG	4000H
D.0000	EQU	0000H	; --S-I
I$0001	EQU	0001H	; ----I
I$0002	EQU	0002H	; ----I
BDOS	EQU	0005H	; ----I
I$0009	EQU	0009H	; ----I
I$000A	EQU	000AH	; ----I
I$000C	EQU	000CH	; ----I
I$000D	EQU	000DH	; ----I
I$000F	EQU	000FH	; ----I
I$0014	EQU	0014H	; ----I
I$0018	EQU	0018H	; ----I
I.0030	EQU	0030H	; ----I
C.0038	EQU	0038H	; -C---
I$0064	EQU	0064H	; ----I
C$009C	EQU	009CH	; -C---
C.009F	EQU	009FH	; -C---
C$00A2	EQU	00A2H	; -C---
C$00A5	EQU	00A5H	; -C---
I$00B7	EQU	00B7H	; ----I
I$0180	EQU	0180H	; ----I
C$0217	EQU	0217H	; -C---
I$0801	EQU	0801H	; ----I
D$6000	EQU	6000H	; ---L-
I$631B	EQU	631BH	; ----I
I$632B	EQU	632BH	; ----I
I$6331	EQU	6331H	; ----I
I$67D0	EQU	67D0H	; ----I
I$6E6B	EQU	6E6BH	; ----I
I$6E6E	EQU	6E6EH	; ----I
I$6E77	EQU	6E77H	; ----I
I$6E80	EQU	6E80H	; ----I
I$6E86	EQU	6E86H	; ----I
I$73B2	EQU	73B2H	; ----I
D.F55E	EQU	0F55EH	; --SL-
D.F55F	EQU	0F55FH	; --SL-
D.F560	EQU	0F560H	; --SL-
D.F561	EQU	0F561H	; --SLI
D.F562	EQU	0F562H	; --SLI
D.F563	EQU	0F563H	; --SLI
D.F564	EQU	0F564H	; --SL-
I.F566	EQU	0F566H	; ----I
I$F567	EQU	0F567H	; ----I
I.F663	EQU	0F663H	; ----I
I$F7F6	EQU	0F7F6H	; ----I
D.F7F8	EQU	0F7F8H	; --S-I
D$F862	EQU	0F862H	; ---L-
D$F864	EQU	0F864H	; --S--
I.F8CF	EQU	0F8CFH	; ----I
I$F8DF	EQU	0F8DFH	; ----I
I$F8EF	EQU	0F8EFH	; ----I
D.FB03	EQU	0FB03H	; --SL-
D.FB04	EQU	0FB04H	; --SL-
D.FB06	EQU	0FB06H	; --SLI
J.FB07	EQU	0FB07H	; J---I
J.FB0C	EQU	0FB0CH	; J---I
J.FB11	EQU	0FB11H	; J---I
D.FB16	EQU	0FB16H	; ---LI
D.FB17	EQU	0FB17H	; ---LI
D$FB18	EQU	0FB18H	; ---L-
D.FB1A	EQU	0FB1AH	; --SLI
D.FB1B	EQU	0FB1BH	; --SLI
D.FB1C	EQU	0FB1CH	; --SLI
D.FB1D	EQU	0FB1DH	; --S-I
D.FB1E	EQU	0FB1EH	; --SL-
D.FB1F	EQU	0FB1FH	; --SL-
I$FB20	EQU	0FB20H	; ----I
I$FBD8	EQU	0FBD8H	; ----I
I$FC82	EQU	0FC82H	; ----I
D.FC9B	EQU	0FC9BH	; --SL-
D$FCA9	EQU	0FCA9H	; ---L-
D$FCC0	EQU	0FCC0H	; ---L-
I$FCC1	EQU	0FCC1H	; ----I
I.FD89	EQU	0FD89H	; ----I
D.FD9A	EQU	0FD9AH	; --S-I
D$FD9B	EQU	0FD9BH	; --S--
D$FD9C	EQU	0FD9CH	; --S--
D$FD9E	EQU	0FD9EH	; --S--
D.FF3E	EQU	0FF3EH	; --S-I
D$FF3F	EQU	0FF3FH	; --S--
D$FF40	EQU	0FF40H	; --S--
D$FF42	EQU	0FF42H	; --S--
X.FFCA	EQU	0FFCAH	; -CS-I
D$FFCB	EQU	0FFCBH	; --S--
D$FFCC	EQU	0FFCCH	; --S--
D$FFCE	EQU	0FFCEH	; --S--
I$FFCF	EQU	0FFCFH	; ----I
I$FFF3	EQU	0FFF3H	; ----I
I.FFFF	EQU	0FFFFH	; ----I
        DEFB	"A","B"
        DEFW	C4075
        DEFW	C4150
        DEFW	C41F2
        DEFW	0
        DEFS	6,0

?4010:	DEFB	010H
        DEFB	0
        DEFB	0
        JP	J4040
?4016:	JP	C4260
?4019:	JP	C4F5C
?401C:	JP	C42C5
?401F:	JP	C4DDB
?4022:	JP	C4290
?4025:	JP	J406A
?4028:	JP	C4317
?402B:	JP	C4342
?402E:	JP	C437F
?4031:	JP	C4EDF
?4034:	JP	C4F44
?4037:	RET
        RET
        RET
?403A:	RET
        RET
        RET
?403D:	RET
        RET
        RET

J4040:	EI
        PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	IY,-13
        ADD	IY,SP
        LD	SP,IY
        PUSH	IY
        POP	DE
        LD	C,13
J4051:	CALL	C44BF
        LD	(DE),A
I4055:	INC	DE
        DEC	C
        JR	NZ,J4051
        CALL	C4AEC
        PUSH	AF
        LD	IY,-13-2
        ADD	IY,SP
        POP	AF
        LD	SP,IY
        POP	HL
        POP	DE
        POP	BC
        RET

J406A:	LD	HL,0
I406D:	CALL	C4C70
        RET	Z
        CALL	C435F
        RET

C4075:	CALL	C4C5C
        LD	IY,I4143
        CALL	C4AEC
        CALL	C4131
        DI
        LD	DE,J.FB11
        LD	HL,D.FD9A
        LD	BC,5
        LDIR
        LD	DE,J.FB0C
        LD	HL,D.FF3E
        LD	BC,5
        LDIR
        CALL	C4C40
        LD	(D$FD9B),A
        LD	(D$FF3F),A
        LD	A,0F7H
        LD	(D.FD9A),A
        LD	(D.FF3E),A
        LD	HL,I4C6A
        LD	(D$FD9C),HL
        LD	HL,I49F0
        LD	(D$FF40),HL
        LD	A,0C9H
        LD	(D$FD9E),A
        LD	(D$FF42),A
        EI
        LD	HL,I$FB20
        BIT	0,(HL)
        JR	NZ,J40D2
        SET	0,(HL)
        LD	HL,X.FFCA
        LD	B,05H	; 5 
J40CD:	LD	(HL),0C9H
        INC	HL
        DJNZ	J40CD
J40D2:	XOR	A
        LD	DE,I$0801
        CALL	X.FFCA
        LD	HL,D.FB16
        LD	(HL),A
        XOR	A
        LD	DE,I$0001
        CALL	X.FFCA
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        OR	(HL)
        LD	(HL),A
        LD	DE,J.FB07
        DI
        LD	HL,X.FFCA
        LD	BC,BDOS
        LDIR
        CALL	C4C40
        LD	(D$FFCB),A
        LD	A,0F7H
        LD	(X.FFCA),A
        LD	HL,I43D4
        LD	(D$FFCC),HL
        LD	A,0C9H
        LD	(D$FFCE),A
        LD	BC,I$0018
        LD	HL,I4119
        LD	DE,I$FFCF
        LDIR
        EI
        RET

I4119:	PUSH	DE
        LD	E,02H	; 2 
        JR	J4121

?411E:	PUSH	DE
        LD	E,03H	; 3 
J4121:	LD	D,00H
        PUSH	IX
        PUSH	IY
        CALL	X.FFCA
        EI
        POP	IY
        POP	IX
        POP	DE
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4131:	XOR	A
        LD	(D.FB1B),A
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4135:	PUSH	HL
        LD	HL,D.FB17
        XOR	A
        LD	(HL),A
        INC	HL
        LD	(HL),A
        INC	HL
        LD	(HL),A
        INC	HL
        LD	(HL),A
        POP	HL
        RET

I4143:	DEFB    "8N1XHNNN"
        DEFW    1200
        DEFW    1200
        DEFB    0

C4150:	EI
        PUSH	HL
        POP	IX
        LD	DE,I419F
        CALL	C415D
        RET	C
        PUSH	DE
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C415D:	PUSH	BC
        PUSH	HL
J415F:	LD	HL,I.FD89
        LD	A,(DE)
        INC	A
        JR	Z,J4178
        CALL	C417C
        JR	Z,J4170
        INC	DE
        INC	DE
        INC	DE
        JR	J415F

J4170:	EX	DE,HL
        INC	HL
        LD	E,(HL)
        INC	HL
        LD	D,(HL)
        AND	A
        JR	J4179

J4178:	SCF
J4179:	POP	HL
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C417C:	LD	A,(DE)
        CALL	C4AE3
        LD	C,A
        LD	A,(HL)
        CALL	C4AE3
        CP	C
        JR	NZ,J418E
        AND	A
        RET	Z
        INC	DE
        INC	HL
        JR	C417C

J418E:	LD	A,(DE)
        AND	A
        JR	Z,J4195
        INC	DE
J4193:	JR	J418E

J4195:	LD	A,(HL)
        AND	A
        JR	Z,J419C
        INC	HL
        JR	J4195

J419C:	LD	A,L
        OR	H
        RET

I419F:	DEFB	"COMINI",0
        DEFW	C458C
        DEFB	"COMDTR",0
        DEFW	C464F
        DEFB	"COMSTAT",0
        DEFW	C466D
        DEFB	"COMBREAK",0
        DEFW	C4691
        DEFB	"COMTERM",0
        DEFW	C46D6
        DEFB	"COM",0
        DEFW	C4947
        DEFB	"COMON",0
        DEFW	C499F
        DEFB	"COMOFF",0
        DEFW	C4981
        DEFB	"COMSTOP",0
        DEFW	C49BD
        
; COMHELP missing in this version!
        
        DEFB	0FFH

C41F2:	EI
        CP	0FFH
        JP	NZ,J422F
        LD	HL,I.FD89
        LD	A,(HL)
        CP	"C"
        JR	NZ,J422D
        INC	HL
        LD	A,(HL)
        CP	"O"
        JR	NZ,J422D
        INC	HL
        LD	A,(HL)
        CP	"M"
        JR	NZ,J422D
        INC	HL
        LD	A,(HL)
        AND	A
        JR	NZ,J4214
        DEC	HL
        LD	A,"0"
J4214:	SUB	"0"
        JR	C,J422D
        CP	0AH	; 10 
        JR	NC,J422D
        PUSH	BC
        PUSH	AF
        LD	A,(D.FB16)
        AND	0FH	; 15 
        LD	B,A
        POP	AF
        CP	B
        POP	BC
        JR	NZ,J422D
        INC	HL
        LD	A,(HL)
        AND	A
        RET	Z
J422D:	SCF
        RET

J422F:	PUSH	HL
        PUSH	AF
        LD	HL,I4240
        ADD	A,L
        LD	L,A
        JR	NC,J4239
        INC	H
J4239:	LD	A,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,A
        POP	AF
        EX	(SP),HL
        RET

I4240:	DEFW	C4254
        DEFW	C4290
        DEFW	C4478
        DEFW	C42B2
        DEFW	C42BE
        DEFW	C4309
        DEFW	C433C
        DEFW	C4356
        DEFW	C4496
        DEFW	C437F

C4254:	LD	C,7FH
        CALL	C4260
        JP	C,J446C
        LD	(D$F864),HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4260:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	(D.FB04),HL
        LD	A,C
        LD	(D.FB06),A
        LD	(HL),E
        XOR	A
        INC	HL
        INC	HL
        LD	(HL),A
        INC	HL
        LD	(HL),A
        INC	HL
        INC	HL
        INC	HL
        LD	(HL),A
        CALL	C4131
        LD	A,E
        CP	08H	; 8 
        JR	Z,J428B
        LD	HL,D.FB1B
        SET	3,(HL)
        DI
        CALL	C4C63
        CALL	C4F31
        EI
        SCF
J428B:	CCF
        POP	HL
        POP	DE
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4290:	PUSH	HL
        LD	HL,(D.FB04)
        LD	A,(HL)
I4295:	CP	02H	; 2 
        SCF
        CCF
        JR	NZ,J42A0
        LD	A,1AH
        CALL	C4DDB
J42A0:	DI
        CALL	C4F82
        CALL	C4F39
        CALL	C4C5C
        EI
        LD	HL,D.FB1B
        RES	3,(HL)
        POP	HL
        RET

?42B2:	LD	A,C
        CALL	C4DDB
        EI
        JP	C,J44A2
        JP	Z,J44A2
        RET

?42BE:	CALL	C42C5
        JP	M,J44A2
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C42C5:	PUSH	HL
        PUSH	BC
        CALL	C4397
        LD	C,(HL)
        LD	(HL),00H
        DEC	HL
        LD	A,(HL)
        LD	(D.FB1A),A
        LD	(HL),00H
        INC	HL
        AND	A
        JR	NZ,J42FF
        LD	A,C
        AND	A
        JR	NZ,J42EB
        CALL	C4C84
        EI
        LD	C,A
        JP	M,J42FF
        CALL	C4EA2
        JR	C,J42FF
        JR	Z,J42FF
J42EB:	PUSH	HL
        LD	HL,(D.FB04)
        LD	A,(HL)
        POP	HL
        CP	04H	; 4 
        JR	Z,J4303
        LD	A,C
        CP	1AH
        JR	NZ,J4303
        LD	(HL),A
        AND	A
        SCF
        JR	J4306

J42FF:	OR	80H
        JR	J4305

J4303:	XOR	A
        INC	A
J4305:	LD	A,C
J4306:	POP	BC
        POP	HL
        RET

?4309:	PUSH	HL
        CALL	C4317
J430D:	LD	(D.F7F8),HL
        LD	HL,I.F663
        LD	(HL),02H	; 2 
        POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4317:	PUSH	AF
        EI
        LD	HL,(D.FB04)
        LD	A,(HL)
        CP	01H	; 1 
        JR	NZ,J4334
        CALL	C438F
        JR	Z,J432C
        SUB	1AH
        JR	Z,J4337
        LD	A,01H	; 1 
J432C:	PUSH	BC
        CALL	C439E
        ADD	A,B
        POP	BC
        JR	J4337

J4334:	CALL	C4C70
J4337:	LD	L,A
        LD	H,00H
        POP	AF
        RET

?433C:	PUSH	HL
        CALL	C4342
J4340:	JR	J430D

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4342:	PUSH	AF
        EI
        CALL	C4317
        PUSH	DE
        EX	DE,HL
        LD	A,(D.FB06)
        LD	L,A
        LD	H,00H
        AND	A
        SBC	HL,DE
        INC	HL
        POP	DE
        POP	AF
        RET

?4356:	PUSH	HL
        CALL	C435F
        JP	M,J44A2
        JR	J4340

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C435F:	PUSH	BC
        LD	B,A
        EI
        CALL	C42C5
        JP	M,J437C
        PUSH	BC
        LD	C,A
        CALL	C437F
        POP	BC
        CP	1AH
        JR	Z,J4378
        XOR	A
        LD	L,A
        LD	H,A
        INC	A
        JR	J437C

J4378:	LD	HL,I.FFFF
        SCF
J437C:	LD	A,B
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C437F:	PUSH	HL
        CALL	C4397
        LD	(HL),C
        PUSH	AF
        DEC	HL
        LD	A,(D.FB1A)
        AND	38H	; "8"
        LD	(HL),A
        POP	AF
        POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C438F:	PUSH	HL
        CALL	C4397
        LD	A,(HL)
        POP	HL
        AND	A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4397:	LD	HL,(D.FB04)
        INC	HL
        INC	HL
        INC	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C439E:	PUSH	AF
        PUSH	HL
        LD	B,00H
        CALL	C4C7F
        JR	Z,J43B4
        LD	C,A
J43A8:	CALL	C43B7
        LD	A,(HL)
        CP	1AH
        JR	Z,J43B4
        INC	B
        DEC	C
        JR	NZ,J43A8
J43B4:	POP	HL
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C43B7:	PUSH	DE
        LD	A,(D$FB18)
        LD	HL,D.FB06
        ADD	A,B
        JR	C,J43C4
        CP	(HL)
        JR	C,J43C5
J43C4:	SUB	(HL)
J43C5:	LD	HL,(D.FB04)
        LD	E,09H	; 9 
        LD	D,00H
        ADD	HL,DE
        LD	E,A
        LD	D,00H
        ADD	HL,DE
        ADD	HL,DE
        POP	DE
        RET

I43D4:	EI
        PUSH	AF
        LD	A,D
        INC	A
        JP	Z,J4429
        DEC	A
        JP	NZ,J443C
        LD	A,E
        AND	A
        JR	Z,J43EF
        DEC	A
        JR	Z,J43FC
        DEC	A
        JR	Z,J4402
        DEC	A
        JR	Z,J4416
        JP	J4457

J43EF:	LD	A,08H	; 8 
        CALL	C44A9
        LD	A,00H
        CALL	C44A9
        JP	J4457

J43FC:	POP	AF
        INC	A
        PUSH	AF
        JP	J4457

J4402:	CALL	C4A31
        JR	Z,J4413
        PUSH	BC
        CALL	C4DA7
        EI
        NOP
        POP	BC
        DI
        CALL	C4C5C
        EI
J4413:	JP	J4457

J4416:	CALL	C4A31
        JR	Z,J4426
        DI
        CALL	C4C63
        CALL	C4F31
        CALL	C4D8D
        EI
J4426:	JP	J4457

J4429:	LD	A,E
        AND	A
        JR	NZ,J443A
        CALL	C445B
        LD	A,00H
        CALL	C44A9
        LD	A,00H
        CALL	C44A9
J443A:	JR	J4457

J443C:	CP	08H	; 8 
        JR	NZ,J4457
        LD	A,E
        AND	A
        JR	Z,J444A
        CP	01H	; 1 
        JR	Z,J4454
        JR	J4457

J444A:	CALL	C445B
        LD	A,00H
        CALL	C44A9
        JR	J4457

J4454:	POP	AF
        INC	A
        PUSH	AF
J4457:	POP	AF
        JP	J.FB07

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C445B:	CALL	C4C40
        CALL	C44A9
        LD	A,10H	; 16 
        CALL	C44A9
        LD	A,40H	; "@"
        CALL	C44A9
        RET

J446C:	LD	IX,I$6E6B
        JR	J44A6

?4472:	LD	IX,I$6E80
        JR	J44A6

?4478:	LD	IX,I$6E86
        JR	J44A6

J447E:	LD	IX,I$6E6E
        JR	J44A6

J4484:	LD	IX,I$6E77
        JR	J44A6

J448A:	LD	IX,I481C
        JR	J44A6

J4490:	LD	IX,I4055
        JR	J44A6

J4496:	LD	IX,I475A
        JR	J44A6

J449C:	LD	IX,I406D
        JR	J44A6

J44A2:	LD	IX,I$73B2
J44A6:	JP	C457B

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C44A9:	PUSH	AF
        PUSH	BC
        PUSH	DE
        PUSH	IX
        LD	E,A
        LD	A,B
        LD	IX,I$0014
        CALL	C4580
        EI
        INC	HL
        POP	IX
        POP	DE
        POP	BC
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C44BF:	PUSH	BC
        PUSH	DE
        PUSH	IX
        LD	A,B
        LD	IX,I$000C
        CALL	C4580
        EI
        INC	HL
        POP	IX
        POP	DE
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C44D2:	PUSH	IX
        LD	IX,I$00B7
        CALL	C4580
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C44DE:	PUSH	BC
        LD	B,A
        LD	A,(D.F561)
        AND	A
        JR	Z,J4504
        LD	A,B
        CP	20H	; " "
        JR	NC,J4504
        LD	A,5EH	; "^"
        CALL	C4506
        LD	A,B
        ADD	A,40H	; "@"
        CALL	C4506
        LD	A,B
        CP	0AH	; 10 
        POP	BC
        RET	NZ
        LD	A,0DH	; 13 
        CALL	C4506
        LD	A,0AH	; 10 
        JR	C4506

J4504:	LD	A,B
        POP	BC
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4506:	PUSH	AF
        CALL	C$00A2
        EI
        LD	A,(D.F563)
        AND	A
        JR	Z,J4517
        POP	AF
        PUSH	AF
        CALL	C$00A5
        EI
J4517:	POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4519:	LD	A,(HL)
        EX	(SP),HL
        CP	(HL)
        JP	NZ,J4490
        INC	HL
        EX	(SP),HL
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4521:	PUSH	IX
        LD	IX,I4666
        EXX
        PUSH	HL
        EXX
        CALL	C457B
        EXX
        POP	HL
        EXX
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4533:	PUSH	IX
        LD	IX,I4C64
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C453F:	PUSH	IX
        LD	IX,I542F
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C454B:	PUSH	IX
        LD	IX,I521C
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4557:	PUSH	IX
        LD	IX,I5EA4
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4563:	PUSH	IX
        LD	IX,I$67D0
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C456F:	PUSH	IX
        LD	IX,I517A
        CALL	C457B
        POP	IX
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C457B:	CALL	C4580
        EI
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4580:	PUSH	IY
        LD	IY,(D$FCC0)
        CALL	C$0217
        POP	IY
        RET

?458C:	CALL	C4A37
        CALL	C4A31
        DI
        CALL	C4C5C
        EI
        LD	A,(D.FB1E)
        LD	(D.F560),A
        LD	IY,I$F567
        PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	BC,I$000D
        PUSH	IY
        POP	DE
        LD	HL,I4143
        LDIR
        POP	HL
        POP	DE
        POP	BC
        LD	A,B
        AND	C
        INC	A
        JR	NZ,J45CC
        LD	A,D
        AND	A
        JP	Z,J4638
        CP	3AH	; ":"
        JP	Z,J4638
        CP	29H	; ")"
        JP	Z,J4635
        CALL	C4519
        INC	L
        JR	J45F2

J45CC:	PUSH	HL
        EXX
        PUSH	HL
        EXX
        POP	HL
        LD	A,B
        AND	A
        JR	Z,J45E5
        PUSH	IY
        POP	DE
J45D8:	LD	A,(HL)
        CP	20H	; " "
        JR	Z,J45E1
        CALL	C4AE3
        LD	(DE),A
J45E1:	INC	DE
        INC	HL
        DJNZ	J45D8
J45E5:	POP	HL
        DEC	HL
        CALL	C4521
        CP	29H	; ")"
        JR	Z,J4635
        CALL	C4519
        INC	L
J45F2:	CP	2CH	; ","
        JR	Z,J460C
        CALL	C453F
        LD	(IY+8),E
        LD	(IY+9),D
        LD	A,(HL)
        CP	29H	; ")"
        JR	NZ,J460C
        LD	(IY+10),E
        LD	(IY+11),D
        JR	J4635

J460C:	CALL	C4519
        INC	L
        CP	2CH	; ","
        JR	Z,J4622
        CALL	C453F
        LD	(IY+10),E
        LD	(IY+11),D
        LD	A,(HL)
        CP	29H	; ")"
        JR	Z,J4635
J4622:	CALL	C4519
        INC	L
        CP	29H	; ")"
        JR	Z,J4635
        CALL	C454B
        LD	(IY+12),A
        CALL	C4519
        ADD	HL,HL
        DEC	HL
J4635:	CALL	C4521
J4638:	EI
        CALL	C4AEC
        JP	C,J4496
        CALL	C4A31
        CALL	NZ,C4C63
        LD	A,(D.F560)
        BIT	5,A
        CALL	NZ,C4F31
        AND	A
        RET

?464F:	CALL	C4A37
        CALL	C4AA0
        CALL	C4519
        INC	L
        CALL	C4A31
        JP	Z,J4484
        CALL	C453F
        CALL	C4519
        ADD	HL,HL
I4666:	LD	A,D
        OR	E
        CALL	C4F44
        EI
        RET

?466D:	CALL	C4A37
        CALL	C4AA0
        CALL	C4519
        INC	L
        CALL	C4A31
        JP	Z,J4484
        CALL	C4557
        PUSH	HL
        CALL	C4F5C
        LD	(D.F7F8),HL
        POP	HL
        CALL	C4AAA
        CALL	C4519
        ADD	HL,HL
        AND	A
        RET

?4691:	CALL	C4A37
        CALL	C4AA0
        CALL	C4A31
        JP	Z,J4484
        LD	A,D
        CP	2CH	; ","
        JR	Z,J46B2
        AND	A
        JR	Z,J46AD
        CP	3AH	; ":"
        JR	Z,J46AD
        CALL	C4519
        ADD	HL,HL
J46AD:	LD	DE,I$000A
        JR	J46BC

J46B2:	CALL	C4521
        CALL	C453F
        CALL	C4519
        ADD	HL,HL
J46BC:	PUSH	HL
        LD	HL,I$0002
        AND	A
        SBC	HL,DE
        JP	NC,J4496
        POP	HL
        CALL	C4EDF
        EI

; code removed in this version

        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

        JP	C,J44A2
        AND	A
        RET

?46D6:	CALL	C4A37
        CALL	C4AA0
        LD	A,D
        AND	A
        JR	Z,J46E8
        CP	3AH	; ":"
        JR	Z,J46E8
        CALL	C4519
        ADD	HL,HL
J46E8:	PUSH	HL
        POP	IX
        CALL	C4A31
        JP	NZ,J447E
        LD	IY,(D$F862)
        XOR	A
        LD	(D.F55E),A
        LD	(D.F563),A
        LD	(D.F561),A
        LD	(D.F562),A
        LD	HL,I.F8CF
        LD	DE,I.F566
        LD	BC,I.0030
        PUSH	BC
        PUSH	HL
        LDIR
        POP	HL
        POP	BC
        LD	B,C
        PUSH	HL
J4713:	LD	(HL),00H
        INC	HL
        DJNZ	J4713
        POP	DE
        LD	HL,I48F9
        LD	BC,BDOS
        PUSH	BC
        LDIR
        POP	BC
        LD	DE,I$F8DF
        PUSH	BC
        LDIR
        POP	BC
        LD	DE,I$F8EF
        PUSH	BC
        LDIR
        POP	BC
        LD	A,(D$FCA9)
        LD	(D.F564),A
        CALL	C491A
        PUSH	IY
        POP	HL
        LD	E,04H	; 4 
        LD	C,78H	; "x"
        CALL	C4260
J4744:	EI
        PUSH	IY
        POP	HL
        CALL	C4317
        LD	A,L
        OR	H
        JR	Z,J4779
        CALL	C4908
        JR	C,J47A5
        LD	C,A
        LD	A,(D.F55E)
        AND	A
        JR	NZ,J476B
I475A	EQU	$-1
        LD	A,C
        CP	1BH
        JR	NZ,J4766
        LD	A,01H	; 1 
        LD	(D.F55E),A
        LD	A,C
J4766:	CALL	C44DE
I4769:	JR	J4779

J476B:	XOR	A
        LD	(D.F55E),A
        LD	A,C
        CP	1BH
        JR	NZ,J4766
        CALL	C44DE
        JR	J47CB

J4779:	CALL	C493C
        CALL	NZ,C4912
        CALL	C44D2
        JR	C,J47A5
        CALL	C$009C
        EI
        JR	Z,J4744
        CALL	C.009F
        EI
        CP	0A0H
        JP	Z,J48D8
        CALL	C490D
        LD	C,A
        LD	A,(D.F562)
        AND	A
        JP	Z,J4744
        LD	A,C
        CALL	C44DE
        JP	J4744

J47A5:	PUSH	IY
        POP	HL
        CALL	C4290
        LD	HL,I.F566
        LD	DE,I.F8CF
        LD	BC,I.0030
        LDIR
        PUSH	IX
        POP	HL
        LD	A,(D.F564)
        AND	A
        PUSH	AF
        CALL	Z,C492A
        POP	AF
        CALL	NZ,C491A
        XOR	A
        DI
        LD	(D.FC9B),A
        RET

J47CB:	LD	A,(D.F561)
        AND	A
        JP	NZ,J4744
        CALL	C492A
        LD	A,0FFH
        LD	(D.F55F),A
J47DA:	CALL	C4908
        JP	C,J47A5
        CP	3AH	; ":"
        JR	NZ,J47DA
        CALL	C48A6
        JP	C,J485D
        AND	A
        JR	Z,J4834
        LD	B,A
        LD	E,A
        CALL	C489B
        JP	C,J485D
        CALL	C48A6
        JP	C,J485D
        ADD	A,L
        ADD	A,H
        ADD	A,E
        LD	E,A
J47FF:	CALL	C48A6
I4800	EQU	$-2
        JR	C,J485D
        LD	(HL),A
        ADD	A,E
        LD	E,A
        INC	HL
        DJNZ	J47FF
        CALL	C48A6
        JR	C,J485D
        ADD	A,E
        JR	NZ,J485D
        LD	A,47H	; "G"
        CALL	C490D
        LD	A,(D.F55F)
        AND	A
        JR	Z,J4828
I481C	EQU	$-1
        INC	A
        LD	(D.F55F),A
        LD	A,2AH	; "*"
        CALL	C44DE
        JR	J4831

J4828:	DEC	A
        LD	(D.F55F),A
        LD	A,7FH
        CALL	C44DE
J4831:	JP	J47DA

J4834:	CALL	C489B
        JR	C,J485D
        LD	A,H
        OR	L
        JR	NZ,J4865
        CALL	C48A6
        JR	C,J485D
        CP	01H	; 1 
        JR	NZ,J485D
        CALL	C48A6
        JR	C,J485D
        CP	0FFH
        JR	NZ,J485D
J484F:	LD	A,47H	; "G"
        CALL	C490D
        CALL	C4933
        CALL	C491A
I4858	EQU	$-2
        JP	J4744

J485D:	LD	A,42H	; "B"
        CALL	C490D
        JP	J47DA

J4865:	CALL	C48A6
        JR	C,J485D
        CP	01H	; 1 
        JR	NZ,J485D
        ADD	A,L
        ADD	A,H
        LD	E,A
        CALL	C48A6
        JR	C,J485D
        ADD	A,E
        JR	NZ,J485D
        CALL	C4908
        JP	C,J47A5
        CP	0AH	; 10 
        JR	NZ,J484F
        LD	A,47H	; "G"
        CALL	C490D
        CALL	C4933
        PUSH	IX
        PUSH	HL
        LD	HL,I4893
        EX	(SP),HL
        JP	(HL)

I4893:	POP	IX
        CALL	C491A
        JP	J4744

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C489B:	CALL	C48A6
        RET	C
        LD	H,A
        CALL	C48A6
        RET	C
        LD	L,A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C48A6:	PUSH	BC
        CALL	C4908
        JR	C,J48C1
        CALL	C48C3
        JR	C,J48C1
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	B,A
        CALL	C4908
        JR	C,J48C1
        CALL	C48C3
        JR	C,J48C1
        ADD	A,B
J48C1:	POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C48C3:	CALL	C4AE3
        SUB	30H	; "0"
        RET	C
        CP	0AH	; 10 
        JR	C,J48D6
        SUB	11H	; 17 
        RET	C
        CP	06H	; 6 
        CCF
        RET	C
        ADD	A,0AH	; 10 
J48D6:	AND	A
        RET

J48D8:	CALL	C.009F
        EI
        SUB	06H	; 6 
        JR	Z,J48EB
        DEC	A
        JR	Z,J48F0
        DEC	A
        JR	NZ,J48F6
        LD	HL,D.F563
        JR	J48F3

J48EB:	LD	HL,D.F561
        JR	J48F3

J48F0:	LD	HL,D.F562
J48F3:	LD	A,(HL)
        CPL
        LD	(HL),A
J48F6:	JP	J4744

I48F9:	DEFB	0A0H,006H,000H,06CH,069H
        DEFB	0A0H,007H,000H,068H,066H
        DEFB	0A0H,008H,000H,070H,065H

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4908:	CALL	C4C84
        EI
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C490D:	CALL	C4DDB
        EI
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4912:	LD	DE,I$0064
        CALL	C4EDF
        EI
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C491A:	LD	A,1BH
        CALL	C44DE
        LD	A,79H	; "y"
J4921:	CALL	C44DE
        LD	A,35H	; "5"
J4926:	CALL	C44DE
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C492A:	LD	A,1BH
        CALL	C44DE
        LD	A,78H	; "x"
        JR	J4921

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4933:	LD	A,0DH	; 13 
        CALL	C44DE
        LD	A,0AH	; 10 
        JR	J4926

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C493C:	LD	A,(D.FC9B)
        AND	A
        RET	Z
        XOR	A
        LD	(D.FC9B),A
        INC	A
        RET

; COMHELP missing in this version

?4947:	CALL	C4A37
        CALL	C4AA0
        CALL	C4A24
        JP	C,J4496
        CALL	C4519
        INC	L
        CALL	C4519
        ADC	A,L
        LD	IX,I4769
        CALL	C457B
        PUSH	HL
        LD	A,E
        OR	D
        JR	Z,J4973
        LD	IX,I4295
        CALL	C457B
        JP	NC,J448A
        LD	E,C
        LD	D,B
J4973:	CALL	C4A11
        INC	HL
        LD	(HL),E
        INC	HL
        LD	(HL),D
        POP	HL
        CALL	C4519
        ADD	HL,HL
        AND	A
        RET

?4981:	CALL	C4A37
        CALL	C4AA0
        LD	A,D
        AND	A
        JR	Z,J4993
        CP	3AH	; ":"
        JR	Z,J4993
        CALL	C4519
        ADD	HL,HL
J4993:	CALL	C4A24
        JP	C,J4496
        LD	IX,I$632B
        JR	J49E6

?499F:	CALL	C4A37
        CALL	C4AA0
        LD	A,D
        AND	A
        JR	Z,J49B1
        CP	3AH	; ":"
        JR	Z,J49B1
        CALL	C4519
        ADD	HL,HL
J49B1:	CALL	C4A24
        JP	C,J4496
        LD	IX,I$631B
        JR	J49D9

?49BD:	CALL	C4A37
        CALL	C4AA0
        LD	A,D
        AND	A
        JR	Z,J49CF
        CP	3AH	; ":"
        JR	Z,J49CF
        CALL	C4519
        ADD	HL,HL
J49CF:	CALL	C4A24
        JP	C,J4496
        LD	IX,I$6331
J49D9:	PUSH	HL
        PUSH	AF
        CALL	C4A11
        LD	A,(HL)
        AND	01H	; 1 
        CALL	Z,C4135
        POP	AF
        POP	HL
J49E6:	PUSH	HL
        CALL	C4A11
        CALL	C457B
        POP	HL
        AND	A
        RET

I49F0:	EI
        CALL	C4C70
        PUSH	HL
        CALL	NZ,C49FC
        POP	HL
        JP	J.FB0C

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C49FC:	CALL	C4A11
        LD	A,(HL)
        AND	01H	; 1 
        RET	Z
        LD	A,(HL)
        OR	04H	; 4 
        CP	(HL)
        RET	Z
        CP	05H	; 5 
        RET	NZ
        LD	(HL),A
        LD	HL,I$FBD8
        INC	(HL)
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4A11:	CALL	C4A24
        JP	C,J4496
        PUSH	BC
        LD	C,A
        ADD	A,A
        ADD	A,C
        LD	C,A
        LD	B,00H
        LD	HL,I$FC82
        ADD	HL,BC
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4A24:	LD	A,(D.FB16)
        AND	0F0H
        RRCA
        RRCA
        RRCA
        RRCA
        CP	06H	; 6 
        CCF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4A31:	LD	A,(D.FB1B)
        BIT	3,A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4A37:	DEC	HL
        CALL	C4521
        LD	D,A
        JR	NZ,J4A45
J4A3E:	XOR	A
        LD	BC,I.FFFF
        PUSH	HL
        JR	J4A83

J4A45:	CP	28H	; "("
        JP	Z,J4A50
        CP	2CH	; ","
        JR	Z,J4A3E
        JR	J4A58

J4A50:	CALL	C4521
        LD	D,A
        CP	2CH	; ","
        JR	Z,J4A3E
J4A58:	CALL	C4533
        PUSH	HL
        CALL	C4563
        LD	C,00H
        LD	B,(HL)
        INC	HL
        LD	A,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,A
        LD	A,B
        AND	A
        JR	Z,J4A83
        INC	HL
        LD	A,(HL)
        CP	3AH	; ":"
        JR	Z,J4A75
        DEC	HL
        XOR	A
        JR	J4A83

J4A75:	DEC	HL
        LD	A,(HL)
        SUB	30H	; "0"
        JR	C,J4A9D
        CP	0AH	; 10 
        JR	NC,J4A9D
        INC	HL
        INC	HL
        DEC	B
        DEC	B
J4A83:	LD	E,A
        LD	A,(D.FB16)
        AND	0FH	; 15 
        PUSH	HL
        EXX
        POP	HL
        EXX
        POP	HL
        PUSH	AF
        DEC	HL
        CALL	C4521
        LD	D,A
        POP	AF
        CP	E
        RET	Z
J4A97:	POP	HL
        PUSH	IX
        POP	HL
        SCF
        RET

J4A9D:	POP	HL
        JR	J4A97

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4AA0:	LD	A,B
        OR	C
        RET	Z
        LD	A,B
        AND	C
        INC	A
        RET	Z
        JP	J4496

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4AAA:	PUSH	HL
        LD	HL,I.F663
        LD	A,(HL)
        CP	02H	; 2 
        JR	Z,J4AD8
        CP	04H	; 4 
        JR	Z,J4AC8
        CP	08H	; 8 
        JP	NZ,J449C
        LD	(HL),02H	; 2 
        PUSH	DE
        LD	A,08H	; 8 
        CALL	C456F
        LD	C,08H	; 8 
        JR	J4AD2

J4AC8:	LD	(HL),02H	; 2 
        PUSH	DE
        LD	A,04H	; 4 
        CALL	C456F
        LD	C,04H	; 4 
J4AD2:	POP	DE
        LD	HL,I$F7F6
        JR	J4ADD

J4AD8:	LD	HL,D.F7F8
        LD	C,02H	; 2 
J4ADD:	LD	B,00H
        LDIR
        POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4AE3:	CP	61H	; "a"
        RET	C
        CP	7BH	; "{"
        RET	NC
        SUB	20H	; " "
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4AEC:	LD	A,(IY)
        SUB	35H	; "5"
        CP	04H	; 4 
        JR	NC,J4B0D
        LD	B,A
        LD	D,A
        CALL	C4BC1
        LD	A,(IY+1)
        CP	45H	; "E"
        JR	Z,J4B0F
        CP	4FH	; "O"
        JR	Z,J4B11
        CP	49H	; "I"
        JR	Z,J4B15
        CP	4EH	; "N"
        JR	Z,J4B1C
J4B0D:	SCF
        RET

J4B0F:	SET	3,B
J4B11:	SET	2,B
        JR	J4B1C

J4B15:	LD	A,B
        CP	03H	; 3 
        JP	Z,J4B0D
        INC	B
J4B1C:	RLC	B
        RLC	B
        LD	A,(IY+2)
        SUB	31H	; "1"
        CP	03H	; 3 
        JP	NC,J4B0D
        INC	A
        RRCA
        RRCA
        OR	B
        LD	B,A
        LD	C,00H
        LD	A,(IY+3)
        CP	58H	; "X"
        JR	NZ,J4B3C
        SET	0,C
        JR	J4B41

J4B3C:	CP	4EH	; "N"
        JP	NZ,J4B0D
J4B41:	LD	A,(IY+4)
        CP	48H	; "H"
        JR	NZ,J4B4C
        SET	1,C
        JR	J4B51

J4B4C:	CP	4EH	; "N"
        JP	NZ,J4B0D
J4B51:	LD	A,(IY+5)
        CP	41H	; "A"
        JR	NZ,J4B5C
        SET	3,C
        JR	J4B61

J4B5C:	CP	4EH	; "N"
        JP	NZ,J4B0D
J4B61:	LD	A,(IY+6)
        CP	41H	; "A"
        JR	NZ,J4B6C
        SET	2,C
        JR	J4B71

J4B6C:	CP	4EH	; "N"
        JP	NZ,J4B0D
J4B71:	LD	A,(IY+7)
        CP	53H	; "S"
        JR	NZ,J4B82
        LD	A,D
        CP	02H	; 2 
        JP	NZ,J4B0D
        SET	4,C
        JR	J4B87

J4B82:	CP	4EH	; "N"
        JP	NZ,J4B0D
J4B87:	LD	A,C
        LD	(D.FB1C),A
        LD	A,02H	; 2 
        OR	B
        LD	(D.FB1F),A
        CALL	C4EB4
        LD	E,(IY+8)
        LD	D,(IY+9)
        CALL	C4BD5
        JP	C,J4B0D
        LD	C,00H
        CALL	C4FDB
        LD	E,(IY+10)
        LD	D,(IY+11)
        CALL	C4BD5
        JP	C,J4B0D
        LD	C,01H	; 1 
        CALL	C4FDB
        LD	A,(IY+12)
        LD	(D.FB03),A
        CALL	C4F47
        OR	A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4BC1:	PUSH	AF
        PUSH	BC
        XOR	03H	; 3 
        LD	C,0FFH
        JR	Z,J4BCE
        LD	B,A
J4BCA:	SRL	C
        DJNZ	J4BCA
J4BCE:	LD	A,C
        LD	(D.FB1D),A
        POP	BC
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4BD5:	PUSH	HL
        BIT	7,D
        JR	Z,J4BE7
        LD	A,E
        AND	D
        INC	A
        JR	Z,J4C03
        LD	HL,D.0000
        SBC	HL,DE
        EX	DE,HL
        JR	J4C02

J4BE7:	LD	HL,I4C06
J4BEA:	LD	C,(HL)
        INC	HL
        LD	B,(HL)
        INC	HL
        LD	A,B
        OR	C
        JR	Z,J4C03
        PUSH	HL
        LD	L,E
        LD	H,D
        AND	A
        SBC	HL,BC
        POP	HL
        JR	Z,J4BFF
        INC	HL
        INC	HL
        JR	J4BEA

J4BFF:	LD	E,(HL)
        INC	HL
        LD	D,(HL)
J4C02:	SCF
J4C03:	CCF
        POP	HL
        RET

I4C06:  DEFW       50,00900h
        DEFW       75,00600h
        DEFW      110,00417h
        DEFW      300,00180h
        DEFW      600,000C0h
        DEFW     1200,00060h
        DEFW     1800,00040h
        DEFW     2000,0003Ah
        DEFW     2400,00030h
        DEFW     3600,00020h
        DEFW     4800,00018h
        DEFW     7200,00010h
        DEFW     9600,0000Ch
        DEFW    19200,00006h
        DEFW    0

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C40:	PUSH	BC
        PUSH	HL
        IN	A,(0A8H)
        RRCA
        RRCA
        AND	03H	; 3 
        LD	C,A
        LD	B,00H
        LD	HL,I$FCC1
        ADD	HL,BC
        OR	(HL)
J4C50:	LD	C,A
        INC	HL
        INC	HL
        INC	HL
        INC	HL
        LD	A,(HL)
        AND	0CH	; 12 
        OR	C
        POP	HL
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C5C:	PUSH	AF
        LD	A,0FFH
        OUT	(82H),A
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C63:	PUSH	AF
I4C64:	LD	A,0FEH
        OUT	(82H),A
        POP	AF
        RET

I4C6A:	CALL	C4CD0
        JP	J.FB11

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C70:	CALL	C4C7F
        PUSH	BC
        LD	B,A
        CALL	C438F
        JR	Z,J4C7C
        LD	A,01H	; 1 
J4C7C:	ADD	A,B
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C7F:	LD	A,(D.FB17)
        AND	A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4C84:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	HL,D.FB17
J4C8A:	EI
        CALL	C44D2
        JR	C,J4CC8
        LD	A,(HL)
        AND	A
        JR	NZ,J4CA0
        CALL	C4F31
        CALL	C4D8D
        JR	C,J4CC8
        JR	Z,J4CC8
        JR	J4C8A

J4CA0:	CP	03H	; 3 
        JR	NC,J4CAF
        CALL	C4F31
        CALL	C4D8D
        EI
        JR	C,J4CC8
        JR	Z,J4CC8
J4CAF:	DI
        DEC	(HL)
        CALL	C4D72
        LD	C,(HL)
        LD	B,80H
        INC	HL
        LD	A,(HL)
        LD	(D.FB1A),A
        AND	A
        JR	Z,J4CC0
        INC	B
J4CC0:	LD	A,C
        OR	A
        DEC	B
J4CC3:	EI
        POP	BC
        POP	DE
        POP	HL
        RET

J4CC8:	PUSH	AF
        POP	BC
        RES	7,C
        PUSH	BC
        POP	AF
        JR	J4CC3

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4CD0:	CALL	C4F2C
        RET	Z
        CALL	C4F12
        LD	HL,D.FB1D
        AND	(HL)
        LD	C,A
        CALL	C4F18
        LD	B,A
        AND	A
        JR	NZ,J4CFD
        LD	HL,D.FB1B
        LD	A,C
        CP	11H	; 17 
        JR	Z,J4CF3
        CP	13H	; 19 
        JR	NZ,J4D0E
        SET	2,(HL)
        JR	J4CF5

J4CF3:	RES	2,(HL)
J4CF5:	LD	A,(D.FB1C)
        BIT	0,A
        RET	NZ
        JR	J4D0E

J4CFD:	AND	20H	; " "
        JR	Z,J4D26
        LD	A,C
        AND	A
        JR	NZ,J4D26
        LD	HL,D.FB1B
        SET	4,(HL)
        LD	B,00H
        JR	J4D26

J4D0E:	LD	A,(D.FB1C)
        BIT	4,A
        JR	Z,J4D26
        LD	HL,D.FB1B
        LD	A,C
        SUB	0FH	; 15 
        JR	NZ,J4D20
        RES	7,(HL)
        RET

J4D20:	INC	A
        JR	NZ,J4D26
        SET	7,(HL)
        RET

J4D26:	LD	HL,D.FB17
        LD	A,(D.FB06)
        CP	(HL)
        RET	Z
        INC	(HL)
        INC	HL
        PUSH	BC
        CALL	C4D72
        POP	BC
        LD	A,(D.FB1C)
        BIT	4,A
        LD	A,C
        JR	Z,J4D4B
        CP	20H	; " "
        JR	C,J4D4B
        LD	A,(D.FB1B)
        BIT	7,A
        LD	A,C
        JR	Z,J4D4B
        OR	80H
J4D4B:	LD	(HL),A
        PUSH	HL
        LD	HL,D.FB17
        LD	A,(D.FB06)
        SUB	(HL)
        POP	HL
        JR	NZ,J4D59
        SET	7,B
J4D59:	CP	10H	; 16 
        CALL	C,C4DA7
        LD	A,B
        INC	HL
        LD	(HL),A
        DEC	HL
        AND	A
        RET	NZ
        LD	A,(D.FB1C)
        BIT	3,A
        RET	Z
        LD	A,(HL)
        CP	0DH	; 13 
        RET	NZ
        LD	C,0AH	; 10 
        JR	J4D26

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4D72:	INC	HL
        LD	A,(HL)
        LD	C,A
        INC	A
        PUSH	HL
        LD	HL,D.FB06
        CP	(HL)
        POP	HL
        JR	C,J4D7F
        XOR	A
J4D7F:	LD	(HL),A
        EX	DE,HL
        LD	HL,(D.FB04)
        LD	B,00H
        ADD	HL,BC
        ADD	HL,BC
        LD	BC,I$0009
        ADD	HL,BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4D8D:	DI
        LD	A,(D.FB1B)
        BIT	1,A
        JR	NZ,J4D98
        XOR	A
        INC	A
        RET

J4D98:	LD	C,11H	; 17 
        CALL	C4DC3
        RET	C
        RET	Z
        PUSH	HL
        LD	HL,D.FB1B
        RES	1,(HL)
        POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4DA7:	DI
        XOR	A
        INC	A
        LD	A,(D.FB1B)
        BIT	1,A
        RET	NZ
        PUSH	HL
        LD	HL,D.FB1B
        SET	1,(HL)
        POP	HL
        LD	C,13H	; 19 
        CALL	C4DC3
        CALL	C4F82
        CALL	C4F39
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4DC3:	LD	A,(D.FB1C)
        BIT	0,A
        JR	NZ,J4DCD
        XOR	A
        INC	A
        RET

J4DCD:	CALL	C4F82
        PUSH	DE
        CALL	C4F91
        POP	DE
        RET	C
        RET	Z
        LD	A,C
        JP	C4F15

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4DDB:	EI
        PUSH	BC
        LD	C,A
        LD	A,(D.FB1C)
        BIT	4,A
        JR	Z,J4E1D
        LD	A,C
        CP	20H	; " "
        JR	C,J4E1D
        LD	A,(D.FB1B)
        BIT	0,A
        JR	NZ,J4E07
        BIT	7,C
        JR	Z,J4E1D
        LD	A,0EH	; 14 
        CALL	C4E1F
        JR	C,J4E69
        JR	Z,J4E69
        PUSH	HL
        LD	HL,D.FB1B
        SET	0,(HL)
        POP	HL
        JR	J4E1B

J4E07:	BIT	7,C
        JR	NZ,J4E1B
        LD	A,0FH	; 15 
        CALL	C4E1F
        JR	C,J4E69
        JR	Z,J4E69
        PUSH	HL
        LD	HL,D.FB1B
        RES	0,(HL)
        POP	HL
J4E1B:	RES	7,C
J4E1D:	LD	A,C
        POP	BC
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4E1F:	PUSH	HL
        LD	HL,D.FB1C
        BIT	2,(HL)
        POP	HL
        JR	Z,J4E3E
        CP	0AH	; 10 
        JR	NZ,J4E3E
        LD	A,(D.FB1B)
        BIT	5,A
        LD	A,0AH	; 10 
        JR	Z,J4E3E
        PUSH	HL
        LD	HL,D.FB1B
        RES	5,(HL)
        POP	HL
        AND	A
        RET

J4E3E:	PUSH	BC
        LD	C,A
        PUSH	DE
        CALL	C4E6F
        POP	DE
        JR	C,J4E69
        JR	Z,J4E69
        CALL	C4F82
        CALL	C4F91
        JR	C,J4E69
        JR	Z,J4E69
        LD	A,C
        CALL	C4F15
        EI
        PUSH	HL
        LD	HL,D.FB1B
        CP	0DH	; 13 
        JR	NZ,J4E64
        SET	5,(HL)
        JR	J4E66

J4E64:	RES	5,(HL)
J4E66:	POP	HL
        XOR	A
        INC	A
J4E69:	CALL	C4EA2
        LD	A,C
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4E6F:	LD	A,(D.FB1C)
        BIT	0,A
        JR	Z,J4E9F
        LD	A,(D.FB03)
        LD	D,A
J4E7A:	LD	E,64H	; "d"
J4E7C:	CALL	C4FCA
J4E7F:	EI
        CALL	C44D2
        DI
        RET	C
        LD	A,(D.FB1B)
        BIT	2,A
        JR	Z,J4E9F
        LD	A,(D.FB03)
        AND	A
        JR	Z,J4E7F
        CALL	C4FD6
        JR	NC,J4E7F
        AND	A
        DEC	E
        JR	NZ,J4E7C
        DEC	D
        JR	NZ,J4E7A
        RET

J4E9F:	XOR	A
        INC	A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4EA2:	PUSH	HL
        LD	HL,D.FB1A
        LD	(HL),00H
        JR	C,J4EB0
        JR	NZ,J4EB2
        SET	6,(HL)
        JR	J4EB2

J4EB0:	SET	2,(HL)
J4EB2:	POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4EB4:	XOR	A
        OUT	(81H),A
        PUSH	AF
        POP	AF
        OUT	(81H),A
        PUSH	AF
        POP	AF
        OUT	(81H),A
        PUSH	AF
        POP	AF
        LD	A,40H	; "@"
        OUT	(81H),A
        PUSH	AF
        POP	AF
        LD	A,(D.FB1F)
        OUT	(81H),A
        PUSH	AF
        POP	AF
        CALL	C4F12
        CALL	C4F18
        LD	A,07H	; 7 
        CALL	C4FC2
        CALL	C4F12
        JP	C4F18

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4EDF:	PUSH	BC
        DI
        CALL	C4C5C
        EI
        LD	A,(D.FB1E)
        OR	08H	; 8 
        LD	B,A
J4EEB:	CALL	C44D2
        JR	C,J4F00
        CALL	C4F82
        XOR	A
        CALL	C4F15
        LD	A,B
        CALL	C4FC2
        DEC	DE
        LD	A,E
        OR	D
        JR	NZ,J4EEB
J4F00:	PUSH	AF
        CALL	C4F82
        LD	A,B
        AND	0F7H
        CALL	C4FC2
        DI
        CALL	C4C63
        EI
        POP	AF
        POP	BC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F12:	IN	A,(80H)
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F15:	OUT	(80H),A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F18:	IN	A,(81H)
        AND	38H	; "8"
        PUSH	AF
        LD	A,(D.FB1E)
        PUSH	AF
        OR	10H	; 16 
        CALL	C4FC2
        POP	AF
        CALL	C4FC2
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F2C:	IN	A,(81H)
        AND	02H	; 2 
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F31:	PUSH	AF
        LD	A,(D.FB1E)
        SET	5,A
        JR	J4F3F

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F39:	PUSH	AF
        LD	A,(D.FB1E)
        RES	5,A
J4F3F:	CALL	C4FC2
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F44:	AND	A
        JR	Z,J4F50
;
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F47:	DI
        PUSH	AF
        LD	A,(D.FB1E)
        OR	02H	; 2 
        JR	J4F57

J4F50:	DI
        PUSH	AF
        LD	A,(D.FB1E)
        AND	0FDH
J4F57:	CALL	C4FC2
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F5C:	PUSH	AF
        IN	A,(82H)
        LD	L,0C1H
        XOR	L
        AND	L
        LD	L,A
        IN	A,(81H)
        AND	80H
        JR	Z,J4F6C
        SET	3,L
J4F6C:	DI
        LD	A,(D.FB1B)
        BIT	4,A
        JR	Z,J4F7B
        SET	2,L
        RES	4,A
        LD	(D.FB1B),A
J4F7B:	EI
        LD	A,(D.FB1A)
        LD	H,A
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F82:	PUSH	AF
J4F83:	EI
        DEFB	0,0
        DI
        IN	A,(81H)
        AND	05H	; 5 
        CP	05H	; 5 
        JR	NZ,J4F83
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4F91:	LD	A,(D.FB1C)
        BIT	1,A
        JR	Z,J4FBF
        LD	A,(D.FB03)
        LD	D,A
J4F9C:	LD	E,64H	; "d"
J4F9E:	CALL	C4FCA
J4FA1:	CALL	C44D2
        EI
        RET	C
        IN	A,(82H)
        BIT	7,A
        JR	Z,J4FBF
        LD	A,(D.FB03)
        AND	A
        JR	Z,J4FA1
        CALL	C4FD6
        JR	NC,J4FA1
        AND	A
        DEC	E
        JR	NZ,J4F9E
        DEC	D
        JR	NZ,J4F9C
        RET

J4FBF:	XOR	A
        INC	A
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4FC2:	OUT	(81H),A
        LD	(D.FB1E),A
        PUSH	AF
        POP	AF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4FCA:	PUSH	AF
        PUSH	BC
        PUSH	DE
        LD	A,0B0H
        LD	C,86H
        LD	DE,I4800
        JR	J4FE8

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4FD6:	IN	A,(82H)
        RLCA
        RLCA
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C4FDB:	PUSH	AF
        PUSH	BC
        PUSH	DE
        LD	A,C
        LD	B,C
        ADD	A,84H
        LD	C,A
        LD	A,B
        RRCA
        RRCA
        OR	36H	; "6"
J4FE8:	OUT	(87H),A
        OUT	(C),E
        OUT	(C),D
        POP	DE
        POP	BC
        POP	AF
        RET

        DEFS	06000H-$,0FFH

        END
