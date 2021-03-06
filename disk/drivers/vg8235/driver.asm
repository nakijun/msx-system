;  Diskdriver Philips VG-8235
;   VG8235 -> Source re-created by Z80DIS 2.2
;      Z80DIS was written by Kenneth Gielow
;                            Palo Alto, CA
        .Z80
        ORG	7405H

MYSIZE  EQU     8

C.0000	EQU	0000H	; -C--I
I.0001	EQU	0001H	; ----I
I$0008	EQU	0008H	; ----I
I$0012	EQU	0012H	; ----I
I$0022	EQU	0022H	; ----I
C.0024	EQU	0024H	; -C---
C$0030	EQU	0030H	; -C---
C.0038	EQU	0038H	; -C---
J.0047	EQU	0047H	; J----
J.004A	EQU	004AH	; J----
I$0055	EQU	0055H	; ----I
J.0064	EQU	0064H	; J----
J.006A	EQU	006AH	; J----
I$0072	EQU	0072H	; ----I
J$00A0	EQU	00A0H	; J----
J$00A1	EQU	00A1H	; J----
J$00A3	EQU	00A3H	; J----
J$00AE	EQU	00AEH	; J----
J$00B2	EQU	00B2H	; J----
X.00B4	EQU	00B4H	; J-S--
C$00C0	EQU	00C0H	; -C---
D.00C5	EQU	00C5H	; --S-I
C$00D1	EQU	00D1H	; -C---
I$00E5	EQU	00E5H	; ----I
J.0100	EQU	0100H	; J---I
I$0101	EQU	0101H	; ----I
C.0102	EQU	0102H	; -C--I
I$0108	EQU	0108H	; ----I
I$010C	EQU	010CH	; ----I
C$0113	EQU	0113H	; -C---
C.011D	EQU	011DH	; -C---
C$0124	EQU	0124H	; -C---
I$0129	EQU	0129H	; ----I
I$012C	EQU	012CH	; ----I
C.012E	EQU	012EH	; -C---
C$0135	EQU	0135H	; -C---
I$013B	EQU	013BH	; ----I
I$014E	EQU	014EH	; ----I
I$015F	EQU	015FH	; ----I
I$01F7	EQU	01F7H	; ----I
J.0200	EQU	0200H	; J---I
I$0201	EQU	0201H	; ----I
J$022E	EQU	022EH	; J----
I$0301	EQU	0301H	; ----I
J$0302	EQU	0302H	; J----
I$0400	EQU	0400H	; ----I
I$0502	EQU	0502H	; ----I
I$09F8	EQU	09F8H	; ----I
I$09F9	EQU	09F9H	; ----I
I.117B	EQU	117BH	; ----I
D.2D20	EQU	2D20H	; --S-I
D$322E	EQU	322EH	; --S--
I$364E	EQU	364EH	; ----I
I$3F00	EQU	3F00H	; ----I
J$4022	EQU	4022H	; J----
C$4E01	EQU	4E01H	; -C---
I$4E20	EQU	4E20H	; ----I
J$8016	EQU	8016H	; J----
J$801F	EQU	801FH	; J----
J$802C	EQU	802CH	; J----
J$802D	EQU	802DH	; J----
J$803C	EQU	803CH	; J----
I$99E1	EQU	99E1H	; ----I
D.BFF8	EQU	0BFF8H	; --SL-
D.BFF9	EQU	0BFF9H	; ---L-
D.BFFA	EQU	0BFFAH	; --SL-
D.BFFB	EQU	0BFFBH	; --SL-
D.BFFC	EQU	0BFFCH	; --S--
I.BFFF	EQU	0BFFFH	; ----I
D$C059	EQU	0C059H	; ---L-
J$C063	EQU	0C063H	; J----
J$C06A	EQU	0C06AH	; J----
C$C077	EQU	0C077H	; -C---
I$C085	EQU	0C085H	; ----I
I.C0AB	EQU	0C0ABH	; ----I
D$C0B9	EQU	0C0B9H	; --S--
D.C0D0	EQU	0C0D0H	; --SL-
I.D6D8	EQU	0D6D8H	; ----I
I$E4A8	EQU	0E4A8H	; ----I
I$F51F	EQU	0F51FH	; ----I
I$FF00	EQU	0FF00H	; ----I
I$FFDE	EQU	0FFDEH	; ----I
I$FFDF	EQU	0FFDFH	; ----I

I$7405:
; Only supports 3.5 media

        DEFB	0F8h		; Media F8
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

DEFDPB  EQU     $-1

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


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

DSKIO:
C.744D:	JP	NC,C.7550
        CALL	C$7481
J.7453:	EI
        CALL	ENAINT
        PUSH	AF
        LD	C,60
        JR	NC,J$745E
        LD	C,0
J$745E:	LD	A,0D0H
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        EX	(SP),HL
        EX	(SP),HL
        LD	A,(D.7FFB)
        LD	A,(D.7FF8)
        LD	(IX+0),120
        LD	A,(IX+3)
        AND	A
        JR	NZ,J$747C
        LD	(IX+1),C
        POP	AF
        RET

J$747C:	LD	(IX+2),C
        POP	AF
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7481:	CALL	C.7619
        RET	C
        CALL	DISINT
        DI
J$7489:	LD	A,H
        AND	A
        JP	M,J.74B8
        CALL	C$7BEC
        CALL	C.7C73
        RET	C
        INC	B
        DEC	B
        RET	Z
        CALL	DISINT
        DI
        LD	A,H
        AND	A
        JP	M,J.74B8
        PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	DE,(_SECBUF)
        PUSH	DE
        LD	BC,512
        CALL	XFER
        POP	HL
        POP	BC
        POP	DE
        CALL	C.74C3
        POP	HL
        JR	J$74BB

