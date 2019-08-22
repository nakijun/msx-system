; *************************************
; BEGIN OF FRENCH KEYBOARD HANDLER
; *************************************

;
I0DA5:

;	Table	keycodes for scancode 000H-02FH Normal layout

        DEFB	85H,26H,82H,22H,27H,28H,0BFH,8AH
        DEFB	21H,87H,29H,2DH,3CH,0FFH,24H,6DH
        DEFB	97H,23H,3BH,3AH,3DH,00H,71H,62H
        DEFB	63H,64H,65H,66H,67H,68H,69H,6AH
        DEFB	6BH,6CH,2CH,6EH,6FH,70H,61H,72H
        DEFB	73H,74H,75H,76H,7AH,78H,79H,77H

; 	Table	keycodes for scancode 000H-02FH Shift layout

        DEFB	30H,31H,32H,33H,34H,35H,36H,37H
        DEFB	38H,39H,0F8H,5FH,3EH,0FFH,2AH,4DH
        DEFB	25H,9CH,2EH,2FH,2BH,00H,51H,42H
        DEFB	43H,44H,45H,46H,47H,48H,49H,4AH
        DEFB	4BH,4CH,3FH,4EH,4FH,50H,41H,52H
        DEFB	53H,54H,55H,56H,5AH,58H,59H,57H

;	Table	keycodes for scancode 000H-02FH Graph layout

        DEFB	09H,0ACH,0ABH,0BAH,0BBH,0EFH,0F4H,0FBH
        DEFB	0ECH,07H,01H,17H,0AEH,0FFH,0DH,06H
        DEFB	05H,0BDH,0F6H,1EH,0F1H,00H,0C4H,11H
        DEFB	0BCH,0C7H,0CDH,14H,15H,13H,0DCH,0C6H
        DEFB	0DDH,0C8H,0BH,1BH,0C2H,0DBH,0CCH,18H
        DEFB	0D2H,12H,0C0H,1AH,0CFH,1CH,19H,0FH

;	Table	keycodes for scancode 000H-02FH Shift+Graph layout

        DEFB	0AH,16H,0FDH,0FCH,0F7H,00H,0F5H,00H
        DEFB	00H,08H,02H,1FH,0AFH,0FFH,0EH,04H
        DEFB	03H,00H,00H,1DH,0F0H,00H,0FEH,00H
        DEFB	0FAH,0C1H,0CEH,0D4H,10H,0D6H,0DFH,0CAH
        DEFB	0DEH,0C9H,0CH,0D3H,0C3H,0D7H,0CBH,0A9H
        DEFB	0D1H,0D9H,0C5H,0D5H,0D0H,0F9H,0AAH,00H

;	Table	keycodes for scancode 000H-02FH Code layout

        DEFB	0EBH,7CH,40H,0E0H,60H,7BH,5EH,0EEH
        DEFB	0E7H,0E9H,7DH,0EDH,0F3H,0FFH,9BH,0B7H
        DEFB	0B9H,0E5H,86H,0A6H,0A7H,00H,84H,0E1H
        DEFB	8DH,8BH,8CH,94H,81H,0B1H,0A1H,91H
        DEFB	0B3H,0B5H,0E6H,0A4H,0A2H,0A3H,83H,93H
        DEFB	89H,96H,98H,95H,88H,9FH,0A0H,0DAH

;	Table	keycodes for scancode 000H-02FH Shift+Code layout

        DEFB	0D8H,0ADH,90H,9EH,00H,5BH,0BEH,7EH
        DEFB	0E2H,80H,5DH,0E8H,0F2H,0FFH,00H,0B6H
        DEFB	0B8H,0E4H,8FH,5CH,00H,00H,8EH,00H
        DEFB	00H,00H,00H,99H,9AH,0B0H,00H,92H
        DEFB	0B2H,0B4H,0A8H,0A5H,00H,0E3H,00H,00H
        DEFB	00H,00H,00H,00H,00H,00H,9DH,0EAH

;	Subroutine	rest of the functionkey handler
;	Inputs		C = code (035H-03EH)
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions from this point

