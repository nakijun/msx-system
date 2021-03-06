; Diskdriver Digital Design DDX 3.0
; FDC	WD279x

; Source re-created by Z80DIS 2.2
; Z80DIS was written by Kenneth Gielow, Palo Alto, CA

; Code Copyrighted by Digital Design and maybe others
; Source comments by Arjen Zeilemaker

; Sourcecode supplied for STUDY ONLY
; Recreation NOT permitted without authorisation of the copyrightholders

MYSIZE	EQU	10

J$4022	EQU	4022H	; J----
J$41C8	EQU	41C8H	; J----
J$5AE2	EQU	5AE2H	; J----
D$5C93	EQU	5C93H	; --S--
C.5F81	EQU	5F81H	; -C---
D.6205	EQU	6205H	; --S--
D.7114	EQU	7114H	; --S--
I.8348	EQU	8348H	; ----I

I7405:	DEFB	0F8h		; Media F8
        DEFW	512		; 80 Tracks
        DEFB	0Fh		; 9 sectors
        DEFB	04h		; 1 side
        DEFB	01h		; 3.5" 360 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	12
        DEFW	355
        DEFB	2
        DEFW	5

DEFDPB	equ	$-1

        DEFB	0F9h		; Media F9
        DEFW	512		; 80 Tracks
        DEFB	0Fh		; 9 sectors
        DEFB	04h		; 2 sides
        DEFB	01h		; 3.5" 720 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	14
        DEFW	714
        DEFB	3
        DEFW	7

        DEFB	0FAh		; Media FA
        DEFW	512		; 80 Tracks
        DEFB	0Fh		; 8 sectors
        DEFB	04h		; 1 side
        DEFB	01h		; 3.5" 320 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	10
        DEFW	316
        DEFB	1
        DEFW	3

        DEFB	0FBh		; Media FB
        DEFW	512		; 80 Tracks
        DEFB	0Fh		; 8 sectors
        DEFB	04h		; 2 sides
        DEFB	01h		; 3.5" 640 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	12
        DEFW	635
        DEFB	2
        DEFW	5

        DEFB	0FCh		; Media FC
        DEFW	512		; 40 Tracks
        DEFB	0Fh		; 9 sectors
        DEFB	04h		; 1 side
        DEFB	00h		; 5.25" 180 Kb
        DEFB	01h
        DEFW	1
        DEFB	2
        DEFB	64
        DEFW	9
        DEFW	352
        DEFB	2
        DEFW	5

        DEFB	0FDh		; Media FD
        DEFW	512		; 40 Tracks
        DEFB	0Fh		; 9 sectors
        DEFB	04h		; 2 sides
        DEFB	01h		; 5.25" 360 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	12
        DEFW	355
        DEFB	2
        DEFW	5

        DEFB	0FEh		; Media FE
        DEFW	512		; 40 Tracks
        DEFB	0Fh		; 8 sectors
        DEFB	04h		; 1 side
        DEFB	00h		; 5.25" 160 Kb
        DEFB	01h
        DEFW	1
        DEFB	2
        DEFB	64
        DEFW	7
        DEFW	314
        DEFB	1
        DEFW	3

        DEFB	0FFh		; Media FF
        DEFW	512		; 40 Tracks
        DEFB	0Fh		; 8 sectors
        DEFB	04h		; 2 sides
        DEFB	01h		; 5.25" 320 Kb
        DEFB	02h
        DEFW	1
        DEFB	2
        DEFB	112
        DEFW	10
        DEFW	316
        DEFB	1
        DEFW	3

DSKIO:
        LD	(D.6205),A		; debug ??
        CALL	C749E
        JP	J79BF

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C749E:	EI
        PUSH	AF
        JP	NC,J74FA
        PUSH	AF
        PUSH	BC
        PUSH	DE
        PUSH	HL
        CALL	C74EA
        POP	HL
        POP	DE
        POP	BC
        JR	C,J74B5
        LD	A,(RAWFLG)
        AND	A			; verify after write ?
        JR	NZ,J74DC		; yep,
J74B5:	POP	DE
J74B6:	POP	DE
        PUSH	AF
        LD	C,60
        JR	NC,J74BE
        LD	C,0
J74BE:	LD	A,0D0H
        OUT	(0D0H),A
        EX	(SP),HL
        EX	(SP),HL
        EX	(SP),HL
        EX	(SP),HL
        IN	A,(0D3H)
        IN	A,(0D0H)
        LD	(IX),120
        LD	A,D
        AND	A
        JR	NZ,J74D7
        LD	(IX+1),C
        POP	AF
        RET