J.74B8:	CALL	C.74C3
J$74BB:	RET	C
        DEC	B
        RET	Z
        CALL	C.76DF
        JR	J$7489


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.74C3:	LD	E,15H
J$74C5:	CALL	C.773C
        LD	A,0A0H
        BIT	6,D
        JR	Z,J.74D6
        OR	02H	; 2
        BIT	0,D
        JR	Z,J.74D6
        OR	08H	; 8
J.74D6:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	DE,I$74F1
        PUSH	DE
        LD	(D.7FF8),A
        LD	BC,I.7FFF
J.74E3:	LD	A,(BC)
        ADD	A,A
        RET	P
        JP	C,J.74E3
        LD	A,(HL)
        LD	(D.7FFB),A
        INC	HL
        JP	J.74E3

I$74F1:	POP	BC
        POP	DE
        POP	HL
        LD	A,(D.7FF8)
        AND	0FCH
        RET	Z
        BIT	6,A
        JR	NZ,J$7527
        PUSH	AF
        LD	A,(IX+3)
        OR	0C4H
        LD	(D.7FFD),A
        CALL	C.7721
        POP	AF
        DEC	E
        JR	NZ,J$74C5
        SCF
        LD	E,A
        BIT	7,E
        LD	A,02H	; 2
        RET	NZ
        BIT	5,E
        LD	A,0AH	; 10
        RET	NZ
        BIT	4,E
        LD	A,08H	; 8
        RET	NZ
        BIT	3,E
        LD	A,04H	; 4
        RET	NZ
        LD	A,0CH	; 12
        RET

J$7527:	LD	A,0D0H
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,80H
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	HL,I.7FFF
        LD	DE,C.0000
J$753B:	LD	A,(HL)
        ADD	A,A
        JP	C,J.754D
        JP	P,J.754D
        DEC	DE
        LD	A,E
        OR	D
        JP	NZ,J$753B
        LD	A,02H	; 2
        SCF
        RET

J.754D:	XOR	A
        SCF
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7550:	CALL	C$7556
        JP	J.7453


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7556:	CALL	C.7619
        RET	C

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$755A:	CALL	DISINT
        DI
J$755E:	LD	A,H
        AND	A
        JP	M,J.7592
        CALL	C$7BD8
        CALL	C.7C73
        RET	C
        INC	B
        DEC	B
        RET	Z
        CALL	DISINT
        DI
        LD	A,H
        AND	A
        JP	M,J.7592
        PUSH	HL
        LD	HL,(_SECBUF)
        CALL	C.759D
        POP	HL
        RET	C
        PUSH	HL
        PUSH	DE
        PUSH	BC
        EX	DE,HL
        LD	HL,(_SECBUF)
        LD	BC,512
        CALL	XFER
        POP	BC
        POP	DE
        POP	HL
        AND	A
        JR	J$7596

J.7592:	CALL	C.759D
        RET	C
J$7596:	DEC	B
        RET	Z
        CALL	C.76DF
        JR	J$755E


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.759D:	LD	E,15H
J$759F:	CALL	C.773C
        LD	A,80H
        BIT	6,D
        JR	Z,J.75B0
        OR	02H	; 2
        BIT	0,D
        JR	Z,J.75B0
        OR	08H	; 8
J.75B0:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	BC,I.7FFF
        LD	DE,I$75E8
        PUSH	DE
        LD	(D.7FF8),A
        LD	DE,C.0000
J.75C0:	LD	A,(BC)
        ADD	A,A
        JP	NC,J.75E0
        RET	P
        DEC	E
        JP	NZ,J.75C0
        LD	A,(BC)
        ADD	A,A
        JP	NC,J.75E0
        RET	P
        DEC	D
        JP	NZ,J.75C0
        POP	BC
        POP	BC
        POP	DE
        POP	HL
        JR	J$7615

J.75DA:	LD	A,(BC)
        ADD	A,A
        RET	P
        JP	C,J.75DA
J.75E0:	LD	A,(D.7FFB)
        LD	(HL),A
        INC	HL
        JP	J.75DA

I$75E8:	POP	BC
        POP	DE
        POP	HL
        LD	A,(D.7FF8)
        AND	9CH
        RET	Z
        PUSH	AF
        LD	A,(IX+3)
        OR	0C4H
        LD	(D.7FFD),A
        CALL	C.7721
        POP	AF
        DEC	E
        JR	NZ,J$759F
        SCF
        LD	E,A
        BIT	7,E
        LD	A,02H	; 2
        RET	NZ
        BIT	4,E
        LD	A,08H	; 8
        RET	NZ
        BIT	3,E
        LD	A,04H	; 4
        RET	NZ
        LD	A,0CH	; 12
        RET

J$7615:	LD	A,02H	; 2
        SCF
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7619:	PUSH	AF
        PUSH	BC
        PUSH	HL
        CALL	GETWRK
        POP	HL
        POP	BC
        POP	AF

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7622:	CP	02H	; 2
        JR	C,J$762A
J$7626:	LD	A,0CH	; 12
        SCF
        RET

J$762A:	PUSH	AF
        LD	A,C
        CP	0F8H
        JR	C,J$7634
        CP	0FCH
        JR	C,J$7637
J$7634:	POP	AF
        JR	J$7626

J$7637:	EX	(SP),HL
        PUSH	HL
        PUSH	BC
        CALL	C.773C
        BIT	1,C
        LD	C,E
        LD	B,D
        LD	DE,8
        JR	NZ,J$7647
        INC	DE
J$7647:	CALL	DIV16
        LD	A,L
        INC	A
        LD	(X.7FFA),A
        LD	L,C
        POP	BC
        POP	AF
        LD	H,A
        XOR	A
        BIT	0,C
        JR	Z,J.765D
        SRL	L
        JR	NC,J.765D
        INC	A
