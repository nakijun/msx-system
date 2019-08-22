; BIOS.ASM

; MSX BIOS ROM, MSX 2+ version (version 3.0)

; Source re-created by Z80DIS 2.2
; Z80DIS was written by Kenneth Gielow, Palo Alto, CA

; Code Copyrighted by ASCII and maybe others
; Source comments by Arjen Zeilemaker

; Sourcecode supplied for STUDY ONLY
; Recreation NOT permitted without authorisation of the copyrightholders


        .Z80
        ASEG
        ORG	0000H

        INCLUDE	MSX.INC


S.GRPPRT	EQU	0089h
S.MAPXYC	EQU	0091h
S.READC		EQU	0095h
S.SETC		EQU	009Dh
S.TRIGHT	EQU	00A1h
S.RIGHTC	EQU	00A5h
S.TLEFTC	EQU	00A9h
S.LEFTC		EQU	00ADh
S.TDOWNC	EQU	00B1h
S.DOWNC		EQU	00B5h
S.TUPC		EQU	00B9h
S.UPC		EQU	00BDh
S.SCANR		EQU	00C1h
S.SCANL		EQU	00C5h
S.CHGMOD	EQU	00D1h
S.INITXT	EQU	00D5h
S.INIT32	EQU	00D9h
S.INIGRP	EQU	00DDh
S.INIMLT	EQU	00E1h
S.SETTXT	EQU	00E5h
S.SETT32	EQU	00E9h
S.SETGRP	EQU	00EDh
S.SETMLT	EQU	00F1h
S.CLRSPR	EQU	00F5h
S.CLS		EQU	0115h
S.CLRTXT	EQU	0119h
S.DSPFNK	EQU	011Dh
S.DELLNO	EQU	0121h
S.INSLNO	EQU	0125h
S.WRTVDP	EQU	012Dh
S.PUTCHR	EQU	0139h
S.BEEP		EQU	017Dh
S.NEWPAD	EQU	01ADh
S.CHGMDP	EQU	01B5h

M409B	EQU	409BH	; Warm start msx basic
M4666	EQU	4666H	; CHRGTR routine in basicrom
M558C	EQU	558CH	; SYNCHR routine in basicrom
M5597	EQU	5597H	; GETYPR routine in basicrom
M60F6	EQU	60F6H	; headloop PRINT USING
M61F9	EQU	61F9H	; end of formatstring PRINT USING
M6246	EQU	6246H	; plussign if needed PRINT USING
M63E6	EQU	63E6H	; STOP statement in basicrom
M6C48	EQU	6C48H	; file i/o output
M7042	EQU	7042H	; PCMREC routine in basicrom
M71DB	EQU	71DBH	; PCMPLY routine in basicrom
M73B2	EQU	73B2H	; Device I/O error
M7B61	EQU	7B61H	; init code hardware part2
M7C76	EQU	7C76H	; init code msx basic
M7D75	EQU	7D75H	; extension ROM handler
M7E1A	EQU	7E1AH	; read word from extension ROM
M7FBE	EQU	7FBEH	; helper routine RDSLT in basicrom
M7FC4	EQU	7FC4H	; helper routine WRSLT in basicrom

RDPRIM	EQU	0F380H
WRPRIM	EQU	0F385H
CLPRIM	EQU	0F38CH
CLPRM1	equ	0F398H
LINLEN	EQU	0F3B0H
CRTCNT	EQU	0F3B1H
T32COL	EQU	0F3BFH
GRPCGP	EQU	0F3CBH
CLIKSW	EQU	0F3DBH
CSRY	EQU	0F3DCH
CSRX	EQU	0F3DDH
CNSDFG	EQU	0F3DEH
RG0SAV	EQU	0F3DFH
RG1SAV	EQU	0F3E0H
STATFL	EQU	0F3E7H
TRGFLG	EQU	0F3E8H
FORCLR	EQU	0F3E9H
BAKCLR	EQU	0F3EAH
BDRCLR	EQU	0F3EBH
ATRBYT	EQU	0F3F2H
QUEUES	EQU	0F3F3H
SCNCNT	EQU	0F3F6H
REPCNT	EQU	0F3F7H
PUTPNT	EQU	0F3F8H
GETPNT	EQU	0F3FAH
LOW.	equ	0F406H
HIGH.	equ	0F408H
HEADER	equ	0F40AH
ASPCT1	EQU	0F40BH
ASPCT2	EQU	0F40DH
LPTPOS	EQU	0F415H
PRTFLG	EQU	0F416H
NTMSXP	EQU	0F417H
RAWPRT	EQU	0F418H
CURLIN	EQU	0F41CH
FNKSTR	EQU	0F87FH
BUFMIN	EQU	0F55DH
BUF	EQU	0F55EH
TTYPOS	EQU	0F661H
AUTFLG	EQU	0F6AAH
SAVSTK	EQU	0F6B1H
PTRFIL	EQU	0F864H
FILNAM	EQU	0F866H
FNKSTR	EQU	0F87FH
CGPNT	EQU	0F91FH
NAMBAS	EQU	0F922H
CGPBAS	EQU	0F924H
PATBAS	EQU	0F926H
ATRBAS	EQU	0F928H
CLOC	EQU	0F92AH
CMASK	EQU	0F92CH
CSAVEA	EQU	0F942H
CSAVEM	EQU	0F944H
QUEBAK	EQU	0F971H
VOICAQ	EQU	0F975H
ACPAGE	EQU	0FAF6H
EXBRSA	EQU	0FAF8H
CHRCNT	EQU	0FAF9H
MODE	EQU	0FAFCH
DFAFF	EQU	0FAFFH
LOGOPR	EQU	0FB02H
HOKVLD	EQU	0FB20H
VOICEN	EQU	0FB38H
QUEUEN	EQU	0FB3EH
MUSICF	EQU	0FB3FH
PLYCNT	EQU	0FB40H
VCBA	EQU	0FB41H
VCBB	EQU	0FB66H
VCBC	EQU	0FB8BH
FNKFLG	EQU	0FBCEH
TRPTBL	EQU	0FC4CH
ENSTOP	EQU	0FBB0H
BASROM	EQU	0FBB1H
LINTTB	EQU	0FBB2H
FSTPOS	EQU	0FBCAH
CURSAV	EQU	0FBCCH
FNKSWI	EQU	0FBCDH
ONGSBF	EQU	0FBD8H
CLIKFL	EQU	0FBD9H
OLDKEY	EQU	0FBDAH
NEWKEY	EQU	0FBE5H
KEYBUF	EQU	0FBF0H
LINWRK	EQU	0FC18H
PATWRK	EQU	0FC40H
INTFLG	EQU	0FC9BH
PADY	EQU	0FC9CH
PADX	EQU	0FC9DH
JIFFY	EQU	0FC9EH
INTVAL	EQU	0FCA0H
INTCNT	EQU	0FCA2H
LOWLIM	equ	0FCA4H
WINWID	equ	0FCA5H
GRPHED	EQU	0FCA6H
ESCCNT	EQU	0FCA7H
INSFLG	EQU	0FCA8H
CSRSW	EQU	0FCA9H
CSTYLE	EQU	0FCAAH
CAPST	EQU	0FCABH
KANAST	EQU	0FCACH
KANAMD	EQU	0FCADH
SCRMOD	EQU	0FCAFH
OLDSCR	EQU	0FCB0H
CASPRV	EQU	0FCB1H
BDRATR	EQU	0FCB2H
GRPACX	EQU	0FCB7H
GRPACY	EQU	0FCB9H
EXPTBL	EQU	0FCC1H
SLTTBL	EQU	0FCC5H
SLTATR	EQU	0FCC9H

H.KEYI	EQU	0FD9AH
H.TIMI	EQU	0FD9FH
H.CHPU	EQU	0FDA4H
H.DSPC	EQU	0FDA9H
H.ERAC	EQU	0FDAEH
H.DSPF	EQU	0FDB3H
H.ERAF	EQU	0FDB8H
H.TOTE	EQU	0FDBDH
H.CHGE	EQU	0FDC2H
H.INIP	EQU	0FDC7H
H.KEYC	EQU	0FDCCH
H.KEYA	EQU	0FDD1H
H.NMI	EQU	0FDD6H
H.PINL	EQU	0FDDBH
H.QINL	EQU	0FDE0H
H.INLI	EQU	0FDE5H
H.ISFL	EQU	0FEDFH
H.OUTD	EQU	0FEE4H
H.OKNO	EQU	0FF75H
H.MDIN	EQU	0FF75H
H.MDTM	EQU	0FF93H
H.PHYD	EQU	0FFA7H
H.FORM	EQU	0FFACH
H.LPTO	EQU	0FFB6H
H.LPTS	EQU	0FFBBH
EXTBIO	EQU	0FFCAH
RG8SAV	EQU	0FFE7H
RG25SA	EQU	0FFFAH

D.FFFD	EQU	0FFFDH	; used to store SP register during CPU change
D.FFFF	EQU	0FFFFH	; secundairy slotregister
CHKRAM:	DI
        JP	J0416

        DEFW	D1BBF			; address character pattern
        DEFB	VDP.DRW			; vdp dataregister i/o address for read
        DEFB	VDP.DRW			; vdp dataregister i/o address for write


SYNCHR:	JP	J2683

        DEFS	0000CH-$

RDSLT:	JP	C01F5

        DEFS	00010H-$

CHRGTR:	JP	J2686

        DEFS	00014H-$

WRSLT:	JP	C0225

        DEFS	00018H-$

OUTDO:	JP	J1B45

        DEFS	0001CH-$

CALSLT:	JP	C0217

        DEFS	00020H-$

DCOMPR:	JP	J0C04

        DEFS	00024H-$

ENASLT:	JP	C0333

        DEFS	00028H-$

GETYPR:	JP	J2689

IDBYT0:
        IF	INTHZ EQ 60
        DEFB	CHRGEN+16*DATFMT
        ELSE
        DEFB	CHRGEN+16*DATFMT+128
        ENDIF
IDBYT1:	DEFB	KEYTYP+16*BASVER
IDBYT2:	DEFB	MSXVER			; MSX version 2 = 2+
IDBYT3:	DEFB	0			;

        DEFS	00030H-$

CALLF:	JP	C02C6

        DEFS	00034H-$

;	The next bytes are used by the diskrom, to initialize the double byte header char
;	table (0F30FH). I have not seen a MSX with anything other than four zero's, meaning
;	no double byte chars.

D0034:	DEFB	0,0			; double byte header char range 1
        DEFB	0,0			; double byte header char range 2

KEYINT:	JP	J0C3C
INITIO:	JP	J0592
INIFNK:	JP	J13A0
DISSCR:	JP	J060A
ENASCR:	JP	J0603
WRTVDP:	JP	J0612
RDVRM:	JP	C07E1
WRTVRM:	JP	C07D7
SETRD:	JP	C0808
SETWRT:	JP	C07F4
FILVRM:	JP	J083B
LDIRMV:	JP	C073D
LDIRVM:	JP	C0780
CHGMOD:	JP	J08B1
CHGCLR:	JP	J081A

        DEFS	00066H-$		; align to Z80 NMI entry at 0066H

NMI:	JP	J139B
CLRSPR:	JP	J067F
INITXT:	JP	J063E
INIT32:	JP	J0647
INIGRP:	JP	J064F
INIMLT:	JP	J0657
SETTXT:	JP	J065F
SETT32:	JP	J0667
SETGRP:	JP	J066F
SETMLT:	JP	J0677
CALPAT:	JP	J06EC
CALATR:	JP	J0701
GSPSIZ:	JP	C070C
GRPPRT:	JP	J150E
GICINI:	JP	C05B2
WRTPSG:	JP	C1102
RDPSG:	JP	C110E
STRTMS:	JP	J11BA
CHSNS:	JP	C0D6A
CHGET:	JP	C10CB
CHPUT:	JP	J0919
LPTOUT:	JP	C08BA
LPTSTT:	JP	C08E1
CNVCHR:	JP	C08FA
PINLIN:	JP	J23BF
INLIN:	JP	J23D5
QINLIN:	JP	J23CC
BREAKX:	JP	C0564
ISCNTC:	JP	C04F0
CKCNTC:	JP	J10F9
BEEP:	JP	C1113
CLS:	JP	J0897
POSIT:	JP	C08EB
FNKSB:	JP	J0B3A
ERAFNK:	JP	J0B29
DSPFNK:	JP	C0B3F
TOTEXT:	JP	C089E
GTSTCK:	JP	J11E4
GTTRIG:	JP	J1249
GTPAD:	JP	J12A2
GTPDL:	JP	J1269
TAPION:	JP	J1A63
TAPIN:	JP	J1ABC
TAPIOF:	JP	J19E9
TAPOON:	JP	J19F1
TAPOUT:	JP	J1A19
TAPOOF:	JP	J19DD
STMOTR:	JP	J1387
LFTQ:	JP	J14E9
PUTQ:	JP	J1490
RIGHTC:	JP	C1756
LEFTC:	JP	J1790
UPC:	JP	J181F
TUPC:	JP	J17F6
DOWNC:	JP	J17DC
TDOWNC:	JP	C17B4
SCALXY:	JP	C15A5
MAPXYC:	JP	C1604
FETCHC:	JP	C1651
STOREC:	JP	C1658
SETATR:	JP	J1692
READC:	JP	C165F
SETC:	JP	C16C3
NSETCX:	JP	C1843
GTASPC:	JP	J1901
PNTINI:	JP	J1909
SCANR:	JP	J191E
SCANL:	JP	J1994
CHGCAP:	JP	K.BCAP
CHGSND:	JP	K.BSND
RSLREG:	JP	J140E
WSLREG:	JP	J1411
RDVDP:	JP	J140B
SNSMAT:	JP	J0BEC
PHYDIO:	JP	J1414
FORMAT:	JP	J1418
ISFLIO:	JP	C0BF9
OUTDLP:	JP	C1B63
GETVCP:	JP	C0C0A
GETVC2:	JP	J0C0E
KILBUF:	JP	C055D
CALBAS:	JP	C02BF
SUBROM:	JP	J0295
EXTROM:	JP	C029B
CHKSLZ:	JP	J03AC
CHKNEW:	JP	C06A9
EOL:	JP	C0B05
BIGFIL:	JP	C0838
NSETRD:	JP	C06C5
NSTWRT:	JP	C06B3
NRDVRM:	JP	J07E9
NWRVRM:	JP	J0769
RDBTST:	JP	J146A
WRBTST:	JP	J146E

        DEFS	001B6H-$

;	Subroutine	CALSLT for expanded slot 0 page 0
;	Inputs		________________________
;	Outputs		________________________
;	Remark		this is done by this special routine, otherwise calslt crashes
;			code to handle a interslot call to the subrom in a secundairy
;			of slot 0.

J01B6:	POP	AF
        CALL	C143E
        LD	H,A
        IN	A,(0A8H)
        LD	B,A
        AND	3FH
        OR	D
        OUT	(0A8H),A
        LD	D,A
        LD	A,(D.FFFF)
        CPL
        LD	C,A
        AND	0FCH
        OR	H
        LD	E,A
        LD	(D.FFFF),A

; from this point code continues to execute in subrom

        LD	A,L
        OUT	(0A8H),A
        PUSH	HL
        CALL	C04D0
        LD	(HL),E
        PUSH	HL
        PUSH	BC
        EXX
        EX	AF,AF'
        CALL	CLPRM1
        DI
        EX	AF,AF'
        EXX
        POP	BC
        POP	HL
        POP	AF
        OUT	(0A8H),A
        LD	A,C
        LD	(D.FFFF),A

; from this point code returns executing from the subrom

?01EB:	LD	A,B
        OUT	(0A8H),A
        LD	(HL),C
        EX	AF,AF'
        EXX
        RET

        DEFS	01F5H-$,0

;	Subroutine	RDSLT
;	Inputs		________________________
;	Outputs		________________________


C01F5:	CALL	C017A			; adjust if mainrom and calculate masks
        JP	M,J0205			; handle expanded slot
        IN	A,(0A8H)
        LD	D,A
        AND	C
        OR	B
        CALL	RDPRIM
        LD	A,E
        RET

;	Subroutine	RDSLT for expanded slot
;	Inputs		________________________
;	Outputs		________________________


J0205:	CALL	C028C			; prm. slot 0, page 0 ?
        JR	NZ,J021A		; nop, use �old� method
        PUSH	HL
        CALL	C0255			; basicrom on page 1
        EX	(SP),HL
        CALL	M7FBE			; special routine, so bios does not crash
        JR	J0244

        DEFS	0217H-$			; align to 0217H

;	Subroutine	CALSLT
;	Inputs		________________________
;	Outputs		________________________
;	Remark		Just a jump at this adres to have same entry point as MSX1

C0217:	JP	J02D8


;	Subroutine	RDSLT for expanded slot, not slot 0 page 0
;	Inputs		________________________
;	Outputs		________________________


J021A:	PUSH	HL
        CALL	C0378			; adjust secundairy slotregister
        EX	(SP),HL
        PUSH	BC
        CALL	C01F5			; do RDSLT on only the primary slot
        JR	J0279			; restore secundairy slotegister

;	Subroutine	WRSLT
;	Inputs		________________________
;	Outputs		________________________


C0225:	PUSH	DE
        CALL	C017A			; adjust if mainrom and calculate masks
        JP	M,J0235			; expanded slot,
        POP	DE
        IN	A,(0A8H)
        LD	D,A
        AND	C
        OR	B
        JP	WRPRIM

;	Subroutine	WRSLT for expanded slot
;	Inputs		________________________
;	Outputs		________________________


J0235:	CALL	C028C			; prm. slot 0, page 0 ?
        JP	NZ,J026E		; nope, use �old� method
        POP	DE
        PUSH	HL
        CALL	C0255			; basicrom on page 1
        EX	(SP),HL
        CALL	M7FC4			; special routine, so bios does not crash