J74D7:	LD	(IX+2),C
        POP	AF
        RET

J74DC:	POP	AF
        SET	0,(IX+7)		; set verify flag
        CALL	C7500			; read/verify sector
        RES	0,(IX+7)		; reset verify flag
        JR	J74B6

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C74EA:	CALL	C7510
        RET	C
        SET	0,(IX+8)
        LD	A,H
        AND	A
        JP	M,C7819		; read/verify sector
        JP	J775F

J74FA:	CALL	C7500			; read/verify sector
        JP	J74B6

;	  Subroutine read/verify sector
;	     Inputs  ________________________
;	     Outputs ________________________

C7500:	CALL	C7510
        RET	C
        RES	0,(IX+8)
        LD	A,H
        AND	A
        JP	M,C7819		; read/verify sector
        JP	J775F

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C7510:	PUSH	AF
        PUSH	BC
        PUSH	HL
        CALL	GETWRK
        POP	HL
        POP	BC
        POP	AF
        CP	02H	; 2
        JR	C,J7521
J751D:	LD	A,0CH	; 12
        SCF
        RET

J7521:	PUSH	AF
        LD	A,C
        CP	0F8H
        JR	NC,J752A
        POP	AF
        JR	J751D

J752A:	POP	AF
        PUSH	IX
        PUSH	BC
        PUSH	DE
        PUSH	AF
        LD	A,(IX+9)
        DEC	A
        JR	NZ,J754D
        POP	AF
        LD	B,00H
        PUSH	BC
        CP	(IX+6)
        JR	Z,J754D
        LD	(IX+6),A
        XOR	A
        OUT	(0D4H),A
        LD	(IX),A
        PUSH	HL
        CALL	PROMPT
        POP	HL
J754D:	POP	AF
        POP	DE
        POP	BC
        POP	IX
        PUSH	HL
        PUSH	AF
        PUSH	BC
        CALL	C79AC			; wait for FDC ready
        BIT	1,C
        LD	C,E
        LD	B,D
        LD	DE,8
        JR	NZ,J7562
        INC	DE
J7562:	CALL	DIV16
        LD	A,L
        INC	A
        OUT	(0D2H),A
        LD	L,C
        POP	BC
        POP	AF
        LD	H,A
        ADD	A,21H	; "!"
        BIT	0,C
        JR	Z,J7579
        SRL	L
        JR	NC,J7579
        OR	10H	; 16
J7579:	LD	D,A
        LD	A,C
        RRCA
        RRCA
        AND	0C0H
        OR	D
        LD	D,A
        DI
        OUT	(0D4H),A
        LD	A,(IX)
        AND	A
        LD	(IX),0FFH
        EI
        JR	NZ,J7599
        PUSH	HL
        LD	HL,0
J7593:	DEC	HL
        LD	A,L
        OR	H
        JR	NZ,J7593
        POP	HL
J7599:	LD	C,L
        LD	A,(IX+3)
        CP	H
        JR	Z,J75BB
        XOR	01H	; 1
        LD	(IX+3),A
        IN	A,(0D1H)
        JR	Z,J75B1
        LD	(IX+4),A
        LD	A,(IX+5)
        JR	J75B7

J75B1:	LD	(IX+5),A
        LD	A,(IX+4)
J75B7:	OUT	(0D1H),A
        EX	(SP),HL
        EX	(SP),HL
J75BB:	IN	A,(0D1H)
        CP	C
        CALL	NZ,C798E
        POP	HL
        RET

INIHRD:
C75C3:	NOP
        NOP
        NOP				; ???
        LD	(D.6205),A		; debug ??
        LD	A,0D0H
        OUT	(0D0H),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,21H	; "!"
        CALL	C75E5
        LD	A,22H	; """
        CALL	C75E5
        XOR	A
        OUT	(0D4H),A
        LD	(D.7114),A		; debug ??
        RET

MTOFF:
        XOR	A
        LD	(D$5C93),A		; ???
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C75E5:	OUT	(0D4H),A
        CALL	C79AC			; wait for FDC ready
        LD	A,01H	; 1
        OUT	(0D0H),A
        EX	(SP),HL
        EX	(SP),HL
        LD	HL,0
J75F3:	IN	A,(0D0H)
        CPL
        RRA
        RET	C
        DEC	HL
        LD	A,L
        OR	H
        JR	NZ,J75F3
        RET

DRIVES:
        LD	(D.6205),A		; debug ??
        PUSH	BC
        PUSH	AF
        CALL	GETWRK
        LD	A,22H	; """
        CALL	C75E5
        JR	C,J760F
        INC	L
        DEFB	0CAH
