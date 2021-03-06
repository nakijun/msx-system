;  
;   CX5EXT -> Source re-created by Z80DIS 2.2
;      Z80DIS was written by Kenneth Gielow
;                            Palo Alto, CA
        .Z80
        ORG	4000H
RDSLT	EQU	000CH	; ----I
OUTDO	EQU	0018H	; ----I
CALSLT	EQU	001CH	; J----
CLRSPR	EQU	0069H	; ----I
GICINI	EQU	0090H	; -C---
CHGET	EQU	009FH	; ----I
BEEP	EQU	00C0H	; ----I
FNKSB	EQU	00C9H	; ----I

LINL40	EQU	0F3AEH	; --SL-
LINL32	EQU	0F3AFH	; --SL-
LINLEN	EQU	0F3B0H	; --SL-
CRTCNT	EQU	0F3B1H	; ---LI
CLMLST	EQU	0F3B2H	; --S--
TXTNAM	EQU	0F3B3H	; ---L-
TXTCOL	EQU	0F3B5H	; --SL-
TXTCGP	EQU	0F3B7H	; ---L-
T32NAM	EQU	0F3BDH	; ---L-
T32COL	EQU	0F3BFH	; ---L-
T32CGP	EQU	0F3C1H	; ---L-
T32ATR	EQU	0F3C3H	; ---L-
T32PAT	EQU	0F3C5H	; ---L-
GRPNAM	EQU	0F3C7H	; ---L-
GRPCOL	EQU	0F3C9H	; ---L-
GRPCGP	EQU	0F3CBH	; ---L-
GRPATR	EQU	0F3CDH	; ---L-
GRPPAT	EQU	0F3CFH	; ---L-
MLTNAM	EQU	0F3D1H	; ---L-
MLTCGP	EQU	0F3D5H	; ---L-
MLTATR	EQU	0F3D7H	; ---L-
MLTPAT	EQU	0F3D9H	; ---L-
CLIKSW	EQU	0F3DBH	; --S--
CSRY	EQU	0F3DCH	; --SLI
CSRX	EQU	0F3DDH	; ---LI
CNSDFG	EQU	0F3DEH	; --SL-
RG0SAV	EQU	0F3DFH	; --SLI
RG1SAV	EQU	0F3E0H	; --SL-
RG2SAV	EQU	0F3E1H	; --S--
RG3SAV	EQU	0F3E2H	; --S--
RG4SAV	EQU	0F3E3H	; --S--
RG5SAV	EQU	0F3E4H	; --S--
RG6SAV	EQU	0F3E5H	; --S--
FORCLR	EQU	0F3E9H	; --SL-
BAKCLR	EQU	0F3EAH	; --SLI
BDRCLR	EQU	0F3EBH	; ---L-
ATRBYT	EQU	0F3F2H	; ---L-
CS1200	EQU	0F3FCH	; ----I
LOW	EQU	0F406H	; ----I
ASPCT1	EQU	0F40BH	; --S--
ASPCT2	EQU	0F40DH	; --S--
NTMSXP	EQU	0F417H	; --S--
CURLIN	EQU	0F41CH	; ---L-
BUFMIN	EQU	0F55DH	; ----I
BUF	EQU	0F55EH	; --S-I
TTYPOS	EQU	0F661H	; --S--
AUTFLG	EQU	0F6AAH	; ---L-
FNKSTR	EQU	0F87FH	; ----I
CGPNT	EQU	0F91FH	; ---L-
NAMBAS	EQU	0F922H	; --SL-
CGPBAS	EQU	0F924H	; --SL-
PATBAS	EQU	0F926H	; --SL-
ATRBAS	EQU	0F928H	; --SL-
DPPAGE	EQU	0FAF5H	; --SL-
ACPAGE	EQU	0FAF6H	; --SL-
AVCSAV	EQU	0FAF7H	; --SL-
LOGOPR	EQU	0FB02H	; --SL-
BASROM	EQU	0FBB1H	; ---LI
LINTTB	EQU	0FBB2H	; ----I
FSTPOS	EQU	0FBCAH	; --SLI
CURSAV	EQU	0FBCCH	; --SL-
FNKSWI	EQU	0FBCDH	; --S--
NEWKEY	EQU	0FBE5H	; ---L-
LINWRK	EQU	0FC18H	; ----I
TRPTBL	EQU	0FC4CH
INTFLG	EQU	0FC9BH	; --S--
GRPHED	EQU	0FCA6H	; ----I
ESCCNT	EQU	0FCA7H	; --S-I
INSFLG	EQU	0FCA8H	; --S-I
CSRSR	EQU	0FCA9H	; --SL-
CSTYLE	EQU	0FCAAH	; --SL-
SCRMOD	EQU	0FCAFH	; --SL-
OLDSCR	EQU	0FCB0H	; --SL-
GXPOS	EQU	0FCB3H	; --SL-
GYPOS	EQU	0FCB5H	; --SL-
EXPTBL	EQU	0FCC1H	; ----I
PROCNM	EQU	0FD89H	; ----I
H.CHPU	EQU	0FDA4H	; ---LI
H.DSPC	EQU	0FDA9H
H.ERAC	EQU	0FDAEH
H.DSPF	EQU	0FDB3H
H.ERAF	EQU	0FDB8H	; ---LI
H.TOTE	EQU	0FDBDH	; ---LI
H.INIP	EQU	0FDC7H	; -C---
H.PINL	EQU	0FDDBH	; ---LI
H.QINL	EQU	0FDE0H	; ---LI
H.INLI	EQU	0FDE5H	; ---LI
H.WIDT	EQU	0FF84H	; --S--
H.SCRE	EQU	0FFC0H	; --S--
RG8SAV	EQU	0FFE7H	; ----I
RG9SAV	EQU	0FFE8H	; --SL-
RG10SAV	EQU	0FFE9H	; --S--
RG11SAV	EQU	0FFEAH	; --S--
D$FFFF	EQU	0FFFFH	; ---L-

        DEFB	"AB"
        DEFW	C$408F
        DEFW	C$4019
        DEFW	0
        DEFW	0
        DEFW	0
        DEFW	0
        DEFW	0

?.4010:	PUSH	AF
        LD	A,E
        LD	(LINL40),A
        POP	AF
        JP	C.43CB			; chgmod

;	  Subroutine EXTENSION ROM CALL statement handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$4019:	PUSH	HL
        EX	AF,AF'
        EXX	
        LD	DE,I$4047
J$401F:	LD	HL,PROCNM
J$4022:	LD	A,(DE)
        AND	A
        JR	Z,J$403D
        CP	(HL)
        JR	NZ,J.402D
        INC	HL
        INC	DE
        JR	J$4022

J.402D:	LD	A,(DE)
        CP	0FFH
        JR	Z,J$403A
        INC	DE
        AND	A
        JR	NZ,J.402D
        INC	DE
        INC	DE
        JR	J$401F

J$403A:	POP	HL
        SCF	
        RET	

J$403D:	EX	DE,HL
        INC	HL
        PUSH	DE
        LD	E,(HL)
        INC	HL
        LD	D,(HL)
        EX	DE,HL
        POP	DE
        PUSH	HL
        RET	

I$4047:	DEFB	"CLS"
        DEFB	0
        DEFW	C$4089
        DEFB	"@REL"
        DEFB	0
        DEFW	C$406F
        DEFB	"@VER"
        DEFB	0
        DEFW	C$4076
        DEFB	0FFH

I$405C:	DEFB	"X.B8P.10.007"

I$4068:	DEFB	"Ver 1.0"

;	  Subroutine CALL @REL statement
;	     Inputs  ________________________
;	     Outputs ________________________

C$406F:	LD	HL,I$405C
        LD	B,12
        JR	J.407B

;	  Subroutine CALL @VER statement
;	     Inputs  ________________________
;	     Outputs ________________________

C$4076:	LD	HL,I$4068
        LD	B,7
J.407B:	PUSH	BC
        PUSH	HL
        LD	A,(HL)
        CALL	C.41FD
        POP	HL
        INC	HL
        POP	BC
        DJNZ	J.407B
        POP	HL
        OR	A
        RET	

;	  Subroutine CALL CLS statement
;	     Inputs  ________________________
;	     Outputs ________________________

C$4089:	POP	HL
        CALL	C.4B33			; clear screen
        OR	A
        RET	

;	  Subroutine EXTENSION ROM INIT
;	     Inputs  ________________________
;	     Outputs ________________________

C$408F:	DI	
        LD	DE,0C9C9H
J$4093:	LD	HL,(H.WIDT+0)
        OR	A
J$4097:	SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.SCRE+0)
J$409E:	OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.CHPU+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.DSPF+0)
        OR	A
        SBC	HL,DE
J$40B1:	JR	NZ,J.40EB
        LD	HL,(H.ERAF+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.DSPC+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.ERAC+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.PINL+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.QINL+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.INLI+0)
        OR	A
        SBC	HL,DE
        JR	NZ,J.40EB
        LD	HL,(H.TOTE+0)
        OR	A
        SBC	HL,DE
        JR	Z,J$40ED
J.40EB:	EI	
        RET	

J$40ED:	IN	A,(0A8H)
        LD	B,A
        AND	3FH	; "?"
        LD	C,A
        RRCA	
        RRCA	
        RRCA	
        RRCA	
        AND	0C0H
        OR	C
        OUT	(0A8H),A
        LD	A,(D$FFFF)
        CPL	
        LD	C,A
        LD	A,B
        OUT	(0A8H),A
        LD	A,0CH	; 12 
        AND	B
        RRCA	
        RRCA	
        LD	B,A
        LD	HL,EXPTBL
        OR	A
        JR	Z,J$4114
J$4110:	INC	HL
        DEC	A
        JR	NZ,J$4110
J$4114:	LD	A,C
        AND	0CH	; 12 
        OR	(HL)
        OR	B
        LD	HL,I$41C0
        LD	DE,H.WIDT
        LD	BC,5
        LDIR	
        LD	(H.WIDT+1),A
        LD	HL,I$41C5
        LD	DE,H.SCRE
        LD	BC,5
        LDIR	
        LD	(H.SCRE+1),A
        LD	HL,I$41CA
        LD	DE,H.CHPU
        LD	BC,5
        LDIR	
        LD	(H.CHPU+1),A
        LD	HL,I$41CF
        LD	DE,H.DSPF
        LD	BC,5
        LDIR	
        LD	(H.DSPF+1),A
        LD	HL,I$41D4
        LD	DE,H.ERAF
        LD	BC,5
        LDIR	
        LD	(H.ERAF+1),A
        LD	HL,I$41D9
        LD	DE,H.DSPC
        LD	BC,5
        LDIR	
        LD	(H.DSPC+1),A
        LD	HL,I$41DE
        LD	DE,H.ERAC
        LD	BC,5
        LDIR	
        LD	(H.ERAC+1),A
        LD	HL,I$41E3
        LD	DE,H.PINL
        LD	BC,5
        LDIR	
        LD	(H.PINL+1),A
        LD	HL,I$41E8
        LD	DE,H.QINL
        LD	BC,5
        LDIR	
        LD	(H.QINL+1),A
        LD	HL,I$41ED
        LD	DE,H.INLI
        LD	BC,5
        LDIR	
        LD	(H.INLI+1),A
        LD	HL,I$41F2
        LD	DE,H.TOTE
        LD	BC,5
        LDIR	
        LD	(H.TOTE+1),A
        LD	BC,16
        LD	HL,I$4A9A
        LD	DE,RG8SAV
        LDIR	
        EI	
        RET	