J0244:	EX	(SP),HL
        PUSH	AF
        CALL	C1452
        OUT	(0A8H),A
        LD	A,H
        LD	(D.FFFF),A
        LD	A,L
        OUT	(0A8H),A
        POP	AF
        POP	HL
        RET

;	Subroutine	basicrom on page 1
;	Inputs		________________________
;	Outputs		________________________


C0255:	PUSH	AF
        IN	A,(0A8H)
        CALL	C1453
        OUT	(0A8H),A		; page 3 = prm. slot 0 (for access to sec. slotreg)
        LD	A,(D.FFFF)
        CPL
        LD	H,A
        AND	0F3H
        LD	(D.FFFF),A		; page 1 = sec. slot 0
        JP	J145D
J026A:	OUT	(0A8H),A		; restore page 3 prm. slot 0, page 1 = prm. slot 0
        POP	AF
        RET

;	Subroutine	WRSLT for expanded slot, not slot 0 page 0
;	Inputs		________________________
;	Outputs		________________________


J026E:	EX	(SP),HL
        PUSH	HL
        CALL	C0378			; adjust secundairy slotregister
        POP	DE
        EX	(SP),HL
        PUSH	BC
        CALL	C0225			; do WRSLT on only the primary slot
J0279:	POP	BC
        EX	(SP),HL
        PUSH	AF
        LD	A,B
        AND	3FH
        OR	C
        OUT	(0A8H),A
        LD	A,L
        LD	(D.FFFF),A		; restore secundairy slotregister
        LD	A,B
        OUT	(0A8H),A
        POP	AF
        POP	HL
        RET

;	Subroutine	check if primary slot 0,page 0
;	Inputs		________________________
;	Outputs		Zx if primary slot 0, page 0

C028C:	CALL	C1448
        RET	NZ
        LD	A,E
        CP	03H			; page 0 ?
        LD	A,B
        RET

;	Subroutine	SUBROM
;	Inputs		________________________
;	Outputs		________________________


J0295:	CALL	C029B			; EXTROM
        POP	IX
        RET

;	Subroutine	EXTROM
;	Inputs		________________________
;	Outputs		________________________


C029B:	EXX
        EX	AF,AF'
        PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        LD	A,I
        PUSH	AF			; store interrupt state
        EXX
        EX	AF,AF'
        PUSH	IY
        LD	IY,(EXBRSA-1)		; slotid subrom
        CALL	C0217			; CALSLT
        POP	IY
        EX	AF,AF'
        EXX
        POP	AF
        JP	PO,J02B8
        EI				; restore interrupt state
J02B8:	POP	AF
        POP	BC
        POP	DE
        POP	HL
        EXX
        EX	AF,AF'
        RET

;	Subroutine	CALBAS
;	Inputs		________________________
;	Outputs		________________________


C02BF:	LD	IY,(EXPTBL+0-1)		; slotid basicrom
        JP	C0217			; CALSLT

;	Subroutine	CALLF
;	Inputs		________________________
;	Outputs		________________________


C02C6:	EX	(SP),HL
        PUSH	AF
        PUSH	DE
        LD	A,(HL)
        PUSH	AF
        POP	IY
        INC	HL
        LD	E,(HL)
        INC	HL
        LD	D,(HL)
        INC	HL
        PUSH	DE
        POP	IX
        POP	DE
        POP	AF
        EX	(SP),HL

;	Subroutine	CALSLT
;	Inputs		________________________
;	Outputs		________________________


J02D8:	EXX
        EX	AF,AF'
        PUSH	IY
        POP	AF
        PUSH	IX
        POP	HL
        CALL	C017A			; adjust if mainrom and calculate masks
        JP	M,J02EF			; expanded slot,
        IN	A,(0A8H)
        PUSH	AF
        AND	C
        OR	B
        EXX
        JP	CLPRIM

;	Subroutine	CALSLT for expanded slot
;	Inputs		________________________
;	Outputs		________________________


J02EF:	PUSH	AF
        PUSH	HL
        LD	HL,EXPTBL+0
        XOR	(HL)			; slotid of the mainrom ?
        AND	E			; page 0 and same primairy slot ?
        POP	HL
        JP	Z,J142E			; yep, use safe methode
J02FA:	POP	AF
        CALL	C0378			; adjust secundairy slotregister
        PUSH	AF
        POP	IY
        PUSH	HL
        PUSH	BC
        LD	C,A
        LD	B,0
        LD	A,L
        AND	H
        OR	D
        LD	HL,SLTTBL
        ADD	HL,BC
        LD	(HL),A			; update SLTTBL
        PUSH	HL
        EX	AF,AF'
        EXX
        CALL	C0217			; do a CALSLT on only the primary slot
        EXX
        EX	AF,AF'
        POP	HL
        POP	BC
        POP	DE
        LD	A,I
        PUSH	AF			; save interrupt state
        LD	A,B
        AND	3FH
        OR	C
        DI
        OUT	(0A8H),A
        LD	A,E
        LD	(D.FFFF),A		; restore secundairy slotregister
        LD	A,B
        OUT	(0A8H),A
        LD	(HL),E			; restore SLTTBL
        POP	AF
        JP	PO,J0330
        EI				; restore interrupt state
J0330:	EX	AF,AF'
        EXX
        RET

;	Subroutine	ENASLT
;	Inputs		________________________
;	Outputs		________________________


C0333:	CALL	C017A			; adjust if mainrom and calculate masks
        JP	M,J0340			; expanded slot,
        IN	A,(0A8H)
        AND	C
        OR	B
        OUT	(0A8H),A
        RET

;	Subroutine	ENASLT for expanded slot
;	Inputs		________________________
;	Outputs		________________________


J0340:	PUSH	HL
        CALL	C0378			; adjust secundairy slotregister
        LD	C,A
        LD	B,00H
        LD	A,L
        AND	H
        OR	D
        LD	HL,SLTTBL
        ADD	HL,BC
        LD	(HL),A			; update SLTTBL
        POP	HL
        LD	A,C
        JR	C0333			; do a ENASLT on only the primary slot

;	Subroutine	calculate masks
;	Inputs		A=slotid, HL=adres
;	Outputs		P set if expanded slot, A=slotid, D=PPPPPPPP, E=page select mask
;	             B=primairy slot or mask, C=page clear mask

C0353:	DI
        PUSH	AF
        LD	A,H
        RLCA
        RLCA
        AND	03H
        LD	E,A			; page
        LD	A,0C0H
J035D:	RLCA
        RLCA
        DEC	E
        JP	P,J035D
        LD	E,A			; page select mask
        CPL
        LD	C,A			; page clear mask
        POP	AF
        PUSH	AF
        AND	03H
        INC	A
        LD	B,A
        LD	A,0ABH
J036E:	ADD	A,55H
        DJNZ	J036E
        LD	D,A			; PPPPPPPP
        AND	E
        LD	B,A			; prim. slot select
        POP	AF
        AND	A
        RET

;	Subroutine	Adjust secundairy slotregister
;	Inputs		A=slotid, D=, E=
;	Outputs		A=slotid primairy slot

C0378:	PUSH	AF
        LD	A,D
        AND	0C0H
        LD	C,A
        POP	AF
        PUSH	AF
        LD	D,A
        IN	A,(0A8H)
        LD	B,A
        AND	3FH
        OR	C
        OUT	(0A8H),A		; set page 3 to requested primary slot (to access sec. slotreg)
        LD	A,D
        RRCA
        RRCA
        AND	03H
        LD	D,A
        LD	A,0ABH
J0390:	ADD	A,55H
        DEC	D
        JP	P,J0390
        AND	E
        LD	D,A
        LD	A,E
        CPL
        LD	H,A
        LD	A,(D.FFFF)
        CPL
        LD	L,A
        AND	H
        OR	D
        LD	(D.FFFF),A
        LD	A,B
        OUT	(0A8H),A		; restore primary slotreg
        POP	AF
        AND	03H
        RET

;	Subroutine	CHKSLZ
;	Inputs		________________________
;	Outputs		________________________

J03AC:
        DI
;	LD	C,0
;I03AF:	LD	DE,EXPTBL
;	LD	HL,SLTATR
;J03B5:	LD	A,(DE)
;	OR	C
;	LD	C,A
;	PUSH	DE
;J03B9:	PUSH	HL
;	LD	HL,0
;	CALL	M7E1A
;	PUSH	HL
;	LD	HL,04443H
;	RST	20H
;	POP	HL
;	LD	B,00H
;	JR	NZ,J03EF
;	CALL	M7E1A
;	PUSH	HL
;	PUSH	BC
;	PUSH	DE
;	POP	IX
;	LD	A,C
;	PUSH	AF
;	POP	IY
;	CALL	NZ,C0217
;	POP	BC
;	POP	HL
;	CALL	M7E1A
;	ADD	A,0FFH
;	RR	B
;	CALL	M7E1A
;	ADD	A,0FFH
;	RR	B
;	SRL	B
;	LD	DE,-8
;	ADD	HL,DE
;J03EF:	EX	(SP),HL
;	LD	(HL),B
;	EX	(SP),HL
;	POP	HL
;	INC	HL
;	INC	HL
;	INC	HL
;	INC	HL
;	LD	A,C
;	AND	A
;	LD	DE,12
;	JP	P,J040A
;	ADD	A,04H
;	LD	C,A
;	CP	90H
;	JR	C,J03B9
;	AND	03H
;	LD	C,A
;	LD	A,19H
;J040A	EQU	$-1
;	POP	DE
;	INC	DE
;	INC	C
;	LD	A,C
;	CP	04H
;	JR	C,J03B5

        LD	A,(EXPTBL+0)		; 100000pp
        OR	004H			; 100001pp, secundairy slot 1
        LD	C,A			; save slotid
        LD	B,00H			; expansion flags

        LD	HL,2
        CALL	M7E1A
        PUSH	HL
        PUSH	BC
        PUSH	DE
        POP	IX
        LD	A,C
        PUSH	AF
        POP	IY
        CALL	NZ,C0217
        POP	BC
        POP	HL
        CALL	M7E1A
        ADD	A,0FFH
        RR	B
        CALL	M7E1A
        ADD	A,0FFH
        RR	B
        SRL	B

        LD	A,C
        AND	03H			; primairy slot
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A			; *16 (4 pages per slot, 4 secundairies per primairy slot)
        ADD	A,4			; secundairy slot 1
        ADD	A,LOW SLTATR
        LD	L,A
        LD	A,HIGH SLTATR
        ADC	A,0
        LD	H,A			; SLTATR entry for subrom
        LD	(HL),B			; adjust SLTATR

        JP	J1472

        DEFS	0416H-$,0

; orginal init MSX2 and above

J0416:	XOR	A
        OUT	(0FFH),A
        INC	A
        OUT	(0FEH),A
        INC	A
        OUT	(0FDH),A
        INC	A
        OUT	(0FCH),A		; initialize memorymapper
        LD	A,08H
        OUT	(0BBH),A		; initialize lightpen ??
        LD	A,82H
        OUT	(0ABH),A		; initialize i8255 port modeselect

;	XOR	A
;	OUT	(0A8H),A		; initialize primary slotregister (all pages slot 0)
;	LD	A,50H
;	OUT	(0AAH),A		; CAPS led off, cassette motor off
;J0431:	LD	DE,D.FFFF
;	XOR	A
;	LD	C,A
;J0436:	OUT	(0A8H),A
;	SLA	C
;	LD	B,00H
;	LD	HL,D.FFFF
;	LD	(HL),0F0H
;	LD	A,(HL)
;	SUB	0FH
;	JR	NZ,J0451
;	LD	(HL),A
;	LD	A,(HL)
;	INC	A
;	JR	NZ,J0451
;	INC	B
;	SET	0,C
;J044E:	LD	(D.FFFF),A
;J0451:	LD	HL,0BF00H
;J0454:	LD	A,(HL)
;	CPL
;	LD	(HL),A
;I0457:	CP	(HL)
;	CPL
;	LD	(HL),A
;	JR	NZ,J0463
;	INC	L
;	JR	NZ,J0454
;	DEC	H
;	JP	M,J0454
;J0463:	LD	L,00H
;	INC	H
;	LD	A,L
;	SUB	E
;	LD	A,H
;	SBC	A,D
;	JR	NC,J0476
;	EX	DE,HL
;	LD	A,(D.FFFF)
;	CPL
;	LD	L,A
;	IN	A,(0A8H)
;	LD	H,A
;	LD	SP,HL
;J0476:	LD	A,B
;	AND	A
;	JR	Z,J0484
;	LD	A,(D.FFFF)
;	CPL
;	ADD	A,10H
;	CP	40H
;	JR	C,J044E
;J0484:	IN	A,(0A8H)
;	ADD	A,50H
;	JR	NC,J0436
;	LD	HL,0
;	ADD	HL,SP
;	LD	A,H
;	OUT	(0A8H),A
;	LD	A,L
;	LD	(D.FFFF),A
;	LD	A,C
;	RLCA
;	RLCA
;	RLCA
;	RLCA
;	LD	C,A
;	LD	DE,D.FFFF
;	IN	A,(0A8H)
;	AND	3FH
;J04A2:	OUT	(0A8H),A
;	LD	B,00H
;	RLC	C
;	JR	NC,J04B4
;	INC	B
;	LD	A,(D.FFFF)
;	CPL
;	AND	3FH
;J04B1:	LD	(D.FFFF),A
;J04B4:	LD	HL,0FE00H
;J04B7:	LD	A,(HL)
;	CPL
;	LD	(HL),A
;	CP	(HL)
;	CPL
;	LD	(HL),A
;	JR	NZ,J04C8
;	INC	L
;	JR	NZ,J04B7
;	DEC	H
;	LD	A,H
;	CP	0C0H
;	JR	NC,J04B7
;J04C8:	LD	L,00H
;	INC	H
;	LD	A,L
;	SUB	E
;	LD	A,H
;	SBC	A,D
;	JR	NC,J04DB
;	EX	DE,HL
;	LD	A,(D.FFFF)
;	CPL
;	LD	L,A
;	IN	A,(0A8H)
;	LD	H,A
;	LD	SP,HL
;J04DB:	LD	A,B
;	AND	A
;	JR	Z,J04E7
;	LD	A,(D.FFFF)
;	CPL
;	ADD	A,40H
;	JR	NC,J04B1
;J04E7:	IN	A,(0A8H)
;	ADD	A,40H
;	JR	NC,J04A2
        JP	M7B61


; PATCH CODE

;	  Subroutine replace slotid 0 or 0-0 with slotid of mainrom (for page 0 and 1)
;	     Inputs  ________________________
;	     Outputs ________________________

C017A:	BIT	7,H			; page 0 or 1 ?
        JR	NZ,J018D		; nope, use normal methode
        BIT	7,A			; slot expanded ?
        JR	NZ,J0184		; yep,
        AND	03H			; clear unused bits
J0184:	LD	B,A
        AND	0FH
        LD	A,B			; slot 0 or slot 0-0 ?
        JR	NZ,J018D		; nope, use normal methode
        LD	A,(EXPTBL+0)		; use slot id of mainrom
J018D:	JP	C0353

C04D0:	AND	03H
        LD	HL,SLTTBL
        ADD	A,L
        LD	L,A
        RET

J142E:	POP	AF
        PUSH	AF
        AND	0CH			; secundairy slot 0 ?
        JP	Z,J02FA			; yep, continue normally
        LD	A,H
        AND	0C0H			; page 0 ?
        JP	Z,J01B6			; yep, use special routine
        JP	J02FA			; continue normally

C143E:	RRCA
        RRCA
        LD	L,A
        AND	0C0H			;
        LD	D,A
        LD	A,L
        AND	03H
        RET

C1448:	LD	B,A
        AND	83H
        LD	C,A
        LD	A,(EXPTBL+0)
        CP	C
        LD	A,B
        RET

C1452:	LD	A,L
C1453:	LD	L,A
        AND	3FH
        LD	B,A
        AND	03H
        RRCA
        RRCA
        OR	B
        RET

J145D:	LD	A,L
        AND	0F3H
        LD	B,A
        RLCA
        RLCA
        AND	0CH
        OR	B
        JP	J026A


        DEFS	04F0H-$,0

;	Subroutine	ISCNTC
;	Inputs		________________________
;	Outputs		________________________


C04F0:	LD	A,(BASROM)
        AND	A
        RET	NZ			; execute extension ROM with BASIC text, quit
        PUSH	HL
        LD	HL,INTFLG
        DI
        LD	A,(HL)
        EI
        LD	(HL),0			; reset STOP status
        POP	HL
        AND	A
        RET	Z			; STOP or CTRL/STOP not pressed, quit
        CP	03H
        JR	Z,J0521			; handle CTRL/STOP
        PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	C0A37			; display cursor when disabled
        LD	HL,INTFLG
J050E:	DI
        LD	A,(HL)
        EI
        LD	(HL),0			; reset STOP status
        AND	A
        JR	Z,J050E			; STOP or CTRL/STOP not pressed yet, keep waiting
        PUSH	AF
        CALL	C0A84			; remove cursor when disabled
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        CP	03H
        RET	NZ
J0521:	PUSH	HL
        CALL	C055D			; KILBUF
        CALL	C0549			; excute ON STOP GOSUB valid ?
        JR	NC,J0534		; nope, stop basic program
        LD	HL,TRPTBL+10*3
        DI
        CALL	C0EF1			; flag STOP condition
        EI
        POP	HL
        RET

J0534:	CALL	C089E			; TOTEXT (force textmode)
        LD	A,(EXPTBL+0)
        LD	H,40H
        CALL	C0333			; ENASLT (basicrom on page 1)
        POP	HL
        XOR	A
        LD	SP,(SAVSTK)		; restore stack
        PUSH	BC
        JP	M63E6			; execute STOP statement

;	Subroutine	check if ON STOP valid
;	Inputs		________________________
;	Outputs		________________________


C0549:	LD	A,(TRPTBL+10*3+0)
        RRCA
        RET	NC			; ON STOP not ON, quit
        LD	HL,(TRPTBL+10*3+1)
        LD	A,H
        OR	L
        RET	Z			; has not STOP subroutine, quit
        LD	HL,(CURLIN)
        INC	HL
        LD	A,H
        OR	L
        RET	Z			; basic interpeter in direct mode, quit
        SCF				; flag execute ON STOP GOSUB valid
        RET