J760F:	LD	L,2
        LD	(IX+9),L
        XOR	A
        OUT	(0D4H),A
        POP	AF
        JR	Z,J761C
        LD	L,02H	; 2
J761C:	POP	BC
        LD	(D.7114),A		; debug ??
        RET

INIENV:
        LD	A,0
        LD	(RAWFLG),A		; verify after write off
        CALL	GETWRK
        XOR	A
        LD	B,09H	; 9
J762C:	LD	(HL),A
        INC	HL
        DJNZ	J762C
        LD	HL,I7636
        JP	SETINT

I7636:	PUSH	AF
        CALL	GETWRK
        LD	A,(HL)
        AND	A
        JR	Z,J7649
        CP	0FFH
        JR	Z,J7649
        DEC	A
        LD	(HL),A
        JR	NZ,J7649
        JP	J$41C8			; ?? non standard code ??

J7649:	INC	HL
        LD	A,(HL)
        AND	A
        JR	Z,J764F
        DEC	(HL)
J764F:	INC	HL
        LD	A,(HL)
        AND	A
        JR	Z,J7655
        DEC	(HL)
J7655:	POP	AF
        JP	PRVINT

DSKCHG:
        LD	(D.6205),A		; debug ??
        CALL	C7663
        JP	J79BF

?7662:	RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7663:	EI
        PUSH	HL
        PUSH	BC
        PUSH	AF
        CALL	GETWRK
        POP	AF
        POP	BC
        POP	HL
        AND	A
        LD	B,(IX+2)
        JR	NZ,J7676
        LD	B,(IX+1)
J7676:	INC	B
        DEC	B
        LD	B,01H	; 1
        RET	NZ
        PUSH	BC
        PUSH	HL
        LD	DE,1
        LD	HL,(_SECBUF)
        AND	A
        CALL	C749E
        JR	C,J76A0
        LD	HL,(_SECBUF)
        LD	B,(HL)
        POP	HL
        PUSH	BC
        CALL	C76A3
        LD	A,0CH	; 12
        JR	C,J76A0
        POP	AF
        POP	BC
        CP	C
        SCF
        CCF
        LD	B,0FFH
        RET	NZ
        INC	B
        RET

J76A0:	POP	DE
        POP	DE
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

GETDPB:
C76A3:	EI
        EX	DE,HL
        INC	DE
        LD	A,B
        SUB	0F8H
        RET	C
        LD	L,A
        LD	H,00H
        ADD	HL,HL
        LD	C,L
        LD	B,H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,BC
        LD	BC,I7405
        ADD	HL,BC
        LD	BC,18
        LDIR
        RET

CHOICE:
        LD	HL,I76C2
        RET

I76C2:	DEFB	13,10
        DEFB	"1) 5",0ACH," face simples",13,10
        DEFB	"2) 5",0ACH," face dupla",13,10
        DEFB	"3) 3",0ABH," face simples",13,10
        DEFB	"4) 3",0ABH," face dupla",13,10
        DEFB	13,10
        DEFB	0

OEMSTA:
C7714:	PUSH	HL
        LD	DE,I774A
        CALL	C7734
        LD	E,1
        JR	Z,J7729
        LD	DE,I7754
        CALL	C7734
        LD	E,0
        JR	NZ,J7731
J7729:	LD	C,2EH
        CALL	BDOS
        XOR	A
        POP	HL
        RET

J7731:	POP	HL
        SCF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7734:	LD	HL,PROCNM
J7735	EQU	$-2
J7737:	LD	A,(DE)
        AND	A
        JR	Z,J7741
        CP	(HL)
        RET	NZ
        INC	HL
        INC	DE
        JR	J7737

J7741:	LD	A,(HL)
        AND	A
J7743:	RET	Z
        INC	HL
J7745:	CP	20H	; " "
        JR	Z,J7741
J7748	EQU	$-1
        RET

I774A:	DEFB	"VERIFY ON"
        DEFB	0

I7754:	DEFB	"VERIFY OFF"
        DEFB	0

J775F:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	IX
        LD	HL,I77EE
        LD	DE,(_SECBUF)