I$41C0:	RST	30H
        DEFB	0
        DEFW	C$4253
        RET	

I$41C5:	RST	30H
        DEFB	0
        DEFW	C$42C6
        RET	

I$41CA:	RST	30H
        DEFB	0
        DEFW	C$4CFA
        RET

I$41CF:	RST	30H
        DEFB	0
        DEFW	C$5183
        RET	

I$41D4:	RST	30H
        DEFB	0
        DEFW	C$516B
        RET	

I$41D9:	RST	30H
        DEFB	0
        DEFW	C$50E6
        RET	

I$41DE:	RST	30H
        DEFB	0
        DEFW	C$510B
        RET	

I$41E3:	RST	30H
        DEFB	0
        DEFW	C$524E
        RET	

I$41E8:	RST	30H
        DEFB	0
        DEFW	C$5266
        RET	

I$41ED:	RST	30H
        DEFB	0
        DEFW	C$5274
        RET	

I$41F2:	RST	30H
        DEFB	0
        DEFW	C$43BD
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$41F7:	LD	IX,CHGET
        JR	J.4231

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.41FD:	LD	IX,OUTDO
        JR	J.4231

J$4203:	LD	IX,FNKSB
        JR	J.4231

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$4209:	LD	IX,RDSLT
        JR	J.4231

;	  Subroutine get next BASIC char
;	     Inputs  ________________________
;	     Outputs ________________________

C.420F:	LD	IX,I$4666
        JR	J.4231

;	  Subroutine evaluate byte operand
;	     Inputs  ________________________
;	     Outputs ________________________

C.4215:	LD	IX,I$521C
        JR	J.4231

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$421B:	LD	IX,CLRSPR
        JR	J.4231

C.4221:	LD	IX,BEEP
        JR	J.4231

J$4227:	LD	IX,I$4055
        JR	J.4231

J.422D:	LD	IX,I$475A

J.4231:	DI	
        PUSH	AF
        IN	A,(0A8H)
        AND	0FCH
        OUT	(0A8H),A
        XOR	A
        PUSH	AF
        POP	IY
        POP	AF
        EI	
        JP	CALSLT

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4242:	LD	A,H
        SUB	D
        RET	NZ
        LD	A,L
        SUB	E
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4248:	LD	A,(HL)
        EX	(SP),HL
        CP	(HL)
        INC	HL
        EX	(SP),HL
        JP	NZ,J$4227		; syntax error
        JP	C.420F			; get next BASIC char

;	  Subroutine WIDTH statement
;	     Inputs  ________________________
;	     Outputs ________________________
        
C$4253:	AND	A
        JR	Z,J.4268
        LD	A,(OLDSCR)
        AND	A
        LD	A,E
        JR	Z,J$4262
        CP	32+1			; screenmode 1, 32 colums max
        JP	NC,J.4268
J$4262:	CP	40+1
        JR	C,J.4268		; weird code, not needed at all
        CP	80+1			; screenmode 0, 80 colums max
J.4268:	JP	NC,J.422D		; illegal function call
        LD	A,(LINLEN)
        CP	E
        JR	Z,J.42AE		; screenwidth not changed, just quit
        CALL	C.4B33			; clear screen
        LD	A,E
        LD	(LINLEN),A
        CALL	C.42B9			; initialize CLMLST
        LD	A,(OLDSCR)
        DEC	A
        LD	A,E
        JR	NZ,J$428A
        LD	(LINL32),A
        CALL	C.4B33			; clear screen
        JR	J.42AE			; quit

J$428A:	LD	C,40+1
        LD	A,(LINL40)
        CP	C
        LD	A,E
        LD	(LINL40),A
        PUSH	AF
        CALL	C.4B33			; clear screen
        POP	AF
        JR	C,J$429F		; was in TEXT40 mode
        CP	C
        JR	NC,J.42AE		; was in TEXT80 mode, not changed, quit
        LD	C,A
J$429F:	CP	C
        JR	C,J.42AE		; not changed, quit
        PUSH	AF
        PUSH	HL
        XOR	A			; screenmode 0
        CALL	C.43CB			; chgmod
        POP	HL
        POP	AF
        LD	E,A
        CALL	C.42B9			; initialize CLMLST
J.42AE:	DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.WIDT+4
        JP	J.433B

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.42B9:	SUB	0EH
        JR	NC,C.42B9
        ADD	A,1CH
        CPL	
        INC	A
        ADD	A,E
        LD	(CLMLST),A
        RET	

;	  Subroutine SCREEN statement
;	     Inputs  ________________________
;	     Outputs ________________________

C$42C6:	CP	","
        JR	Z,J$42E4
        CALL	C.4215			; evaluate byte operand
        CP	3+1
        JP	NC,J.422D		; max screenmode=3, illegal function call
        PUSH	HL
        CALL	C.43CB			; chgmod
        LD	A,(LINLEN)
        LD	E,A
        CALL	C.42B9			; initialize CLMLST
        POP	HL
        DEC	HL
        CALL	C.420F			; get next BASIC char
        JR	Z,J.4333		; end of statement, quit
J$42E4:	CALL	C.4248
        DEFB	","			; check for ,
        CP	","
        JR	Z,J$4308
        CALL	C.4215			; evaluate byte operand 
        CP	3+1
        JP	NC,J.422D		; spritemode must be 0-3, illegal function call
        LD	A,(RG1SAV)
        AND	0FCH
        OR	E
        LD	(RG1SAV),A
        PUSH	HL
        CALL	C$421B			; CLRSPR
        POP	HL
        DEC	HL
        CALL	C.420F			; get next BASIC char
        JR	Z,J.4333		; end of statement, quit
J$4308:	CALL	C.4248
        DEFB	","			; check for ,
        CP	","
        JR	Z,J$4318
        CALL	C.4215			; evaluate byte operand 
        LD	(CLIKSW),A
        JR	Z,J.4333
J$4318:	CALL	C.4248
        DEFB	","			; check for ,
        CP	","
        JR	Z,J$4329
        CALL	C$435F			; evaluate cassettespeed operand and set it up
        DEC	HL
        CALL	C.420F			; get next BASIC char
        JR	Z,J.4333
J$4329:	CALL	C.4248
        DEFB	","			; check for ,
        CALL	C.4215			; evaluate byte operand 
        LD	(NTMSXP),A
J.4333:	DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.SCRE+4
J.433B:	LD	HL,0
        ADD	HL,SP
J$433F:	LD	E,(HL)
        INC	HL
        LD	D,(HL)
        INC	HL
        EX	DE,HL
        OR	A
        SBC	HL,BC
        EX	DE,HL
        JR	NZ,J$433F
        LD	D,H
        LD	E,L
        DEC	DE
        OR	A
        SBC	HL,SP
        LD	B,H
        LD	C,L
        LD	H,D
        LD	L,E
        INC	DE
        INC	DE
        LDDR	
        POP	DE
        POP	DE
        POP	HL
        POP	BC
        POP	AF
        EI	
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$435F:	CALL	C.4215			; evaluate byte operand 
        DEC	A
        CP	02H	; 2 
        JP	NC,J.422D		; illegal function call
        PUSH	HL
        LD	BC,5
        AND	A
        LD	HL,CS1200
        JR	Z,J$4373
        ADD	HL,BC
J$4373:	LD	DE,LOW
        LDIR	
        POP	HL
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.437A:	LD	A,(FORCLR)
        LD	E,A
        LD	HL,(ATRBAS)
        LD	BC,02000H
J$4384:	CALL	C.4530
        LD	A,0D1H
        JR	C,J$438D		; screen 0-3,
        LD	A,0D9H
J$438D:	CALL	C.4759
        INC	HL
        INC	HL
        LD	A,C
        CALL	C.4759
        INC	HL
        INC	C
        LD	A,(RG1SAV)
        RRC	A
        RRC	A
        JR	NC,J$43A4
        INC	C
        INC	C
        INC	C
J$43A4:	LD	A,E
        CALL	C.4759
        INC	HL
        DJNZ	J$4384
        CALL	C.4530
        RET	C			; screen 0-3, quit
        LD	HL,(ATRBAS)
        LD	BC,00200H
        SBC	HL,BC
        LD	A,(FORCLR)
        JP	C.4C33

;	  Subroutine H.TOTE handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$43BD:	CALL	C.43CB			; chgmod
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.TOTE+4
        JP	J.433B

;	  Subroutine chgmod
;	     Inputs  ________________________
;	     Outputs ________________________

C.43CB:	CP	3+1
        RET	NC
        LD	HL,I$43DB
        LD	C,A
        LD	B,0
        ADD	HL,BC
        ADD	HL,BC
        LD	C,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,C
        JP	(HL)

I$43DB:	DEFW	C.43E3
        DEFW	C.4418
        DEFW	C.4446
        DEFW	C.4485

;	  Subroutine chgmod screen mode 0
;	     Inputs  ________________________
;	     Outputs ________________________

C.43E3:	XOR	A
        LD	(OLDSCR),A
        CALL	C.44C3
        LD	A,(LINL40)
        LD	(LINLEN),A
        LD	HL,00800H
        LD	(TXTCOL),HL
        LD	HL,(TXTNAM)
        LD	(NAMBAS),HL
        LD	HL,(TXTCGP)
        CP	40+1
        JR	C,J$4406
        LD	HL,01000H
J$4406:	LD	(CGPBAS),HL
        CALL	C$457D
J$440C:	CALL	C.4C10
        CALL	C.4BAB
        CALL	C$4C79			; initialize patterngenerator with msx characterset
        JP	J.453C			; wait until VDP command is done and enable vdp display output

;	  Subroutine chgmod screen mode 1
;	     Inputs  ________________________
;	     Outputs ________________________

C.4418:	LD	A,01H	; 1 
        LD	(OLDSCR),A
        CALL	C.44C3
        LD	A,(LINL32)
J$4423:	LD	(LINLEN),A
        LD	HL,(T32NAM)
        LD	(NAMBAS),HL
        LD	HL,(T32CGP)
        LD	(CGPBAS),HL
        LD	HL,(T32PAT)
        LD	(PATBAS),HL
        LD	HL,(T32ATR)
        LD	(ATRBAS),HL
        CALL	C$45D7
        CALL	C.437A
        JR	J$440C