;	Subroutine	KILBUF (clears keyboardbuffer)
;	Inputs		________________________
;	Outputs		________________________


C055D:	LD	HL,(PUTPNT)
        LD	(GETPNT),HL
        RET

;	Subroutine	BREAKX
;	Inputs		________________________
;	Outputs		________________________


C0564:	IN	A,(0AAH)
        AND	0F0H
        OR	07H
        OUT	(0AAH),A
        IN	A,(0A9H)
        AND	10H
        RET	NZ
        IN	A,(0AAH)
        DEC	A
        OUT	(0AAH),A
        IN	A,(0A9H)
        AND	02H
        RET	NZ
        PUSH	HL
        LD	HL,(PUTPNT)
        LD	(GETPNT),HL		; clear keyboardbuffer
        POP	HL
        LD	A,(OLDKEY+7)
        AND	0EFH
        LD	(OLDKEY+7),A

        IF INTHZ EQ 60
        LD	A,14H
        ELSE
        LD	A,20H
        ENDIF

        LD	(REPCNT),A		; reset REPCNT
        SCF
        RET

;	Subroutine	INITIO
;	Inputs		________________________
;	Outputs		________________________


J0592:	LD	A,7
        LD	E,80H
        CALL	C1102			; WRTPSG
        LD	A,15
        LD	E,0CFH
        CALL	C1102			; WRTPSG
        LD	A,11
        LD	E,A
        CALL	C1102			; WRTPSG
        CALL	C110C
        AND	40H
        LD	(KANAMD),A		; save kanji layout
        LD	A,0FFH
        OUT	(90H),A

;	Subroutine	GICINI
;	Inputs		________________________
;	Outputs		________________________


C05B2:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        LD	HL,MUSICF
        LD	B,71H
        XOR	A
J05BC:	LD	(HL),A
        INC	HL
        DJNZ	J05BC
        LD	DE,VOICAQ
        LD	B,7FH
        LD	HL,0080H
J05C8:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        CALL	C14D8
        POP	AF
        ADD	A,8
        LD	E,00H
        CALL	C1102			; WRTPSG
        SUB	08H
        PUSH	AF
        LD	L,0FH
        CALL	C0C11
        EX	DE,HL
        LD	HL,I05FD
        LD	BC,6
        LDIR
        POP	AF
        POP	BC
        POP	HL
        POP	DE
        ADD	HL,DE
        EX	DE,HL
        INC	A
        CP	03H
        JR	C,J05C8
        LD	A,7
        LD	E,0B8H
        CALL	C1102			; WRTPSG
        JP	J0937

I05FD:	DEFB	004H,004H,078H,088H,0FFH,000H

;	Subroutine	ENASCR
;	Inputs		________________________
;	Outputs		________________________


J0603:	LD	A,(RG1SAV)
        OR	40H
        JR	J060F

;	Subroutine	DISSCR
;	Inputs		________________________
;	Outputs		________________________


J060A:	LD	A,(RG1SAV)
        AND	0BFH
J060F:	LD	B,A
        LD	C,1			; vdp register 1

;	Subroutine	WRTVDP
;	Inputs		________________________
;	Outputs		________________________


J0612:	LD	A,C
        AND	A
        JR	NZ,J061D
        LD	A,(RG0SAV)
        XOR	B
        RRCA
        JR	NC,J0629		; external vdp input bit unchanged, old way
                                        ; otherwise A>=080H and due next code handled by the subrom
J061D:	CP	08H
        JR	C,J0629			; vdp registers 1-7 handled the old way
        PUSH	IX
        LD	IX,S.WRTVDP
        JR	J0644			; others are handled by the subrom routine

J0629:	LD	A,B
        DI
        OUT	(VDP.CW),A
        LD	A,C
        OR	80H
        EI
        OUT	(VDP.CW),A
        PUSH	HL
        LD	A,B
        LD	B,00H
        LD	HL,RG0SAV
        ADD	HL,BC
        JP	J1440			; patch routine for V9958 digitize hardware

;	Subroutine	INITXT
;	Inputs		________________________
;	Outputs		________________________


J063E:	PUSH	IX
        LD	IX,S.INITXT
J0644:	JP	J0295			; INITXT handled by SUBROM

;	Subroutine	INIT32
;	Inputs		________________________
;	Outputs		________________________


J0647:	PUSH	IX
        LD	IX,S.INIT32
        JR	J0644			; INIT32 handled by SUBROM

;	Subroutine	INIGRP
;	Inputs		________________________
;	Outputs		________________________


J064F:	PUSH	IX
        LD	IX,S.INIGRP
        JR	J0644			; INIGRP handled by SUBROM

;	Subroutine	INIMLT
;	Inputs		________________________
;	Outputs		________________________


J0657:	PUSH	IX
        LD	IX,S.INIMLT
        JR	J0644			; INIMLT handled by SUBROM

;	Subroutine	SETTXT
;	Inputs		________________________
;	Outputs		________________________


J065F:	PUSH	IX
        LD	IX,S.SETTXT
        JR	J0644			; SETTXT handled by SUBROM

;	Subroutine	SETT32
;	Inputs		________________________
;	Outputs		________________________


J0667:	PUSH	IX
        LD	IX,S.SETT32
        JR	J0644			; SETT32 handled by SUBROM

;	Subroutine	SETGRP
;	Inputs		________________________
;	Outputs		________________________


J066F:	PUSH	IX
        LD	IX,S.SETGRP
        JR	J0644			; SETGRP handled by SUBROM

;	Subroutine	SETMLT
;	Inputs		________________________
;	Outputs		________________________


J0677:	PUSH	IX
        LD	IX,S.SETMLT
        JR	J0644			; SETMLT handled by SUBROM

;	Subroutine	CLRSPR
;	Inputs		________________________
;	Outputs		________________________


J067F:	PUSH	IX
        LD	IX,S.CLRSPR
        JR	J0644			; CLRSPR handled by SUBROM

;	Subroutine	setup for INIR/OTIR
;	Inputs		HL = vram adres, DE = ram adres, BC = size
;	Outputs		DE = vram adres, HL = ram adres, B = initial repeatcount, A = loopcount

C0687:	EX	DE,HL
        LD	A,C
        OR	A
        LD	A,B
        LD	B,C
        RET	Z			; low byte size zero, quit
        INC	A			; extra loop for mod 256
        RET

;	Subroutine	convert base vram adres to screenpage vram adres
;	Inputs		HL = base vram adres, D = active screenpage
;	Outputs		DHL = vram adres for screenpage

C068F:	EX	DE,HL
        LD	A,(SCRMOD)
        SUB	5
        JR	C,J06A6			; MSX1 style screenmode, screenpage ignored
        AND	02H
        LD	A,H
        JR	NZ,J069D		; screenmode 7 and 8 (and MSX2+ screenmodes), screensize 64Kb
        RRA				; extra shift for screensize 32Kb
J069D:	RRA
        LD	H,A
        LD	A,0
        LD	L,A
        ADC	A,A
        ADD	HL,DE
        LD	D,A
        RET

J06A6:	LD	D,0
        RET

;	Subroutine	CHKNEW (check if new style screenmode)
;	Inputs		________________________
;	Outputs		________________________


C06A9:	PUSH	BC
        LD	B,A
        LD	A,(SCRMOD)
        CP	5
        LD	A,B
        POP	BC
        RET

;	Subroutine	NSTWRT
;	Inputs		HL=vram adres (range:0-0FFFFH)
;	Outputs		________________________


C06B3:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	A,(ACPAGE)
        AND	A
        LD	D,A			; A16=0 / active screenpage
        CALL	NZ,C068F		; active screenpage non zero, convert baseadres to screenpage adres
        LD	A,H
        AND	3FH
        OR	40H
        JR	J06D3

;	Subroutine	NSETRD
;	Inputs		HL=vram adres (range:0-0FFFFH)
;	Outputs		________________________


C06C5:	PUSH	BC
        PUSH	DE
        PUSH	HL
        LD	A,(ACPAGE)
        AND	A
        LD	D,A			; A16=0 / active screenpage
        CALL	NZ,C068F		; active screenpage non zero, convert baseadres to screenpage adres
        LD	A,H
        AND	3FH
J06D3:	PUSH	AF
        LD	A,H
        AND	0C0H
        OR	D
        RLCA
        RLCA
        DI
        OUT	(VDP.CW),A
        LD	A,128+14
        OUT	(VDP.CW),A		; vdp register 14 (setup A16-A14 of vram adres)
        LD	A,L
        OUT	(VDP.CW),A
        POP	AF
        EI
        OUT	(VDP.CW),A
        POP	HL
        POP	DE
        POP	BC
        RET

;	Subroutine	CALPAT
;	Inputs		________________________
;	Outputs		________________________


J06EC:	LD	L,A
        LD	H,00H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        CALL	C070C			; GSPSIZ
        CP	08H
        JR	Z,J06FB
        ADD	HL,HL
        ADD	HL,HL
J06FB:	EX	DE,HL
        LD	HL,(PATBAS)
        ADD	HL,DE
        RET

;	Subroutine	CALATR
;	Inputs		________________________
;	Outputs		________________________


J0701:	LD	L,A
        LD	H,00H
        ADD	HL,HL
        ADD	HL,HL
        EX	DE,HL
        LD	HL,(ATRBAS)
        ADD	HL,DE
        RET

;	Subroutine	GSPSIZ
;	Inputs		________________________
;	Outputs		________________________


C070C:	LD	A,(RG1SAV)
        RRCA
        RRCA
        LD	A,8
        RET	NC
        LD	A,32
        RET

;	Subroutine	Initialize character pattern table
;	Inputs		________________________
;	Outputs		________________________
;	Remark		Unused code, same code is in subrom
;			code was used in INITXT and INIT32, but these too are moved in subrom

;?0717:	CALL	H.INIP
;	LD	HL,(CGPBAS)
;	CALL	C07F4			; SETWRT
;	LD	A,(CGPNT+0)
;	LD	HL,(CGPNT+1)
;	LD	BC,0800H
;	PUSH	AF
;J072A:	POP	AF
;	PUSH	AF
;	PUSH	BC
;	DI
;	CALL	C01F5			; RDSLT
;	EI
;	POP	BC
;	OUT	(VDP.DRW),A
;	INC	HL
;	DEC	BC
;	LD	A,C
;	OR	B
;	JR	NZ,J072A
;	POP	AF
;	RET



        DEFS	073DH-$,0


;	Subroutine	LDIRMV (vram to memory)
;	Inputs		HL = vram adres, DE = ram adres, BC = size
;	Outputs		________________________


C073D:	LD	A,(SCRMOD)
        CP	4
        JR	NC,J075A		; MSX2 screenmode, use faster methode
        LD	A,(MODE)
        AND	08H
        JR	NZ,J075A		; use fast transfer for MSX1 screenmodes, use fast methode
        CALL	C0808			; SETRD
        EX	(SP),HL
        EX	(SP),HL
J0750:	IN	A,(VDP.DRW)
        LD	(DE),A
        INC	DE
        DEC	BC
        LD	A,C
        OR	B
        JR	NZ,J0750
        RET

J075A:	CALL	C06C5			; NSETRD
        CALL	C0687			; setup for INIR
        LD	C,VDP.DRW
J0762:	INIR
        DEC	A
        JR	NZ,J0762
        EX	DE,HL
        RET

;	Subroutine	NWRVRM
;	Inputs		________________________
;	Outputs		________________________


J0769:	PUSH	AF
        CALL	C06B3			; NSTWRT
        EX	(SP),HL
        EX	(SP),HL
        POP	AF
        OUT	(VDP.DRW),A
        RET


        DEFS	0777H-$


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

;	This routine has same entrypoint as MSX1

C0777:	PUSH	IX
        LD	IX,S.CLS
        JP	J0295			; SUBROM

;	Subroutine	LDIRVM (memory to vram)
;	Inputs		HL = RAM adres, DE = VRAM adres, BC = size
;	Outputs		________________________


C0780:	EX	DE,HL
        LD	A,(SCRMOD)
        CP	04H
        JR	NC,J079C		; MSX2 screenmode, use fast methode
        LD	A,(MODE)
        AND	08H
        JR	NZ,J079C		; use fast transfer for MSX1 screenmodes, use fast methode
        CALL	C07F4			; SETWRT
J0792:	LD	A,(DE)
        OUT	(VDP.DRW),A
        INC	DE
        DEC	BC
        LD	A,C
        OR	B
        JR	NZ,J0792
        RET

J079C:	CALL	C06B3			; NSTWRT
        CALL	C0687			; setup for OTIR
        LD	C,VDP.DRW
J07A4:	OTIR
        DEC	A
        JR	NZ,J07A4
        EX	DE,HL
        RET

;	Subroutine	copy charpattern to PATWRK
;	Inputs		A = charcode
;	Outputs		________________________


C07AB:	LD	H,0
        LD	L,A
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        EX	DE,HL
        LD	HL,(CGPNT+1)
        ADD	HL,DE
        LD	DE,PATWRK
        LD	B,8
J07BB:	PUSH	HL
        PUSH	DE
        PUSH	BC
        LD	A,(CGPNT+0)
        CALL	C01F5			; RDSLT
        EI
        POP	BC
        POP	DE
        POP	HL
        LD	(DE),A
        INC	DE
        INC	HL
        DJNZ	J07BB
        RET

;	Subroutine	do cls
;	Inputs		________________________
;	Outputs		________________________


C07CE:	PUSH	IX
        LD	IX,S.CLRTXT
        JP	J0295			; SUBROM

;	Subroutine	WRTVRM
;	Inputs		________________________
;	Outputs		________________________


C07D7:	PUSH	AF
        CALL	C07F4			; SETWRT
        EX	(SP),HL
        EX	(SP),HL
        POP	AF
        OUT	(VDP.DRW),A
        RET

;	Subroutine	RDVRM
;	Inputs		________________________
;	Outputs		________________________


C07E1:	CALL	C0808			; SETRD
        EX	(SP),HL
        EX	(SP),HL
        IN	A,(VDP.DRW)
        RET

;	Subroutine	NRDVRM
;	Inputs		________________________
;	Outputs		________________________


J07E9:	CALL	C06C5			; NSETRD
        EX	(SP),HL
        EX	(SP),HL
        IN	A,(VDP.DRW)
        RET

;	Subroutine	set VDP for VRAM write at screenlocation
;	Inputs		H=x pos, L=y pos
;	Outputs		________________________


C07F1:	CALL	C0B98			; convert screenlocation to VRAM adres

;	Subroutine	SETWRT
;	Inputs		HL=vram adres
;	Outputs		________________________


C07F4:	XOR	A
        DI
        OUT	(VDP.CW),A
        LD	A,128+14
        OUT	(VDP.CW),A			; vdp register 14 = 0 (adres the first 16 Kb vram)
        LD	A,L
        OUT	(VDP.CW),A
        LD	A,H
        AND	3FH
        OR	40H
        OUT	(VDP.CW),A			; setup vdp for writing
        EI
        RET

;	Subroutine	SETRD
;	Inputs		________________________
;	Outputs		________________________


C0808:	XOR	A
        DI
        OUT	(VDP.CW),A
        LD	A,128+14
        OUT	(VDP.CW),A			; vdp register 14 = 0 (adres the first 16 Kb vram)
        LD	A,L
        OUT	(VDP.CW),A
        LD	A,H
        AND	3FH
        OUT	(VDP.CW),A
        EI
        RET

;	Subroutine	CHGCLR
;	Inputs		________________________
;	Outputs		________________________


J081A:	LD	A,(SCRMOD)
        DEC	A
        JP	M,J0881
        PUSH	AF
        CALL	C088E
        POP	AF
        RET	NZ
        LD	A,(FORCLR)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	HL,BAKCLR
        OR	(HL)
        LD	HL,(T32COL)
        LD	BC,32

;	Subroutine	BIGFIL
;	Inputs		________________________
;	Outputs		________________________


C0838:	PUSH	AF
        JR	J0841

;	Subroutine	FILVRM
;	Inputs		HL=vram adres,BC=size,A=data
;	Outputs		________________________


J083B:	PUSH	AF
        CALL	C06A9			; CHKNEW (check if new style screenmode)
        JR	C,J0853			; nope,
J0841:	CALL	C06B3			; NSTWRT
        LD	A,C
        OR	A
        JR	Z,J0849
        INC	B
J0849:	POP	AF
J084A:	OUT	(VDP.DRW),A
        DEC	C
        JP	NZ,J084A
        DJNZ	J084A
        RET

J0853:	POP	AF
        PUSH	HL
        PUSH	DE
        LD	E,A
        LD	A,H
        AND	3FH
        LD	H,A			; vram adres back in 16 Kb range
        PUSH	HL
        ADD	HL,BC
        DEC	HL
        LD	A,H
        CP	40H			; do we cross the 16 Kb border with this fill ?
        POP	HL
        JR	C,J087A			; nope,
        PUSH	BC
        XOR	A
        SUB	L
        LD	C,A
        LD	A,40H
        SBC	A,H
        LD	B,A			; size = 4000H-vram adres
        LD	A,E			; data
        CALL	C0838			; BIGFIL
        POP	BC
        ADD	HL,BC
        LD	C,L
        LD	A,H
        SUB	40H
        LD	B,A			; size = size-
        LD	HL,0			; start at vram adres 0
J087A:	LD	A,E			; data
        CALL	C0838			; BIGFIL
        POP	DE
        POP	HL
        RET


J0881:	LD	A,(FORCLR)
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	HL,BAKCLR
        OR	(HL)
        JR	J0891


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C088E:	LD	A,(BDRCLR)
J0891:	LD	B,A
        LD	C,7
        JP	J0612			; WRTVDP

;	Subroutine	CLS
;	Inputs		________________________
;	Outputs		________________________