J776B:	LD	BC,01CBH
J776E:	LDIR
        LD	HL,(_SECBUF)
        OR	A
        LD	DE,I77EE
        SBC	HL,DE
        EX	DE,HL
        LD	IX,I77A6
J777E:	LD	L,(IX+0)
        LD	H,(IX+1)
        INC	IX
        INC	IX
        LD	A,H
        OR	L
        JR	Z,J779D
        ADD	HL,DE
        INC	HL
        LD	C,(HL)
        INC	HL
        LD	B,(HL)
        PUSH	HL
        LD	H,B
        LD	L,C
        ADD	HL,DE
        LD	B,H
        LD	C,L
        POP	HL
        LD	(HL),B
        DEC	HL
        LD	(HL),C
        JR	J777E

J779D:	POP	IX
        POP	BC
        POP	DE
J77A1:	LD	HL,(_SECBUF)
        EX	(SP),HL
        RET

I77A6:	DEFW	77F4H
        DEFW	7804H
        DEFW	781FH
        DEFW	7822H
        DEFW	7838H
        DEFW	784EH
        DEFW	7855H
        DEFW	785AH
        DEFW	7869H
        DEFW	7870H
        DEFW	787AH
        DEFW	7881H
        DEFW	7886H
        DEFW	788AH
        DEFW	7893H
        DEFW	78B6H
        DEFW	78B9H
        DEFW	78BCH
        DEFW	78BFH
        DEFW	78C3H
        DEFW	78C8H
        DEFW	78D0H
        DEFW	78DDH
        DEFW	78F1H
        DEFW	7901H
        DEFW	791EH
        DEFW	7921H
        DEFW	7924H
        DEFW	792CH
        DEFW	7951H
        DEFW	797DH
        DEFW	798BH
        DEFW	7999H
        DEFW	79B2H
        DEFW	0

I77EE:	PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	GETSLT
        LD	(D$780C+1),A
        EI
        LD	A,(RAMAD1)
        LD	H,40H	; "@"
        CALL	ENASLT
        EI
        POP	BC
        POP	DE
        POP	HL
        CALL	C7819			; read/verify sector
        PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        EI
D$780C:	LD	A,00H
        LD	H,40H
        CALL	ENASLT
        EI
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        RET

;	  Subroutine read/verify sector
;	     Inputs  ________________________
;	     Outputs ________________________

C7819:	LD	E,11
        BIT	0,(IX+8)
        JP	NZ,J78DD
J7822:	CALL	C79AC			; wait for FDC ready
        LD	A,80H
        BIT	6,D
        JR	Z,J7833
        OR	02H	; 2
        BIT	4,D
        JR	Z,J7833
        OR	08H	; 8
J7833:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	C,0D3H
        LD	DE,I78A8
        PUSH	DE
        CALL	DISINT
        DI
        OUT	(0D0H),A
        LD	DE,0
        BIT	0,(IX+7)		; verify ?
        JR	NZ,J7877		; yep,
J784B:	IN	A,(0D4H)
        ADD	A,A
        JP	P,J7873
        RET	C
        IN	A,(0D4H)
        ADD	A,A
        JP	P,J7873
        RET	C
        DEC	E
        JP	NZ,J784B
        DEC	D
        JP	NZ,J784B
J7861:	POP	BC
        POP	BC
        POP	DE
        POP	HL
        EI
        CALL	ENAINT
        JP	J794D

J786C:	IN	A,(0D4H)
        ADD	A,A
        RET	C
        JP	M,J786C
J7873:	INI
        JR	J786C

J7877:	IN	A,(0D4H)
        ADD	A,A
        JP	P,J7896
        RET	C
        IN	A,(0D4H)
        ADD	A,A
        JP	P,J7896
        RET	C
        DEC	E
        JP	NZ,J7877
        DEC	D
        JP	NZ,J7877
        JR	J7861

J788F:	IN	A,(0D4H)
        ADD	A,A
        RET	C
        JP	M,J788F
J7896:	IN	A,(0D3H)
        CPI
        JR	Z,J788F
        POP	BC
        POP	BC
        POP	DE
        POP	HL
        EI
        CALL	ENAINT
        LD	A,08H	; 8
        JR	J78C2

I78A8:	POP	BC
        POP	DE
        POP	HL
        EI
        CALL	ENAINT
        IN	A,(0D0H)
        AND	9CH
        JR	NZ,J78BF
        DEC	B
        JP	Z,J7950
        CALL	C7951
        JP	C7819			; read/verify sector