;	  Subroutine chgmod screen mode 2
;	     Inputs  ________________________
;	     Outputs ________________________

C.4446:	LD	A,02H	; 2 
        CALL	C.44C3
        LD	HL,(GRPATR)
        CALL	C$446F
        PUSH	HL
        CALL	C$460D
        POP	HL
        CALL	C.477C
        XOR	A
        LD	B,03H	; 3 
J.445C:	OUT	(98H),A
        INC	A
        JR	NZ,J.445C
        DJNZ	J.445C
        CALL	C.4BDC
J$4466:	CALL	C.4C10
        CALL	C.437A
        JP	J.453C			; wait until VDP command is done and enable vdp display output

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$446F:	LD	(ATRBAS),HL
        LD	HL,(GRPPAT)
        LD	(PATBAS),HL
        LD	HL,(GRPCGP)
        LD	(CGPBAS),HL
        LD	HL,(GRPNAM)
        LD	(NAMBAS),HL
        RET	

;	  Subroutine chgmod screen mode 3
;	     Inputs  ________________________
;	     Outputs ________________________

C.4485:	LD	A,03H	; 3 
        CALL	C.44C3
        LD	HL,(MLTPAT)
        LD	(PATBAS),HL
        LD	HL,(MLTATR)
        LD	(ATRBAS),HL
        LD	HL,(MLTCGP)
        LD	(CGPBAS),HL
        LD	HL,(MLTNAM)
        LD	(NAMBAS),HL
        PUSH	HL
        CALL	C$4654
        POP	HL
        CALL	C.477C
        LD	DE,6
J$44AD:	LD	C,04H	; 4 
J$44AF:	LD	A,D
        LD	B,20H	; " "
J$44B2:	OUT	(98H),A
        INC	A
        DJNZ	J$44B2
        DEC	C
        JR	NZ,J$44AF
        LD	D,A
        DEC	E
        JR	NZ,J$44AD
        CALL	C.4BF4
        JR	J$4466

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.44C3:	LD	(SCRMOD),A
        XOR	A
        LD	(DPPAGE),A
        LD	(ACPAGE),A
        LD	HL,00100H
        LD	(ASPCT1),HL
        LD	(ASPCT2),HL
        CALL	C.4A13
        CALL	C$4546			; wait until VDP command is done and disable vdp display output
        CALL	C$46F7			; initialize all palettes
        LD	B,00H
        LD	C,17H
        JP	C.4551			; vertikal scroll 0

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$44E6:	PUSH	AF
        LD	A,(SCRMOD)
        LD	HL,I$450A
        PUSH	BC
        INC	A
        LD	C,A
        LD	B,00H
        LD	A,(LINLEN)
        CP	40+1
        JR	NC,J$44FA
        DEC	BC
J$44FA:	ADD	HL,BC
        ADD	HL,BC
        POP	BC
        LD	A,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,A
        PUSH	DE
        LD	E,D
        LD	D,00H
        ADD	HL,DE
        ADD	HL,DE
        POP	DE
        POP	AF
        RET	
;	-----------------
I$450A:	DEFW	00400H
        DEFW	00F00H
        DEFW	02020H
        DEFW	03C00H
        DEFW	02020H

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4514:	LD	A,02H
        CALL	C.4A20
        AND	40H
        JR	NZ,C.4514
J$451D:	LD	A,02H
        CALL	C.4A20
        AND	40H
        JR	Z,J$451D
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4527:	LD	(CNSDFG),A

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.452A:	LD	A,(SCRMOD)
        CP	02H	; 2 
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4530:	LD	A,(SCRMOD)
        CP	04H
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4536:	LD	A,(SCRMOD)
        CP	05H	; 5 
        RET	

J.453C:	CALL	C.4514			; wait until VDP command is done
        LD	A,(RG1SAV)
        OR	60H	; "`"
        JR	J$454E

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$4546:	CALL	C.4514			; wait until VDP command is done
        LD	A,(RG1SAV)
        AND	3FH	; "?"
J$454E:	LD	B,A
        LD	C,1

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4551:	LD	A,I
        PUSH	AF
        LD	A,B
        DI	
        OUT	(99H),A
        LD	A,C
        OR	80H
        OUT	(99H),A
        PUSH	HL
        PUSH	BC
        PUSH	DE
        LD	D,B
        LD	A,C
        LD	B,00H
        CP	08H	; 8 
        JR	NC,J$456D
        LD	HL,RG0SAV
        JR	J$4574
;	-----------------
J$456D:	CP	18H
        JR	NC,J$4576
        LD	HL,RG8SAV-8
J$4574:	ADD	HL,BC
        LD	(HL),D
J$4576:	POP	DE
        POP	BC
        POP	HL
        POP	AF
        RET	PO
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$457D:	CALL	C.46DB
        LD	A,(LINLEN)
        CP	29H	; ")"
        LD	B,00H
        JR	C,J$458B
        LD	B,04H	; 4 
J$458B:	LD	C,10H	; 16 
        CALL	C.46E4
        LD	A,(LINLEN)
        CP	29H	; ")"
        LD	A,(DPPAGE)
        JR	NC,J$45AD
        ADD	A,A
        LD	HL,(TXTCGP)
        LD	B,00H
        CALL	C.4694
        ADD	A,A
        LD	HL,(TXTNAM)
        CALL	C.4688
        JP	J.4802
;	-----------------
J$45AD:	LD	A,(DPPAGE)
        PUSH	AF
        ADD	A,A
        ADD	A,A
        LD	B,00H
        LD	HL,(CGPBAS)
        CALL	C.4694
        ADD	A,A
        LD	B,03H	; 3 
        LD	HL,(TXTNAM)
        CALL	C.4688
        POP	AF
        LD	HL,(TXTCOL)
        LD	E,00H
        SRL	A
        RR	E
        LD	D,A
        LD	B,07H	; 7 
        CALL	C.46A2
        JP	J.4802
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$45D7:	CALL	C.46DB
        LD	BC,0
        CALL	C.46E4
        LD	A,(DPPAGE)
        LD	C,A
        LD	B,00H
        LD	HL,(T32CGP)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        CALL	C.4694
        LD	HL,(T32PAT)
        CALL	C.46CE
        LD	HL,(T32NAM)
        ADD	A,A
        CALL	C.4688
        LD	E,B
        LD	D,C
        LD	HL,(T32COL)
        CALL	C.46A2
        SRL	D
        RR	E
        LD	HL,(T32ATR)
        JR	J.464E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$460D:	XOR	A
        PUSH	AF
        LD	BC,00200H
        CALL	C.46E4
        CALL	C.46DB
        LD	A,(DPPAGE)
        LD	C,A
        LD	B,03H	; 3 
        LD	HL,(GRPCGP)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        CALL	C.4694
        LD	HL,(GRPPAT)
        CALL	C.46CE
        LD	HL,(GRPNAM)
        ADD	A,A
        LD	B,00H
        CALL	C.4688
        LD	E,B
        LD	D,C
        LD	B,7FH
        LD	HL,(GRPCOL)
        CALL	C.46A2
        SRL	D
        RR	E
        POP	AF
        LD	B,A
        LD	HL,(GRPATR)
        JR	Z,J.464E
        LD	HL,(ATRBAS)
J.464E:	CALL	C$46B9
        JP	J.4802
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4654:	CALL	C.46DB
        LD	BC,00008H
        CALL	C.46E4
        LD	A,(DPPAGE)
        LD	C,A
        LD	B,00H
        LD	HL,(MLTCGP)
I$4666:	ADD	A,A
        ADD	A,A
        ADD	A,A
        CALL	C.4694
        LD	HL,(MLTPAT)
        CALL	C.46CE
        LD	HL,(MLTNAM)
        ADD	A,A
        LD	B,00H
        CALL	C.4688
        LD	E,B
        LD	D,C
        SRL	D
        RR	E
        LD	B,00H
        LD	HL,(MLTATR)
        JR	J.464E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4688:	LD	L,A
        SRL	H
        SRL	H
        ADD	A,H
        OR	B
        LD	(RG2SAV),A
        LD	A,L
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4694:	LD	L,A
        SRL	H
        SRL	H
        SRL	H
        ADD	A,H
        OR	B
        LD	(RG4SAV),A
        LD	A,L
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.46A2:	PUSH	AF
        XOR	A
        ADD	HL,HL
        ADC	A,A
        ADD	HL,HL
        ADC	A,A
        LD	L,H
        LD	H,A
        ADD	HL,DE
        LD	A,L
        OR	B
        LD	(RG3SAV),A
        LD	A,H
        LD	(RG10SAV),A
        POP	AF
        RET	
;	-----------------
?.46B6:	LD	HL,(ATRBAS)
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$46B9:	PUSH	AF
        XOR	A
        ADD	HL,HL
        ADC	A,A
        LD	L,H
        LD	H,A
        ADD	HL,DE
        LD	A,L
        OR	B
        LD	(RG5SAV),A
        LD	A,H
        LD	(RG11SAV),A
        POP	AF
        RET	
;	-----------------
?.46CB:	LD	HL,(PATBAS)
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.46CE:	LD	L,A
        SRL	H
        SRL	H
        SRL	H
        ADD	A,H
        LD	(RG6SAV),A
        LD	A,L
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.46DB:	LD	A,(RG9SAV)
        AND	7FH
        LD	(RG9SAV),A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.46E4:	LD	A,(RG0SAV)
        AND	0F1H
        OR	B
        LD	(RG0SAV),A
        LD	A,(RG1SAV)
        AND	0E7H
        OR	C
        LD	(RG1SAV),A
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$46F7:	PUSH	HL
        LD	HL,I$470B
        LD	B,10H	; 16 
        LD	D,00H
J$46FF:	LD	A,(HL)
        INC	HL
        LD	E,(HL)
        INC	HL
        CALL	C$472B
        INC	D
        DJNZ	J$46FF
        POP	HL
        RET	

I$470B:	DEFB	000H,000H
        DEFB	000H,000H
        DEFB	011H,006H
        DEFB	033H,007H
        DEFB	017H,001H
        DEFB	027H,003H
        DEFB	051H,001H
        DEFB	027H,006H
        DEFB	071H,001H
        DEFB	073H,003H
        DEFB	061H,006H
        DEFB	064H,006H
        DEFB	011H,004H
        DEFB	065H,002H
        DEFB	055H,005H
        DEFB	077H,007H

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$472B:	PUSH	BC
        PUSH	HL
        LD	B,D
        LD	C,10H	; 16 
        PUSH	AF
        CALL	C.4551
        POP	AF
        OUT	(9AH),A
        PUSH	AF
        POP	AF
        LD	A,E
        OUT	(9AH),A
        CALL	C$44E6
        PUSH	AF
        CALL	C.4F56
        CALL	C.477C
        EX	(SP),HL
        EX	(SP),HL
        POP	AF
        OUT	(99H),A
        PUSH	AF
        POP	AF
        LD	A,E
        OUT	(99H),A
        CALL	C.4F5E
        POP	HL
        POP	BC
        RET	