J0EC5:	LD	E,C
        LD	D,00H
        LD	HL,FNKFLG-035H
        ADD	HL,DE
        LD	A,(HL)
        AND	A			; functionkey used for trap ?
        JR	NZ,J0EE3		; yep, handle trap
J0ED0:	EX	DE,HL
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        ADD	HL,HL
        LD	DE,FNKSTR-035H*16
        ADD	HL,DE
        EX	DE,HL			; pointer to functionkey definition string
J0EDA:	LD	A,(DE)
        AND	A			; end of string ?
        RET	Z			; yep, quit
        CALL	C0F55			; put keycode in keyboardbuffer
        INC	DE
        JR	J0EDA			; next

J0EE3:	LD	HL,(CURLIN)
        INC	HL
        LD	A,H
        OR	L			; interpreter in direct mode ?
        JR	Z,J0ED0			; yep, normal behavior
        LD	HL,TRPTBL-035H*3
        ADD	HL,DE
        ADD	HL,DE
        ADD	HL,DE

;	Subroutine	raise trap
;	Inputs		________________________
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

C0EF1:	LD	A,(HL)
        AND	01H			; trap enabled ?
        RET	Z			; nope, quit
        LD	A,(HL)
        OR	04H
        CP	(HL)			; trap occured flag set ?
        RET	Z			; yep, quit
        LD	(HL),A			; flag trap occured
        XOR	05H			; trap paused ?
        RET	NZ			; yep, quit
        LD	A,(ONGSBF)
        INC	A
        LD	(ONGSBF),A		; increase trap counter
        RET

;	Subroutine	handler HOME key
;	Inputs		-
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

C0F06:	LD	A,(NEWKEY+6)
        RRCA				; SHIFT key status
        LD	A,0CH			; assume SHIFT-HOME -> CLS keycode
        SBC	A,0			; no SHIFT pressed -> HOME keycode
        JR	C0F55			; put keycode in keyboardbuffer

;	Subroutine	handler easily converted keys
;	Inputs		A = scancode (030H-057H)
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

C0F10:	CALL	H.KEYA
        LD	E,A
        LD	D,00H
        LD	HL,I1041-030H
        ADD	HL,DE
        LD	A,(HL)
        AND	A
        RET	Z
        JR	C0F55

;	Table		scancode table
;	Remark		last scancode+1,low byte execution address

I0F1F:	DEFB	030H,LOW C0F83
        DEFB	033H,LOW C0F10
        DEFB	034H,LOW C0F36
        DEFB	035H,LOW C0F10
        DEFB	03AH,LOW C0FE7
        DEFB	03CH,LOW C0F10
        DEFB	03DH,LOW C0F46
        DEFB	040H,LOW C0F10
        DEFB	041H,LOW C0FF4
        DEFB	042H,LOW C0F06
        DEFB	0FFH,LOW C0F10

        DEFS	00F36H-$,0

;	Subroutine	handler CAPS key
;	Inputs		-
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

C0F36:	LD	HL,CAPST
        LD	A,(HL)
        CPL
        LD	(HL),A			; toggle CAPS status
        CPL				; adjust for CHGCAP and change CAPS led

;	Subroutine	CHGCAP
;	Inputs		________________________
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

K.BCAP:	AND	A
        LD	A,0CH
        JR	Z,J0F43
        INC	A
J0F43:	OUT	(0ABH),A
        RET

;	Subroutine	handler STOP key
;	Inputs		-
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

C0F46:	LD	A,(NEWKEY+6)
        RRCA
        RRCA				; CTRL key status
        LD	A,3			; CTRL-STOP
        JR	NC,J0F50		; CTRL pressed, flag CTRL-STOP
        INC	A			; STOP
J0F50:	LD	(INTFLG),A
        JR	C,J0F64			; STOP, continue in keyclick

;	Subroutine	put keycode in keyboardbuffer
;	Inputs		A = keycode
;	Outputs		________________________
;	Remark		entrypoint compatible among keyboard layout versions

C0F55:	LD	HL,(PUTPNT)
        LD	(HL),A			; put in keyboardbuffer
        CALL	C1069			; reset DEAD status, next postition in keyboardbuffer with roundtrip
        LD	A,(GETPNT)
        CP	L			; keyboard buffer full ?
        RET	Z			; yep, quit
        LD	(PUTPNT),HL		; update put pointer