J78BF:	JP	M,J794D
J78C2:	PUSH	AF
        CALL	C7988
        POP	AF
        DEC	E
        JP	NZ,J7822
        LD	E,A
        BIT	4,E
        LD	A,08H	; 8
        JP	NZ,J794F
        BIT	3,E
        LD	A,04H	; 4
        JR	NZ,J794F
        LD	A,0CH	; 12
        JR	J794F

J78DD:	CALL	C79AC			; wait for FDC ready
        LD	A,0A0H
        BIT	6,D
        JR	Z,J78EE
        OR	02H	; 2
        BIT	4,D
        JR	Z,J78EE
        OR	08H	; 8
J78EE:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	DE,I7908
        PUSH	DE
        CALL	DISINT
        DI
        OUT	(0D0H),A
        LD	C,0D3H
J78FD:	IN	A,(0D4H)
        ADD	A,A
        RET	C
        JP	M,J78FD
        OUTI
        JR	J78FD

I7908:	LD	B,6AH	; "j"
J790A:	EX	(SP),HL
        EX	(SP),HL
        DJNZ	J790A
        POP	BC
        POP	DE
        POP	HL
        EI
        CALL	ENAINT
        IN	A,(0D0H)
        AND	0FCH
        JR	NZ,J7924
        DEC	B
        JR	Z,J7950
        CALL	C7951
        JP	C7819			; read/verify sector

J7924:	JP	M,J794D
        BIT	6,A
        JR	NZ,J794A
        PUSH	AF
        CALL	C7988
        POP	AF
        DEC	E
        JR	NZ,J78DD
        LD	E,A
        BIT	5,E
        LD	A,0AH	; 10
        JR	NZ,J794F
        BIT	4,E
        LD	A,08H	; 8
        JR	NZ,J794F
        BIT	3,E
        LD	A,04H	; 4
        JR	NZ,J794F
        LD	A,0CH	; 12
        JR	J794F

J794A:	XOR	A
        JR	J794F

J794D:	LD	A,02H	; 2
J794F:	SCF
J7950:	RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C7951:	CALL	C79AC			; wait for FDC ready
        INC	H
        INC	H
        IN	A,(0D2H)
        INC	A
        OUT	(0D2H),A
        BIT	7,D
        JR	NZ,J7962
        CP	0AH	; 10
        RET	C
J7962:	CP	09H	; 9
        RET	C
        LD	A,01H	; 1
        OUT	(0D2H),A
        BIT	6,D
        JR	Z,J7977
        BIT	4,D
        JR	NZ,J7977
        SET	4,D
        LD	A,D
        OUT	(0D4H),A
        RET

J7977:	RES	4,D
        LD	A,D
        OUT	(0D4H),A
        INC	C
        CALL	C79AC			; wait for FDC ready
        LD	A,50H	; "P"
        OUT	(0D0H),A
        EX	(SP),HL
        EX	(SP),HL
        JR	J7999

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7988:	BIT	0,E
        RET	NZ
        CALL	C79B2
;
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C798E:	LD	A,C
        OUT	(0D3H),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,10H	; 16
J7995:	OUT	(0D0H),A
        EX	(SP),HL
        EX	(SP),HL
J7999:	CALL	C79AC			; wait for FDC ready
        BIT	0,(IX+8)
        RET	Z
        PUSH	BC
        LD	BC,0DFCH
J79A5:	DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J79A5
        POP	BC
        RET

;	  Subroutine wait for FDC ready
;	     Inputs  ________________________
;	     Outputs ________________________

C79AC:	IN	A,(0D0H)
        RRA
        JR	C,C79AC
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C79B2:	CALL	C79AC			; wait for FDC ready
        LD	A,01H	; 1
        JR	J7995

DSKFMT:
        LD	(D.6205),A		; debug ??
        CALL	C79CF
J79BF:	PUSH	HL
        PUSH	AF
        LD	HL,(YFB21+2)
        LD	A,H
        OR	L
        JP	Z,J79CC
        LD	(D.7114),A		; debug ??
J79CC:	POP	AF
        POP	HL
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C79CF:	PUSH	HL
        POP	IY
        DEC	A
        LD	E,A
        LD	A,03H	; 3
        CP	E
        LD	A,0CH	; 12
        RET	C
        LD	A,B
        CP	18H
        LD	A,0EH	; 14
        RET	C
        LD	A,D
        AND	01H	; 1
        LD	(IY+9),A
        PUSH	HL
        LD	BC,32
        ADD	HL,BC
        LD	(IY+5),L
        LD	(IY+6),H
        LD	D,00H
        LD	B,05H	; 5
        LD	HL,I7B2D