?.4756:	CALL	C.476A

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4759:	PUSH	AF
I$475A:	CALL	C.477C
        POP	AF
        OUT	(98H),A
        RET	

?.4761:	CALL	C.476A
        CALL	C.4771
        IN	A,(98H)
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.476A:	PUSH	AF
        LD	A,H
        AND	3FH	; "?"
        LD	H,A
        POP	AF
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4771:	LD	A,L
        DI	
        OUT	(99H),A
        LD	A,H
        AND	3FH
        OUT	(99H),A
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.477C:	PUSH	BC
        PUSH	DE
        PUSH	HL
        EX	DE,HL
        CALL	C.47C5
        LD	A,H
        AND	3FH	; "?"
        OR	40H	; "@"
        JR	J.47AA
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$478A:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	A,(ACPAGE)
        AND	A
        LD	D,A
        CALL	NZ,C.47C5
        LD	A,H
        AND	3FH	; "?"
        OR	40H	; "@"
        JR	J.47AA
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$479C:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	A,(ACPAGE)
        AND	A
        LD	D,A
        CALL	NZ,C.47C5
        LD	A,H
        AND	3FH	; "?"
J.47AA:	PUSH	AF
        LD	A,H
        AND	0C0H
        OR	D
        RLC	A
        RLC	A
        DI	
        OUT	(99H),A
        LD	A,8EH
        OUT	(99H),A
        LD	A,L
        OUT	(99H),A
        POP	AF
        OUT	(99H),A
        EI	
        POP	HL
        POP	DE
        POP	BC
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.47C5:	LD	A,(SCRMOD)
        LD	C,A
        LD	A,(ACPAGE)
        AND	A
        LD	HL,I$47D5
        JR	NZ,J$47DD
        EX	DE,HL
        LD	D,A
        RET	
;	-----------------
I$47D5:	DEFW	C.47E6
        DEFW	C.47F4
        DEFW	C.47F4
        DEFW	C.47F4

J$47DD:	LD	B,0
        ADD	HL,BC
        ADD	HL,BC
        LD	C,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,C
        JP	(HL)

C.47E6:	LD	A,(LINLEN)
        CP	29H	; ")"
        LD	A,(ACPAGE)
        JR	C,J$47F6
        JR	J$47F5

?.47F2:	ADD	A,A
        ADD	A,A
C.47F4:	ADD	A,A
J$47F5:	ADD	A,A
J$47F6:	ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	H,A
        LD	A,00H
        LD	L,A
        ADC	A,A
        ADD	HL,DE
        LD	D,A
        RET	
;	-----------------
J.4802:	PUSH	AF
        PUSH	BC
        PUSH	DE
        PUSH	HL
        CALL	C.4F46
        DI	
        XOR	A
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        CALL	C.4514			; wait until VDP command is done
        LD	HL,RG0SAV
        LD	B,08H	; 8 
J$4819:	LD	A,(HL)
        INC	HL
        OUT	(9BH),A
        DJNZ	J$4819
        LD	HL,RG8SAV
        LD	B,10H	; 16 
J$4824:	LD	A,(HL)
        INC	HL
        OUT	(9BH),A
        DJNZ	J$4824
        EI	
        CALL	C.4F4E
        POP	HL
        POP	DE
        POP	BC
        POP	AF
        RET	

;	  Subroutine evaluate logical operation
;	     Inputs  ________________________
;	     Outputs ________________________

?.4833:	AND	A
        JR	Z,J$485F
        PUSH	BC
        LD	B,A
        CALL	C.4536
        LD	A,B
        POP	BC
        RET	C
        CP	0F8H
        JR	Z,J$485D
        CP	0F7H
        JR	Z,J$485A
        CP	0F6H
        JR	Z,J$4857
        CP	0C3H
        JR	Z,J$4854
        CP	0C2H
        SCF	
        RET	NZ
        XOR	A
        DEFB	0C2H
J$4854:	LD	A,4
        DEFB	0C2H
J$4857:	LD	A,1
        DEFB	0C2H
J$485A:	LD	A,2
        DEFB	0C2H
J$485D:	LD	A,3
J$485F:	OR	D
        LD	(AVCSAV),A
        RET	

;	  Subroutine draw box line
;	     Inputs  ________________________
;	     Outputs ________________________

?.4864:	CALL	C.4AAA
        CALL	C.4CCC
        CALL	C.4AAA
        CALL	C.4CCC
        CALL	C.4CA5
        JR	Z,C.48A6
        CALL	C,C$4CCF
        CALL	C.4CB7
        JR	Z,C.48A6
        CALL	C,C.4CC2
        LD	HL,(GYPOS)
        PUSH	HL
        PUSH	DE
        EX	DE,HL
        CALL	C.48A6
        POP	HL
        LD	(GYPOS),HL
        EX	DE,HL
        CALL	C.48A6
        POP	HL
        DEC	HL
        INC	DE
        LD	(GYPOS),HL
        LD	HL,(GXPOS)
        PUSH	BC
        LD	C,L
        LD	B,H
        CALL	C.48A6
        POP	HL
        LD	(GXPOS),HL
        LD	C,L
        LD	B,H

;	  Subroutine draw line
;	     Inputs  ________________________
;	     Outputs ________________________

C.48A6:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	HL,(GYPOS)
        PUSH	HL
        LD	HL,(GXPOS)
        PUSH	HL
        CALL	C.4AAA
        CALL	C.4CCC
        CALL	C.4AAA
        CALL	C.4CB7
        CALL	C,C.4CCC
        PUSH	DE
        PUSH	HL
        EX	AF,AF'
        XOR	A
        EX	AF,AF'
        CALL	C.4CA5
        EX	DE,HL
        JR	NC,J$48CF
        EX	AF,AF'
        OR	04H	; 4 
        EX	AF,AF'
J$48CF:	POP	HL
        CALL	C.4242			; compare
        JR	C,J$48DA
        EX	DE,HL
        EX	AF,AF'
        OR	01H	; 1 
        EX	AF,AF'
J$48DA:	EX	(SP),HL
        CALL	C.4F46
        CALL	C.4A13
        LD	A,24H	; "$"
        DI	
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        LD	A,C
        OUT	(9BH),A
        LD	A,B
        OUT	(9BH),A
        LD	A,L
        OUT	(9BH),A
        LD	A,(ACPAGE)
        OUT	(9BH),A
        LD	A,E
        OUT	(9BH),A
        LD	A,D
        OUT	(9BH),A
        POP	HL
        LD	A,L
        OUT	(9BH),A
        LD	A,H
        OUT	(9BH),A
        LD	A,(ATRBYT)
        OUT	(9BH),A
        EX	AF,AF'
        OUT	(9BH),A
        LD	A,(AVCSAV)
        AND	0FH	; 15 
        OR	70H	; "p"
        EI	
        POP	HL
        LD	(GXPOS),HL
        POP	HL
        LD	(GYPOS),HL
        POP	HL
        POP	DE
        POP	BC
        RET	

;	  Subroutine draw box filled
;	     Inputs  ________________________
;	     Outputs ________________________

?.4921:	CALL	C.4AAA
        CALL	C.4F46
        LD	L,C
        LD	H,B
        LD	A,E
        CALL	C.4A3B
        CALL	C.4CCC
        CALL	C.4AAA
        CALL	C.4CCC
        EX	AF,AF'
        XOR	A
        EX	AF,AF'
        CALL	C.4CA5
        JR	NC,J$4941
        OR	04H	; 4 
        EX	AF,AF'
J$4941:	INC	HL
        PUSH	HL
        CALL	C.4CB7
        JR	NC,J$494C
        EX	AF,AF'
        OR	08H	; 8 
        EX	AF,AF'
J$494C:	INC	HL
        POP	DE
        CALL	C.4A5A
        EX	AF,AF'
        CALL	C.4A71
        EX	AF,AF'
        LD	A,(ATRBYT)
        CALL	C.4A87
        AND	0FH	; 15 
        ADD	A,80H
        CALL	C.4A7C
        JP	C.4F4E
;	-----------------
?.4966:	LD	B,04H	; 4 
        JR	J.4974
;	-----------------
?.496A:	LD	B,06H	; 6 
        JR	J.4974
;	-----------------
?.496E:	LD	B,02H	; 2 
        JR	J.4974
;	-----------------
?.4972:	LD	B,00H
J.4974:	PUSH	BC
        CALL	C$49B3
        POP	AF
        DI	
        OUT	(99H),A
        LD	A,0ADH
        OUT	(99H),A
        LD	A,60H	; "`"
        OUT	(99H),A
        LD	A,0AEH
        OUT	(99H),A
        CALL	C.4A13
        AND	10H	; 16 
        RET	Z
        LD	A,08H	; 8 
        DI	
        OUT	(99H),A
        LD	A,8FH
        OUT	(99H),A
        IN	A,(99H)
        LD	L,A
        LD	A,09H	; 9 
        OUT	(99H),A
        LD	A,8FH
        OUT	(99H),A
        IN	A,(99H)
        PUSH	AF
        XOR	A
        OUT	(99H),A
        LD	A,8FH
        OUT	(99H),A
        EI	
        POP	AF
        AND	01H	; 1 
        LD	H,A
        SCF	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$49B3:	PUSH	AF
        CALL	C.4A13
        LD	A,20H	; " "
        DI	
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        LD	A,L
        OUT	(9BH),A
        LD	A,H
        OUT	(9BH),A
        LD	A,E
        OUT	(9BH),A
        LD	A,(ACPAGE)
        OUT	(9BH),A
        POP	AF
        OUT	(99H),A
        LD	A,0ACH
        OUT	(99H),A
        EI	
        RET	
;	-----------------
?.49D7:	PUSH	DE
        CALL	C$4A35
        XOR	A
        CALL	C.4A71
        LD	A,40H	; "@"
        CALL	C.4A7C
        CALL	C.4A13
        LD	A,07H	; 7 
        CALL	C.4A20
        EI	
        POP	DE
        RET	
;	-----------------
?.49EF:	CALL	C.4F46
        CALL	C.4A3B
        LD	A,2CH	; ","
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        LD	A,(ATRBYT)
        OUT	(9BH),A
        XOR	A
        OUT	(9BH),A
        LD	A,(AVCSAV)
        AND	0FH	; 15 
        OR	50H	; "P"
        OUT	(9BH),A
        CALL	C.4F4E
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A13:	LD	A,02H	; 2 
        CALL	C.4A20
        EI	
        RRC	A
        JR	C,C.4A13
        RLC	A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A20:	DI	
        OUT	(99H),A
        LD	A,8FH
        OUT	(99H),A
        PUSH	HL
        POP	HL
        IN	A,(99H)
        PUSH	AF
        XOR	A
        OUT	(99H),A
        LD	A,8FH
        OUT	(99H),A
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4A35:	PUSH	AF
        LD	A,20H	; " "
        PUSH	AF
        JR	J$4A3F
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A3B:	PUSH	AF
        LD	A,24H	; "$"
        PUSH	AF