;	Subroutine	make keyclick
;	Inputs		-
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

J0F64:	LD	A,(CLIKSW)
        AND	A			; keyclicks enabled ?
        RET	Z			; nope, quit
        LD	A,(CLIKFL)
        AND	A			; keyclick already done (only one click for multiple keys) ?
        RET	NZ			; yep, quit
        LD	A,0FH
        LD	(CLIKFL),A		; no keyclick until the next scan
        OUT	(0ABH),A		; set click bit
        LD	A,10
J0F77:	DEC	A
        JR	NZ,J0F77		; wait
                                        ; reset click bit

;	Subroutine	change click bit
;	Inputs		A = 0, A <> 0
;	Outputs		________________________
;	Remark		code identical among keyboard layout versions

K.BSND:	AND	A
        LD	A,0EH
        JR	Z,J0F80
        INC	A
J0F80:	OUT	(0ABH),A
        RET

;	Subroutine	handler scancodes 000H-02FH
;	Inputs		C = scancode (000H-02FH)
;	Outputs		________________________

C0F83:	LD	A,(NEWKEY+6)
        LD	E,A
        AND	14H
        CP	14H			; CODE or GRAPH key pressed ?
        JR	NZ,J0FA3		; yep,
        LD	A,C
        CP	0BH			; 0-9, or - key ?
        JR	C,J0F9E			; yep, use CAPS status
        CP	0FH			; ; key ?
        JR	Z,J0F9E			; yep, use CAPS status
        CP	22H			; M key ?
        JR	Z,J0FA3			; yep, ignore CAPS status
        CP	16H			; ^ \ @ ( : ) , . / _ ?
        JR	C,J0FA3			; yep, ignore CAPS status
J0F9E:	LD	A,(CAPST)
        AND	A			; in CAPS mode ?
        DEFB	038H			; JR C,xx skip next instruction
J0FA3:	XOR	A			; ignore CAPS mode
        LD	A,E
        JR	Z,J0FAA
        XOR	01H			; toggle SHIFT key status
        LD	E,A
J0FAA:	RRA
        RRA				; CTRL status in Cx
        PUSH	AF
        LD	A,E
        CPL
        NOP
        NOP				; patch from international keyboard handler
        RRA
        RRA
        RLCA
        AND	03H			; GRAPH and SHIFT status
        BIT	1,A
        JR	NZ,J0FC3		; GRAPH pressed, ignore CODE key, use GRAPH and SHIFT
        BIT	4,E			; CODE pressed ?
        JR	NZ,J0FC3		; nope, no GRAPH, no CODE, use only SHIFT
        OR	04H			; flag CODE pressed
        NOP
        NOP
        NOP				; patch from international keyboard handler
J0FC3:	LD	E,A
        ADD	A,A
        ADD	A,E
        ADD	A,A
        ADD	A,A
        ADD	A,A
        ADD	A,A
        LD	E,A			; *48 (6*8)
        LD	D,0
        LD	HL,I0DA5
        ADD	HL,DE			; keycode table
        LD	B,D
        ADD	HL,BC			; + scancode
        POP	AF
        LD	A,(HL)
        INC	A			; DEAD key ?
        JP	Z,J1B96			; yep, handle dead key
        DEC	A			; keycode for this combination ?
        RET	Z			; nope, quit
        JR	C,J0FFA			; no CTRL pressed, non CTRL handler
        AND	0DFH			; make upcase
        SUB	40H			; convert "@","A"-"Z" to keycode (controlcode)
        CP	20H			; was "@" or "A"-"Z" ?
        RET	NC			; nope, quit (ignore)
J0FE4:	JP	C0F55			; put keycode in keyboardbuffer

;	Subroutine	handler functionkeys
;	Inputs		C = scancode (035H-039H)
;	Outputs		________________________

C0FE7:	LD	A,(NEWKEY+6)
        RRCA				; SHIFT key pressed ?
        JR	C,J0FF1			; nope, F1-F5
        LD	A,C
        ADD	A,5
        LD	C,A			; yep, F6-F10