J79F8:	ADD	HL,DE
        DJNZ	J79F8
        POP	DE
        LD	BC,5
        LDIR
        CALL	C75C3
        LD	(D.6205),A		; debug ??
        PUSH	HL
        CALL	GETWRK
        POP	HL
        XOR	A
        LD	(IX+4),A
        LD	(IX+5),A
        LD	A,(IY+9)
        LD	DE,0
        LD	BC,00FFH
        CALL	C7510
        RET	C
        CALL	DISINT
        DI
        LD	E,02H	; 2
        CALL	C7C8E
        RET	C
        LD	E,00H
        CALL	C7C8E
        RET	C
        LD	C,(IY+2)
        LD	B,09H	; 9
        LD	DE,0
J7A38:	PUSH	DE
        PUSH	BC
        LD	A,(IY+9)
        CALL	C7510
        LD	A,06H	; 6
        JR	C,J7A52
        LD	(IY+7),D
        LD	L,(IY+5)
        LD	H,(IY+6)
        PUSH	HL
        CALL	C7BB9
        POP	HL
J7A52:	POP	BC
        POP	DE
        JR	NC,J7A60
        PUSH	AF
        LD	A,(IY+9)
        LD	D,A
        POP	AF
        PUSH	DE
        JP	J74B6

J7A60:	PUSH	DE
        PUSH	BC
        LD	A,D
        OR	E
        JR	Z,J7A71
        PUSH	HL
        LD	HL,27
        SBC	HL,DE
        POP	HL
        JR	C,J7A71
        DEC	DE
        INC	B
J7A71:	XOR	A
        LD	A,(IY+9)
        CALL	C749E
        LD	A,04H	; 4
        POP	BC
        POP	DE
        RET	C
        PUSH	HL
        LD	HL,0156H
        BIT	2,C
        JR	NZ,J7A88
        LD	HL,02BEH
J7A88:	BIT	0,C
        JR	Z,J7A8D
        ADD	HL,HL
J7A8D:	AND	A
        SBC	HL,DE
        POP	HL
        JR	NC,J7AB4
        PUSH	DE
        PUSH	BC
        PUSH	HL
        LD	B,01H	; 1
        LD	HL,7
        BIT	0,C
        JR	Z,J7AA2
        LD	HL,16
J7AA2:	AND	A
        EX	DE,HL
        SBC	HL,DE
        EX	DE,HL
        POP	HL
        XOR	A
        LD	A,(IY+9)
        CALL	C749E
        LD	A,04H	; 4
        POP	BC
        POP	DE
        RET	C
J7AB4:	LD	H,00H
        LD	L,B
        ADD	HL,DE
        EX	DE,HL
        LD	A,(IY+4)
        SUB	D
        JP	NZ,J7A38
        LD	A,(IY+3)
        SUB	E
        JP	NZ,J7A38
        LD	L,(IY+5)
        LD	H,(IY+6)
        PUSH	HL
        LD	BC,12*512
J7AD1:	LD	(HL),00H
        INC	HL
        DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J7AD1
        LD	L,(IY)
        LD	H,(IY+1)
        POP	DE
        PUSH	DE
        LD	BC,30
        LDIR
        LD	HL,I7E88
        LD	BC,00B0H
        LDIR
        POP	HL
        PUSH	HL
        LD	A,(IY+2)
        INC	H
        INC	H
        LD	(HL),A
        INC	HL
        DEC	(HL)
        INC	HL
        DEC	(HL)
        INC	H
        INC	H
        INC	H
        INC	H
        CP	0F9H
        JR	NZ,J7B04
        INC	H
        INC	H
J7B04:	DEC	(HL)
        DEC	HL
        DEC	(HL)
        DEC	HL
        LD	(HL),A
        POP	HL
        PUSH	HL
        LD	B,0CH	; 12
        LD	C,A
        LD	A,(IY+9)
        LD	DE,0
        SCF
        CALL	C749E
        POP	HL
        RET	C
        LD	BC,7*512
        ADD	HL,BC
        LD	B,02H	; 2
        LD	C,(IY+2)
        LD	DE,12
        LD	A,(IY+9)
        SCF
        JP	C749E