J$4A3F:	CALL	C.4A13
        DI	
        POP	AF
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        LD	A,L
        OUT	(9BH),A
        LD	A,H
        OUT	(9BH),A
        POP	AF
        OUT	(9BH),A
        LD	A,(ACPAGE)
        OUT	(9BH),A
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A5A:	LD	A,28H	; "("
        DI	
        OUT	(99H),A
        LD	A,91H
        OUT	(99H),A
        LD	A,E
        OUT	(9BH),A
        LD	A,D
        OUT	(9BH),A
        LD	A,L
        OUT	(9BH),A
        LD	A,H
        OUT	(9BH),A
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A71:	PUSH	AF
        DI	
        OUT	(99H),A
        LD	A,0ADH
        OUT	(99H),A
        EI	
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A7C:	PUSH	AF
        DI	
        OUT	(99H),A
        LD	A,0AEH
        OUT	(99H),A
        EI	
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4A87:	PUSH	AF
        DI	
        OUT	(99H),A
        LD	A,0ACH
        OUT	(99H),A
        EI	
        POP	AF
        RET	

?.4A92:	DEFB	000H,060H,000H,000H,000H,000H,000H,000H

I$4A9A:	DEFB	000H,002H,000H,000H,000H,000H,000H,000H
        DEFB	000H,000H,000H,000H,000H,03BH,005H,000H

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4AAA:	CALL	C.4536
        JP	NC,J$4AF0
        PUSH	HL
        PUSH	BC
        LD	B,01H	; 1 
        EX	DE,HL
        LD	A,H
        ADD	A,A
        JR	NC,J$4ABE
        LD	HL,0
        JR	J$4AC8
;	-----------------
J$4ABE:	LD	DE,000C0H
        CALL	C.4242			; compare
        JR	C,J$4ACA
        EX	DE,HL
        DEC	HL
J$4AC8:	LD	B,00H
J$4ACA:	EX	(SP),HL
        LD	A,H
        ADD	A,A
        JR	NC,J$4AD4
        LD	HL,0
        JR	J$4ADE
;	-----------------
J$4AD4:	LD	DE,00100H
        CALL	C.4242			; compare
        JR	C,J$4AE0
        EX	DE,HL
        DEC	HL
J$4ADE:	LD	B,00H
J$4AE0:	POP	DE
        SRL	L
        SRL	L
        SRL	E
        SRL	E
        LD	A,B
        RRC	A
        LD	C,L
        LD	B,H
        POP	HL
        RET	
;	-----------------
J$4AF0:	PUSH	HL
        PUSH	BC
        LD	B,01H	; 1 
        EX	DE,HL
        LD	A,H
        ADD	A,A
        JR	NC,J$4AFE
        LD	HL,0
        JR	J$4B08
;	-----------------
J$4AFE:	LD	DE,000D4H
        CALL	C.4242			; compare
        JR	C,J$4B0A
        EX	DE,HL
        DEC	HL
J$4B08:	LD	B,00H
J$4B0A:	EX	(SP),HL
        LD	A,H
        ADD	A,A
        JR	NC,J$4B14
        LD	HL,0
        JR	J$4B28
;	-----------------
J$4B14:	LD	A,(SCRMOD)
        AND	02H	; 2 
        LD	DE,00200H
        JR	NZ,J$4B21
        LD	DE,00200H
J$4B21:	CALL	C.4242			; compare
        JR	C,J$4B2A
        EX	DE,HL
        DEC	HL
J$4B28:	LD	B,00H
J$4B2A:	LD	A,B
        RRC	A
        LD	B,H
        LD	C,L
        POP	DE
        POP	HL
        RET	
;	-----------------
?.4B32:	RET	NZ

;	  Subroutine clear screen
;	     Inputs  ________________________
;	     Outputs ________________________

C.4B33:	PUSH	AF
        PUSH	DE
        PUSH	HL
        PUSH	BC
        CALL	C$4B3F
        POP	BC
        POP	HL
        POP	DE
        POP	AF
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$4B3F:	CALL	C.4530
        JP	Z,C.4BDC		; screen 4
        JR	NC,J$4B53		; screen 5-8
        CALL	C.452A
        JP	Z,C.4BDC		; screen 2
        JP	NC,C.4BF4		; screen 3
        JP	C.4BAB			; screen 0-1

J$4B53:	PUSH	AF
        PUSH	DE
        PUSH	HL
        CALL	C.4A13
        LD	A,(BAKCLR)
        CALL	C$4B8C
        CALL	C.4A87
        XOR	A
        LD	H,A
        LD	L,A
        CALL	C.4A3B
        XOR	A
        CALL	C.4A71
        LD	A,(SCRMOD)
        AND	02H	; 2 
        LD	DE,00100H
        JR	Z,J$4B79
        LD	DE,00200H
J$4B79:	LD	HL,000D4H
        CALL	C.4A5A
        LD	A,0C0H
        CALL	C.4A7C
        CALL	C.4A13
        POP	HL
        POP	DE
        POP	BC
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4B8C:	LD	B,A
        LD	A,(SCRMOD)
        CP	08H	; 8 
        LD	A,B
        RET	Z
        RLC	A
        RLC	A
        RLC	A
        RLC	A
        OR	B
        LD	B,A
        LD	A,(SCRMOD)
        CP	06H	; 6 
        LD	A,B
        RET	NZ
        RRC	A
        RRC	A
        OR	B
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4BAB:	LD	A,(SCRMOD)
        AND	A
        LD	HL,(NAMBAS)
        JR	NZ,J$4BC5
        LD	A,(LINLEN)
        CP	29H	; ")"
        JR	NC,J$4BC0
        LD	BC,003C0H
        JR	J.4BC8
;	-----------------
J$4BC0:	LD	BC,00780H
        JR	J.4BC8
;	-----------------
J$4BC5:	LD	BC,00300H
J.4BC8:	LD	A,20H	; " "
        CALL	C.4C33
        CALL	C.4C09
        LD	HL,LINTTB
        LD	B,18H
J$4BD5:	LD	(HL),B
        INC	HL
        DJNZ	J$4BD5
        JP	J$4203
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4BDC:	CALL	C.4C5D
        LD	BC,01800H
        PUSH	BC
        LD	HL,(GRPCOL)
        LD	A,(BAKCLR)
        CALL	C.4C33
        LD	HL,(GRPCGP)
        POP	BC
        XOR	A
J$4BF1:	JP	C.4C33
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4BF4:	CALL	C.4C5D
        LD	HL,BAKCLR
        LD	A,(HL)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        OR	(HL)
        LD	HL,(MLTCGP)
        LD	BC,00600H
        JP	J$4BF1
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4C09:	LD	HL,00101H
        LD	(CSRY),HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4C10:	CALL	C.4536
        JR	NC,J$4C58
        CALL	C.4C66
        DEC	A
        JP	M,J$4C4B
        PUSH	AF
        CALL	C.4C5D
        POP	AF
        RET	NZ
        LD	HL,BAKCLR
        LD	A,(FORCLR)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        OR	(HL)
        LD	HL,(T32COL)
        LD	BC,00020H
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4C33:	PUSH	AF
        CALL	C.4F56
        CALL	C.477C
        LD	A,C
        OR	A
        JR	Z,J$4C3F
        INC	B
J$4C3F:	POP	AF
J.4C40:	OUT	(98H),A
        DEC	C
        JR	NZ,J.4C40
        DJNZ	J.4C40
        CALL	C.4F5E
        RET	
;	-----------------
J$4C4B:	LD	HL,BAKCLR
        LD	A,(FORCLR)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        OR	(HL)
        JR	J$4C60
;	-----------------
J$4C58:	CP	08H	; 8 
        CALL	NZ,C.4C66
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4C5D:	LD	A,(BDRCLR)
J$4C60:	LD	B,A
        LD	C,07H	; 7 
        JP	C.4551
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4C66:	PUSH	AF
        LD	A,(BAKCLR)
        AND	0FH	; 15 
        LD	(BAKCLR),A
        LD	A,(FORCLR)
        AND	0FH	; 15 
        LD	(FORCLR),A
        POP	AF
        RET	

;	  Subroutine initialize patterngenerator with msx characterset
;	     Inputs  ________________________
;	     Outputs ________________________

C$4C79:	CALL	H.INIP
        CALL	C.4F56
        LD	HL,(CGPBAS)
        CALL	C.477C
        LD	A,(CGPNT+0)
        LD	HL,(CGPNT+1)
        LD	BC,00800H
        PUSH	AF
J$4C8F:	POP	AF
        PUSH	AF
        PUSH	BC
        DI	
        CALL	C$4209			; RDSLT
        EI	
        POP	BC
        OUT	(98H),A
        INC	HL
        DEC	BC
        LD	A,C
        OR	B
        JR	NZ,J$4C8F
        CALL	C.4F5E
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4CA5:	LD	HL,(GXPOS)
        LD	A,L
        SUB	C
        LD	L,A
        LD	A,H
        SBC	A,B
        LD	H,A
J$4CAE:	RET	NC
        XOR	A
        SUB	L
        LD	L,A
        SBC	A,H
        SUB	L
        LD	H,A
        SCF	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4CB7:	LD	HL,(GYPOS)
        LD	A,L
        SUB	E
        LD	L,A
        LD	A,H
        SBC	A,D
        LD	H,A
        JR	J$4CAE
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4CC2:	PUSH	HL
        LD	HL,(GYPOS)
        EX	DE,HL
        LD	(GYPOS),HL
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4CCC:	CALL	C.4CC2
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4CCF:	PUSH	HL
        PUSH	BC
        LD	HL,(GXPOS)
        EX	(SP),HL
        LD	(GXPOS),HL
        POP	BC
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4CDB:	PUSH	HL
        PUSH	AF
        LD	HL,GRPHED
        XOR	A
        CP	(HL)
        LD	(HL),A
        JR	Z,J$4CF2
        POP	AF
        SUB	40H	; "@"
        CP	20H	; " "
        JR	C,J$4CF0
        ADD	A,40H	; "@"
J$4CEE:	CP	A
        SCF	
J$4CF0:	POP	HL
        RET	
;	-----------------
J$4CF2:	POP	AF
        CP	01H	; 1 
        JR	NZ,J$4CEE
        LD	(HL),A
        POP	HL
        RET	