J0FF1:	JP	J0EC5			; rest of the functionkey handler

;	Subroutine	handler spacebar
;	Inputs		-
;	Outputs		________________________

C0FF4:	LD	A," "
        LD	B,0
        JR	J1009

J0FFA:	CP	20H			; keycode with graphic header ?
        JR	NC,J1009
        PUSH	AF
        LD	A,1			; put MSX header keycode in keyboard buffer
        CALL	C0F55			; put keycode in keyboardbuffer
        POP	AF
        ADD	A,40H			; to 040H-05FH keycode
        JR	J0FE4			; put keycode in keyboardbuffer

J1009:	LD	DE,(KANAST)
        INC	E
        DEC	E			; DEAD key was pressed ?
        JR	Z,J0FE4			; nope, no DEAD + letter sequence, put keycode in keyboardbuffer and quit
        LD	D,A
        OR	20H			; lowercase
        LD	HL,I106F+7-1
        LD	C,7
        CPDR				; valid DEAD letter ?
        LD	A,D
        JR	NZ,J0FE4		; nope, put keycode in keyboardbuffer and quit
        INC	HL
        LD	C,7
J1021:	ADD	HL,BC
        DEC	E
        JR	NZ,J1021		; to correct DEAD table
        BIT	5,D			; upcase letter ?
        JR	NZ,J102C		; nope,
        LD	C,14
        ADD	HL,BC
J102C:	LD	A,(HL)
        JR	J0FE4			; put keycode in keyboardbuffer and quit

;	Subroutine	K.HAND (not offical name)
;	Inputs		C = scancode
;	Outputs		________________________

K.HAND:	LD	A,C
        LD	HL,I0F1F
        CALL	H.KEYC
        LD	D,HIGH C0F06		; it is assumed that all handlers are in the 0F00H-0FFFH area!
J1038:	CP	(HL)
        INC	HL
        LD	E,(HL)			; handler (low byte)
        INC	HL
        PUSH	DE
        RET	C			; yep, continue in handler
        POP	DE
        JR	J1038			; next

;	Table		keycodes for easily converted keys
;	Remark		scancodes 030H-057H

I1041:	DEFB	00H,00H,00H,00H,00H,00H,00H,00H
        DEFB	00H,00H,1BH,09H,00H,08H,18H,0DH
        DEFB	" ",0CH,12H,7FH,1DH,1EH,1FH,1CH
        DEFB	"*" ,"+" ,"/" ,"0" ,"1" ,"2" ,"3" ,"4"
        DEFB	"5" ,"6" ,"7" ,"8" ,"9" ,"-" ,"," ,"."

;	Subroutine	reset DEAD status, next postition in keyboardbuffer with roundtrip
;	Inputs		-
;	Outputs		________________________
;	Remark		Unused, leftover from international keyboard handler

C1069:	XOR	A
        LD	(KANAST),A
        JR	C10C2

;	Table	valid DEAD letters

I106F:	DEFB	"a" ,"e" ,"i" ,"o" ,"u" ,"y" ," "

;	Table	translation DEAD

        DEFB	083H,088H,08CH,093H,096H,079H,05EH

;	Table	translation SHIFT DEAD

        DEFB	084H,089H,08BH,094H,081H,098H,020H

;	Table	translation DEAD upcase

        DEFB	"A" ,"E" ,"I" ,"O" ,"U" ,"Y" ,05EH

;	Table	translation SHIFT DEAD upcase

        DEFB	08EH,"E" ,"I" ,099H,09AH,"Y" ,020H


        DEFS	010C2H-$,0


        ORG	01B94H

        JR	J1BAC

;	Subroutine	handler DEAD key
;	Inputs		-
;	Outputs		________________________

J1B96:	LD	A,(NEWKEY+6)
        LD	E,A
        OR	0FEH		; SHIFT key status (rest of bits 1)
        CPL
        INC	A
        LD	(KANAST),A	; set DEAD status (001H-002H)
        JP	J0F64		; make keyclick

        DEFS	01BABH-$,0

; *************************************
; END OF FRENCH KEYBOARD HANDLER
; *************************************