J0897:	RET	NZ
        PUSH	HL
        CALL	C0777
        POP	HL
        RET

;	Subroutine	TOTEXT
;	Inputs		________________________
;	Outputs		________________________


C089E:	CALL	C0B4E			; check if screen is in textmode
        RET	C			; yep, do nothing
        LD	A,(OLDSCR)
        CALL	H.TOTE
        PUSH	IX
        LD	IX,S.CHGMDP
        JP	J0295			; SUBROM

;	Subroutine	CHGMOD
;	Inputs		________________________
;	Outputs		________________________


J08B1:	PUSH	IX
        LD	IX,S.CHGMOD
        JP	J0295			; CHGMOD is in SUBROM

;	Subroutine	LPTOUT
;	Inputs		________________________
;	Outputs		________________________


C08BA:	CALL	H.LPTO
        PUSH	AF
J08BE:	CALL	C0564			; BREAKX
        JR	C,J08D5
        CALL	C08E1			; LPTSTT
        JR	Z,J08BE
        POP	AF

;	Subroutine	write byte to printerport
;	Inputs		________________________
;	Outputs		________________________


C08C9:	PUSH	AF
        OUT	(91H),A
        XOR	A
        OUT	(90H),A			; strobe
        DEC	A
        OUT	(90H),A
        POP	AF
        AND	A
        RET

J08D5:	XOR	A
        LD	(LPTPOS),A
        LD	A,0DH
        CALL	C08C9			; write CR to printerport
        POP	AF
        SCF
        RET

;	Subroutine	LPTSTT
;	Inputs		________________________
;	Outputs		________________________


C08E1:	CALL	H.LPTS
        IN	A,(90H)
        RRCA
        RRCA
        CCF
        SBC	A,A
        RET

;	Subroutine	POSIT
;	Inputs		________________________
;	Outputs		________________________


C08EB:	LD	A,1BH
        RST	OUTDO
        LD	A,"Y"
        RST	OUTDO
        LD	A,L
        ADD	A,1FH
        RST	OUTDO
        LD	A,H
        ADD	A,1FH
        RST	OUTDO
        RET

;	Subroutine	CNVCHR
;	Inputs		________________________
;	Outputs		________________________


C08FA:	PUSH	HL
        PUSH	AF
        LD	HL,GRPHED
        XOR	A
        CP	(HL)
        LD	(HL),A
        JR	Z,J0911
        POP	AF
        SUB	40H	; "@"
        CP	20H	; " "
        JR	C,J090F
        ADD	A,40H	; "@"
J090D:	CP	A
        SCF
J090F:	POP	HL
        RET
;	-----------------
J0911:	POP	AF
        CP	01H	; 1
        JR	NZ,J090D
        LD	(HL),A
        POP	HL
        RET

;	Subroutine	CHPUT
;	Inputs		________________________
;	Outputs		________________________


J0919:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        CALL	H.CHPU
        CALL	C0B4E			; check if screen is in textmode
        JR	NC,J0937		; nope, quit
        CALL	C0A8B			; remove cursor when enabled
        POP	AF
        PUSH	AF
        CALL	C093C
        CALL	C0A3E			; display cursor when enabled
        LD	A,(CSRX)
        DEC	A
        LD	(TTYPOS),A
J0937:	POP	AF
J0938:	POP	BC
        POP	DE
        POP	HL
        RET

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C093C:	CALL	C08FA			; CNVCHR
        RET	NC
        LD	C,A
        JR	NZ,J0950
        LD	HL,ESCCNT
        LD	A,(HL)
        AND	A
        JP	NZ,J09EC
        LD	A,C
        CP	20H	; " "
        JR	C,J0971
J0950:	LD	HL,(CSRY)
        CP	7FH
        JP	Z,J0AFA
        CALL	C0B8D			; write char at screenlocation
        CALL	C0AA1			; move cursor right if possible
        RET	NZ			; was possible, quit
        XOR	A
        CALL	C0BDB			; mark line as succession
        LD	H,1

;	Subroutine	screencode LF
;	Inputs		________________________
;	Outputs		________________________


C0965:	CALL	C0ABE			; cursor down if possible
        RET	NZ			; possible, quit
        CALL	C0AC6			; update cursorpos
        LD	L,1
        JP	C0AE5			; delete line 1

J0971:	LD	HL,D098C-2
        LD	C,12


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C0976:	INC	HL
        INC	HL
        AND	A
        DEC	C
        RET	M
        CP	(HL)
        INC	HL
        JR	NZ,C0976
        LD	C,(HL)
        INC	HL
        LD	B,(HL)
        LD	HL,(CSRY)
        CALL	C098A
        XOR	A
        RET

;	Subroutine	call subroutine
;	Inputs		BC = adres of subroutine
;	Outputs		________________________


C098A:	PUSH	BC
        RET

D098C:	DEFB	7
        DEFW	C1113			; BEEP
        DEFB	8
        DEFW	C0AA9			; BS, cursor left with warp
        DEFB	9
        DEFW	C0ACE
        DEFB	10
        DEFW	C0965
        DEFB	11
        DEFW	C0ADC
        DEFB	12
        DEFW	C07CE			; do CLS
        DEFB	13
        DEFW	C0ADE
        DEFB	27
        DEFW	C09E6
        DEFB	28
        DEFW	C0AB8			; RIGHT, cursor right with linewarp
        DEFB	29
        DEFW	C0AA9			; LEFT, cursor left with linewarp
        DEFB	30
        DEFW	C0AB4			; UP, cursor up if possible
        DEFB	31
        DEFW	C0ABE			; DOWN, cursor down if possible

; ESC table

D09B0:	DEFB	"j"
        DEFW	C07CE			; ESC j, clear screen
        DEFB	"E"
        DEFW	C07CE			; ESC E, clear screen
        DEFB	"K"
        DEFW	C0B05			; ESC K, clear to end of line
        DEFB	"J"
        DEFW	C0B19			; ESC J, clear to end of screen
        DEFB	"l"
        DEFW	C0B03			; ESC l, clear line
        DEFB	"L"
        DEFW	C0AEE			; ESC L, insert line
        DEFB	"M"
        DEFW	C0AE2			; ESC M, delete line
        DEFB	"Y"
        DEFW	C09E3			; ESC Y, locate cursor
        DEFB	"A"
        DEFW	C0AB4			; ESC A, cursor up if possible
        DEFB	"B"
        DEFW	C0ABE			; ESC B, cursor down if possible
        DEFB	"C"
        DEFW	C0AA1			; ESC C, cursor right if possible
        DEFB	"D"
        DEFW	C0AB2			; ESC D, cursor left if possible
        DEFB	"H"
        DEFW	C0ADC			; ESC H, cursor home
        DEFB	"x"
        DEFW	C09DD			; ESC x
        DEFB	"y"
        DEFW	C09E0			; ESC y

; ESC x

C09DD:	LD	A,1
        DEFB	001H			; LD BC,xxxx (skip next instruction)

; ESC y

C09E0:	LD	A,2
        DEFB	001H			; LD BC,xxxx (skip next instruction)

; ESC Y

C09E3:	LD	A,4
        DEFB	001H			; LD BC,xxxx (skip next instruction)

; ESC handler

C09E6:	LD	A,0FFH
        LD	(ESCCNT),A		; mark start of ESC sequence
        RET

J09EC:	JP	P,J09FA			; esc sequence with parameter, handle
        LD	(HL),0			; esc sequence ends
        LD	A,C
        LD	HL,D09B0-2
        LD	C,15
        JP	C0976

J09FA:	DEC	A
        JR	Z,J0A1B			; esc x
        DEC	A
        JR	Z,J0A25			; esc y
        DEC	A
        LD	(HL),A
        LD	A,(LINLEN)		; max x coord
        LD	DE,CSRX
        JR	Z,J0A10			; busy with the x coord
        LD	(HL),3
        CALL	C0BE2			; get max linenumber
        DEC	DE			; CSRY
J0A10:	LD	B,A
        LD	A,C
        SUB	20H
        CP	B			; coord in range ?
        INC	A			; 1 based
        LD	(DE),A			; save cursor coord
        RET	C			; yep, quit
        LD	A,B
        LD	(DE),A			; nope, use the max
        RET

; ESC x handler

J0A1B:	LD	(HL),A			; esc sequence ends
        LD	A,C
        SUB	"4"
        JR	Z,J0A2C			; ESC x4, block cursor
        DEC	A
        JR	Z,J0A33			; ESC x5, cursor disabled
        RET				; other ESC x, ignore

; ESC y handler

J0A25:	LD	(HL),A			; esc sequence ends
        LD	A,C
        SUB	"4"
        JR	NZ,J0A30
        INC	A			; ESC y4, "insert" cursor
J0A2C:	LD	(CSTYLE),A
        RET

J0A30:	DEC	A
        RET	NZ			; other ESC y, ignore
        INC	A			; ESC y5, enable cursor
J0A33:	LD	(CSRSW),A
        RET

;	Subroutine	display cursor when disabled
;	Inputs		________________________
;	Outputs		________________________


C0A37:	LD	A,(CSRSW)
        AND	A
        RET	NZ			; cursor enabled, quit
        JR	J0A43			; display cursor

;	Subroutine	display cursor when enabled
;	Inputs		________________________
;	Outputs		________________________


C0A3E:	LD	A,(CSRSW)
        AND	A
        RET	Z			; cursor disabled, quit
J0A43:	CALL	H.DSPC
        CALL	C0B4E			; check if screen is in textmode
        RET	NC			; nope, quit
        LD	HL,(CSRY)
        PUSH	HL
        CALL	C0B83			; read char from screenlocation
        LD	(CURSAV),A		; save it
        LD	L,A
        LD	H,00H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        EX	DE,HL
        LD	HL,(CGPBAS)
        PUSH	HL
        ADD	HL,DE
        CALL	C0B54			; copy charpattern to LINWRK
        LD	HL,LINWRK+7
        LD	B,8
        LD	A,(CSTYLE)
        AND	A
        JR	Z,J0A70			; "block" cursor
        LD	B,3 			; "insert" cursor
J0A70:	LD	A,(HL)
        CPL
        LD	(HL),A
        DEC	HL
        DJNZ	J0A70
        POP	HL
        LD	BC,255*8
        ADD	HL,BC			; the cursor pattern
        CALL	C0B6B			; copy LINWRK to charpattern
        POP	HL
        LD	C,0FFH			; the cursor
        JP	C0B8D			; write char at screenlocation

;	Subroutine	remove cursor when disabled
;	Inputs		________________________
;	Outputs		________________________


C0A84:	LD	A,(CSRSW)
        AND	A
        RET	NZ			; cursor enabled, quit
        JR	J0A90			; remove cursor from screen

;	Subroutine	remove cursor when enabled
;	Inputs		________________________
;	Outputs		________________________


C0A8B:	LD	A,(CSRSW)
        AND	A
        RET	Z			; cursor disabled, quit
J0A90:	CALL	H.ERAC
        CALL	C0B4E			; check if screen is in textmode
        RET	NC			; nope, quit
        LD	HL,(CSRY)		; cursorlocation
        LD	A,(CURSAV)
        LD	C,A			; orginal char at cursorlocation
        JP	C0B8D			; write char at screenlocation

;	Subroutine	move cursor right if possible
;	Inputs		________________________
;	Outputs		________________________


C0AA1:	LD	A,(LINLEN)
        CP	H
        RET	Z			; already at end of line, quit
        INC	H			; cursor right
        JR	C0AC6			; update cursorpos

;	Subroutine	move cursor left with linewarp
;	Inputs		________________________
;	Outputs		________________________


C0AA9:	CALL	C0AB2			; cursor left if possible
        RET	NZ			; was possible, quit
        LD	A,(LINLEN)
        LD	H,A			; cursor at end of line
        DEFB	011H			; LD DE,xxxx (skip next 2 instructions), so cursor line up

;	Subroutine	move cursor left if possible
;	Inputs		________________________
;	Outputs		________________________


C0AB2:	DEC	H
        DEFB	03EH			; LD A,xx (skip next instruction)

;	Subroutine	move cursor up if possible
;	Inputs		________________________
;	Outputs		________________________


C0AB4:	DEC	L
        RET	Z			; already at top of screen, quit
        JR	C0AC6			; update cursorpos

;	Subroutine	move cursor right with linewarp
;	Inputs		________________________
;	Outputs		________________________


C0AB8:	CALL	C0AA1			; cursor right if possible
        RET	NZ			; was possible, quit
        LD	H,1			; start of line and linedown

;	Subroutine	cursor down if possible
;	Inputs
;	Outputs		________________________


C0ABE:	CALL	C0BE2			; get max linenumber
        CP	L
        RET	Z			; already at the bottom of screen, quit
        JR	C,J0ACA
        INC	L			; cursor down


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C0AC6:	LD	(CSRY),HL
        RET
;	-----------------
J0ACA:	DEC	L
        XOR	A
        JR	C0AC6			; update cursorpos
;	-----------------
C0ACE:	LD	A,20H	; " "
        CALL	C093C
        LD	A,(CSRX)
        DEC	A
        AND	07H	; 7
        JR	NZ,C0ACE
        RET
;	-----------------
C0ADC:	LD	L,01H	; 1

;	Subroutine	screencode CR
;	Inputs		________________________
;	Outputs		________________________


C0ADE:	LD	H,1
        JR	C0AC6			; update cursorpos
;	-----------------
C0AE2:	CALL	C0ADE

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C0AE5:	PUSH	IX
        LD	IX,S.DELLNO
        JP	J0295			; SUBROM
;	-----------------
C0AEE:	CALL	C0ADE

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C0AF1:	PUSH	IX
        LD	IX,S.INSLNO
        JP	J0295			; SUBROM

J0AFA:	CALL	C0AA9			; cursor left with warp
        RET	Z
        LD	C," "
        JP	C0B8D			; write char at screenlocation
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C0B03:	LD	H,1

;	Subroutine	EOL
;	Inputs		________________________
;	Outputs		________________________


C0B05:	CALL	C0BD9			; unmark line as succession
        PUSH	HL
        CALL	C07F1			; set VDP for VRAM write at screenlocation
        POP	HL
J0B0D:	LD	A," "
        OUT	(VDP.DRW),A
        INC	H
        LD	A,(LINLEN)
        CP	H
        JR	NC,J0B0D		; write blanks until the end of line
        RET

C0B19:	PUSH	HL
        CALL	C0B05			; EOL
        POP	HL
        CALL	C0BE2			; get max linenumber
        CP	L
        RET	C
        RET	Z
        LD	H,01H	; 1
        INC	L
        JR	C0B19

;	Subroutine	ERAFNK
;	Inputs		________________________
;	Outputs		________________________


J0B29:	CALL	H.ERAF
        XOR	A
        CALL	C0B4B
        RET	NC
        PUSH	HL
        LD	HL,(CRTCNT)
        CALL	C0B03
        POP	HL
        RET

;	Subroutine	FNKSB
;	Inputs		________________________
;	Outputs		________________________


J0B3A:	LD	A,(CNSDFG)
        AND	A
        RET	Z

;	Subroutine	DSPFNK
;	Inputs		________________________
;	Outputs		________________________


C0B3F:	CALL	H.DSPF
        PUSH	IX
        LD	IX,S.DSPFNK
        JP	J0295			; SUBROM
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C0B4B:	LD	(CNSDFG),A

;	Subroutine	check if in textmode
;	Inputs		________________________
;	Outputs		Cx set if in textmode

C0B4E:	LD	A,(SCRMOD)
        CP	02H
        RET

;	Subroutine	copy 8 bytes of vram to LINWRK
;	Inputs		HL=vram adres
;	Outputs		________________________


C0B54:	PUSH	HL
        LD	C,8
        JR	J0B61

;	Subroutine	copy screenline to LINWRK
;	Inputs		L=linenumber
;	Outputs		________________________
;	Remark		Unused code, code is in subrom
;			This code will not even work if screen is in 80 kol mode because LINWRK is only 40 bytes!

?0B59:	PUSH	HL
        CALL	C0B96			; convert linenumber to VRAM adres
        LD	A,(LINLEN)		; screenwidth
        LD	C,A
J0B61:	LD	B,00H
        LD	DE,LINWRK
        CALL	C073D			; LDIRMV (copy to LINWRK)
        POP	HL
        RET

;	Subroutine	copy 8 bytes from LINWRK to vram
;	Inputs		HL=vram adres
;	Outputs		________________________


C0B6B:	PUSH	HL
        LD	C,8
        JR	J0B78

;	Subroutine	copy LINWRK to screenline
;	Inputs		L=linenumber
;	Outputs		________________________
;	Remark		Unused code, code is in subrom
;			This code will not even work if screen is in 80 kol mode because LINWRK is only 40 bytes!

?0B70:	PUSH	HL
        CALL	C0B96			; convert linenumber to VRAM adres
        LD	A,(LINLEN)
        LD	C,A
J0B78:	LD	B,00H
        EX	DE,HL
        LD	HL,LINWRK
        CALL	C0780			; LDIRVM
        POP	HL
        RET

;	Subroutine	read char from screenlocation
;	Inputs		H=x pos, L=y pos
;	Outputs		A=char, C=char

C0B83:	PUSH	HL
        CALL	C0B98			; convert screenlocation to VRAM adres
        CALL	C07E1			; RDVRM
        LD	C,A
        POP	HL
        RET

;	Subroutine	write char at screenlocation
;	Inputs		H=x pos, L=y pos, C=char
;	Outputs		________________________


C0B8D:	PUSH	HL
        CALL	C07F1			; set VDP for VRAM write at screenlocation
        LD	A,C
        OUT	(VDP.DRW),A
        POP	HL
        RET

;	Subroutine	convert linenumber to VRAM adres
;	Inputs		L=y pos
;	Outputs		HL=vram adres in nametable

C0B96:	LD	H,1			; x pos = 1

;	Subroutine	convert screenlocation to VRAM adres
;	Inputs		H=x pos, L=y pos
;	Outputs		HL=vram adres in nametable