;	  Subroutine H.CHPU handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$4CFA:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        CALL	C.452A
        JR	NC,J$4D15		; screen 4-8,
        CALL	C.50F4
        POP	AF
        PUSH	AF
        CALL	C.4D81
        CALL	C.509F
        LD	A,(CSRX)
        DEC	A
        LD	(TTYPOS),A
J$4D15:	POP	AF
        POP	BC
        POP	DE
        POP	HL
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.CHPU+4
        LD	HL,0
        ADD	HL,SP
J$4D25:	LD	E,(HL)
        INC	HL
        LD	D,(HL)
        INC	HL
        EX	DE,HL
        OR	A
        SBC	HL,BC
        EX	DE,HL
        JR	NZ,J$4D25
        LD	D,H
        LD	E,L
        DEC	DE
        OR	A
        SBC	HL,SP
        LD	B,H
        LD	C,L
        LD	H,D
        LD	L,E
        PUSH	DE
        LD	DE,10
        ADD	HL,DE
        POP	DE
        EX	DE,HL
        LDDR	
        POP	DE
        POP	DE
        POP	DE
        POP	DE
        POP	DE
        POP	DE
        POP	HL
        POP	BC
        POP	AF
        EI	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4D4E:	EX	DE,HL
        LD	A,C
        OR	A
        LD	A,B
        LD	B,C
        RET	Z
        INC	A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4D56:	CALL	C.4F56
        CALL	C$479C
        CALL	C.4D4E
        LD	C,98H
J$4D61:	INIR	
        DEC	A
        JR	NZ,J$4D61
        EX	DE,HL
        CALL	C.4F5E
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4D6B:	EX	DE,HL
        CALL	C.4F56
        CALL	C$478A
        CALL	C.4D4E
        LD	C,98H
J$4D77:	OTIR	
        DEC	A
        JR	NZ,J$4D77
        EX	DE,HL
        CALL	C.4F5E
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4D81:	CALL	C.4CDB
        RET	NC
        LD	C,A
        JR	NZ,J$4D95
        LD	HL,ESCCNT
        LD	A,(HL)
        AND	A
        JP	NZ,J$4E31
        LD	A,C
        CP	20H	; " "
        JR	C,J$4DB6
J$4D95:	LD	HL,(CSRY)
        CP	7FH
        JP	Z,J$5067
        CALL	C.4EC3
        CALL	C.4F69
        RET	NZ
        XOR	A
        CALL	C$4F35
        LD	H,01H	; 1 
C.4DAA:	CALL	C.4F86
        RET	NZ
        CALL	C.4F8E
        LD	L,01H	; 1 
        JP	C.4FAD

J$4DB6:	LD	HL,C.4DD1-2
        LD	C,12

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4DBB:	INC	HL
        INC	HL
        AND	A
        DEC	C
        RET	M
        CP	(HL)
        INC	HL
        JR	NZ,C.4DBB
        LD	C,(HL)
        INC	HL
        LD	B,(HL)
        LD	HL,(CSRY)
        CALL	C.4DCF
        XOR	A
        RET	

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4DCF:	PUSH	BC
        RET	

C.4DD1:	DEFB	7
        DEFW	C.4221
        DEFB	8
        DEFW	C.4F71
        DEFB	9
        DEFW	C.4F96
        DEFB	10
        DEFW	C.4DAA
        DEFB	11
        DEFW	C.4FA4
        DEFB	12
        DEFW	C.4BAB
        DEFB	13
        DEFW	C.4FA6
        DEFB	27
        DEFW	C.4E2B
        DEFB	28
        DEFW	C.4F80
        DEFB	29
        DEFW	C.4F71
        DEFB	30
        DEFW	C.4F7C
        DEFB	31
        DEFW	C.4F86

C.4DF5:	DEFB	"j"
        DEFW	C.4BAB
        DEFB	"E"
        DEFW	C.4BAB
        DEFB	"K"
        DEFW	C.5072
        DEFB	"J"
        DEFW	C.508F
        DEFB	"l"
        DEFW	C.5070
        DEFB	"L"
        DEFW	C.4FFB
        DEFB	"M"
        DEFW	C.4FAA
        DEFB	"Y"
        DEFW	C.4E28
        DEFB	"A"
        DEFW	C.4F7C
        DEFB	"B"
        DEFW	C.4F86
        DEFB	"C"
        DEFW	C.4F69
        DEFB	"D"
        DEFW	C.4F7A
        DEFB	"H"
        DEFW	C.4C09
        DEFB	"x"
        DEFW	C.4E22
        DEFB	"y"
        DEFW	C.4E25

C.4E22:	LD	A,1
        DEFB	1
C.4E25:	LD	A,2
        DEFB	1
C.4E28:	LD	A,4
        DEFB	1
C.4E2B:	LD	A,0FFH
        LD	(ESCCNT),A
        RET	
;	-----------------
J$4E31:	JP	P,J$4E3F
        LD	(HL),00H
        LD	A,C
        LD	HL,C.4DF5-2
        LD	C,15
        JP	C.4DBB

J$4E3F:	DEC	A
        JR	Z,J$4E60
        DEC	A
        JR	Z,J$4E6A
        DEC	A
        LD	(HL),A
        LD	A,(LINLEN)
        LD	DE,CSRX
        JR	Z,J$4E55
        LD	(HL),03H	; 3 
        CALL	C.4F3C
        DEC	DE
J$4E55:	LD	B,A
        LD	A,C
        SUB	20H	; " "
        CP	B
        INC	A
J$4E5B:	LD	(DE),A
        RET	C
        LD	A,B
        LD	(DE),A
        RET	
;	-----------------
J$4E60:	LD	(HL),A
        LD	A,C
        SUB	34H	; "4"
        JR	Z,J$4E71
        DEC	A
        JR	Z,J$4E78
        RET	
;	-----------------
J$4E6A:	LD	(HL),A
        LD	A,C
        SUB	34H	; "4"
        JR	NZ,J$4E75
        INC	A
J$4E71:	LD	(CSTYLE),A
        RET	
;	-----------------
J$4E75:	DEC	A
        RET	NZ
        INC	A
J$4E78:	LD	(CSRSR),A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4E7C:	PUSH	HL
        LD	C,08H	; 8 
        JR	J$4E8B
;	-----------------
?.4E81:	PUSH	HL
        LD	H,01H	; 1 
        CALL	C.4EF2
        LD	A,(LINLEN)
        LD	C,A
J$4E8B:	LD	B,00H
        LD	DE,LINWRK
        CALL	C$4D56
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4E95:	PUSH	HL
        LD	C,08H	; 8 
        JR	J$4EA4
;	-----------------
?.4E9A:	PUSH	HL
        LD	H,01H	; 1 
        CALL	C.4EF2
        LD	A,(LINLEN)
        LD	C,A