J.765D:	LD	(D.7FFC),A
        LD	D,A
        LD	A,(IX+7)
        DEC	A
        JR	Z,J$7668
        LD	A,H
J$7668:	OR	0C4H
        CALL	DISINT
        DI
        LD	(D.7FFD),A
        LD	A,(IX)
        AND	A
        LD	(IX),0FFH
        EI
        CALL	ENAINT
        JR	NZ,J$768B
        CALL	C.7764
        CALL	C.7764
        CALL	C.7764
        CALL	C.7764
J$768B:	LD	A,C
        RRCA
        RRCA
        AND	0C0H
        OR	D
        LD	D,A
        LD	C,L
        LD	A,(IX+7)
        DEC	A
        JR	Z,J$76BE
        LD	A,(IX+3)
        CP	H
        JR	Z,J.76D2
        XOR	01H	; 1
        LD	(IX+3),A
        LD	A,(D.7FF9)
        JR	Z,J$76B1
        LD	(IX+4),A
        LD	A,(IX+5)
        JR	J$76B7

J$76B1:	LD	(IX+5),A
        LD	A,(IX+4)
J$76B7:	LD	(D.7FF9),A
        EX	(SP),HL
        EX	(SP),HL
        JR	J$76D5

J$76BE:	LD	A,(IX+6)
        CP	H
        LD	(IX+6),H
        JR	Z,J.76D2
        PUSH	IX
        PUSH	DE
        PUSH	BC
        CALL	PROMPT
        POP	BC
        POP	DE
        POP	IX
J.76D2:	LD	A,(D.7FF9)
J$76D5:	CALL	C$7727
        POP	HL
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.76DA:	CALL	C.773C
        JR	J$76F5


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.76DF:	CALL	C.773C
        INC	H
        INC	H
        LD	A,(X.7FFA)
        INC	A
        LD	(X.7FFA),A
        BIT	7,D
        JR	NZ,J$76F2
        CP	0AH	; 10
        RET	C
J$76F2:	CP	09H	; 9
        RET	C
J$76F5:	LD	A,01H	; 1
        LD	(X.7FFA),A
        BIT	6,D
        JR	Z,J.7709
        BIT	0,D
        JR	NZ,J.7709
        SET	0,D
        LD	(D.7FFC),A
        JR	J$771D

J.7709:	RES	0,D
        XOR	A
        LD	(D.7FFC),A
        INC	C
        CALL	C.773C
        LD	A,50H	; "P"
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.773C
J$771D:	SCF
        CCF
        JR	J.776A


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7721:	BIT	0,E
        RET	NZ
        CALL	C.7743

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7727:	CALL	C.773C
        LD	A,C
        LD	(D.7FFB),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,10H	; 16
J$7732:	LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.773C
        JR	J.776A


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.773C:	LD	A,(D.7FF8)
        RRA
        JR	C,C.773C
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7743:	LD	A,(D.7FF9)
        OR	A
        JR	NZ,J$774C
        CALL	C.7753
J$774C:	CALL	C.773C
        LD	A,02H	; 2
        JR	J$7732


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7753:	PUSH	BC
        LD	B,05H	; 5
J$7756:	CALL	C.773C
        LD	A,50H	; "P"
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        DJNZ	J$7756
        POP	BC
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7764:	PUSH	HL
        LD	HL,I$99E1
        JR	J.7774

J.776A:	PUSH	HL
        LD	HL,I.117B
        JR	J.7774

?.7770:	PUSH	HL
        LD	HL,I$012C
J.7774:	DEC	HL
        LD	A,H
        OR	L
        JR	NZ,J.7774
        POP	HL
        XOR	A
        RET

INIHRD:
	CALL	C.77B3
        LD	A,0C0H
        CALL	C$778A

MTOFF:
        LD	A,03H	; 3
        LD	(D.7FFD),A
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$778A:	LD	(D.7FFD),A
        CALL	C.7753
        CALL	C.773C
        LD	A,02H	; 2
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        PUSH	DE
        LD	HL,I.D6D8
        LD	D,02H	; 2
J.77A0:	LD	A,(D.7FF8)
        RRA
        JR	NC,J$77B1
        DEC	HL
        LD	A,L
        OR	H
        JR	NZ,J.77A0
        DEC	D
        JR	NZ,J.77A0
        CALL	C.77B3
J$77B1:	POP	DE
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.77B3:	LD	A,0D0H
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,(D.7FF8)
        LD	A,(D.7FFD)
        RET