C0B98:	PUSH	BC
        DEC	H
        DEC	L			; make cursorpos 0 based
        LD	E,H
        LD	H,0
        LD	D,H
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        LD	C,L
        LD	B,H
        ADD	HL,HL
        ADD	HL,HL			; y pos*32
        LD	A,(SCRMOD)
        AND	A
        LD	A,(LINLEN)
        JR	Z,J0BB3			; screenmode 0,
        SBC	A,32+2
        JR	J0BC0			; screenmode 1, linlen-34

J0BB3:	CP	29H
        JR	C,J0BBD			; 40 kol mode,
        ADD	HL,BC			; y pos*40
        ADD	HL,HL			; y pos*80
        SBC	A,80+2
        JR	J0BC0			; screenmode 0 80 kol, linlen-82

J0BBD:	ADD	HL,BC			; y pos*40
        SBC	A,40+2
J0BC0:	ADD	HL,DE
        CPL
        AND	A
        RRA				; /2
        LD	E,A
        ADD	HL,DE
        EX	DE,HL
        LD	HL,(NAMBAS)
        ADD	HL,DE
        POP	BC
        RET

;	Subroutine	get LINTTB entry
;	Inputs		L = linenumber
;	Outputs		DE = LINTTB entry for line, A = , Zx when the one physiscal line is the succession of the line above

C0BCD:	PUSH	HL
        LD	DE,LINTTB-1
        LD	H,0
        ADD	HL,DE
        LD	A,(HL)
        EX	DE,HL
        POP	HL
        AND	A
        RET

;	Subroutine	unmark line as succession
;	Inputs		L = linenumber
;	Outputs		________________________


C0BD9:	DEFB	03EH			; LD A,xx (skip next instruction)
C0BDA:	XOR	A

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C0BDB:	PUSH	AF
        CALL	C0BCD			; get LINTTB entry
        POP	AF
        LD	(DE),A
        RET

;	Subroutine	get max linenumber
;	Inputs		________________________
;	Outputs		________________________


C0BE2:	LD	A,(CNSDFG)
        PUSH	HL
        LD	HL,CRTCNT
        ADD	A,(HL)
        POP	HL
        RET

;	Subroutine	SNSMAT
;	Inputs		________________________
;	Outputs		________________________


J0BEC:	LD	C,A
        DI
        IN	A,(0AAH)
        AND	0F0H
        ADD	A,C
        OUT	(0AAH),A
        EI
        IN	A,(0A9H)
        RET

;	Subroutine	ISFLIO
;	Inputs		________________________
;	Outputs		________________________


C0BF9:	CALL	H.ISFL
        PUSH	HL
        LD	HL,(PTRFIL)
        LD	A,L
        OR	H
        POP	HL
        RET

;	Subroutine	DCOMPR
;	Inputs		________________________
;	Outputs		________________________


J0C04:	LD	A,H
        SUB	D
        RET	NZ
        LD	A,L
        SUB	E
        RET

;	Subroutine	GETVCP
;	Inputs		________________________
;	Outputs		________________________


C0C0A:	LD	L,2
        JR	C0C11

;	Subroutine	GETVC2
;	Inputs		________________________
;	Outputs		________________________


J0C0E:	LD	A,(VOICEN)


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C0C11:	PUSH	DE
        LD	DE,VCBA
        LD	H,0
        ADD	HL,DE
        OR	A
        JR	Z,J0C22
        LD	DE,37
J0C1E:	ADD	HL,DE
        DEC	A
        JR	NZ,J0C1E
J0C22:	POP	DE
        RET
; The following NOP really puzzels me
; It has nothing to do with compatibility to MSX1 or so
; Maybe is just leftover space and 0C25 was pushed against 0C3C
        DEFS	0C25H-$,0

J0C25:	LD	A,(NEWKEY+6)
        RRCA
        JR	C,J0C34			; SHIFT not pressed, just a KANA ON
        XOR	A
        LD	(CHRCNT),A
        INC	A			; 1
        SET	0,(HL)			; SHIFT KANA mode
        JR	J0C39			; KANA led ON

J0C34:	LD	A,0FFH			; KANA on
J0C36:	LD	(KANAST),A

J0C39:	JP	J0F29			; KANA led

;	Subroutine	KEYINT
;	Inputs		________________________
;	Outputs		________________________
; 	Remark		Entry at the same adres as MSX1

J0C3C:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        EXX
        EX	AF,AF'
        PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        PUSH	IY
        PUSH	IX
        CALL	H.KEYI
; Changed from orginal
; MSX1 and above have:
;	IN	A,(VDP.SR)
;	AND	A

; 2+ has:
        CALL	J1479			; expansion code

; Reason: expansion of interrupt routine to handle pause key
;	-----------------
J0C50:	JP	P,J0D02
        CALL	H.TIMI
        EI
        LD	(STATFL),A
        AND	20H
        LD	HL,TRPTBL+11*3
        CALL	NZ,C0EF1		; Sprite coincidence, flag SPRITE condition
        LD	HL,(INTCNT)
        DEC	HL			; decrease interval counter
        LD	A,H
        OR	L
        JR	NZ,J0C73		; not time for interval yet, skip
        LD	HL,TRPTBL+17*3
        CALL	C0EF1			; flag INTERVAL condition
        LD	HL,(INTVAL)
J0C73:	LD	(INTCNT),HL
        LD	HL,(JIFFY)
        INC	HL
        LD	(JIFFY),HL		; update JIFFY counter
        LD	A,(MUSICF)
        LD	C,A
        XOR	A			; playqueue 0
J0C82:	RR	C
        PUSH	AF
        PUSH	BC
        CALL	C,C1131			; queue active, do queue
        POP	BC
        POP	AF
        INC	A
        CP	3
        JR	C,J0C82			; do all 3 playqueues
        LD	HL,SCNCNT
        DEC	(HL)			; time for a keyboard scan ?
        JR	NZ,J0D02		; nope, quit interrupt routine

        IF INTHZ EQ 60
        LD	(HL),2			; scanfrequency 2*1000/60 = 33 ms
        ELSE
        LD	(HL),1			; scanfrequency 1*1000/50 = 20 ms
        ENDIF

        XOR	A
        CALL	C1202
        AND	30H			; read joystick 0 trigger status
        PUSH	AF
        LD	A,1
        CALL	C1202
        AND	30H			; read joystick 1 trigger status
        RLCA
        RLCA
        POP	BC
        OR	B
        PUSH	AF
        CALL	C121C
        AND	01H			; read spacekey status
        POP	BC
        OR	B
        LD	C,A
        LD	HL,TRGFLG
        XOR	(HL)
        AND	(HL)
        LD	(HL),C
        LD	C,A
        RRCA
        LD	HL,TRPTBL+12*3
        CALL	C,C0EF1			; space key pressed, flag TRIG(0) condition
        RL	C
        LD	HL,TRPTBL+16*3
        CALL	C,C0EF1			; trigger B joystick 1 pressed, flag TRIG(4) condition
        RL	C
        LD	HL,TRPTBL+14*3
        CALL	C,C0EF1			; trigger A joystick 1 pressed, flag TRIG(2) condition
        RL	C
        LD	HL,TRPTBL+15*3
        CALL	C,C0EF1			; trigger B joystick 0 pressed, flag TRIG(3) condition
        RL	C
        LD	HL,TRPTBL+13*3
        CALL	C,C0EF1			; trigger A joystick 0 pressed, flag TRIG(1) condition
        XOR	A
        LD	(CLIKFL),A
        CALL	C0D12			; scan keyboard and translate to keycodes
        JR	NZ,J0D02		; keyboard buffer not empty, quit interrupt routine
        LD	HL,REPCNT
        DEC	(HL)
        JR	NZ,J0D02		; no autorepeat yet, quit interrupt routine
        LD	(HL),1			; autorepeat every keyboardscan
        LD	HL,OLDKEY
        LD	DE,OLDKEY+1
        LD	BC,11-1
        LD	(HL),0FFH
        LDIR				; reinitialize OLDKEY (to force new transitions)
        CALL	C0D4E			; scan for transitions and translate to keycodes
J0D02:	POP	IX
        POP	IY
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        EX	AF,AF'
        EXX
        POP	AF
        POP	BC
        POP	DE
        POP	HL
        EI
        RET

;	Subroutine	scan keyboard and translate to keycodes
;	Inputs		________________________
;	Outputs		Zx set if keyboardbuffer is empty
;	Remark		Entry at the same adres as MSX1

C0D12:	IN	A,(0AAH)
        AND	0F0H
        LD	C,A
        LD	B,11
        LD	HL,NEWKEY
J0D1C:	LD	A,C
        OUT	(0AAH),A
        IN	A,(0A9H)
        LD	(HL),A
        INC	C
        INC	HL
        DJNZ	J0D1C
        LD	A,(ENSTOP)
        AND	A
        JR	Z,J0D3A
        LD	A,(NEWKEY+6)
        CP	0E8H
        JR	NZ,J0D3A
        LD	IX,M409B
        JP	C02BF			; CALBAS

J0D3A:	LD	DE,OLDKEY+11
        LD	B,11
J0D3F:	DEC	DE
        DEC	HL
        LD	A,(DE)
        CP	(HL)
        JR	NZ,J0D49		; transition, reset REPCNT
        DJNZ	J0D3F
        JR	C0D4E

J0D49:
        IF INTHZ EQ 60
        LD	A,14H			; autorepeat at 20 keyboardscans (= 666 ms)
        ELSE
        LD	A,20H			; autorepeat at 32 keyboardscans (= 640 ms)
        ENDIF

        LD	(REPCNT),A

;	Subroutine	scan for transitions and translate to keycodes
;	Inputs		________________________
;	Outputs		________________________


C0D4E:	LD	B,0BH
        LD	HL,OLDKEY
        LD	DE,NEWKEY
J0D56:	LD	A,(DE)
        LD	C,A
        XOR	(HL)			; only keys which changed status
        AND	(HL)			; and are being pressed
        LD	(HL),C
        CALL	NZ,C0D89		; convert to scancode and handle
        INC	DE
        INC	HL
        DJNZ	J0D56

;	Subroutine	check if keyboardbuffer is empty
;	Inputs		________________________
;	Outputs		________________________


C0D62:	LD	HL,(GETPNT)
        LD	A,(PUTPNT)
        SUB	L
        RET

;	Subroutine	CHSNS
;	Inputs		________________________
;	Outputs		________________________
;	Remark		Entry at the same adres as MSX1

C0D6A:	EI
        PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	C0B4E			; check if screen is in textmode
        JR	NC,J0D82		; nope, skip functionkey display
        LD	A,(FNKSWI)
        LD	HL,NEWKEY+6
        XOR	(HL)
        LD	HL,CNSDFG
        AND	(HL)
        RRCA
        CALL	C,C0B3F			; DSPFNK
J0D82:	CALL	C0D62			; check keyboardbuffer is empty
        POP	BC
        POP	DE
        POP	HL
        RET

;	Subroutine	convert to scancode and handle
;	Inputs		________________________
;	Outputs		________________________
;	Remark		Entry at the same adres as MSX1

C0D89:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        LD	A,11
        SUB	B
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	C,A
        LD	B,8
        POP	AF
J0D97:	RRA
        PUSH	BC
        PUSH	AF
        CALL	C,K.HAND
        POP	AF
        POP	BC
        INC	C
        DJNZ	J0D97
        JP	J0938


        IF	KEYTYP EQ 0
        INCLUDE	KEYJAP
        ENDIF


        IF	KEYTYP EQ 1
        INCLUDE KEYINT
        ENDIF

        IF	KEYTYP EQ 2
        INCLUDE KEYFR
        ENDIF

        IF	KEYTYP EQ 3
        INCLUDE KEYUK
        ENDIF

        IF	KEYTYP EQ 4
        INCLUDE KEYGER
        ENDIF

        IF	KEYTYP EQ 5
        INCLUDE KEYRUS
        ENDIF

        IF	KEYTYP EQ 6
        INCLUDE KEYSPA
        ENDIF

        ORG	010C2H

;	Subroutine	increase keyboardbuffer pointer
;	Inputs		________________________
;	Outputs		________________________


C10C2:	INC	HL			; increase pointer
        LD	A,L
        CP	(KEYBUF+40) AND 255
        RET	NZ			; not the end of buffer, quit
        LD	HL,KEYBUF		; warp around to start of buffer
        RET

;	Subroutine	CHGET
;	Inputs		________________________
;	Outputs		________________________

C10CB:	PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	H.CHGE
        CALL	C0D6A			; CHSNS
        JR	NZ,J10E1
        CALL	C0A37			; display cursor when disabled
J10D9:	CALL	C0D6A			; CHSNS
        JR	Z,J10D9			; wait for input
        CALL	C0A84			; remove cursor when disabled
J10E1:	LD	HL,INTFLG
        LD	A,(HL)
        CP	04H	; 4
        JR	NZ,J10EB
        LD	(HL),00H
J10EB:	LD	HL,(GETPNT)
        LD	C,(HL)
        CALL	C10C2			; increase keyboardbuffer pointer (warp around)
        LD	(GETPNT),HL
        LD	A,C
        JP	J0938

;	Subroutine	CKCNTC
;	Inputs		________________________
;	Outputs		________________________


J10F9:	PUSH	HL
        LD	HL,0
        CALL	C04F0			; ISCNTC
        POP	HL
        RET

;	Subroutine	WRTPSG
;	Inputs		________________________
;	Outputs		________________________


C1102:	DI
        OUT	(0A0H),A
        PUSH	AF
        LD	A,E
        EI
        OUT	(0A1H),A
        POP	AF
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C110C:	LD	A,0EH

;	Subroutine	RDPSG
;	Inputs		________________________
;	Outputs		________________________


C110E:	OUT	(0A0H),A
        IN	A,(0A2H)
        RET

;	Subroutine	BEEP
;	Inputs		________________________
;	Outputs		________________________


C1113:	PUSH	IX
        LD	IX,S.BEEP
        JP	J0295			; SUBROM

J111C:	PUSH	AF
        LD	A,0FH
        OUT	(0A0H),A
        IN	A,(0A2H)
        AND	7FH
        LD	B,A
        POP	AF
        OR	A
        LD	A,80H
        JR	Z,J112D
        XOR	A
J112D:	OR	B
        OUT	(0A1H),A
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1131:	LD	B,A
        CALL	C0C0A			; GETVCP
        DEC	HL
        LD	D,(HL)
        DEC	HL
        LD	E,(HL)
        DEC	DE
        LD	(HL),E
        INC	HL
        LD	(HL),D
        LD	A,D
        OR	E
        RET	NZ
        LD	A,B
        LD	(QUEUEN),A
        CALL	C11D8
        CP	0FFH
        JR	Z,J11A6
        LD	D,A
        AND	0E0H
        RLCA
        RLCA
        RLCA
        LD	C,A
        LD	A,D
        AND	1FH
        LD	(HL),A
        CALL	C11D8
        DEC	HL
        LD	(HL),A
        INC	C
J115C:	DEC	C
        RET	Z
        CALL	C11D8
        LD	D,A
        AND	0C0H
        JR	NZ,J1177
        CALL	C11D8
        LD	E,A
        LD	A,B
        RLCA
        CALL	C1102			; WRTPSG
        INC	A
        LD	E,D
        CALL	C1102			; WRTPSG
        DEC	C
        JR	J115C
;	-----------------
J1177:	LD	H,A
        AND	80H
        JR	Z,J118B
        LD	E,D
        LD	A,B
        ADD	A,08H	; 8
        CALL	C1102			; WRTPSG
        LD	A,E
        AND	10H	; 16
        LD	A,0DH	; 13
        CALL	NZ,C1102		; WRTPSG
J118B:	LD	A,H
        AND	40H	; "@"
        JR	Z,J115C
        CALL	C11D8
        LD	D,A
        CALL	C11D8
        LD	E,A
        LD	A,0BH	; 11
        CALL	C1102			; WRTPSG
        INC	A
        LD	E,D
        CALL	C1102			; WRTPSG
        DEC	C
        DEC	C
        JR	J115C
;	-----------------
J11A6:	LD	A,B
        ADD	A,08H	; 8
        LD	E,00H
        CALL	C1102			; WRTPSG
        INC	B
        LD	HL,MUSICF
        XOR	A
        SCF
J11B4:	RLA
        DJNZ	J11B4
        AND	(HL)
        XOR	(HL)
        LD	(HL),A

;	Subroutine	STRTMS
;	Inputs		________________________
;	Outputs		________________________


J11BA:	LD	A,(MUSICF)
        OR	A
        RET	NZ
        LD	HL,PLYCNT
        LD	A,(HL)
        OR	A
        RET	Z
        DEC	(HL)
        LD	HL,1
        LD	(VCBA+0),HL
        LD	(VCBB+0),HL
        LD	(VCBC+0),HL
        LD	A,07H	; 7
        LD	(MUSICF),A
        RET
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C11D8:	LD	A,(QUEUEN)
        PUSH	HL
        PUSH	DE
        PUSH	BC
        CALL	C14AB
        JP	J0938

;	Subroutine	GTSTCK
;	Inputs		________________________
;	Outputs		________________________


J11E4:	DEC	A
        JP	M,J11F6
        CALL	C1202
        LD	HL,I1229
J11EE:	AND	0FH	; 15
        LD	E,A
        LD	D,00H
        ADD	HL,DE
        LD	A,(HL)
        RET

J11F6:	CALL	C121C			; read keyboard row 8
        RRCA
        RRCA
        RRCA
        RRCA
        LD	HL,I1239
        JR	J11EE


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1202:	LD	B,A
        LD	A,15
        DI
        CALL	C110E			; RDPSG
        DJNZ	J1211
        AND	0DFH
        OR	4CH
        JR	J1215

J1211:	AND	0AFH
        OR	03H
J1215:	OUT	(0A1H),A
        CALL	C110C			; read PSG register 14
        EI
        RET

;	Subroutine	read keyboard row 8
;	Inputs		________________________
;	Outputs		________________________