J$4EA4:	LD	B,00H
        EX	DE,HL
        LD	HL,LINWRK
        CALL	C$4D6B
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4EAF:	PUSH	HL
        CALL	C.4EF2
        CALL	C.4F56
        CALL	C.4771
        EX	(SP),HL
        EX	(SP),HL
        IN	A,(98H)
        CALL	C.4F5E
        LD	C,A
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4EC3:	PUSH	HL
        CALL	C.4EF2
        CALL	C.4F56
        CALL	C.477C
        LD	A,C
        OUT	(98H),A
        CALL	C.4F5E
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4ED5:	CALL	C.4F56
        CALL	C.4771
        EX	DE,HL
        LD	C,98H
        INIR	
        JP	C.4F5E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4EE3:	CALL	C.4F56
        EX	DE,HL
        CALL	C.477C
        EX	DE,HL
        LD	C,98H
        OTIR	
        JP	C.4F5E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4EF2:	PUSH	BC
        DEC	H
        DEC	L
        LD	E,H
        LD	H,00H
        LD	D,H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        LD	C,L
        LD	B,H
        ADD	HL,HL
        ADD	HL,HL
        LD	A,(SCRMOD)
        AND	A
        LD	A,(LINLEN)
        JR	Z,J$4F0D
        SBC	A,22H	; """
        JR	J.4F1A
;	-----------------
J$4F0D:	CP	29H	; ")"
        JR	C,J$4F17
        ADD	HL,BC
        ADD	HL,HL
        SBC	A,52H	; "R"
        JR	J.4F1A
;	-----------------
J$4F17:	ADD	HL,BC
        SBC	A,2AH	; "*"
J.4F1A:	ADD	HL,DE
        CPL	
        AND	A
        RRA	
        LD	E,A
        ADD	HL,DE
        EX	DE,HL
        LD	HL,(NAMBAS)
        ADD	HL,DE
        POP	BC
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.4F27:	PUSH	HL
        LD	DE,LINTTB-1
        LD	H,00H
        ADD	HL,DE
        LD	A,(HL)
        EX	DE,HL
        POP	HL
        AND	A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F33:	LD	A,0AFH
C$4F34	EQU	$-1
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4F35:	PUSH	AF
        CALL	C.4F27			; get LINTTB entry
        POP	AF
        LD	(DE),A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F3C:	LD	A,(CNSDFG)
        PUSH	HL
        LD	HL,CRTCNT
        ADD	A,(HL)
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F46:	PUSH	AF
        LD	A,(LOGOPR)
        OR	01H	; 1 
        JR	J.4F64
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F4E:	PUSH	AF
        LD	A,(LOGOPR)
        AND	0FEH
        JR	J.4F64
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F56:	PUSH	AF
        LD	A,(LOGOPR)
        OR	80H
        JR	J.4F64
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F5E:	PUSH	AF
        LD	A,(LOGOPR)
        AND	7FH
J.4F64:	LD	(LOGOPR),A
        POP	AF
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F69:	LD	A,(LINLEN)
        CP	H
        RET	Z
        INC	H
        JR	C.4F8E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F71:	CALL	C.4F7A
        RET	NZ
        LD	A,(LINLEN)
        LD	H,A
        DEFB	011H
C.4F7A:	LD	A,025H
C.4F7C:	DEC	L
        RET	Z
        JR	C.4F8E
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F80:	CALL	C.4F69
        RET	NZ
        LD	H,01H	; 1 
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F86:	CALL	C.4F3C
        CP	L
        RET	Z
        JR	C,J$4F92
        INC	L
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4F8E:	LD	(CSRY),HL
        RET	
;	-----------------
J$4F92:	DEC	L
        XOR	A
        JR	C.4F8E
;	-----------------
C.4F96:	LD	A,20H	; " "
        CALL	C.4D81
        LD	A,(CSRX)
        DEC	A
        AND	07H	; 7 
        JR	NZ,C.4F96
        RET	
;	-----------------
C.4FA4:	LD	L,01H	; 1 
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4FA6:	LD	H,01H	; 1 
        JR	C.4F8E
;	-----------------
C.4FAA:	CALL	C.4FA6
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.4FAD:	CALL	C.4F3C
        SUB	L
        RET	C
        JP	Z,J.504C
        PUSH	HL
        PUSH	AF
        LD	C,A
        LD	B,00H
        CALL	C.4F27			; get LINTTB entry
        LD	L,E
        LD	H,D
        INC	HL
        LDIR	
        LD	HL,FSTPOS
        DEC	(HL)
        POP	AF
        POP	HL
        PUSH	AF
        LD	A,(LINLEN)
        CP	29H	; ")"
        JR	NC,J$4FE1
        POP	AF
J$4FD1:	PUSH	AF
        INC	L
        CALL	C.5119
        DEC	L
        CALL	C.5142
        INC	L
        POP	AF
        DEC	A
        JR	NZ,J$4FD1
        JR	J$4FF8
;	-----------------
J$4FE1:	POP	AF
J$4FE2:	PUSH	AF
        INC	L
        CALL	C.511A
        DEC	L
        CALL	C.5143
        INC	L
        CALL	C.5133
        DEC	L
        CALL	C.515D
        INC	L
        POP	AF
        DEC	A
        JR	NZ,J$4FE2
J$4FF8:	JP	J.504C
;	-----------------
C.4FFB:	CALL	C.4FA6
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$4FFE:	CALL	C.4F3C
        LD	H,A
        SUB	L
        RET	C
        JP	Z,J.504C
        LD	L,H
        PUSH	HL
        PUSH	AF
        LD	C,A
        LD	B,00H
        CALL	C.4F27			; get LINTTB entry
        LD	L,E
        LD	H,D
        PUSH	HL
        DEC	HL
        LDDR	
        POP	HL
        LD	(HL),H
        POP	AF
        POP	HL
        PUSH	AF
        LD	A,(LINLEN)
        CP	29H	; ")"
        JR	NC,J$5033
        POP	AF
J$5023:	PUSH	AF
        DEC	L
        CALL	C.5119
        INC	L
        CALL	C.5142
        DEC	L
        POP	AF
        DEC	A
        JR	NZ,J$5023
        JR	J$504A
;	-----------------
J$5033:	POP	AF
J$5034:	PUSH	AF
        DEC	L
        CALL	C.511A
        INC	L
        CALL	C.5143
        DEC	L
        CALL	C.5133
        INC	L
        CALL	C.515D
        DEC	L
        POP	AF
        DEC	A
        JR	NZ,J$5034
J$504A:	LD	H,01H	; 1 
J.504C:	PUSH	HL
        LD	HL,(CSRY)
        EX	(SP),HL
        LD	(CSRY),HL
        CALL	C$505C
        POP	HL
        LD	(CSRY),HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$505C:	LD	A,1BH
        CALL	C.41FD
        LD	A,6CH	; "l"
        CALL	C.41FD
        RET	
;	-----------------
J$5067:	CALL	C.4F71
        RET	Z
        LD	C,20H	; " "
        JP	C.4EC3
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5070:	LD	H,01H	; 1 
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5072:	CALL	C.4F33
        PUSH	HL
        CALL	C.4EF2
        CALL	C.4F56
        CALL	C.477C
        POP	HL
J$5080:	LD	A,20H	; " "
        OUT	(98H),A
        INC	H
        LD	A,(LINLEN)
        CP	H
        JR	NC,J$5080
        CALL	C.4F5E
        RET	
;	-----------------
C.508F:	PUSH	HL
        CALL	C.5072
        POP	HL
        CALL	C.4F3C
        CP	L
        RET	C
        RET	Z
        LD	H,01H	; 1 
        INC	L
        JR	C.508F
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.509F:	LD	A,(CSRSR)
        AND	A
        RET	Z
        CALL	C.50A8
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.50A8:	CALL	C.452A
        RET	NC			; screen 4-8, quit
        LD	HL,(CSRY)
        PUSH	HL
        CALL	C.4EAF
        LD	(CURSAV),A
        LD	L,A
        LD	H,00H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        EX	DE,HL
        LD	HL,(CGPBAS)
        PUSH	HL
        ADD	HL,DE
        CALL	C$4E7C
        LD	HL,LINWRK+7
        LD	B,08H	; 8 
        LD	A,(CSTYLE)
        AND	A
        JR	Z,J.50D2
        LD	B,03H	; 3 
J.50D2:	LD	A,(HL)
        CPL	
        LD	(HL),A
        DEC	HL
        DJNZ	J.50D2
        POP	HL
        LD	BC,007F8H
        ADD	HL,BC
        CALL	C$4E95
        POP	HL
        LD	C,0FFH
        JP	C.4EC3

;	  Subroutine H.DSPC handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$50E6:	CALL	C.50A8
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.DSPC+4
        JP	J.433B
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.50F4:	LD	A,(CSRSR)
        AND	A
        RET	Z
        CALL	C.50FD
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.50FD:	CALL	C.452A
        RET	NC			; screen 4-8, quit
        LD	HL,(CSRY)
        LD	A,(CURSAV)
        LD	C,A
        JP	C.4EC3

;	  Subroutine H.ERAC handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$510B:	CALL	C.50FD
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.ERAC+4
        JP	J.433B
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5119:	OR	0AFH
C.511A	EQU	$-1
        PUSH	HL
        PUSH	AF
        LD	H,01H	; 1 
        CALL	C.4EF2
        POP	AF
        LD	A,(LINLEN)
        JR	NZ,J$512A
        SUB	28H	; "("
J$512A:	LD	B,A
J$512B:	LD	DE,LINWRK
        CALL	C$4ED5
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5133:	PUSH	HL
        LD	A,(LINLEN)
        SUB	28H	; "("
        INC	A
        LD	H,A
        CALL	C.4EF2
        LD	B,28H	; "("
        JR	J$512B
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5142:	OR	0AFH
C.5143	EQU	$-1
        PUSH	HL
        PUSH	AF
        LD	H,01H	; 1 
        CALL	C.4EF2
        POP	AF
        LD	A,(LINLEN)
        JR	NZ,J$5153
        SUB	28H	; "("
J$5153:	LD	B,A
J$5154:	EX	DE,HL
        LD	HL,LINWRK
        CALL	C$4EE3
        POP	HL
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.515D:	PUSH	HL
        LD	A,(LINLEN)
        SUB	27H	; "'"
        LD	H,A
        CALL	C.4EF2
        LD	B,28H	; "("
        JR	J$5154

;	  Subroutine H.ERAF handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$516B:	XOR	A
        CALL	C.4527
        RET	NC
        PUSH	HL
        LD	HL,(CRTCNT)
        CALL	C.5070
        POP	HL
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.ERAF+4
        JP	J.433B

;	  Subroutine H.DSPF handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$5183:	LD	A,0FFH
        CALL	C.4527
        RET	NC
        PUSH	HL
        LD	A,(CSRY)
        LD	HL,CRTCNT
        CP	(HL)
        LD	A,0AH	; 10 
        JR	NZ,J$5198
        CALL	C.41FD
J$5198:	LD	A,(NEWKEY+6)
        RRC	A
        LD	HL,FNKSTR+0*16
        LD	A,01H	; 1 
        JR	C,J$51A8
        LD	HL,FNKSTR+5*16
        XOR	A
J$51A8:	LD	(FNKSWI),A
        CALL	C.5221
        LD	C,05H	; 5 
        LD	A,(LINLEN)
        CP	29H	; ")"
        JR	NC,J$51E0
        CALL	C.522F
        JR	C,J$51CE
J$51BC:	PUSH	BC
        LD	C,00H
J$51BF:	CALL	C.523D
        DJNZ	J$51BF
        LD	A,10H	; 16 
        SUB	C
        LD	C,A
        ADD	HL,BC
        INC	DE
        POP	BC
        DEC	C
        JR	NZ,J$51BC
J$51CE:	LD	HL,(CRTCNT)
        CALL	C.5142
        POP	HL
J$51D5:	DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.DSPF+4
        JP	J.433B
;	-----------------
J$51E0:	PUSH	AF
        CALL	C.522F
        POP	AF
        SUB	28H	; "("
J$51E7:	PUSH	BC
        LD	C,00H
J$51EA:	EX	AF,AF'
        CALL	C.523D
        EX	AF,AF'
        DEC	A
        CALL	Z,C.5211
        DJNZ	J$51EA
        DEC	A
        JR	NZ,J$51FC
        CALL	C.5211
        DEC	DE
J$51FC:	EX	AF,AF'
        LD	A,10H	; 16 
        SUB	C
        LD	C,A
        ADD	HL,BC
        EX	AF,AF'
        INC	DE
        POP	BC
        DEC	C
        JR	NZ,J$51E7
        LD	HL,(CRTCNT)
        CALL	C.515D
        POP	HL
        JR	J$51D5
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5211:	PUSH	BC
        PUSH	HL
        LD	HL,(CRTCNT)
        CALL	C.5143
        CALL	C.5221
I$521C:	POP	HL
        POP	BC
        LD	A,0FFH
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.5221:	LD	DE,LINWRK
        PUSH	DE
        LD	B,28H	; "("
        LD	A,20H	; " "
J$5229:	LD	(DE),A
        INC	DE
        DJNZ	J$5229
        POP	DE
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.522F:	SUB	04H	; 4 
        RET	C
        LD	B,0FFH
J$5234:	INC	B
        SUB	05H	; 5 
        JR	NC,J$5234
        LD	A,B
        SUB	01H	; 1 
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.523D:	LD	A,(HL)
        INC	HL
        INC	C
        CALL	C.4CDB
        JR	NC,C.523D
        JR	NZ,J$524B
        CP	20H	; " "
        JR	C,J$524C
J$524B:	LD	(DE),A
J$524C:	INC	DE
        RET	

;	  Subroutine H.PINL handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$524E:	CALL	C$525C
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.PINL+4
        JP	J.433B

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$525C:	LD	A,(AUTFLG)
        AND	A
        JR	NZ,C.528C
        LD	L,00H
        JR	J$5294

;	  Subroutine H.QINL handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$5266:	CALL	C$5282
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.QINL+4
        JP	J.433B

;	  Subroutine H.INLI handler
;	     Inputs  ________________________
;	     Outputs ________________________

C$5274:	CALL	C.528C
        DI	
        PUSH	AF
        PUSH	BC
        PUSH	HL
        PUSH	DE
        LD	BC,H.INLI+4
        JP	J.433B

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$5282:	LD	A,"?"
        CALL	C.41FD
        LD	A," "
        CALL	C.41FD

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.528C:	LD	HL,(CSRY)
        DEC	L
        CALL	NZ,C.4F33
        INC	L
J$5294:	LD	(FSTPOS),HL
        XOR	A
        LD	(INTFLG),A
J$529B:	CALL	C$41F7			; chget
        LD	HL,I$52F1-2
        LD	C,11
        CALL	C.4DBB
        PUSH	AF
        CALL	NZ,C.52B3
        POP	AF
        JR	NC,J$529B
        LD	HL,BUFMIN
        RET	Z
        CCF	
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.52B3:	PUSH	AF
C.52B2:	CP	09H	; 9 
        JR	NZ,J$52C7
        POP	AF
J$52B9:	LD	A,20H	; " "
        CALL	C.52B3
        LD	A,(CSRX)
        DEC	A
        AND	07H	; 7 
        JR	NZ,J$52B9
        RET	
;	-----------------
J$52C7:	POP	AF
        LD	HL,INSFLG
        CP	01H	; 1 
        JR	Z,J$52DA
        CP	20H	; " "
        JR	C,J$52DE
        PUSH	AF
        LD	A,(HL)
        AND	A
        CALL	NZ,C$53AC
        POP	AF
J$52DA:	CALL	C.41FD
        RET	

J$52DE:	LD	(HL),00H
        CALL	C.41FD
        DEFB	03EH
J$52E4:	DEFB	03EH

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.52E5:	XOR	A
        PUSH	AF
        CALL	C.50F4
        POP	AF
        LD	(CSTYLE),A
        JP	C.509F

C.52F1:	DEFB	8
        DEFW	C.541D
        DEFB	18
        DEFW	C.539F
        DEFB	27
        DEFW	C.52B2
        DEFB	2
        DEFW	C.54CA
        DEFB	6
        DEFW	C.54B4
        DEFB	14
        DEFW	C.5493
        DEFB	5
        DEFW	C.5475
        DEFB	3
        DEFW	C.537F
        DEFB	13
        DEFW	C.5312
        DEFB	21
        DEFW	C.546A
        DEFB	127
        DEFW	C.540A

C.5312:	CALL	C.552A
        LD	A,(AUTFLG)
        AND	A
        JR	Z,J$531D
        LD	H,01H	; 1 
J$531D:	PUSH	HL
        CALL	C.50F4
        POP	HL
        LD	DE,BUF
        LD	B,0FEH
        DEC	L
J$5328:	INC	L
J$5329:	PUSH	DE
        PUSH	BC
        CALL	C.4EAF
        POP	BC
        POP	DE
        AND	A
        JR	Z,J$5347
        CP	20H	; " "
        JR	NC,J$5342
        DEC	B
        JR	Z,J.5357
        LD	C,A
        LD	A,01H	; 1 
        LD	(DE),A
        INC	DE
        LD	A,C
        ADD	A,40H	; "@"
J$5342:	LD	(DE),A
        INC	DE
        DEC	B
        JR	Z,J.5357
J$5347:	INC	H
        LD	A,(LINLEN)
        CP	H
        JR	NC,J$5329
        PUSH	DE
        CALL	C.4F27			; get LINTTB entry
        POP	DE
        LD	H,01H	; 1 
        JR	Z,J$5328
J.5357:	DEC	DE
        LD	A,(DE)
        CP	20H	; " "
        JR	Z,J.5357
        PUSH	HL
        PUSH	DE
        CALL	C.509F
        POP	DE
        POP	HL
        INC	DE
        XOR	A
        LD	(DE),A
J.5367:	LD	A,0DH	; 13 
        AND	A
J$536A:	PUSH	AF
        CALL	C.4F33
        CALL	C$553E
        LD	A,0AH	; 10 
        CALL	C.41FD
        XOR	A
        LD	(INSFLG),A
        POP	AF
        SCF	
        POP	HL
        RET	
;	-----------------
J$537E:	INC	L
C.537F:	CALL	C.4F27			; get LINTTB entry
        JR	Z,J$537E
        CALL	C.52E5			; change to block cursor
        XOR	A
        LD	(BUF+0),A
        LD	H,01H	; 1 
        PUSH	HL
        CALL	GICINI
        CALL	C$5555			; excute ON STOP GOSUB valid ?
        POP	HL
        JR	C,J.5367		; yep,
        LD	A,(BASROM)
        AND	A			; running BASIC ROM program ?
        JR	NZ,J.5367		; yep,
        JR	J$536A
;	-----------------
C.539F:	LD	HL,INSFLG
        LD	A,(HL)
        XOR	0FFH
        LD	(HL),A
        JP	Z,C.52E5		; change to block cursor
        JP	J$52E4			; change to insert cursor
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$53AC:	CALL	C.50F4
        LD	HL,(CSRY)
        LD	C,20H	; " "
J$53B4:	PUSH	HL
J$53B5:	PUSH	BC
        CALL	C.4EAF
        POP	DE
        PUSH	BC
        LD	C,E
        CALL	C.4EC3
        POP	BC
        LD	A,(LINLEN)
        INC	H
        CP	H
        LD	A,D
        JR	NC,J$53B5
        POP	HL
        CALL	C.4F27			; get LINTTB entry
        JR	Z,J$5405
        LD	A,C
        CP	20H	; " "
        PUSH	AF
        JR	NZ,J.53DE
        LD	A,(LINLEN)
        CP	H
        JR	Z,J.53DE
        POP	AF
        JP	C.509F
;	-----------------
J.53DE:	CALL	C$4F34
        INC	L
        PUSH	BC
        PUSH	HL
        CALL	C.4F3C
        CP	L
        JR	C,J$53EF
        CALL	C$4FFE
        JR	J$53FE
;	-----------------
J$53EF:	LD	HL,CSRY
        DEC	(HL)
        JR	NZ,J$53F6
        INC	(HL)
J$53F6:	LD	L,01H	; 1 
        CALL	C.4FAD
        POP	HL
        DEC	L
        PUSH	HL
J$53FE:	POP	HL
        POP	BC
        POP	AF
        JP	Z,C.509F
        DEC	L
J$5405:	INC	L
        LD	H,01H	; 1 
        JR	J$53B4
;	-----------------
C.540A:	LD	A,(LINLEN)
        CP	H
        JR	NZ,J$5415
        CALL	C.4F27			; get LINTTB entry
        JR	NZ,J.5451
J$5415:	LD	A,1CH
        CALL	C.41FD
        LD	HL,(CSRY)
C.541D:	PUSH	HL
        CALL	C.50F4
        POP	HL
        DEC	H
        JP	NZ,J$5436
        INC	H
        PUSH	HL
        DEC	L
        JR	Z,J.5435
        LD	A,(LINLEN)
        LD	H,A
        CALL	C.4F27			; get LINTTB entry
        JR	NZ,J.5435
        EX	(SP),HL
J.5435:	POP	HL
J$5436:	LD	(CSRY),HL
J$5439:	LD	A,(LINLEN)
        CP	H
        JR	Z,J.5451
        INC	H
J$5440:	CALL	C.4EAF
        DEC	H
        CALL	C.4EC3
        INC	H
        INC	H
        LD	A,(LINLEN)
        INC	A
        CP	H
        JR	NZ,J$5440
        DEC	H
J.5451:	LD	C,20H	; " "
        CALL	C.4EC3
        CALL	C.4F27			; get LINTTB entry
        JP	NZ,C.509F
        PUSH	HL
        INC	L
        LD	H,01H	; 1 
        CALL	C.4EAF
        EX	(SP),HL
        CALL	C.4EC3
        POP	HL
        JR	J$5439
;	-----------------
C.546A:	CALL	C.50F4
        CALL	C.552A
        LD	(CSRY),HL
        JR	J.547A
;	-----------------
C.5475:	PUSH	HL
        CALL	C.50F4
        POP	HL
J.547A:	CALL	C.4F27			; get LINTTB entry
        PUSH	AF
        CALL	C.5072
        POP	AF
        JR	NZ,J.5489
        LD	H,01H	; 1 
        INC	L
        JR	J.547A
;	-----------------
J.5489:	CALL	C.509F
        XOR	A
        LD	(INSFLG),A
        JP	C.52E5			; change to block cursor
;	-----------------
C.5493:	CALL	C.50F4
        LD	HL,(CSRY)
        DEC	L
J$549A:	INC	L
        CALL	C.4F27			; get LINTTB entry
        JR	Z,J$549A
        LD	A,(LINLEN)
        LD	H,A
        INC	H
J$54A5:	DEC	H
        JR	Z,J$54AF
        CALL	C.4EAF
        CP	20H	; " "
        JR	Z,J$54A5
J$54AF:	CALL	C.4F80
        JR	J.5489
;	-----------------
C.54B4:	CALL	C.50F4
        CALL	C.54F0
J$54BA:	CALL	C.54E0
        JR	Z,J.5489
        JR	C,J$54BA
J$54C1:	CALL	C.54E0
        JR	Z,J.5489
        JR	NC,J$54C1
        JR	J.5489
;	-----------------
C.54CA:	CALL	C.50F4
J$54CD:	CALL	C.54F0
        JR	Z,J.5489
        JR	NC,J$54CD
J$54D4:	CALL	C.54F0
        JR	Z,J.5489
        JR	C,J$54D4
        CALL	C.4F80
        JR	J.5489
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.54E0:	LD	HL,(CSRY)
        CALL	C.4F80
        CALL	C.4F3C
        LD	E,A
        LD	A,(LINLEN)
        LD	D,A
        JR	J$54F9
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.54F0:	LD	HL,(CSRY)
        CALL	C.4F71
        LD	DE,00101H
J$54F9:	LD	HL,(CSRY)
        CALL	C.4242			; compare
        RET	Z
        LD	DE,I$5526
        PUSH	DE
        CALL	C.4EAF
        CP	30H	; "0"
        CCF	
        RET	NC
        CP	3AH	; ":"
        RET	C
        CP	41H	; "A"
        CCF	
        RET	NC
        CP	5BH	; "["
        RET	C
        CP	61H	; "a"
        CCF	
        RET	NC
        CP	7BH	; "{"
        RET	C
        CP	86H
        CCF	
        RET	NC
        CP	0A0H
        RET	C
        CP	0A6H
        CCF	
I$5526:	LD	A,00H
        INC	A
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C.552A:	DEC	L
        JR	Z,J$5532
        CALL	C.4F27			; get LINTTB entry
        JR	Z,C.552A
J$5532:	INC	L
        LD	A,(FSTPOS)
        CP	L
        LD	H,01H	; 1 
        RET	NZ
        LD	HL,(FSTPOS)
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C$553E:	LD	A,1BH
        CALL	C.41FD
        LD	A,59H	; "Y"
        CALL	C.41FD
        LD	A,L
        ADD	A,1FH
        CALL	C.41FD
        LD	A,H
        ADD	A,1FH
        CALL	C.41FD
        RET	
;	-----------------
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$5555:	LD	A,(TRPTBL+01EH)
        RRCA	
        RET	NC
        LD	HL,(TRPTBL+01EH)
        LD	A,H
        OR	L
        RET	Z
        LD	HL,(CURLIN)
        INC	HL
        LD	A,H
        OR	L
        RET	Z
        SCF	
        RET	

        END