I7B2D:	DEFW	I7B41
        DEFB	0FCH
        DEFW	0168H

        DEFW	I7B5F
        DEFB	0FDH
        DEFW	02D0H

        DEFW	I7B7D
        DEFB	0F8H
        DEFW	02D0H

        DEFW	I7B9B
        DEFB	0F9H
        DEFW	05A0H

I7B41:	DEFB	0EBH,0FEH,090H
        DEFB	"MSX-01  "
        DEFW	512
        DEFB	1
        DEFW	1
        DEFB	2
        DEFW	64
        DEFW	0168H
        DEFB	0FCH
        DEFW	2
        DEFW	9
        DEFW	1
        DEFW	0

I7B5F:	DEFB	0EBH,0FEH,090H
        DEFB	"MSX-02  "
        DEFW	512
        DEFB	2
        DEFW	1
        DEFB	2
        DEFW	112
        DEFW	02D0H
        DEFB	0FDH
        DEFW	2
        DEFW	9
        DEFW	2
        DEFW	0

I7B7D:	DEFB	0EBH,0FEH,090H
        DEFB	"MSX-03  "
        DEFW	512
        DEFB	2
        DEFW	1
        DEFB	2
        DEFW	112
        DEFW	02D0H
        DEFB	0F8H
        DEFW	2
        DEFW	9
        DEFW	1
        DEFW	0

I7B9B:	DEFB	0EBH,0FEH,090H
        DEFB	"MSX-04  "
        DEFW	512
        DEFB	2
        DEFW	1
        DEFB	2
        DEFW	112
        DEFW	05A0H
        DEFB	0F9H
        DEFW	3
        DEFW	9
        DEFW	2
        DEFW	0

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C7BB9:	LD	D,01H	; 1
        LD	A,4EH	; "N"
        LD	B,50H	; "P"
        CALL	C7CA3
        CALL	C7CA0
        LD	A,0F6H
J7BC6	EQU	$-1
        LD	B,03H	; 3
        CALL	C7CA3
        LD	(HL),0FCH
        INC	HL
        LD	A,4EH	; "N"
        LD	B,32H	; "2"
        CALL	C7CA3
J7BD6:	CALL	C7CA0
J7BD8	EQU	$-1
        LD	A,0F5H
        LD	B,03H	; 3
        CALL	C7CA3
        LD	(HL),0FEH
        INC	HL
        CALL	C79AC			; wait for FDC ready
        IN	A,(0D1H)
        LD	(HL),A
        INC	HL
        LD	A,(IY+7)
        AND	10H	; 16
        RRCA
        RRCA
        RRCA
        RRCA
        LD	(HL),A
        INC	HL
        LD	(HL),D
        INC	HL
        LD	(HL),02H	; 2
        INC	HL
        LD	(HL),0F7H
        INC	HL
        LD	A,4EH	; "N"
        LD	B,16H
        CALL	C7CA3
        CALL	C7CA0
        LD	A,0F5H
        LD	B,03H	; 3
        CALL	C7CA3
        LD	(HL),0FBH
        INC	HL
        LD	BC,512
J7C14:	LD	(HL),40H	; "@"
        INC	HL
        DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J7C14
        LD	(HL),0F7H
        INC	HL
        LD	B,54H	; "T"
        LD	A,4EH	; "N"
        CALL	C7CA3
        INC	D
        LD	A,09H	; 9
        CP	D
        JR	NC,J7BD6
        LD	(HL),0FFH
        LD	(IY+8),05H	; 5
J7C32:	CALL	C79AC			; wait for FDC ready
        LD	HL,I7C68
        PUSH	HL
        LD	L,(IY+5)
        LD	H,(IY+6)
        CALL	DISINT
        DI
        LD	C,0D3H
        LD	A,0F4H
        OUT	(0D0H),A
J7C49:	LD	A,(HL)
        INC	A
        JP	Z,J7C5A
J7C4E:	IN	A,(0D4H)
        ADD	A,A
        RET	C
        JP	M,J7C4E
        OUTI
        JP	J7C49

J7C5A:	IN	A,(0D4H)
        ADD	A,A
        RET	C
        JP	M,J7C5A
        LD	A,4EH	; "N"
        OUT	(0D3H),A
        JP	J7C5A

I7C68:	IN	A,(0D0H)
        AND	7CH	; "|"
        PUSH	AF
        JR	NZ,J7C73
        EI
        CALL	ENAINT
J7C73:	POP	AF
        RET	Z
        LD	B,A
        BIT	6,B
        LD	A,00H
        JR	NZ,J7C7E
        LD	A,10H	; 16