C121C:	DI
        IN	A,(0AAH)
        AND	0F0H
        ADD	A,08H	; 8
        OUT	(0AAH),A
        IN	A,(0A9H)
        EI
        RET

I1229:	DEFB	000H,005H,001H,000H
        DEFB	003H,004H,002H,003H
        DEFB	007H,006H,008H,007H
        DEFB	000H,005H,001H,000H

I1239:	DEFB	000H,003H,005H,004H
        DEFB	001H,002H,000H,003H
        DEFB	007H,000H,006H,005H
        DEFB	008H,001H,007H,000H

;	Subroutine	GTTRIG
;	Inputs		________________________
;	Outputs		________________________


J1249:	DEC	A
        JP	M,J1262
        PUSH	AF
        AND	01H
        CALL	C1202
        POP	BC
        DEC	B
        DEC	B
        LD	B,10H
        JP	M,J125D
        LD	B,20H
J125D:	AND	B
J125E:	SUB	01H
        SBC	A,A
        RET

J1262:	CALL	C121C
        AND	01H
        JR	J125E

;	Subroutine	GTPDL
;	Inputs		________________________
;	Outputs		________________________
;	Remark		Paddles are not supported by Turbo-R

J1269:	INC	A
        AND	A
        RRA
        PUSH	AF
        LD	B,A
        XOR	A
        SCF
J1270:	RLA
        DJNZ	J1270
        LD	B,A
        POP	AF
        LD	C,10H	; 16
        LD	DE,003AFH
        JR	NC,J1281
        LD	C,20H	; " "
        LD	DE,04C9FH
J1281:	LD	A,0FH	; 15
        DI
        CALL	C110E
        AND	E
        OR	D
        OR	C
        OUT	(0A1H),A
        XOR	C
        OUT	(0A1H),A
        LD	A,0EH	; 14
        OUT	(0A0H),A
        LD	C,00H
J1295:	IN	A,(0A2H)
        AND	B
        JR	Z,J129F
        INC	C
        JP	NZ,J1295
        DEC	C
J129F:	EI
        LD	A,C
        RET


;	Subroutine	GTPAD
;	Inputs		________________________
;	Outputs		________________________


J12A2:	CP	08H	; 8
        JR	C,J12AF
        PUSH	IX
        LD	IX,S.NEWPAD
        JP	J0295			; new style pads handled by SUBROM

J12AF:	CP	4
        LD	DE,0CECH

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C12B4:	JR	C,J12BB
        LD	DE,03D3H
        SUB	04H	; 4
J12BB:	DEC	A
        JP	M,J12C8
        DEC	A
        LD	A,(PADX)
        RET	M
        LD	A,(PADY)
        RET	Z
J12C8:	PUSH	AF
        EX	DE,HL
        LD	(FILNAM+0),HL
        SBC	A,A
        CPL
        AND	40H
        LD	C,A
        LD	A,15
        DI
        CALL	C110E			; RDPSG
        AND	0BFH
        OR	C
        OUT	(0A1H),A
        POP	AF
        JP	M,J12EB
        CALL	C110C
        EI
        AND	08H
        SUB	01H
        SBC	A,A
        RET

J12EB:	LD	C,00H
        CALL	C1335
        CALL	C1335
        JR	C,J131D
        CALL	C1323
        JR	C,J131D
        PUSH	DE
        CALL	C1323
        POP	BC
        JR	C,J131D
        LD	A,B
        SUB	D
        JR	NC,J1307
        CPL
        INC	A
J1307:	CP	05H	; 5
        JR	NC,J12EB
        LD	A,C
        SUB	E
        JR	NC,J1311
        CPL
        INC	A
J1311:	CP	05H	; 5
        JR	NC,J12EB
        LD	A,D
        LD	(PADX),A
        LD	A,E
        LD	(PADY),A
J131D:	EI
        LD	A,H
        SUB	01H	; 1
        SBC	A,A
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1323:	LD	C,0AH	; 10
        CALL	C1335
        RET	C
        LD	D,L
        PUSH	DE
        LD	C,00H
        CALL	C1335
        POP	DE
        LD	E,L
        XOR	A
        LD	H,A
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1335:	CALL	C135E
        LD	B,8
        LD	D,C
J133B:	RES	0,D
        RES	2,D
        CALL	C1370
        CALL	C110C
        LD	H,A
        RRA
        RRA
        RRA
        RL	L
        SET	0,D
        SET	2,D
        CALL	C1370
        DJNZ	J133B
        SET	4,D
        SET	5,D
        CALL	C1370
        LD	A,H
        RRA
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C135E:	LD	A,35H	; "5"
        OR	C
        LD	D,A
        CALL	C1370
J1365:	CALL	C110C
        AND	02H	; 2
        JR	Z,J1365
        RES	4,D
        RES	5,D


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1370:	PUSH	HL
        PUSH	DE
        LD	HL,(FILNAM+0)
        LD	A,L
        CPL
        AND	D
        LD	D,A
        LD	A,15
        OUT	(0A0H),A
        IN	A,(0A2H)
        AND	L
        OR	D
        OR	H
        OUT	(0A1H),A
        POP	DE
        POP	HL
        RET

;	Subroutine	STMOTR
;	Inputs		________________________
;	Outputs		________________________

J1387:	AND	A
        JP	M,J1395
J138B:	JR	NZ,J1390
        LD	A,09H
        DEFB	0C2H
J1390:	LD	A,08H
        OUT	(0ABH),A
        RET
J1395:	IN	A,(0AAH)
        AND	10H	; 16
        JR	J138B

;	Subroutine	NMI (NonMaskable Interrupt routine Z80)
;	Inputs		________________________
;	Outputs		________________________


J139B:	CALL	H.NMI
        RETN

;	Subroutine	INIFNK
;	Inputs		________________________
;	Outputs		________________________


J13A0:	LD	HL,FNKSTR
        LD	B,9FH
        PUSH	HL
        XOR	A
J13A7:	LD	(HL),A
        INC	HL
        DJNZ	J13A7
        POP	HL
        LD	B,10			; 10 functionkeys
        LD	DE,I13C3
J13B1:	LD	C,16
J13B3:	LD	A,(DE)
        INC	DE
        LD	(HL),A
        INC	HL
        DEC	C
        OR	A
        JR	NZ,J13B3
        PUSH	BC
        LD	B,0
        ADD	HL,BC
        POP	BC
        DJNZ	J13B1
        RET
;	-----------------
I13C3:	DEFM	'color ',0
        DEFM	'auto ',0
        DEFM	'goto ',0
        DEFM	'list ',0
        DEFM	'run',13,0

        IF BASVER EQ 0
        DEFM	'color 15,4,7',13,0
        ELSE
        DEFM	'color 15,4,4',13,0
        ENDIF

        DEFM	'load"',0
        DEFM	'cont',13,0
        DEFM	'list.',13,30,30,0
        DEFM	12,'run',13,0

        DEFS	140BH-$

;	Subroutine	RDVDP
;	Inputs		________________________
;	Outputs		________________________


J140B:	IN	A,(VDP.SR)
        RET

;	Subroutine	RSLREG
;	Inputs		________________________
;	Outputs		________________________


J140E:	IN	A,(0A8H)
        RET

;	Subroutine	WSLREG
;	Inputs		________________________
;	Outputs		________________________


J1411:	OUT	(0A8H),A
        RET

;	Subroutine	PHYDIO
;	Inputs		________________________
;	Outputs		________________________


J1414:	CALL	H.PHYD
        RET

;	Subroutine	FORMAT
;	Inputs		________________________
;	Outputs		________________________;


J1418:	CALL	H.FORM
        RET


; MSX2 has unused space at 141CH-1479H


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C141C:	LD	A,(MODE)
        AND	10H
        LD	E,212
        RET	Z
        LD	DE,256
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C1428:	LD	HL,(CLOC)
        LD	A,(RG25SA)
        AND	18H
        CP	18H
        RET	NZ
        LD	A,(MODE)
        AND	20H
        RET	NZ
        LD	(LOGOPR),A
        POP	HL
        JP	J16DE


; patchcode Turbo-R, use for initializing digitize hardware

J1440:	LD	(HL),A			; update RGSAV
        LD	H,A
        LD	A,(RG0SAV)
        AND	0EH
        RRCA				; M3,M4 and M5
        LD	L,A
        LD	A,(RG1SAV)
        AND	18H			; M2 and M1
        OR	L
        LD	L,A
        LD	A,(RG8SAV)
        AND	20H			; TP
        OR	L
        LD	L,A
        LD	A,(RG25SA)		; YAE and YJK
        AND	18H
        RLCA
        RLCA
        RLCA
        OR	L
        OUT	(0F3H),A
        LD	A,H
        POP	HL
        RET

        DEFS	146AH-$			; unused space, align to MSX2+ code

;	Subroutine	RDBTST
;	Inputs		________________________
;	Outputs		________________________


J146A:	IN	A,(0F4H)
        NOP
        RET

;	Subroutine	WRBTST
;	Inputs		________________________
;	Outputs		________________________


J146E:	NOP
        OUT	(0F4H),A
        RET
;	-----------------
J1472:	NOP
        NOP
        NOP
        NOP
        JP	M7D75

J1479:	IN	A,(0BAH)
        AND	010H
        JR	NZ,J148C
        LD	HL,DFAFF
        SET	7,(HL)
        LD	A,020H
        OUT	(0BBH),A
        OR	008H
        OUT	(0BBH),A
J148C:	IN	A,(VDP.SR)
        AND	A
        RET


;	Subroutine	PUTQ
;	Inputs		________________________
;	Outputs		________________________


J1490:	CALL	C14F8
        LD	A,B
        INC	A
        INC	HL
        AND	(HL)
        CP	C
        RET	Z
        PUSH	HL
        DEC	HL
        DEC	HL
        DEC	HL
        EX	(SP),HL
        INC	HL
        LD	C,A
        LD	A,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,A
        LD	B,00H
        ADD	HL,BC
        LD	(HL),E
        POP	HL
        LD	(HL),C
        RET
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C14AB:	CALL	C14F8
        LD	(HL),00H
        JR	NZ,J14CF		; putback flag set,
        LD	A,C
        CP	B
        RET	Z
        INC	HL
        INC	A
        AND	(HL)
        DEC	HL
        DEC	HL
        PUSH	HL
        INC	HL
        INC	HL
        INC	HL
        LD	C,A
        LD	A,(HL)
        INC	HL
        LD	H,(HL)
        LD	L,A
        LD	B,00H
        ADD	HL,BC
        LD	A,(HL)
        POP	HL
        LD	(HL),C
        OR	A
        RET	NZ
        INC	A
        LD	A,00H
        RET
;	-----------------
J14CF:	LD	C,A
        LD	B,00H
        LD	HL,QUEBAK-1
        ADD	HL,BC
        LD	A,(HL)
        RET
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C14D8:	PUSH	BC
        CALL	C1502			; get control blok queue
        LD	(HL),B
        INC	HL
        LD	(HL),B
        INC	HL
        LD	(HL),B
        INC	HL
        POP	AF
        LD	(HL),A
        INC	HL
        LD	(HL),E
        INC	HL
        LD	(HL),D
        RET

;	Subroutine	LFTQ
;	Inputs		________________________
;	Outputs		________________________


J14E9:	CALL	C14F8
        LD	A,B
        INC	A
        INC	HL
        AND	(HL)
        LD	B,A
        LD	A,C
        SUB	B
        AND	(HL)
        LD	L,A
        LD	H,00H
        RET
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C14F8:	CALL	C1502			; get controlblok queue
        LD	B,(HL)			; put pos
        INC	HL
        LD	C,(HL)			; get pos
        INC	HL
        LD	A,(HL)			; putback flag
        OR	A
        RET
;	-----------------

;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________

C1502:	RLCA
        LD	B,A
        RLCA
        ADD	A,B			; *6
        LD	C,A
        LD	B,00H
        LD	HL,(QUEUES)
        ADD	HL,BC
        RET

;	Subroutine	GRPPRT
;	Inputs		________________________
;	Outputs		________________________


J150E:	CALL	C06A9			; CHKNEW (check if new style screenmode)
        JR	C,J151C			; nope,
        PUSH	IX
        LD	IX,S.GRPPRT
        JP	J0295			; new style GRPPRT handled by SUBROM

J151C:	PUSH	HL
        PUSH	DE
        PUSH	BC
        PUSH	AF
        CALL	C08FA			; CNVCHR
        JR	NC,J1587
        JR	NZ,J152F
        CP	0DH
        JR	Z,J158A
        CP	20H
        JR	C,J1587
J152F:	CALL	C07AB			; copy charpattern to PATWRK
        LD	A,(FORCLR)
        LD	(ATRBYT),A
        LD	HL,(GRPACY)
        EX	DE,HL
        LD	BC,(GRPACX)
        CALL	C15A5			; SCALXY
        JR	NC,J1587
        CALL	C1604			; MAPXYC
        LD	DE,PATWRK
        LD	C,8			; 8 pixels vertical
J154D:	LD	B,8			; 8 pixels horizontal
        CALL	C1651			; FETCHC
        PUSH	HL
        PUSH	AF
        LD	A,(DE)
J1555:	ADD	A,A
        PUSH	AF
        CALL	C,C16C3			; has dot, SETC
        CALL	C1735			; pixel pos right if possible
        POP	HL
        JR	C,J1564			; not possible, quit with this row
        PUSH	HL
        POP	AF
        DJNZ	J1555
J1564:	POP	AF
        POP	HL
        CALL	C1658			; STOREC
        CALL	C17B4			; TDOWNC (pixel pos down if possible)
        JR	C,J1572			; not possible, quit
        INC	DE
        DEC	C
        JR	NZ,J154D
J1572:	CALL	C15FB			; check if screenmode 2 or 4
        LD	A,(GRPACX)
        JR	Z,J1580			; yep,
        ADD	A,20H
        JR	C,J158A
        JR	J1584

J1580:	ADD	A,08H
        JR	C,J158A
J1584:	LD	(GRPACX),A
J1587:	JP	J0937

J158A:	XOR	A
        LD	(GRPACX),A
        CALL	C15FB			; check if screenmode 2 or 4
        LD	A,(GRPACY)
        JR	Z,J1599			; yep,
        ADD	A,20H
        DEFB	001H			; skip next instruction
J1599:	ADD	A,08H
        CP	0C0H
        JR	C,J15A0
        XOR	A
J15A0:	LD	(GRPACY),A
        JR	J1587

;	Subroutine	SCALXY
;	Inputs		________________________
;	Outputs		________________________


C15A5:	PUSH	HL
        PUSH	BC
        LD	B,1
        EX	DE,HL
        LD	A,H
        ADD	A,A
        JR	NC,J15B3
        LD	HL,0
        JR	J15C4

J15B3:	LD	DE,192			; msx1 style screenmodes have ymax=192
        LD	A,(SCRMOD)
        CP	5
        CALL	NC,C141C		; new style screenmode, determine y-size
        NOP				; ??
        RST	DCOMPR
        JR	C,J15C6			; y-coordinate in range
        EX	DE,HL
        DEC	HL			; use max y-coordinate
J15C4:	LD	B,0
J15C6:	EX	(SP),HL
        LD	A,H
        ADD	A,A
        JR	NC,J15D0
        LD	HL,0			; negative x-coordinate, use x=0
        JR	J15E3

J15D0:	LD	DE,256			; most screenmodes have xmax 256
        LD	A,(SCRMOD)
        AND	07H
        CP	06H
        JR	C,J15DE
        LD	D,HIGH 512		; screenmode 6 and 7, xmax is 512
J15DE:	RST	DCOMPR
        JR	C,J15E5			; x-coordinate in range
        EX	DE,HL
        DEC	HL			; use max x-coordinate
J15E3:	LD	B,0
J15E5:	POP	DE
        LD	A,(SCRMOD)
        CP	03H
        JR	NZ,J15F5
        SRL	L
        SRL	L
        SRL	E
        SRL	E			; screenmode 3, divide coordinates by 4
J15F5:	LD	A,B
        RRCA
        LD	B,H
        LD	C,L
        POP	HL
        RET

;	Subroutine	check if screenmode 2 or 4
;	Inputs		________________________
;	Outputs		________________________


C15FB:	LD	A,(SCRMOD)
        CP	4
        RET	Z
        CP	2
        RET

;	Subroutine	MAPXYC
;	Inputs		________________________
;	Outputs		________________________


C1604:	LD	A,(SCRMOD)
        CP	05H	; 5
        JR	NC,J163E
        CP	03H	; 3
        JR	Z,J1648
        PUSH	BC
        LD	D,C
        LD	A,C
        AND	07H	; 7
        LD	C,A
        LD	HL,I1636
        ADD	HL,BC
        LD	A,(HL)
        LD	(CMASK),A
        LD	A,E
        RRCA
        RRCA
        RRCA
        AND	1FH
        LD	B,A
        LD	A,D
        AND	0F8H
        LD	C,A
        LD	A,E
        AND	07H	; 7
        OR	C
        LD	C,A
        LD	HL,(GRPCGP)
        ADD	HL,BC
        LD	(CLOC),HL
        POP	BC
        RET
;	-----------------
I1636:	DEFB	080H,040H,020H,010H,008H,004H,002H,001H

J163E:	LD	H,B
        LD	L,C
        LD	(CLOC),HL
        LD	A,E
        LD	(CMASK),A
        RET
;	-----------------
J1648:	PUSH	IX
        LD	IX,S.MAPXYC
        JP	J0295			; SUBROM

;	Subroutine	FETCHC
;	Inputs		________________________
;	Outputs		________________________


C1651:	LD	A,(CMASK)
        LD	HL,(CLOC)
        RET

;	Subroutine	STOREC
;	Inputs		________________________
;	Outputs		________________________


C1658:	LD	(CMASK),A
        LD	(CLOC),HL
        RET

;	Subroutine	READC
;	Inputs		________________________
;	Outputs		________________________


C165F:	CALL	C06A9			; CHKNEW (check if new style screenmode)
        JR	C,J166D			; nope,
