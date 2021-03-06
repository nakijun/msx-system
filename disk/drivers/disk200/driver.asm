; A driver section for stand alone DOS2.
; (C) 1995 by Ultrasoft
;
; By:	A.Zeilemaker
;	Woldweg 195
;	9606 PD Kropswolde
;	The Netherlands
;
; Last revision:	Tuesday 07-03-1995
; Version:		1.00

        .Z80


; Used externals from system kernel (permited)
;
;		EXTRN	GETSLT
;		EXTRN	DIV16
;		EXTRN	GETWRK
;		EXTRN	SETINT
;		EXTRN	PRVINT
;		EXTRN	PROMPT


; Publics for DOS1 or DOS2 kernel

;		PUBLIC	INIHRD
;		PUBLIC	DRIVES
;		PUBLIC	INIENV
;		PUBLIC	DSKIO
;		PUBLIC	DSKCHG
;		PUBLIC	GETDPB
;		PUBLIC	CHOICE
;		PUBLIC	DSKFMT
;		PUBLIC	MTOFF
;		PUBLIC	OEMSTA
;
;		PUBLIC	MYSIZE
;		PUBLIC	SECLEN
;		PUBLIC	DEFDPB		; UltraSoft DRIVER routine


DOS2		equ	1		; Which kernel

MYSIZE		equ	0		; Size of environment
SECLEN		equ	512		; Size of biggest sector


;RAWFLG		equ	0F30Dh
;_SECBUF		equ	0F34Dh
;XFER		equ	0F36Eh

;DISINT		equ	0FFCFh
;ENAINT		equ	0FFD4h

;PROCNM		equ	0FD89H


; INIHRD
;
; Input:	None
; Output:	None
; Changed:	AF,BC,DE,HL,IX,IY may be affected

INIHRD:
        ret

; DRIVES
;
; Input: 	F	Zx set if to return physical drives
;			Zx reset if to return at least 2 drives, if only one
;			  physical drive it becomes a phantom drive
; Output:	L	number of drives
; Changed:	F,HL,IX,IY may be affected

DRIVES:
        ld	l,0
        ret

; INIENV
;
; Input: 	None
; Output:	None
; Changed:	AF,BC,DE,HL,IX,IY may be affected
;

INIENV:
        ret

;
; DSKIO
;
; Input: 	A	Drivenumber
;		F	Cx reset for read
;			Cx set for write
; 		B	number of sectors
; 		C	Media descriptor
;		DE	logical sectornumber
; 		HL	transferaddress
; Output:	F	Cx set for error
;			Cx reset for ok
;		A	if error, errorcode
;		B	if error, remaining sectors
; Changed:	AF,BC,DE,HL,IX,IY may be affected

DSKIO:
        ld	a,0Ch
        scf
        ret

; DSKCHG
;
; Input: 	A	Drivenumber
; 		B	0
; 		C	Media descriptor
; 		HL	pointer to DPB
; Output:	F	Cx set for error
;			Cx reset for ok
;		A	if error, errorcode
;		B	if no error, disk change status
;			01 disk unchanged
;			00 unknown
;			FF disk changed
; Changed:	AF,BC,DE,HL,IX,IY may be affected


DSKCHG:
        ld	a,0Ch
        scf
        ret

; GETDPB
;
; Input: 	A	Drivenumber
; 		B	first byte of FAT
; 		C	Media descriptor
; 		HL	pointer to DPB
; Output:	[HL+1]
;		..
;		[HL+18]	updated
; Changed:	AF,BC,DE,HL,IX,IY may be affected

GETDPB:
        scf
        ret

; CHOICE
;
; Input: 	None
; Output:	HL	pointer to choice string, 0 if no choice
; Changed:	AF,BC,DE,HL,IX,IY may be affected

CHOICE:
        ld	hl,0
        ret

; DSKFMT
;
; Input: 	A	choicecode (1-9)
;		D	drivenumber
;		HL	begin of workarea
;		BC	length of workarea
; Output:	F	Cx set for error
;			Cx reset for ok
;		A	if error, errorcode
; Changed:	AF,BC,DE,HL,IX,IY may be affected
;

DSKFMT:
        ld	a,010h
        scf
        ret

; OEMSTATEMENT
;
; Input:	HL	basicpointer
; Output:	F	Cx set if statement not recognized
;			Cx reset if statement is recognized
;		HL	basicpointer,	updated if recognized
;					unchanged if not recognized
; Changed:	AF,BC,DE,HL,IX,IY may be affected

OEMSTA:
        scf
        ret

; MTOFF
;
; Input:	None
; Output:	None
; Changed:	AF,BC,DE,HL,IX,IY may be affected

MTOFF:
        ret

; DEFDPB
;

fakedpb:	ds	18,0

DEFDPB		equ	fakedpb-1