J7C7E:	DEC	(IY+8)
        JR	NZ,J7C32
J7C83:	PUSH	AF
        EI
        CALL	ENAINT
        XOR	A
        OUT	(0D4H),A
        POP	AF
        SCF
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7C8E:	LD	BC,0FFFFH
J7C91:	IN	A,(0D0H)
        AND	02H	; 2
        CP	E
        RET	Z
        DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J7C91
        LD	A,02H	; 2
        JR	J7C83

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7CA0:	XOR	A
        LD	B,0CH	; 12
;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________
C7CA3:	LD	(HL),A
        INC	HL
        DJNZ	C7CA3
        RET

?7CA8:	DI
        LD	B,15H
J7CAB:	PUSH	BC
        LD	A,B
        OR	80H
        PUSH	AF
        LD	HL,I.8348
        CALL	RDSLT
        LD	E,A
        LD	HL,I.8348
        POP	AF
        CALL	WRSLT
        POP	BC
        DJNZ	J7CAB
        EI
        RET

        DEFS	07E88H-$,0

I7E88:
        .PHASE	0C01EH

        RET	NC
        LD	(IC06F+1),DE
        LD	(IC0CB),A
        LD	(HL),LOW IC06D
        INC	HL
        LD	(HL),HIGH IC06D
J7E95:	LD	SP,KBUF+256
        LD	DE,IC0A6
        LD	C,0FH
        CALL	BDOS
        INC	A
        JP	NZ,JC051
        LD	HL,IC0CC
        LD	DE,IC0A6+1
        LD	BC,2
        LDIR
        LD	DE,IC0A6
        LD	C,0FH
        CALL	BDOS
        INC	A
        JP	Z,J$C07A
JC051:	LD	DE,0100H
        LD	C,1AH
        CALL	BDOS
        LD	HL,1
        LD	(D$C0B4),HL
        LD	HL,4000H-0100H
        LD	DE,IC0A6
        LD	C,27H
        CALL	BDOS
        JP	0100H

IC06D:	DEFW	IC06F
IC06F:	CALL	0
        LD	A,C
        AND	0FEH
        CP	02H	; 2
        JP	NZ,J$C081
        LD	A,(IC0CB)
        AND	A
        JP	Z,J$4022
        LD	DE,IC090
        LD	C,09H
        CALL	BDOS
        LD	C,07H
        CALL	BDOS
        JR	J7E95

IC090:	DEFB	"Erro! Tecle Algo...",13,10
        DEFB	"$"

IC0A6:	DEFB	0
        DEFB	"MSXDOS  SYS"
        DEFW 	0
        DEFW	0
        DEFB	0,0,0,0
        DEFW	0
        DEFW	0
        DEFB	0
        DEFB	0
        DEFW	0
        DEFW	0
        DEFW	0
        DEFB	0,0,0,0,0

IC0CB:	DEFB	0
IC0CC:	DEFB	"DD"

        DEPHASE


        LD	A,(0F340H)
        LD	(D.6205),A		; debug ??
        RET

J7F3F:	PUSH	IX
        PUSH	IY
        PUSH	HL
        PUSH	BC
        LD	DE,0
J7F48:	XOR	A
        CALL	PHYDIO
        POP	BC
        POP	HL
        POP	IX
        POP	IY
        RET	NC
        CP	02H
        JR	Z,J7FAA
J7F57:	SCF
        RET

?7F59:	LD	BC,4C02H
        INC	B
        CALL	C.5F81
        DEFB	13,10
        DEFB	"DDX-DRIVE Interface 3",0ABH,"-5",0ACH," V3.0f",13,10
        DEFB	"Digital Design Eletr",093H,"nica Ltda.",13,10,10
        DEFB	0
        LD	H,D
        JP	J$5AE2

J7FAA:	PUSH	IX
        PUSH	IY
        PUSH	HL
        PUSH	BC
        CALL	C.5F81
        DEFB	13,10,10
        DEFB	"Insira DISCO e tecle ALGO!",13,10
        DEFB	"(ESC p/DISK BASIC) "
        DEFB	0
        CALL	CHGET
        PUSH	AF
        CALL	C.5F81
        DEFB	13,10,10
        DEFB	0
        POP	AF
        POP	BC
        POP	HL
        POP	IY
        POP	IX
        CP	1BH
        JP	Z,J7F57
        JP	J7F3F

        END