J1664:	PUSH	IX
        LD	IX,S.READC
        JP	J0295			; READC new style handled by SUBROM

J166D:	CALL	C15FB			; check if screenmode 2 or 4
        JR	NZ,J1664		; nope, use subrom version of READC
        PUSH	BC
        PUSH	HL
        CALL	C1651			; FETCHC
        LD	B,A
        CALL	C07E1			; RDVRM
        AND	B
        PUSH	AF
        LD	BC,2000H
        ADD	HL,BC
        CALL	C07E1			; RDVRM
        LD	B,A
        POP	AF
        LD	A,B
        JR	Z,J168D
        RRCA
        RRCA
        RRCA
        RRCA
J168D:	AND	0FH
        POP	HL
        POP	BC
        RET

;	Subroutine	SETATR
;	Inputs		________________________
;	Outputs		________________________


J1692:	CALL	C169A
        RET	C
        LD	(ATRBYT),A
        RET

;	Subroutine	validate graphical attribute
;	Inputs		A = attribute
;	Outputs		Cx = if error

C169A:	PUSH	AF
        LD	A,(SCRMOD)
        CP	06H
        JR	Z,J16AE			; screenmode 6 has 4 colors
        CP	08H
        JR	Z,J16AB			; screenmode 8 has 256 colors, so it is always valid
        POP	AF
        CP	10H			; screenmode 2,3, 5 and 7 have 16 colors
        CCF
        RET

J16AB:	POP	AF
        AND	A
        RET

J16AE:	POP	AF
        CP	20H
        CCF
        RET	C
        CP	10H
        JR	C,J16BA
        AND	0FH
        RET

J16BA:	AND	03H
        PUSH	BC
        LD	B,A
        ADD	A,A
        ADD	A,A
        ADD	A,B
        POP	BC
        RET

;	Subroutine	SETC
;	Inputs		________________________
;	Outputs		________________________


C16C3:	LD	A,(SCRMOD)
        CP	05H
        JR	NC,J16E7		; new style screenmode, use VDP command
        CP	03H
        JR	Z,J16DE			; screenmode 3 SETC handled by SUBROM
        PUSH	HL
        PUSH	BC
        PUSH	DE
        LD	A,(CMASK)
        LD	HL,(CLOC)
        CALL	C18A6
        POP	DE
        POP	BC
        POP	HL
        RET

J16DE:	PUSH	IX
        LD	IX,S.SETC
        JP	J0295			; SUBROM

J16E7:	CALL	C1428
        LD	A,(CMASK)
        PUSH	AF
J16EE:	DI
        LD	A,02H
        OUT	(VDP.CW),A
        LD	A,8FH
        OUT	(VDP.CW),A
        PUSH	HL
        POP	HL
        IN	A,(VDP.SR)
        PUSH	AF
        XOR	A
        OUT	(VDP.CW),A
        LD	A,8FH
        OUT	(VDP.CW),A
        POP	AF
        EI
        RRCA
        JR	C,J16EE
        DI
        LD	A,24H
        OUT	(VDP.CW),A
        LD	A,91H
        OUT	(VDP.CW),A
        LD	A,L
        OUT	(VDP.CIW),A
        LD	A,H
        OUT	(VDP.CIW),A
        POP	AF
        OUT	(VDP.CIW),A
        LD	A,(ACPAGE)
        OUT	(VDP.CIW),A
        LD	A,2CH
        OUT	(VDP.CW),A
        LD	A,91H
        OUT	(VDP.CW),A
        LD	A,(ATRBYT)
        OUT	(VDP.CIW),A
        XOR	A
        OUT	(VDP.CIW),A
        LD	A,50H
        OUT	(VDP.CIW),A
        EI
        RET

;	Subroutine	pixel pos right if possible
;	Inputs		________________________
;	Outputs		________________________


C1735:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J1743			; yep,
        PUSH	IX
        LD	IX,S.TRIGHT
        JP	J0295			; SUBROM

J1743:	PUSH	HL
        CALL	C1651			; FETCHC
        RRCA
        JR	NC,J17AE
        LD	A,L
        AND	0F8H
        CP	0F8H
        LD	A,80H
        JR	NZ,J176B
        JP	J181C

;	Subroutine	RIGHTC
;	Inputs		________________________
;	Outputs		________________________


C1756:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J1764			; yep,
        PUSH	IX
        LD	IX,S.RIGHTC
        JP	J0295			; SUBROM

J1764:	PUSH	HL
        CALL	C1651			; FETCHC
        RRCA
        JR	NC,J17AE
J176B:	PUSH	DE
        LD	DE,8
        JR	J17A9

;	Subroutine	pixel pos left if possible
;	Inputs		________________________
;	Outputs		________________________


C1771:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J177F
        PUSH	IX
        LD	IX,S.TLEFTC
        JP	J0295			; SUBROM

J177F:	PUSH	HL
        CALL	C1651			; FETCHC
        RLCA
        JR	NC,J17AE
        LD	A,L
        AND	0F8H
        LD	A,01H
        JR	NZ,J17A5
        JP	J181C

;	Subroutine	LEFTC
;	Inputs		________________________
;	Outputs		________________________


J1790:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J179E
        PUSH	IX
        LD	IX,S.LEFTC
        JP	J0295			; SUBROM

J179E:	PUSH	HL
        CALL	C1651			; FETCHC
        RLCA
        JR	NC,J17AE
J17A5:	PUSH	DE
        LD	DE,-8
J17A9:	ADD	HL,DE
        LD	(CLOC),HL
        POP	DE
J17AE:	LD	(CMASK),A
        AND	A
        POP	HL
        RET

;	Subroutine	TDOWNC
;	Inputs		________________________
;	Outputs		________________________


C17B4:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J17C2
        PUSH	IX
        LD	IX,S.TDOWNC
        JP	J0295			; SUBROM

J17C2:	PUSH	HL
        PUSH	DE
        LD	HL,(CLOC)
        PUSH	HL
        LD	HL,(GRPCGP)
        LD	DE,01700H
        ADD	HL,DE
        EX	DE,HL
        POP	HL
        RST	DCOMPR
        JR	C,J17EF
        LD	A,L
        INC	A
        AND	07H
        JR	NZ,J17EF
        JR	J181B

;	Subroutine	DOWNC
;	Inputs		________________________
;	Outputs		________________________


J17DC:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J17EA
        PUSH	IX
        LD	IX,S.DOWNC
        JP	J0295			; SUBROM

J17EA:	PUSH	HL
        PUSH	DE
        LD	HL,(CLOC)
J17EF:	INC	HL
        LD	A,L
        LD	DE,00F8H
        JR	J1837

;	Subroutine	TUPC
;	Inputs		________________________
;	Outputs		________________________


J17F6:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J1804
        PUSH	IX
        LD	IX,S.TUPC
        JP	J0295			; SUBROM

J1804:	PUSH	HL
        PUSH	DE
        LD	HL,(CLOC)
        PUSH	HL
        LD	HL,(GRPCGP)
        LD	DE,0100H
        ADD	HL,DE
        EX	DE,HL
        POP	HL
        RST	DCOMPR
        JR	NC,J1832
        LD	A,L
        AND	07H	; 7
        JR	NZ,J1832
J181B:	POP	DE
J181C:	SCF
        POP	HL
        RET

;	Subroutine	UPC
;	Inputs		________________________
;	Outputs		________________________


J181F:	CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J182D
        PUSH	IX
        LD	IX,S.UPC
        JP	J0295			; SUBROM

J182D:	PUSH	HL
        PUSH	DE
        LD	HL,(CLOC)
J1832:	LD	A,L
        DEC	HL
        LD	DE,0FF08H
J1837:	AND	07H
        JR	NZ,J183C
        ADD	HL,DE
J183C:	LD	(CLOC),HL
        AND	A
        POP	DE
        POP	HL
        RET

;	Subroutine	NSETCX
;	Inputs		________________________
;	Outputs		________________________


C1843:	CALL	C15FB			; check if screenmode 2 or 4
        JP	NZ,J18F5
        PUSH	HL
        CALL	C1651			; FETCHC
        EX	(SP),HL
        ADD	A,A
        JR	C,J1869
        PUSH	AF
        LD	BC,-1
        RRCA
J1856:	ADD	HL,BC
        JR	NC,J189E
        RRCA
        JR	NC,J1856
        POP	AF
        DEC	A
        EX	(SP),HL
        PUSH	HL
        CALL	C18A6
        POP	HL
        LD	DE,8
        ADD	HL,DE
        EX	(SP),HL
J1869:	LD	A,L
        AND	07H	; 7
        LD	C,A
        LD	A,H
        RRCA
        LD	A,L
        RRA
        RRCA
        RRCA
        AND	3FH	; "?"
        POP	HL
        LD	B,A
        JR	Z,J188D
J1879:	XOR	A
        CALL	C07D7			; WRTVRM
        LD	DE,2000H
        ADD	HL,DE
        LD	A,(ATRBYT)
        CALL	C07D7			; WRTVRM
        LD	DE,2008H
        ADD	HL,DE
        DJNZ	J1879
J188D:	DEC	C
        RET	M
        PUSH	HL
        LD	HL,I1897
        ADD	HL,BC
        LD	A,(HL)
        JR	J18A5

I1897:	DEFB	080H,0C0H,0E0H,0F0H,0F8H,0FCH,0FEH

J189E:	ADD	A,A
        DEC	A
        CPL
        LD	B,A
        POP	AF
        DEC	A
        AND	B
J18A5:	POP	HL


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C18A6:	LD	B,A
        CALL	C07E1			; RDVRM
        LD	C,A
        LD	DE,2000H
        ADD	HL,DE
        CALL	C07E1			; RDVRM
        PUSH	AF
        AND	0FH
        LD	E,A
        POP	AF
        SUB	E
        LD	D,A
        LD	A,(ATRBYT)
        CP	E
        JR	Z,J18D8
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        CP	D
        JR	Z,C18DC
        PUSH	AF
        LD	A,B
        OR	C
        CP	0FFH
        JR	Z,J18E4
        PUSH	HL
        PUSH	DE
        CALL	C18DC
        POP	DE
        POP	HL
        POP	AF
        OR	E
        JR	J18F2

J18D8:	LD	A,B
        CPL
        AND	C
        DEFB	011H			; LD DE,xxxx (skip next 2 instructions)
C18DC:	LD	A,B
        OR	C


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C18DE:	LD	DE,2000H
        ADD	HL,DE
        JR	J18F2

J18E4:	POP	AF
        LD	A,B
        CPL
        PUSH	HL
        PUSH	DE
        CALL	C18DE
        POP	DE
        POP	HL
        LD	A,(ATRBYT)
        OR	D
J18F2:	JP	C07D7			; WRTVRM

J18F5:	PUSH	HL
        CALL	C16C3			; SETC
        CALL	C1756			; RIGHTC
        POP	HL
        DEC	L
        JR	NZ,J18F5
        RET

;	Subroutine	GTASPC
;	Inputs		________________________
;	Outputs		________________________


J1901:	LD	HL,(ASPCT1)
        EX	DE,HL
        LD	HL,(ASPCT2)
        RET

;	Subroutine	PNTINI
;	Inputs		________________________
;	Outputs		________________________


J1909:	PUSH	AF
        CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J1915
        POP	AF
        CP	10H
        CCF
        JR	J191A

J1915:	POP	AF
        LD	A,(ATRBYT)
        AND	A
J191A:	LD	(BDRATR),A
        RET

;	Subroutine	SCANR
;	Inputs		________________________
;	Outputs		________________________


J191E:	LD	HL,0
        LD	C,L
        CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J1930
        PUSH	IX
        LD	IX,S.SCANR
        JP	J0295			; SUBROM

J1930:	LD	A,B
        LD	(FILNAM+0),A
        XOR	A
        LD	(FILNAM+3),A
        LD	A,(BDRATR)
        LD	B,A
J193C:	CALL	C165F			; READC
        CP	B
        JR	NZ,J194F
        DEC	DE
        LD	A,D
        OR	E
        RET	Z
        CALL	C1735			; pixel pos right if possible
        JR	NC,J193C		; is possible,
        LD	DE,0
        RET

J194F:	CALL	C19D1
        PUSH	DE
        CALL	C1651			; FETCHC
        LD	(CSAVEA),HL
        LD	(CSAVEM),A
        LD	DE,0
J195F:	INC	DE
        CALL	C1735			; pixel pos right if possible
        JR	C,J1970			; not possible,
        CALL	C165F			; READC
        CP	B
        JR	Z,J1970
        CALL	C19D1
        JR	J195F

J1970:	PUSH	DE
        CALL	C1651			; FETCHC
        PUSH	HL
        PUSH	AF
        LD	HL,(CSAVEA)
        LD	A,(CSAVEM)
        CALL	C1658			; STOREC
        EX	DE,HL
        LD	(FILNAM+1),HL
        LD	A,(FILNAM+0)
        AND	A
        CALL	NZ,C1843		; NSETCX
        POP	AF
        POP	HL
        CALL	C1658			; STOREC
        POP	HL
        POP	DE
        JP	J19CC

;	Subroutine	SCANL
;	Inputs		________________________
;	Outputs		________________________


J1994:	LD	HL,0
        LD	C,L
        CALL	C15FB			; check if screenmode 2 or 4
        JR	Z,J19A6
        PUSH	IX
        LD	IX,S.SCANL
        JP	J0295			; SUBROM

J19A6:	XOR	A
        LD	(FILNAM+3),A
        LD	A,(BDRATR)
        LD	B,A
J19AE:	CALL	C1771			; pixel pos left if possible
        JR	C,J19C2			; not possible,
        CALL	C165F			; READC
        CP	B
        JR	Z,J19BF
        CALL	C19D1
        INC	HL
        JR	J19AE

J19BF:	CALL	C1756			; RIGHTC
J19C2:	PUSH	HL
        LD	DE,(FILNAM+1)
        ADD	HL,DE
        CALL	C1843			; NSETCX
        POP	HL
J19CC:	LD	A,(FILNAM+3)
        LD	C,A
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C19D1:	PUSH	HL
        LD	HL,ATRBYT
        CP	(HL)
        POP	HL
        RET	Z
        INC	A
        LD	(FILNAM+3),A
        RET

J19DD:	PUSH	BC
        PUSH	AF
        LD	BC,0
J19E2:	DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J19E2
        POP	AF
        POP	BC
J19E9:	PUSH	AF
        LD	A,09H	; 9
        OUT	(0ABH),A
        POP	AF
        EI
        RET
J19F1:	OR	A
        PUSH	AF
        LD	A,08H	; 8
        OUT	(0ABH),A
        LD	HL,0
J19FA:	DEC	HL
        LD	A,H
        OR	L
        JR	NZ,J19FA
        POP	AF
        LD	A,(HEADER)
        JR	Z,J1A07
        ADD	A,A
        ADD	A,A
J1A07:	LD	B,A
        LD	C,00H
        DI
J1A0B:	CALL	C1A4D
        CALL	C1A3F
        DEC	BC
        LD	A,B
        OR	C
        JR	NZ,J1A0B
        JP	C0564
J1A19:	LD	HL,(LOW.)
        PUSH	AF
        LD	A,L
        SUB	0EH	; 14
        LD	L,A
        CALL	C1A50
        POP	AF
        LD	B,08H	; 8
J1A27:	RRCA
        CALL	C,C1A40
        CALL	NC,C1A39
        DJNZ	J1A27
        CALL	C1A40
        CALL	C1A40
        JP	C0564

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1A39:	LD	HL,(LOW.)
        CALL	C1A50

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1A3F:	RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1A40:	CALL	C1A4D
        EX	(SP),HL
        EX	(SP),HL
        DEFB	0,0,0,0
        CALL	C1A4D
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1A4D:	LD	HL,(HIGH.)

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1A50:	PUSH	AF
J1A51:	DEC	L
        JP	NZ,J1A51
        LD	A,0BH	; 11
        OUT	(0ABH),A
J1A59:	DEC	H
        JP	NZ,J1A59
        LD	A,0AH	; 10
        OUT	(0ABH),A
        POP	AF
        RET
J1A63:	LD	A,08H	; 8
        OUT	(0ABH),A
        DI
        LD	A,0EH	; 14
        OUT	(0A0H),A
J1A6C:	LD	HL,0457H
J1A6F:	LD	D,C
        CALL	C1B34
        RET	C
        LD	A,C
        CP	0DEH
        JR	NC,J1A6C
        CP	05H	; 5
        JR	C,J1A6C
        SUB	D
        JR	NC,J1A82
        CPL
        INC	A
J1A82:	CP	04H	; 4
        JR	NC,J1A6C
        DEC	HL
        LD	A,H
        OR	L
        JR	NZ,J1A6F
        LD	HL,0
        LD	B,L
        LD	D,L
J1A90:	CALL	C1B34
        RET	C
        ADD	HL,BC
        DEC	D
        JP	NZ,J1A90
        LD	BC,06AEH
        ADD	HL,BC
        LD	A,H
        RRA
        AND	7FH
        LD	D,A
        ADD	HL,HL
        LD	A,H
        SUB	D
        LD	D,A
        SUB	06H	; 6
        LD	(LOWLIM),A
        LD	A,D
        ADD	A,A
        LD	B,00H
J1AAF:	SUB	03H	; 3
        INC	B
        JR	NC,J1AAF
        LD	A,B
        SUB	03H	; 3
        LD	(WINWID),A
        OR	A
        RET
J1ABC:	LD	A,(LOWLIM)
        LD	D,A
J1AC0:	CALL	C0564
        RET	C
        IN	A,(0A2H)
        RLCA
        JR	NC,J1AC0
J1AC9:	CALL	C0564
        RET	C
        IN	A,(0A2H)
        RLCA
        JR	C,J1AC9
        LD	E,00H
        CALL	C1B1F
J1AD7:	LD	B,C
        CALL	C1B1F
        RET	C
        LD	A,B
        ADD	A,C
        JP	C,J1AD7
        CP	D
        JR	C,J1AD7
        LD	L,08H	; 8