DRIVES:
        NOP
        NOP
        NOP
        PUSH	BC
        PUSH	AF
        PUSH	DE
        CALL	GETWRK
        POP	DE
        POP	AF
        PUSH	AF
        PUSH	DE
        JR	Z,J$77F8
        LD	A,0C1H
        LD	(D.7FFD),A
        CALL	C.7753
        CALL	C.773C
        LD	A,02H	; 2
        LD	(D.7FF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	HL,I.D6D8
        LD	D,02H	; 2
J.77E7:	LD	A,(D.7FF8)
        RRA
        JR	NC,J$77FB
        DEC	HL
        LD	A,L
        OR	H
        JR	NZ,J.77E7
        DEC	D
        JR	NZ,J.77E7
        CALL	C.77B3
J$77F8:	LD	L,1
        DEFB    0CAH                    ; pseudo jp z,nnnn
J$77FB:	LD      L,2
        POP	DE
        LD	(IX+7),L
        LD	A,03H	; 3
        LD	(D.7FFD),A
        POP	AF
        JR	Z,J$780B
        LD	L,02H	; 2
J$780B:	POP	BC
        RET

INIENV:
	CALL	GETWRK
        XOR	A
        LD	B,07H	; 7
J$7813:	LD	(HL),A
        INC	HL
        DJNZ	J$7813
        LD	HL,I$781D
        JP	SETINT

I$781D:	PUSH	AF
        CALL	GETWRK
        LD	A,(HL)
        AND	A
        JR	Z,J.7832
        CP	0FFH
        JR	Z,J.7832
        DEC	A
        LD	(HL),A
        JR	NZ,J.7832
        LD	A,03H	; 3
        LD	(D.7FFD),A
J.7832:	INC	HL
        LD	A,(HL)
        AND	A
        JR	Z,J$7838
        DEC	(HL)
J$7838:	INC	HL
        LD	A,(HL)
        AND	A
        JR	Z,J$783E
        DEC	(HL)
J$783E:	POP	AF
        JP	PRVINT

DSKCHG:
	EI
        PUSH	HL
        PUSH	BC
        PUSH	AF
        CALL	GETWRK
        POP	AF
        POP	BC
        POP	HL
        LD	B,A
        LD	A,(IX+7)
        DEC	A
        LD	A,B
        JR	NZ,J$7861
        LD	A,(IX+6)
        AND	03H	; 3
        CP	B
        LD	A,B
        LD	B,01H	; 1
        JR	NZ,J$786F
        JR	J$7867

J$7861:	AND	A
        LD	B,(IX+2)
        JR	NZ,J$786A
J$7867:	LD	B,(IX+1)
J$786A:	INC	B
        DEC	B
        LD	B,01H	; 1
        RET	NZ
J$786F:	PUSH	BC
        PUSH	HL
        LD	DE,1
        LD	HL,(_SECBUF)
        PUSH	AF
        CALL	C.7550
        JR	C,J$7895
        POP	AF
        LD	HL,(_SECBUF)
        LD	B,(HL)
        POP	HL
        PUSH	BC
        CALL	C$7899
        LD	A,0AH	; 10
        JR	C,J$7896
        POP	AF
        POP	BC
        CP	C
        SCF
        CCF
        LD	B,0FFH
        RET	NZ
        INC	B
        RET

J$7895:	POP	DE
J$7896:	POP	DE
        POP	DE
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

GETDPB:
C$7899:	EX	DE,HL
        INC	DE
        DEC	A
        JR	NZ,J$78AB
        PUSH	DE
        PUSH	BC
        CALL	GETWRK
        POP	BC
        POP	DE
        LD	A,(IX+7)
        DEC	A
        JR	NZ,J$78AF
J$78AB:	BIT	0,B
        JR	NZ,J.78CB
J$78AF:	LD	A,B
        SUB	0F8H
        RET	C
        CP	04H	; 4
        JR	NC,J.78CB
        LD	L,A
        LD	H,00H
        ADD	HL,HL
        LD	C,L
        LD	B,H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,BC
        LD	BC,I$7405
        ADD	HL,BC
        LD	BC,I$0012
        LDIR
        RET

J.78CB:	SCF
        RET

CHOICE:
	DEC	A                       ; drive 1 ?
        JR	NZ,J$78D9               ; nope (drive 0), no format choice
        CALL	GETWRK
        LD	A,(IX+7)
        DEC	A                       ; 1 physical drive (drive 1 is a phantom drive) ?
        JR	NZ,J$78DD               ; nope, drive 1 is physical, offer format choice
J$78D9:	LD	HL,0
        RET

J$78DD:	LD	HL,I$78E1
        RET

I$78E1:	DEFB	"1 - Single Side ...",13,10
        DEFB	"2 - Double Side ...",13,10
        DEFB	0

DSKFMT:
        EI
        PUSH	HL
        LD	HL,I$E4A8
        ADD	HL,BC
        POP	HL
        JR	C,J$791D
        CCF
        LD	A,0EH	; 14
        RET

J$7919:	CCF
J.791A:	LD	A,0CH	; 12
        RET

J$791D:	LD	(HL),D
        LD	BC,I$0022
J$7920	EQU	$-1
        ADD	HL,BC
        PUSH	AF
        PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	GETWRK
        POP	BC
        POP	DE
        POP	HL
        POP	AF
        LD	B,(IX+7)
        DEC	B
        JR	Z,J.7945
        LD	B,D
        DEC	B
J$7935:	JR	NZ,J.7945
        SUB	01H	; 1
J$7939:	JR	C,J.791A
        CP	02H	; 2
        JR	NC,J$7919
J$793F:	LD	BC,I$09F9
J$7940	EQU	$-2
        DEC	A
        JR	Z,J.794A
J.7945:	LD	BC,I$09F8
        JR	J.794A

J.794A:	PUSH	BC
        LD	B,50H	; "P"
        BIT	0,C
        JR	Z,J$7953
        LD	B,0A0H
J$7953:	LD	A,D
        PUSH	AF
J$7955:	PUSH	DE
        PUSH	HL
        PUSH	BC
        PUSH	AF
        LD	B,02H	; 2
        LD	DE,C.0000
        CALL	C.7622
        JR	C,J.79C9
        CALL	C.7743
        POP	AF
        PUSH	AF
J$7968:	CALL	C.7AD1
        PUSH	HL
        CALL	C.7A01
        POP	HL
        JR	C,J.79C9
        DEC	B
        JR	Z,J$797A
        CALL	C.76DA
        JR	J$7968

J$797A:	POP	AF
        POP	BC
        PUSH	BC
        PUSH	AF
        LD	B,01H	; 1
        LD	DE,C.0000
        CALL	C.7550
        JR	C,J$79C8
        POP	AF
        POP	BC
        POP	HL
        POP	DE
        LD	DE,C.0000
        CALL	C.7622
        JR	C,J.79CD
        PUSH	AF
        CALL	C.7743
        POP	AF
J$7999:	CALL	C.7AD1
        PUSH	HL
        CALL	C.7A01
        CALL	C$79DF
        POP	HL
        JR	C,J.79CD
        DEC	B
        JR	Z,J$79AE
        CALL	C.76DA
        JR	J$7999

J$79AE:	CALL	C.7743
        POP	AF
        POP	BC
        PUSH	AF
        LD	DE,I.0001
        CALL	C$7AA2
        POP	AF
        PUSH	AF
        CALL	C$79D6
        JR	C,J$79CE
        POP	AF
        CALL	C$7B7C
        JP	J.7453

J$79C8:	CCF
J.79C9:	POP	HL
        POP	DE
        POP	BC
        POP	BC
J.79CD:	POP	BC
J$79CE:	POP	BC
        JP	C,J.7453
        SCF
        JP	J.791A


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$79D6:	PUSH	BC
        PUSH	HL
        SCF
        CALL	C.744D
        POP	HL
        POP	BC
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$79DF:	RET	C
        LD	A,(RAWFLG)
        OR	A
        RET	Z
        PUSH	BC
        PUSH	DE
        PUSH	HL
        PUSH	AF
        BIT	7,D
        LD	B,09H	; 9
        JR	NZ,J$79F1
        LD	B,08H	; 8
J$79F1:	LD	A,01H	; 1
        LD	(X.7FFA),A
        CALL	C.773C
        CALL	C$755A
        POP	HL
        POP	HL
        POP	DE
        POP	BC
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7A01:	LD	E,15H
J$7A03:	CALL	C.773C
        LD	A,0F0H
        PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	DE,I$7A4A
        PUSH	DE
        CALL	DISINT
        DI
        EX	(SP),IY
        EX	(SP),IY
        LD	BC,I.7FFF
        LD	DE,C.0000
        LD	(D.7FF8),A
J.7A20:	LD	A,(BC)
        ADD	A,A
        JP	NC,J.7A42
        RET	P
        DEC	E
        JP	NZ,J.7A20
        LD	A,(BC)
        ADD	A,A
        JP	NC,J.7A42
        RET	P
        DEC	D
        JP	NZ,J.7A20
        POP	BC
        POP	BC
        POP	DE
        POP	HL
        LD	A,02H	; 2
        SCF
        RET

J.7A3C:	LD	A,(BC)
        ADD	A,A
        RET	P
        JP	C,J.7A3C
J.7A42:	LD	A,(HL)
        LD	(D.7FFB),A
        INC	HL
        JP	J.7A3C

I$7A4A:	POP	BC
        POP	DE
        POP	HL
        EI
        CALL	ENAINT
        LD	A,(D.7FF8)
        AND	0FCH
        RET	Z
        BIT	6,A
        JR	NZ,J$7A84
        PUSH	AF
        LD	A,(IX+3)
        OR	0C4H
        LD	(D.7FFD),A
        CALL	C.7721
        POP	AF
        DEC	E
        JR	NZ,J$7A03
        SCF
        LD	E,A
        BIT	7,E
        LD	A,02H	; 2
        RET	NZ
        BIT	5,E
        LD	A,0AH	; 10
        RET	NZ
        BIT	4,E
        LD	A,08H	; 8
        RET	NZ
        BIT	3,E
        LD	A,04H	; 4
        RET	NZ
        LD	A,10H	; 16
        RET

J$7A84:	LD	A,0D4H
        LD	(D.7FF8),A
        EX	(SP),IY
        EX	(SP),IY
        LD	HL,I.7FFF
        LD	DE,I$4E20
J$7A93:	LD	A,(HL)
        ADD	A,A
        JP	P,J.754D
        DEC	DE
        LD	A,E
        OR	D
        JP	NZ,J$7A93
        LD	A,02H	; 2
        SCF
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7AA2:	PUSH	HL
        PUSH	DE
        LD	B,01H	; 1
        BIT	1,C
        JR	NZ,J$7AAB
        INC	B
J$7AAB:	BIT	0,C
        JR	Z,J$7AB0
        INC	B
J$7AB0:	SLA	B
        LD	A,07H	; 7
        ADD	A,B
        LD	B,A
        PUSH	BC
J$7AB7:	LD	DE,512
J$7ABA:	LD	(HL),00H
        INC	HL
        DEC	DE
        LD	A,D
        OR	E
        JR	NZ,J$7ABA
        DJNZ	J$7AB7
        POP	BC
        POP	DE
        POP	HL
        LD	(HL),C
        INC	HL
        LD	(HL),0FFH
        INC	HL
        LD	(HL),0FFH
        DEC	HL
        DEC	HL
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7AD1:	PUSH	IY
        PUSH	HL
        PUSH	IX
        PUSH	BC
        PUSH	DE
        LD	BC,I$FFDF
        ADD	HL,BC
        PUSH	HL
        POP	IX
        LD	DE,I$7B5B
        LD	B,21H	; "!"
J$7AE4:	LD	A,(DE)
        LD	(HL),A
        INC	HL
        INC	DE
        DJNZ	J$7AE4
        LD	DE,I$7B50
        CALL	C.7B3C
        CALL	C$7B1B
        POP	DE
        PUSH	DE
        BIT	7,D
        LD	B,09H	; 9
        JR	Z,J.7AFD
        LD	B,08H	; 8
J.7AFD:	PUSH	IX
        POP	DE
        CALL	C.7B3C
        INC	(IX+10)
        DJNZ	J.7AFD
        LD	DE,I$0400
J$7B0B:	LD	(HL),4EH	; "N"
        INC	HL
        DEC	DE
        LD	A,D
        OR	E
        JR	NZ,J$7B0B
        POP	DE
        POP	BC
        POP	IX
        POP	HL
        POP	IY
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7B1B:	POP	IY
        POP	DE
        POP	BC
        PUSH	BC
        PUSH	DE
        PUSH	IY
        BIT	6,D
        JR	Z,J$7B2B
        BIT	0,D
        JR	NZ,J$7B2F
J$7B2B:	LD	D,00H
        JR	J$7B31

J$7B2F:	LD	D,01H	; 1
J$7B31:	LD	(IX+6),C
        LD	(IX+8),D
        LD	(IX+10),01H	; 1
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7B3C:	PUSH	BC
        PUSH	DE
J$7B3E:	LD	A,(DE)
        LD	C,A
        INC	A
        JR	Z,J$7B4D
        INC	DE
        LD	A,(DE)
        LD	B,A
        INC	DE
J$7B47:	LD	(HL),C
        INC	HL
        DJNZ	J$7B47
        JR	J$7B3E

J$7B4D:	POP	DE
        POP	BC
        RET

I$7B50:	LD	C,(HL)
        LD	D,B
        NOP
        INC	C
        OR	03H	; 3
        CALL	M,C$4E01
        LD	A,(DE)
        RST	38H
I$7B5B:	NOP
        INC	C
        PUSH	AF
        INC	BC
        CP	01H	; 1
        NOP
        LD	BC,J.0100
        LD	BC,I$0201
        LD	BC,I$01F7
        LD	C,(HL)
        JR	J$7B6E

J$7B6E:	INC	C
        PUSH	AF
        INC	BC
        EI
        LD	BC,I$00E5
        PUSH	HL
        NOP
        RST	30H
        LD	BC,I$364E
        RST	38H

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7B7C:	PUSH	BC
        PUSH	DE
        PUSH	HL
        PUSH	IX
        PUSH	HL
        POP	IX
        SCF
        PUSH	AF
        PUSH	HL
        PUSH	BC
        LD	BC,D.00C5
        PUSH	HL
        POP	DE
        LD	HL,I$7F26
        LDIR
        POP	BC
        BIT	0,C
        JR	Z,J$7BAB
        LD	(IX+19),0A0H
        LD	(IX+20),05H	; 5
        LD	(IX+21),0F9H
        LD	(IX+22),03H	; 3
        LD	(IX+26),02H	; 2
J$7BAB:	LD	B,01H	; 1
        POP	HL
        POP	AF
        PUSH	HL
        LD	DE,C.0000
        CALL	C.744D
        POP	HL
        LD	BC,I$FFDE
        ADD	HL,BC
        LD	BC,I$0101
J$7BBE:	PUSH	BC
J$7BBF:	LD	DE,512
J$7BC2:	LD	(HL),00H
        INC	HL
        DEC	DE
        LD	A,D
        OR	E
        JR	NZ,J$7BC2
        DJNZ	J$7BBF
        POP	BC
        DEC	C
        JR	NZ,J$7BBE
        POP	IX
        POP	HL
        POP	DE
        POP	BC
        RET

OEMSTA:
	SCF
        RET


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7BD8:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	HL,I$7C79
        LD	DE,(_SECBUF)
        LD	BC,I$014E
        LDIR
        LD	HL,I$7C47
        JR	J.7BFE


;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C$7BEC:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	HL,I$7DC7
        LD	DE,(_SECBUF)
        LD	BC,I$015F
        LDIR
        LD	HL,I$7C1F
J.7BFE:	LD	E,(HL)
        INC	HL
        LD	D,(HL)
        INC	HL
        LD	A,E
        OR	D
        JR	Z,J$7C1B
        PUSH	HL
        LD	HL,(_SECBUF)
        ADD	HL,DE
        INC	HL
        LD	C,(HL)
        INC	HL
        LD	B,(HL)
        EX	DE,HL
        LD	HL,(_SECBUF)
        ADD	HL,BC
        EX	DE,HL
        LD	(HL),D
        DEC	HL
        LD	(HL),E
        POP	HL
        JR	J.7BFE

J$7C1B:	POP	BC
        POP	DE
        POP	HL
        RET

I$7C1F:	LD	B,00H
        INC	H
        NOP
        ADD	HL,HL
        NOP
        DEC	A
        NOP
        LD	C,D
        NOP
        LD	D,D
        NOP
        LD	H,D
        NOP
        LD	H,A
        NOP
        LD	L,A
        NOP
        AND	L
        NOP
        XOR	E
        NOP
        POP	DE
        NOP
        LD	(BC),A
        LD	BC,I$010C
        LD	D,01H	; 1
        ADD	HL,DE
        LD	BC,I$0129
        LD	A,01H	; 1
        LD	C,H
        LD	BC,C.0000
I$7C47:	LD	B,00H
        INC	H
        NOP
        ADD	HL,HL
        NOP
        LD	B,B
        NOP
        LD	C,H
        NOP
        LD	D,C
        NOP
        LD	D,(HL)
        NOP
        LD	E,E
        NOP
        LD	H,A
        NOP
        LD	L,A
        NOP
        LD	A,A
        NOP
        ADD	A,H
        NOP
        ADC	A,B
        NOP
        RET	NZ
        NOP
        POP	AF
        NOP
        EI
        NOP
        DEC	B
        LD	BC,I$0108
        JR	J$7C6E

?.7C6D:	DEC	L
J$7C6E:	LD	BC,I$013B
        DEFB	0,0

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C.7C73:	PUSH	HL
        LD	HL,(_SECBUF)
        EX	(SP),HL
        RET

I$7C79:	PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	GETSLT
        LD	(X.00B4),A
        LD	H,80H
        CALL	C.0024
        EI
        LD	A,(RAMAD1)
        LD	H,40H	; "@"
        CALL	C.0024
        EI
        POP	BC
        POP	DE
        POP	HL
        CALL	DISINT
        DI
J$7C98:	DEC	HL
        LD	A,H
        ADD	A,02H	; 2
        INC	HL
        JP	M,J$00A3
        LD	E,15H
J$7CA2:	CALL	C.011D
        LD	A,80H
        BIT	6,D
        JR	Z,J.7CB3
        OR	02H	; 2
        BIT	0,D
        JR	Z,J.7CB3
        OR	08H	; 8
J.7CB3:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	BC,I.BFFF
        LD	DE,I$0072
        PUSH	DE
        LD	(D.BFF8),A
        LD	DE,C.0000
        LD	A,(BC)
        ADD	A,A
        JP	NC,J.006A
        RET	P
        DEC	E
        JP	NZ,J.004A
        LD	A,(BC)
        ADD	A,A
        JP	NC,J.006A
        RET	P
        DEC	D
        JP	NZ,J.004A
        POP	BC
        POP	BC
        POP	DE
        POP	HL
        JR	J$7D19

?.7CDD:	LD	A,(BC)
        ADD	A,A
        RET	P
        JP	C,J.0064
        LD	A,(D.BFFB)
        LD	(HL),A
        INC	HL
        JP	J.0064

?.7CEB:	POP	BC
        POP	DE
        POP	HL
        LD	A,(D.BFF8)
        AND	9CH
        JR	NZ,J$7CFD
        DEC	B
        JR	Z,J$7D1C
        CALL	C$00C0
        JR	J$7C98

J$7CFD:	JP	M,J$00A0
        PUSH	AF
        CALL	C.0102
        POP	AF
        DEC	E
        JR	NZ,J$7CA2
        LD	E,A
        BIT	4,E
        LD	A,08H	; 8
        JR	NZ,J.7D1B
        BIT	3,E
        LD	A,04H	; 4
        JR	NZ,J.7D1B
        LD	A,0CH	; 12
        JR	J.7D1B

J$7D19:	LD	A,02H	; 2
J.7D1B:	SCF
J$7D1C:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        LD	A,(RAMAD2)
        LD	H,80H
        CALL	C.0024
        CALL	$DOSON
        EI
        LD	A,00H
        LD	H,40H	; "@"
        CALL	C.0024
        EI
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        RET

?.7D39:	CALL	C.011D
        INC	H
        INC	H
        LD	A,(D.BFFA)
        INC	A
        LD	(D.BFFA),A
        BIT	7,D
        JR	NZ,J$7D4C
        CP	0AH	; 10
        RET	C
J$7D4C:	CP	09H	; 9
        RET	C
        LD	A,01H	; 1
        LD	(D.BFFA),A
        BIT	6,D
        JR	Z,J.7D63
        BIT	0,D
        JR	NZ,J.7D63
        SET	0,D
        LD	(D.BFFC),A
        JR	J$7D77

J.7D63:	RES	0,D
        XOR	A
        LD	(D.BFFC),A
        INC	C
        CALL	C.011D
        LD	A,50H	; "P"
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.011D
J$7D77:	SCF
        CCF
        JR	J.7DBB

?.7D7B:	BIT	0,E
        RET	NZ
        CALL	C$0124
        CALL	C.011D
        LD	A,C
        LD	(D.BFFB),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,10H	; 16
J$7D8C:	LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.011D
        JR	J.7DBB

J$7D96:	LD	A,(D.BFF8)
        RRA
        JR	C,J$7D96
        RET

?.7D9D:	LD	A,(D.BFF9)
        OR	A
        JR	NZ,J$7DB4
        PUSH	BC
        LD	B,05H	; 5
J$7DA6:	CALL	C.011D
        LD	A,50H	; "P"
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        DEC	B
        JR	NZ,J$7DA6
        POP	BC
J$7DB4:	CALL	C.011D
        LD	A,02H	; 2
        JR	J$7D8C

J.7DBB:	PUSH	HL
        LD	HL,I.117B
J$7DBF:	DEC	HL
        LD	A,H
        OR	L
        JR	NZ,J$7DBF
        POP	HL
        XOR	A
        RET

I$7DC7:	PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	GETSLT
        LD	(D.00C5),A
        LD	H,80H
        CALL	C.0024
        EI
        LD	A,(RAMAD1)
        LD	H,40H	; "@"
        CALL	C.0024
        EI
        POP	BC
        POP	DE
        POP	HL
        CALL	DISINT
        DI
J$7DE6:	DEC	HL
        LD	A,H
        ADD	A,02H	; 2
        INC	HL
        JP	M,X.00B4
        LD	E,15H
J$7DF0:	CALL	C.012E
        LD	A,0A0H
        BIT	6,D
        JR	Z,J.7E01
        OR	02H	; 2
        BIT	0,D
        JR	Z,J.7E01
        OR	08H	; 8
J.7E01:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	DE,I$0055
        PUSH	DE
        LD	(D.BFF8),A
        LD	BC,I.BFFF
        LD	A,(BC)
        ADD	A,A
        RET	P
        JP	C,J.0047
        LD	A,(HL)
        LD	(D.BFFB),A
        INC	HL
        JP	J.0047

?.7E1C:	POP	BC
        POP	DE
        POP	HL
        LD	A,(D.BFF8)
        AND	0FCH
        JR	NZ,J$7E2E
        DEC	B
        JR	Z,J$7E7B
        CALL	C$00D1
        JR	J$7DE6

J$7E2E:	JP	M,J$00AE
        BIT	6,A
        JR	NZ,J$7E54
        PUSH	AF
        CALL	C$0113
        POP	AF
        DEC	E
        JR	NZ,J$7DF0
        LD	E,A
        BIT	5,E
        LD	A,0AH	; 10
        JR	NZ,J.7E7A
        BIT	4,E
        LD	A,08H	; 8
        JR	NZ,J.7E7A
        BIT	3,E
        LD	A,04H	; 4
        JR	NZ,J.7E7A
        LD	A,0CH	; 12
        JR	J.7E7A

J$7E54:	LD	A,0D0H
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,80H
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        LD	HL,I.BFFF
        LD	DE,C.0000
        LD	A,(HL)
        ADD	A,A
        JR	C,J$7E79
        JP	J$00B2

?.7E6F:	DEC	DE
        LD	A,E
        OR	D
        JP	NZ,J$00A1
        LD	A,02H	; 2
        JR	J.7E7A

J$7E79:	XOR	A
J.7E7A:	SCF
J$7E7B:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        LD	A,(RAMAD2)
        LD	H,80H
        CALL	C.0024
        CALL	$DOSON
        EI
        LD	A,00H
        LD	H,40H	; "@"
        CALL	C.0024
        EI
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        RET

?.7E98:	CALL	C.012E
        INC	H
        INC	H
        LD	A,(D.BFFA)
        INC	A
        LD	(D.BFFA),A
        BIT	7,D
        JR	NZ,J$7EAB
        CP	0AH	; 10
        RET	C
J$7EAB:	CP	09H	; 9
        RET	C
        LD	A,01H	; 1
        LD	(D.BFFA),A
        BIT	6,D
        JR	Z,J.7EC2
        BIT	0,D
        JR	NZ,J.7EC2
        SET	0,D
        LD	(D.BFFC),A
        JR	J$7ED6

J.7EC2:	RES	0,D
        XOR	A
        LD	(D.BFFC),A
        INC	C
        CALL	C.012E
        LD	A,50H	; "P"
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.012E
J$7ED6:	SCF
        CCF
        JR	J.7F1A

?.7EDA:	BIT	0,E
        RET	NZ
        CALL	C$0135
        CALL	C.012E
        LD	A,C
        LD	(D.BFFB),A
        EX	(SP),HL
        EX	(SP),HL
        LD	A,10H	; 16
J$7EEB:	LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        CALL	C.012E
        JR	J.7F1A

J$7EF5:	LD	A,(D.BFF8)
        RRA
        JR	C,J$7EF5
        RET

?.7EFC:	LD	A,(D.BFF9)
        OR	A
        JR	NZ,J$7F13
        PUSH	BC
        LD	B,05H	; 5
J$7F05:	CALL	C.012E
        LD	A,50H	; "P"
        LD	(D.BFF8),A
        EX	(SP),HL
        EX	(SP),HL
        DEC	B
        JR	NZ,J$7F05
        POP	BC
J$7F13:	CALL	C.012E
        LD	A,02H	; 2
        JR	J$7EEB

J.7F1A:	PUSH	HL
        LD	HL,I.117B
J$7F1E:	DEC	HL
        LD	A,L
        OR	H
        JR	NZ,J$7F1E
        POP	HL
        XOR	A
        RET

I$7F26:	EX	DE,HL
        CP	90H
        LD	C,(HL)
        LD	C,L
        LD	D,E
        JR	NZ,J$7F4E
        LD	(D$322E),A
        NOP
        LD	(BC),A
        LD	(BC),A
        LD	BC,J.0200
        LD	(HL),B
        NOP
        RET	NC
        LD	(BC),A
        RET	M
        LD	(BC),A
        NOP
        ADD	HL,BC
        NOP
        LD	BC,C.0000
        NOP
        RET	NC
        LD	(D$C059),DE
        LD	(D.C0D0),A
        LD	(HL),56H	; "V"
J$7F4E:	INC	HL
        LD	(HL),0C0H
J$7F51:	LD	SP,I$F51F
        LD	DE,I.C0AB
        LD	C,0FH	; 15
        CALL	BDOS
        INC	A
        JP	Z,J$C063
        LD	DE,J.0100
        LD	C,1AH
        CALL	BDOS
        LD	HL,I.0001
        LD	(D$C0B9),HL
        LD	HL,I$3F00
        LD	DE,I.C0AB
        LD	C,27H	; "'"
        CALL	BDOS
        JP	J.0100

?.7F7C:	LD	E,B
        RET	NZ
        CALL	C.0000
        LD	A,C
        AND	0FEH
        CP	02H	; 2
        JP	NZ,J$C06A
        LD	A,(D.C0D0)
        AND	A
        JP	Z,J$4022
        LD	DE,I$C085
        CALL	C$C077
        LD	C,07H	; 7
        CALL	BDOS
        JR	J$7F51

J$7F9D:	LD	A,(DE)
        INC	DE
        OR	A
        RET	Z
        PUSH	DE
        LD	E,A
        LD	C,06H	; 6
        CALL	BDOS
        POP	DE
        JR	J$7F9D

?.7FAB:	LD	B,D
        LD	L,A
        LD	L,A
        LD	(HL),H
        JR	NZ,J$8016
        LD	(HL),D
        LD	(HL),D
        LD	L,A
        LD	(HL),D
        DEC	C
        LD	A,(BC)
        LD	D,B
        LD	(HL),D
        LD	H,L
        LD	(HL),E
        LD	(HL),E
        JR	NZ,J$801F
        LD	L,(HL)
        LD	A,C
        JR	NZ,J$802D
        LD	H,L
        LD	A,C
        JR	NZ,J$802C
        LD	L,A
        LD	(HL),D
        JR	NZ,J$803C
        LD	H,L
        LD	(HL),H
        LD	(HL),D
        LD	A,C
        DEC	C
        LD	A,(BC)
        DEFB	0,0
        LD	C,L
        LD	D,E
        LD	E,B
        LD	B,H
        LD	C,A
        LD	D,E
        JR	NZ,X.7FFA
        LD	D,E
        LD	E,C
        LD	D,E
        DEFB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        DEFB	0,0,0,0,0
        RST	38H
        DEFB	0
D.7FF8:	DEFB	0
D.7FF9:	SBC	A,(HL)
X.7FFA:	LD	BC,I$FF00
D.7FFB	EQU	$-2
D.7FFC	EQU	$-1
D.7FFD:	RST	38H
        RST	38H
I.7FFF:	RST	38H
        END

D.7FF9:	SBC	A,(HL)