J1AE6:	CALL	C1B03
        CP	04H	; 4
        CCF
        RET	C
        CP	02H	; 2
        CCF
        RR	D
        LD	A,C
        RRCA
        CALL	NC,C1B23
        CALL	C1B1F
        DEC	L
        JP	NZ,J1AE6
        CALL	C0564
        LD	A,D
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1B03:	LD	A,(WINWID)
        LD	B,A
        LD	C,00H
J1B09:	IN	A,(0A2H)
        XOR	E
        JP	P,J1B17
        LD	A,E
        CPL
        LD	E,A
        INC	C
        DJNZ	J1B09
        LD	A,C
        RET
J1B17:	DEFB	0,0,0,0
J1B1B:	DJNZ	J1B09
        LD	A,C
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1B1F:	CALL	C0564
        RET	C

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1B23:	LD	C,00H
J1B25:	INC	C
        JR	Z,J1B32
        IN	A,(0A2H)
        XOR	E
        JP	P,J1B25
        LD	A,E
        CPL
        LD	E,A
        RET
J1B32:	DEC	C
        RET

;	  Subroutine __________________________
;	     Inputs  ________________________
;	     Outputs ________________________

C1B34:	CALL	C0564
        RET	C
        IN	A,(0A2H)
        RLCA
        JR	C,C1B34
        LD	E,00H
        CALL	C1B23
        JP	J1B25

;	Subroutine	OUTDO
;	Inputs		________________________
;	Outputs		________________________


J1B45:	PUSH	AF
        CALL	H.OUTD
        CALL	C0BF9			; ISFLIO
        JR	Z,J1B56
        POP	AF
        LD	IX,M6C48		; file i/o output
        JP	C02BF			; CALBAS

J1B56:	LD	A,(PRTFLG)
        OR	A
        JR	Z,J1BBB
        LD	A,(RAWPRT)
        AND	A
        JR	NZ,J1BAB
        POP	AF

;	Subroutine	OUTDLP
;	Inputs		________________________
;	Outputs		________________________


C1B63:	PUSH	AF
        CP	09H
        JR	NZ,J1B76
J1B68:	LD	A," "
        CALL	C1B63
        LD	A,(LPTPOS)
        AND	07H
        JR	NZ,J1B68
        POP	AF
        RET

J1B76:	SUB	0DH
        JR	Z,J1B84			; CR, lptpos=0
        JR	C,J1B87			; code 0-8 and 10-12 do not adjust lptpos
        CP	20H-0DH
        JR	C,J1B87			; code 14-31 do not adjust lptpos
        LD	A,(LPTPOS)
        INC	A			; increase lptpos
J1B84:	LD	(LPTPOS),A
J1B87:	LD	A,(NTMSXP)
        AND	A
        JR	Z,J1BAB			; msx printer, just print
        POP	AF
        CALL	C08FA			; CNVCHR
        RET	NC
        JR	NZ,J1BB7


        IF	KEYTYP EQ 0

; *************************************
; *************************************


        AND	A
        JP	P,J1BAC			; plain ascii, print
        CP	86H
        JR	C,J1BB7			; 80H-85H, print space
        CP	0A0H			; 86H-9FH ?
        JR	NC,J1BA4		; nope,
        ADD	A,20H
        JR	J1BAC			; adjust to A6H-BFH and print

J1BA4:	CP	0E0H			; E0H-FFH ?
        JR	C,J1BAC			; nope, print
        SUB	20H			; adjust to C0H-DFH
        DEFB	038H			; JR C,xxxx (skip next instruction)


; *************************************
; *************************************

        ENDIF

        ORG	01BABH

J1BAB:	POP	AF
J1BAC:	CALL	C08BA			; LPTOUT
        RET	NC
        LD	IX,M73B2		; device i/o error
        JP	C02BF			; CALBAS

J1BB7:	LD	A," "
        JR	J1BAC

J1BBB:	POP	AF
        JP	J0919			; CHPUT
;	-----------------
;	Characterset goes here
;	BEGIN
;	-----------------


D1BBF:

        IF	CHRGEN EQ 0

        IF	CNTRY EQ 9
        INCLUDE	CHRKOR
        ELSE
        INCLUDE CHRJAP
        ENDIF

        ENDIF

        IF	CHRGEN EQ 1

        IF	CNTRY EQ 10
        INCLUDE	CHRRUS
        ENDIF
        IF	CNTRY EQ 5
        INCLUDE CHRGER
        ENDIF

        IF	(CNTRY NE 10) AND (CNTRY NE 5)
        INCLUDE CHRINT
        ENDIF

        ENDIF


;	-----------------
;	Characterset goes here
;	END
;	-----------------

;	Subroutine	PINLIN
;	Inputs		________________________
;	Outputs		________________________


J23BF:	CALL	H.PINL
        LD	A,(AUTFLG)
        AND	A
        JR	NZ,J23D5
        LD	L,00H
        JR	J23E0

;	Subroutine	QINLIN
;	Inputs		________________________
;	Outputs		________________________


J23CC:	CALL	H.QINL
        LD	A,"?"
        RST	OUTDO
        LD	A," "
        RST	OUTDO

;	Subroutine	INLIN
;	Inputs		________________________
;	Outputs		________________________


J23D5:	CALL	H.INLI
        LD	HL,(CSRY)
        DEC	L
        CALL	NZ,C0BD9		; not line 1, unmark line above as succession
        INC	L
J23E0:	LD	(FSTPOS),HL
        XOR	A
        LD	(INTFLG),A
J23E7:	CALL	C10CB			; CHGET
        LD	HL,D2439-2
        LD	C,0BH
        CALL	C0976
        PUSH	AF
        CALL	NZ,C23FF
        POP	AF
        JR	NC,J23E7
        LD	HL,BUFMIN
        RET	Z
        CCF

; escape (do nothing)

C23FE:	RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C23FF:	PUSH	AF
        CP	09H
        JR	NZ,J2413
        POP	AF
J2405:	LD	A," "
        CALL	C23FF
        LD	A,(CSRX)
        DEC	A
        AND	07H
        JR	NZ,J2405
        RET

J2413:	POP	AF
        LD	HL,INSFLG
        CP	01H
        JR	Z,J2426
        CP	20H
        JR	C,J2428
        PUSH	AF
        LD	A,(HL)
        AND	A
        CALL	NZ,C24F2
        POP	AF
J2426:	RST	OUTDO
        RET

J2428:	LD	(HL),00H
        RST	OUTDO
        DEFB	03EH			; LD A,xx (skip next instruction)

;	Subroutine	change to "insert" cursor
;	Inputs		________________________
;	Outputs		________________________


J242C:	DEFB	03EH			; LD A,xx (skip next instruction)

;	Subroutine	change to "block" cursor
;	Inputs		________________________
;	Outputs		________________________


C242D:	XOR	A
        PUSH	AF
        CALL	C0A8B			; remove cursor when enabled
        POP	AF
        LD	(CSTYLE),A
        JP	C0A3E			; display cursor when enabled


D2439:	DEFB	8
        DEFW	C2561			; backspace
        DEFB	18
        DEFW	C24E5			; insert
        DEFB	27
        DEFW	C23FE			; escape
        DEFB	2
        DEFW	C260E			; ctrl-b (move to start of previous word)
        DEFB	6
        DEFW	C25F8			; ctrl-f (move to start of next word)
        DEFB	14
        DEFW	C25D7			; ctrl-n (append at end of line)
        DEFB	5
        DEFW	C25B9			; ctrl-e (erase text to the end of logical line)
        DEFB	3
        DEFW	C24C5			; ctrl-stop/ctrl-c
        DEFB	13
        DEFW	C245A			; return
        DEFB	21
        DEFW	C25AE			; ctrl-u (erase logical line)
        DEFB	127
        DEFW	C2550			; delete

; return

C245A:	CALL	C266C			; get start of logical line
        LD	A,(AUTFLG)
        AND	A
        JR	Z,J2465
        LD	H,1			; auto is on, start at begin of line (to get the linenumber as well)
J2465:	PUSH	HL
        CALL	C0A8B			; remove cursor when enabled
        POP	HL
        LD	DE,BUF
        LD	B,0FEH
        DEC	L
J2470:	INC	L
J2471:	PUSH	DE
        PUSH	BC
        CALL	C0B83			; read char from screenlocation
        POP	BC
        POP	DE
        AND	A
        JR	Z,J248F
        CP	20H
        JR	NC,J248A		; not character 0-01FH,
        DEC	B
        JR	Z,J249F			; no space for 2 characters,
        LD	C,A
        LD	A,1
        LD	(DE),A			; graphic controlcode
        INC	DE
        LD	A,C
        ADD	A,40H
J248A:	LD	(DE),A
        INC	DE
        DEC	B
        JR	Z,J249F			; no space left,
J248F:	INC	H			; go right
        LD	A,(LINLEN)
        CP	H
        JR	NC,J2471		; not at the end of line, continue
        PUSH	DE
        CALL	C0BCD			; get LINTTB entry
        POP	DE
        LD	H,1
        JR	Z,J2470			; logical line continues, continue with next line
J249F:	DEC	DE
        LD	A,(DE)
        CP	20H	; " "
        JR	Z,J249F
        PUSH	HL
        PUSH	DE
        CALL	C0A3E			; display cursor when enabled
        POP	DE
        POP	HL
        INC	DE
        XOR	A
        LD	(DE),A
J24AF:	LD	A,0DH	; 13
        AND	A
J24B2:	PUSH	AF
        CALL	C0BD9			; unmark line as succession
        CALL	C08EB			; POSIT
        LD	A,0AH
        RST	OUTDO
        XOR	A
        LD	(INSFLG),A
        POP	AF
        SCF
        POP	HL
        RET

J24C4:	INC	L

; ctrl-stop/ctrl-c

C24C5:	CALL	C0BCD			; get LINTTB entry
        JR	Z,J24C4
        CALL	C242D			; change to block cursor
        XOR	A
        LD	(BUF+0),A
        LD	H,01H	; 1
        PUSH	HL
        CALL	C05B2			; GICINI
        CALL	C0549
        POP	HL
        JR	C,J24AF
        LD	A,(BASROM)
        AND	A
        JR	NZ,J24AF
        JR	J24B2

; insert

C24E5:	LD	HL,INSFLG
        LD	A,(HL)
        XOR	0FFH
        LD	(HL),A
        JP	Z,C242D			; change to "block" cursor
        JP	J242C			; change to "insert" cursor


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C24F2:	CALL	C0A8B			; remove cursor when enabled
        LD	HL,(CSRY)
        LD	C,20H	; " "
J24FA:	PUSH	HL
J24FB:	PUSH	BC
        CALL	C0B83			; read char from screenlocation
        POP	DE
        PUSH	BC
        LD	C,E
        CALL	C0B8D			; write char at screenlocation
        POP	BC
        LD	A,(LINLEN)
        INC	H
        CP	H
        LD	A,D
        JR	NC,J24FB
        POP	HL
        CALL	C0BCD			; get LINTTB entry
        JR	Z,J254B
        LD	A,C
        CP	20H	; " "
        PUSH	AF
        JR	NZ,J2524
        LD	A,(LINLEN)
        CP	H
        JR	Z,J2524
        POP	AF
        JP	C0A3E			; display cursor when enabled

J2524:	CALL	C0BDA			; mark line as succession
        INC	L
        PUSH	BC
        PUSH	HL
        CALL	C0BE2			; get max linenumber
        CP	L
        JR	C,J2535
        CALL	C0AF1
        JR	J2544

J2535:	LD	HL,CSRY
        DEC	(HL)
        JR	NZ,J253C
        INC	(HL)
J253C:	LD	L,1
        CALL	C0AE5
        POP	HL
        DEC	L
        PUSH	HL
J2544:	POP	HL
        POP	BC
        POP	AF
        JP	Z,C0A3E			; display cursor when enabled
        DEC	L
J254B:	INC	L
        LD	H,1
        JR	J24FA

; delete

C2550:	LD	A,(LINLEN)
        CP	H
        JR	NZ,J255B
        CALL	C0BCD			; get LINTTB entry
        JR	NZ,J2595
J255B:	LD	A,1CH
        RST	OUTDO
        LD	HL,(CSRY)

; backspace

C2561:	PUSH	HL
        CALL	C0A8B			; remove cursor when enabled
        POP	HL
        DEC	H
        JP	NZ,J257A
        INC	H
        PUSH	HL
        DEC	L
        JR	Z,J2579
        LD	A,(LINLEN)
        LD	H,A
        CALL	C0BCD			; get LINTTB entry
        JR	NZ,J2579
        EX	(SP),HL
J2579:	POP	HL
J257A:	LD	(CSRY),HL
J257D:	LD	A,(LINLEN)
        CP	H
        JR	Z,J2595
        INC	H
J2584:	CALL	C0B83			; read char from screenlocation
        DEC	H
        CALL	C0B8D			; write char at screenlocation
        INC	H
        INC	H
        LD	A,(LINLEN)
        INC	A
        CP	H
        JR	NZ,J2584
        DEC	H
J2595:	LD	C," "
        CALL	C0B8D			; write char at screenlocation
        CALL	C0BCD			; get LINTTB entry
        JP	NZ,C0A3E		; display cursor when enabled
        PUSH	HL
        INC	L
        LD	H,1
        CALL	C0B83			; read char from screenlocation
        EX	(SP),HL
        CALL	C0B8D			; write char at screenlocation
        POP	HL
        JR	J257D

; ctrl-u (erase logical line)

C25AE:	CALL	C0A8B			; remove cursor when enabled
        CALL	C266C
        LD	(CSRY),HL
        JR	J25BE

; ctrl-e (erase text to the end of logical line)

C25B9:	PUSH	HL
        CALL	C0A8B			; remove cursor when enabled
        POP	HL
J25BE:	CALL	C0BCD			; get LINTTB entry
        PUSH	AF
        CALL	C0B05
        POP	AF
        JR	NZ,J25CD
        LD	H,1			; start of line
        INC	L			; next line
        JR	J25BE

J25CD:	CALL	C0A3E			; display cursor when enabled
        XOR	A
        LD	(INSFLG),A
        JP	C242D			; change to block cursor

; ctrl-n (append at end of line)

C25D7:	CALL	C0A8B			; remove cursor when enabled
        LD	HL,(CSRY)
        DEC	L
J25DE:	INC	L
        CALL	C0BCD			; get LINTTB entry
        JR	Z,J25DE
        LD	A,(LINLEN)
        LD	H,A			; begin and at of line
        INC	H
J25E9:	DEC	H
        JR	Z,J25F3
        CALL	C0B83			; read char from screenlocation
        CP	" "
        JR	Z,J25E9			; go left until non-space
J25F3:	CALL	C0AB8			; cursor right with linewarp
        JR	J25CD

; ctrl-f (move to start of next word)

C25F8:	CALL	C0A8B			; remove cursor when enabled
        CALL	C2634			; cursor left with warp and check if wordchar
J25FE:	CALL	C2624			; cursor right with warp and check if wordchar
        JR	Z,J25CD			; end of screen, quit
        JR	C,J25FE			; repeat until non-wordchar
J2605:	CALL	C2624			; cursor right with warp and check if wordchar
        JR	Z,J25CD			; end of screen, quit
        JR	NC,J2605		; repeat until wordchar
        JR	J25CD			; quit

; ctrl-b (move to start of previous word)

C260E:	CALL	C0A8B			; remove cursor when enabled
J2611:	CALL	C2634			; cursor left with warp and check if wordchar
        JR	Z,J25CD			; end of screen, quit
        JR	NC,J2611		; repeat until wordchar
J2618:	CALL	C2634			; cursor left with warp and check if wordchar
        JR	Z,J25CD			; end of screen, quit
        JR	C,J2618			; repeat until non-wordchar
        CALL	C0AB8			; cursor right with linewarp
        JR	J25CD

;	Subroutine	cursor right with warp and check if wordchar
;	Inputs		________________________
;	Outputs		Zx set if at bottomright position, Cx set if wordchar

C2624:	LD	HL,(CSRY)
        CALL	C0AB8			; cursor right with linewarp
        CALL	C0BE2			; get max linenumber
        LD	E,A
        LD	A,(LINLEN)
        LD	D,A			; bottom right position
        JR	J263D

;	Subroutine	cursor left with warp and check if wordchar
;	Inputs		________________________
;	Outputs		Zx set if at topleft position, Cx set if wordchar

C2634:	LD	HL,(CSRY)
        CALL	C0AA9			; cursor left with warp
        LD	DE,0101H		; top left position
J263D:	LD	HL,(CSRY)
        RST	DCOMPR
        RET	Z
        LD	DE,I2668
        PUSH	DE
        CALL	C0B83			; read char from screenlocation
        CP	"0"
        CCF
        RET	NC
        CP	"9"+1
        RET	C
        CP	"A"
        CCF
        RET	NC
        CP	"Z"+1
        RET	C
        CP	"a"
        CCF
        RET	NC
        CP	"z"+1
        RET	C
        CP	86H
        CCF
        RET	NC
        CP	0A0H
        RET	C
        CP	0A6H
        CCF
I2668:	LD	A,0
        INC	A			; flag NZ
        RET


;	Subroutine	__________________________
;	Inputs		________________________
;	Outputs		________________________


C266C:	DEC	L
        JR	Z,J2674			; at the top line,
        CALL	C0BCD			; get LINTTB entry
        JR	Z,C266C
J2674:	INC	L
        LD	A,(FSTPOS)
        CP	L			; at the line where input begun ?
        LD	H,1
        RET	NZ			; nope, begin at the start of the line
        LD	HL,(FSTPOS)
        RET				; yep, begin at position where input begun


; Some sort of jumptable for routines in basicrom


; entrypoint for 2nd part of the init routine
; not used, remained for compatibility reasons

?2680:	JP	M7C76

; entrypoint for SYNCHR

J2683:	JP	M558C

; entrypoint for CHRGTR

J2686:	JP	M4666

; entrypoint for GETYPR

J2689:	JP	M5597


        END