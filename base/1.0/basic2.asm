; BASIC.ASM

; MSX BASIC ROM, MSX 1 version (version 1.0)

; Source re-created by Z80DIS 2.2
; Z80DIS was written by Kenneth Gielow, Palo Alto, CA

; Code Copyrighted by ASCII and maybe others
; Source comments by Arjen Zeilemaker

; Sourcecode supplied for STUDY ONLY
; Recreation NOT permitted without authorisation of the copyrightholders


        ORG     392EH

KEYWRD  MACRO   ?X, ?Y
        LOCAL   G, Q
G       DEFL    0
Q       DEFL    0
        IRP     ?D, <?X>
        IF      G EQ 0
G       DEFL    1
        ELSE
        IF      Q NE 0
        DEFB    Q
        ENDIF
Q       DEFL    "&?D"
        ENDIF
        ENDM
        DEFB    Q+128
        DEFB    ?Y
        ENDM


TOKEN   MACRO   ?X, ?Y
        DEFB    ?X+128
        DEFB    ?Y
        ENDM


; BASIC tokens
;
; 00                    line endmarker
; 01-0A                 unknown
; 0B LLHH               octal number
; 0C LLHH               hexadecimal number
; 0D LLHH               linepointer
; 0E LLHH               linenumber
; 0F LL                 integer 11-255
; 10                    internal token
; 11                    integer 0
; 12                    integer 1
; 13                    integer 2
; 14                    integer 3
; 15                    integer 4
; 16                    integer 5
; 17                    integer 6
; 18                    integer 7
; 19                    integer 8
; 1A                    integer 9
; 1B                    integer 10
; 1C LLHH               integer
; 1D EEDDDDDD           single real
; 1E                    internal token
; 1F EEDDDDDDDDDDDDDD   double real
; 20-7F                 ASCII chars
; 80                    unknown token
; 81-D8                 statement tokens
; D9-ED                 other tokens
; EE                    >
; EF                    =
; F0                    <
; F1                    +
; F2                    -
; F3                    *
; F4                    /
; F5                    ^
; F6                    AND
; F7                    OR
; F8                    XOR
; F9                    EQV
; FA                    IMP
; FB                    MOD
; FC                    \
; FD                    unknown token, other microsoft basic versions use this to extend token range
; FE                    unknown token, other microsoft basic versions use this to extend token range
; FF TT                 function token



;       Table   addresses of BASIC statement token service routines
;       Remark  start with token 081H, ends with token 0D8H

I392E:  DEFW    C63EA                   ; END
        DEFW    C4524                   ; FOR
        DEFW    C6527                   ; NEXT
        DEFW    C485B                   ; DATA, skip to end of statement
        DEFW    C4B6C                   ; INPUT
        DEFW    C5E9F                   ; DIM
        DEFW    C4B9F                   ; READ
        DEFW    C4880                   ; LET
        DEFW    C47E8                   ; GOTO
        DEFW    C479E                   ; RUN
        DEFW    C49E5                   ; IF
        DEFW    C63C9                   ; RESTORE
        DEFW    C47B2                   ; GOSUB
        DEFW    C4821                   ; RETURN
        DEFW    C485D                   ; REM, skip to end of BASIC line
        DEFW    C63E3                   ; STOP
        DEFW    C4A24                   ; PRINT
        DEFW    C64AF                   ; CLEAR
        DEFW    C522E                   ; LIST
        DEFW    C6286                   ; NEW
        DEFW    C48E4                   ; ON
        DEFW    C401C                   ; WAIT
        DEFW    C501D                   ; DEF
        DEFW    C5423                   ; POKE
        DEFW    C6424                   ; CONT
        DEFW    C6FB7                   ; CSAVE
        DEFW    C703F                   ; CLOAD
        DEFW    C4016                   ; OUT
        DEFW    C4A1D                   ; LPRINT
        DEFW    C5229                   ; LLIST
        DEFW    CLS                     ; CLS
        DEFW    C51C9                   ; WIDTH
        DEFW    C485D                   ; ELSE, skip to end of BASIC line
        DEFW    C6438                   ; TRON
        DEFW    C6439                   ; TROFF
        DEFW    C643E                   ; SWAP
        DEFW    C6477                   ; ERASE
        DEFW    C49AA                   ; ERROR
        DEFW    C495D                   ; RESUME
        DEFW    C53E2                   ; DELETE
        DEFW    C49B5                   ; AUTO
        DEFW    C5468                   ; RENUM
        DEFW    C4718                   ; DEFSTR
        DEFW    C471B                   ; DEFINT
        DEFW    C471E                   ; DEFSNG
        DEFW    C4721                   ; DEFDBL
        DEFW    C4B0E                   ; LINE
        DEFW    C6AB7                   ; OPEN
        DEFW    C7C52                   ; FIELD
        DEFW    C775B                   ; GET
        DEFW    C7758                   ; PUT
        DEFW    C6C14                   ; CLOSE
        DEFW    C6B5D                   ; LOAD
        DEFW    C6B5E                   ; MERGE
        DEFW    C6C2F                   ; FILES
        DEFW    C7C48                   ; LSET
        DEFW    C7C4D                   ; RSET
        DEFW    C6BA3                   ; SAVE
        DEFW    C6C2A                   ; LFILES
        DEFW    C5B11                   ; CIRCLE
        DEFW    C7980                   ; COLOR
        DEFW    C5D6E                   ; DRAW
        DEFW    C59C5                   ; PAINT
        DEFW    BEEP                    ; BEEP
        DEFW    C73E5                   ; PLAY
        DEFW    C57EA                   ; PSET
        DEFW    C57E5                   ; PRESET
        DEFW    C73CA                   ; SOUND
        DEFW    C79CC                   ; SCREEN
        DEFW    C7BE2                   ; VPOKE
        DEFW    C7A48                   ; SPRITE
        DEFW    C7B37                   ; VDP
        DEFW    C7B5A                   ; BASE
        DEFW    C55A8                   ; CALL
        DEFW    C7911                   ; TIME
        DEFW    C786C                   ; KEY
        DEFW    C7E4B                   ; MAX
        DEFW    C73B7                   ; MOTOR
        DEFW    C6EC6                   ; BLOAD
        DEFW    C6E92                   ; BSAVE
        DEFW    C7C16                   ; DSKO$
        DEFW    C7C1B                   ; SET
        DEFW    C7C20                   ; NAME
        DEFW    C7C25                   ; KILL
        DEFW    C7C2A                   ; IPL
        DEFW    C7C2F                   ; COPY
        DEFW    C7C34                   ; CMD
        DEFW    C7766                   ; LOCATE

;       Table   addresses of BASIC function token service routines
;       Remark

I39DE:  DEFW    C6861                   ; LEFT$
        DEFW    C6891                   ; RIGHT$
        DEFW    C689A                   ; MID$
        DEFW    C2E97                   ; SGN
        DEFW    C30CF                   ; INT
        DEFW    C2E82                   ; ABS
        DEFW    C2AFF                   ; SQR
        DEFW    C2BDF                   ; RND
        DEFW    C29AC                   ; SIN
        DEFW    C2A72                   ; LOG
        DEFW    C2B4A                   ; EXP
        DEFW    C2993                   ; COS
        DEFW    C29FB                   ; TAN
        DEFW    C2A14                   ; ATN
        DEFW    C69F2                   ; FRE
        DEFW    C4001                   ; INP
        DEFW    C4FCC                   ; POS
        DEFW    C67FF                   ; LEN
        DEFW    C6604                   ; STR$
        DEFW    C68BB                   ; VAL
        DEFW    C680B                   ; ASC
        DEFW    C681B                   ; CHR$
        DEFW    C541C                   ; PEEK
        DEFW    C7BF5                   ; VPEEK
        DEFW    C6848                   ; SPACE$
        DEFW    C65F5                   ; OCT$
        DEFW    C65FA                   ; HEX$
        DEFW    C4FC7                   ; LPOS
        DEFW    C65FF                   ; BIN$
        DEFW    C2F8A                   ; CINT
        DEFW    C2FB2                   ; CSNG
        DEFW    C303A                   ; CDBL
        DEFW    C30BE                   ; FIX
        DEFW    C7940                   ; STICK
        DEFW    C794C                   ; TRIG
        DEFW    C795A                   ; PDL
        DEFW    C7969                   ; PAD
        DEFW    C7C39                   ; DSKF
        DEFW    C6D39                   ; FPOS
        DEFW    C7C66                   ; CVI
        DEFW    C7C6B                   ; CVS
        DEFW    C7C70                   ; CVD
        DEFW    C6D25                   ; EOF
        DEFW    C6D03                   ; LOC
        DEFW    C6D14                   ; LOF
        DEFW    C7C57                   ; MKI$
        DEFW    C7C5C                   ; MKS$
        DEFW    C7C61                   ; MKD$

;       Table   pointers to the start of keywords of a given letter
;       Remark  start with the pointer for all "A" keywords and ends with "Z" keywords

I3A3E:  DEFW    T3A72
        DEFW    T3A88
        DEFW    T3A9F
        DEFW    T3AF3
        DEFW    T3B2E
        DEFW    T3B4F
        DEFW    T3B69
        DEFW    T3B7B
        DEFW    T3B80
        DEFW    T3B9F
        DEFW    T3BA0
        DEFW    T3BA8
        DEFW    T3BE8
        DEFW    T3C09
        DEFW    T3C18
        DEFW    T3C2B
        DEFW    T3C5D
        DEFW    T3C5E
        DEFW    T3C8E
        DEFW    T3CDB
        DEFW    T3CF6
        DEFW    T3CFF
        DEFW    T3D16
        DEFW    T3D20
        DEFW    T3D24
        DEFW    T3D25

T3A72:  KEYWRD  <A,U,T,O>,0A9H
        KEYWRD  <A,N,D>,0F6H
        KEYWRD  <A,B,S>,006H
        KEYWRD  <A,T,N>,00EH
        KEYWRD  <A,S,C>,015H
        KEYWRD  <A,T,T,R,$>,0E9H
        DEFB    0

T3A88:  KEYWRD  <B,A,S,E>,0C9H
        KEYWRD  <B,S,A,V,E>,0D0H
        KEYWRD  <B,L,O,A,D>,0CFH
        KEYWRD  <B,E,E,P>,0C0H
        KEYWRD  <B,I,N,$>,01DH
        DEFB    0

T3A9F:  KEYWRD  <C,A,L,L>,0CAH
        KEYWRD  <C,L,O,S,E>,0B4H
        KEYWRD  <C,O,P,Y>,0D6H
        KEYWRD  <C,O,N,T>,099H
        KEYWRD  <C,L,E,A,R>,092H
        KEYWRD  <C,L,O,A,D>,09BH
        KEYWRD  <C,S,A,V,E>,09AH
        KEYWRD  <C,S,R,L,I,N>,0E8H
        KEYWRD  <C,I,N,T>,01EH
        KEYWRD  <C,S,N,G>,01FH
        KEYWRD  <C,D,B,L>,020H
        KEYWRD  <C,V,I>,028H
        KEYWRD  <C,V,S>,029H
        KEYWRD  <C,V,D>,02AH
        KEYWRD  <C,O,S>,00CH
        KEYWRD  <C,H,R,$>,016H
        KEYWRD  <C,I,R,C,L,E>,0BCH
        KEYWRD  <C,O,L,O,R>,0BDH
        KEYWRD  <C,L,S>,09FH
        KEYWRD  <C,M,D>,0D7H
        DEFB    0

T3AF3:  KEYWRD  <D,E,L,E,T,E>,0A8H
        KEYWRD  <D,A,T,A>,084H
        KEYWRD  <D,I,M>,086H
        KEYWRD  <D,E,F,S,T,R>,0ABH
        KEYWRD  <D,E,F,I,N,T>,0ACH
        KEYWRD  <D,E,F,S,N,G>,0ADH
        KEYWRD  <D,E,F,D,B,L>,0AEH
        KEYWRD  <D,S,K,O,$>,0D1H
        KEYWRD  <D,E,F>,097H
        KEYWRD  <D,S,K,I,$>,0EAH
        KEYWRD  <D,S,K,F>,026H
        KEYWRD  <D,R,A,W>,0BEH
        DEFB    0

T3B2E:  KEYWRD  <E,L,S,E>,0A1H
        KEYWRD  <E,N,D>,081H
        KEYWRD  <E,R,A,S,E>,0A5H
        KEYWRD  <E,R,R,O,R>,0A6H
        KEYWRD  <E,R,L>,0E1H
        KEYWRD  <E,R,R>,0E2H
        KEYWRD  <E,X,P>,00BH
        KEYWRD  <E,O,F>,02BH
        KEYWRD  <E,Q,V>,0F9H
        DEFB    0

T3B4F:  KEYWRD  <F,O,R>,082H
        KEYWRD  <F,I,E,L,D>,0B1H
        KEYWRD  <F,I,L,E,S>,0B7H
        KEYWRD  <F,N>,0DEH
        KEYWRD  <F,R,E>,00FH
        KEYWRD  <F,I,X>,021H
        KEYWRD  <F,P,O,S>,027H
        DEFB    0

T3B69:  KEYWRD  <G,O,T,O>,089H
        KEYWRD  <G,O,' ',T,O>,089H
        KEYWRD  <G,O,S,U,B>,08DH
        KEYWRD  <G,E,T>,0B2H
        DEFB    0

T3B7B:  KEYWRD  <H,E,X,$>,01BH
        DEFB    0

T3B80:  KEYWRD  <I,N,P,U,T>,085H
        KEYWRD  <I,F>,08BH
        KEYWRD  <I,N,S,T,R>,0E5H
        KEYWRD  <I,N,T>,005H
        KEYWRD  <I,N,P>,010H
        KEYWRD  <I,M,P>,0FAH
        KEYWRD  <I,N,K,E,Y,$>,0ECH
        KEYWRD  <I,P,L>,0D5H
        DEFB    0

T3B9F:  DEFB    0

T3BA0:  KEYWRD  <K,I,L,L>,0D4H
        KEYWRD  <K,E,Y>,0CCH
        DEFB    0

T3BA8:  KEYWRD  <L,P,R,I,N,T>,09DH
        KEYWRD  <L,L,I,S,T>,09EH
        KEYWRD  <L,P,O,S>,01CH
        KEYWRD  <L,E,T>,088H
        KEYWRD  <L,O,C,A,T,E>,0D8H
        KEYWRD  <L,I,N,E>,0AFH
        KEYWRD  <L,O,A,D>,0B5H
        KEYWRD  <L,S,E,T>,0B8H
        KEYWRD  <L,I,S,T>,093H
        KEYWRD  <L,F,I,L,E,S>,0BBH
        KEYWRD  <L,O,G>,00AH
        KEYWRD  <L,O,C>,02CH
        KEYWRD  <L,E,N>,012H
        KEYWRD  <L,E,F,T,$>,001H
        KEYWRD  <L,O,F>,02DH
        DEFB    0

T3BE8:  KEYWRD  <M,O,T,O,R>,0CEH
        KEYWRD  <M,E,R,G,E>,0B6H
        KEYWRD  <M,O,D>,0FBH
        KEYWRD  <M,K,I,$>,02EH
        KEYWRD  <M,K,S,$>,02FH
        KEYWRD  <M,K,D,$>,030H
        KEYWRD  <M,I,D,$>,003H
        KEYWRD  <M,A,X>,0CDH
        DEFB    0

T3C09:  KEYWRD  <N,E,X,T>,083H
        KEYWRD  <N,A,M,E>,0D3H
        KEYWRD  <N,E,W>,094H
        KEYWRD  <N,O,T>,0E0H
        DEFB    0

T3C18:  KEYWRD  <O,P,E,N>,0B0H
        KEYWRD  <O,U,T>,09CH
        KEYWRD  <O,N>,095H
        KEYWRD  <O,R>,0F7H
        KEYWRD  <O,C,T,$>,01AH
        KEYWRD  <O,F,F>,0EBH
        DEFB    0

T3C2B:  KEYWRD  <P,R,I,N,T>,091H
        KEYWRD  <P,U,T>,0B3H
        KEYWRD  <P,O,K,E>,098H
        KEYWRD  <P,O,S>,011H
        KEYWRD  <P,E,E,K>,017H
        KEYWRD  <P,S,E,T>,0C2H
        KEYWRD  <P,R,E,S,E,T>,0C3H
        KEYWRD  <P,O,I,N,T>,0EDH
        KEYWRD  <P,A,I,N,T>,0BFH
        KEYWRD  <P,D,L>,024H
        KEYWRD  <P,A,D>,025H
        KEYWRD  <P,L,A,Y>,0C1H
        DEFB    0

T3C5D:  DEFB    0

T3C5E:  KEYWRD  <R,E,T,U,R,N>,08EH
        KEYWRD  <R,E,A,D>,087H
        KEYWRD  <R,U,N>,08AH
        KEYWRD  <R,E,S,T,O,R,E>,08CH
        KEYWRD  <R,E,M>,08FH
        KEYWRD  <R,E,S,U,M,E>,0A7H
        KEYWRD  <R,S,E,T>,0B9H
        KEYWRD  <R,I,G,H,T,$>,002H
        KEYWRD  <R,N,D>,008H
        KEYWRD  <R,E,N,U,M>,0AAH
        DEFB    0

T3C8E:  KEYWRD  <S,C,R,E,E,N>,0C5H
        KEYWRD  <S,P,R,I,T,E>,0C7H
        KEYWRD  <S,T,O,P>,090H
        KEYWRD  <S,W,A,P>,0A4H
        KEYWRD  <S,E,T>,0D2H
        KEYWRD  <S,A,V,E>,0BAH
        KEYWRD  <S,P,C,(>,0DFH
        KEYWRD  <S,T,E,P>,0DCH
        KEYWRD  <S,G,N>,004H
        KEYWRD  <S,Q,R>,007H
        KEYWRD  <S,I,N>,009H
        KEYWRD  <S,T,R,$>,013H
        KEYWRD  <S,T,R,I,N,G,$>,0E3H
        KEYWRD  <S,P,A,C,E,$>,019H
        KEYWRD  <S,O,U,N,D>,0C4H
        KEYWRD  <S,T,I,C,K>,022H
        KEYWRD  <S,T,R,I,G>,023H
        DEFB    0

T3CDB:  KEYWRD  <T,H,E,N>,0DAH
        KEYWRD  <T,R,O,N>,0A2H
        KEYWRD  <T,R,O,F,F>,0A3H
        KEYWRD  <T,A,B,(>,0DBH
        KEYWRD  <T,O>,0D9H
        KEYWRD  <T,I,M,E>,0CBH
        KEYWRD  <T,A,N>,00DH
        DEFB    0

T3CF6:  KEYWRD  <U,S,I,N,G>,0E4H
        KEYWRD  <U,S,R>,0DDH
        DEFB    0

T3CFF:  KEYWRD  <V,A,L>,014H
        KEYWRD  <V,A,R,P,T,R>,0E7H
        KEYWRD  <V,D,P>,0C8H
        KEYWRD  <V,P,O,K,E>,0C6H
        KEYWRD  <V,P,E,E,K>,018H
        DEFB    0

T3D16:  KEYWRD  <W,I,D,T,H>,0A0H
        KEYWRD  <W,A,I,T>,096H
        DEFB    0

T3D20:  KEYWRD  <X,O,R>,0F8H
        DEFB    0

T3D24:  DEFB    0

T3D25:  DEFB    0

I3D26:  TOKEN   "+",0F1H
        TOKEN   "-",0F2H
        TOKEN   "*",0F3H
        TOKEN   "/",0F4H
        TOKEN   "^",0F5H
        TOKEN   "\\",0FCH
        TOKEN   "'",0E6H
        TOKEN   ">",0EEH
        TOKEN   "=",0EFH
        TOKEN   "<",0F0H
        DEFB    0

I3D3B:  DEFB    079H                    ; +
        DEFB    079H                    ; -
        DEFB    07CH                    ; *
        DEFB    07CH                    ; /
        DEFB    07FH                    ; ^
        DEFB    050H                    ; AND
        DEFB    046H                    ; OR
        DEFB    03CH                    ; XOR
        DEFB    032H                    ; EQV
        DEFB    028H                    ; IMP
        DEFB    07AH                    ; MOD
        DEFB    07BH                    ; \

I3D47:  DEFW    C303A                   ; convert DAC to double real
        DEFW    0
        DEFW    C2F8A                   ; convert DAC to integer
        DEFW    C3058                   ; check if string (error if not)
        DEFW    C2FB2                   ; convert DAC to single real

I3D51:  DEFW    C269A                   ; double real addition DECADD
        DEFW    C268C                   ; double real subtract DECSUB
        DEFW    C27E6                   ; double real multiply DECMUL
        DEFW    C289F                   ; double real divide DECDIV
        DEFW    C37D7                   ; double real to the power
        DEFW    C2F83                   ; double real compare

I3D5D:  DEFW    C324E                   ; single real addition
        DEFW    C3257                   ; single real subtract
        DEFW    C325C                   ; single real muliply
        DEFW    C3267                   ; single real divide
        DEFW    C37C8                   ; single real to the power
        DEFW    C2F21                   ; single real compare (FCOMP)

I3D69:  DEFW    C3172                   ; integer addition
        DEFW    C3167                   ; integer subtract
        DEFW    C3193                   ; integer multiply
        DEFW    C4DB8                   ; integer divide
        DEFW    C383F                   ; integer to the power
        DEFW    C2F4D                   ; integer compare

I3D75:  DEFB    0
        DEFB    "NEXT without FOR",0
        DEFB    "Syntax error",0
        DEFB    "RETURN without GOSUB",0
        DEFB    "Out of DATA",0
        DEFB    "Illegal function call",0
        DEFB    "Overflow",0
        DEFB    "Out of memory",0
        DEFB    "Undefined line number",0
        DEFB    "Subscript out of range",0
        DEFB    "Redimensioned array",0
        DEFB    "Division by zero",0
        DEFB    "Illegal direct",0
        DEFB    "Type mismatch",0
        DEFB    "Out of string space",0
        DEFB    "String too long",0
        DEFB    "String formula too complex",0
        DEFB    "Can't CONTINUE",0
        DEFB    "Undefined user function",0
        DEFB    "Device I/O error",0
        DEFB    "Verify error",0
        DEFB    "No RESUME",0
        DEFB    "RESUME without error",0
        DEFB    "Unprintable error",0
        DEFB    "Missing operand",0
        DEFB    "Line buffer overflow",0
        DEFB    "FIELD overflow",0
        DEFB    "Internal error",0
        DEFB    "Bad file number",0
        DEFB    "File not found",0
        DEFB    "File already open",0
        DEFB    "Input past end",0
        DEFB    "Bad file name",0
        DEFB    "Direct statement in file",0
        DEFB    "Sequential I/O only",0
        DEFB    "File not OPEN",0

I3FD2:  DEFB    " in "

I3FD6:  DEFB    0

I3FD7:  DEFB    "Ok",13,10,0

I3FDC:  DEFB    "Break",0

;       Subroutine      search FOR block on stack (skip 2 words)
;       Inputs          DE = address loop variable (0 if any FOR block)
;       Outputs         Zx set if found, Zx reset if other block found first

C3FE2:  LD      HL,4                    ; skip this routine return address and main loop return address
        ADD     HL,SP

;       Subroutine      search FOR block
;       Inputs          ________________________
;       Outputs         ________________________

C3FE6:  LD      A,(HL)
        INC     HL
        CP      82H                     ; FOR block ?
        RET     NZ                      ; nope, quit
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; address loop variable
        INC     HL
        PUSH    HL
        LD      H,B
        LD      L,C
        LD      A,D
        OR      E                       ; variable specified ?
        EX      DE,HL
        JR      Z,J3FF9                 ; nope, found
        EX      DE,HL
        RST     DCOMPR                  ; same variable ?
J3FF9:  LD      BC,25-3
        POP     HL
        RET     Z                       ; yep, quit
        ADD     HL,BC
        JR      C3FE6                   ; next block

;       Subroutine      INP function
;       Inputs          ________________________
;       Outputs         ________________________

C4001:  CALL    C5439                   ; convert address to integer
        LD      B,H
        LD      C,L
        IN      A,(C)
        JP      C4FCF                   ; byte to DAC

;       Subroutine      evaluate address operand and byte operand seperated by a ","
;       Inputs          ________________________
;       Outputs         ________________________

C400B:  CALL    C542F                   ; evaluate address operand
        PUSH    DE
        RST     SYNCHR
        DEFB    ","
        CALL    C521C                   ; evaluate byte operand
        POP     BC
        RET

;       Subroutine      OUT statement
;       Inputs          ________________________
;       Outputs         ________________________

C4016:  CALL    C400B                   ; evaluate address operand and byte operand seperated by a ","
        OUT     (C),A
        RET

;       Subroutine      WAIT statement
;       Inputs          ________________________
;       Outputs         ________________________

C401C:  CALL    C400B                   ; evaluate address operand and byte operand seperated by a ","
        PUSH    BC
        PUSH    AF
        LD      E,0                     ; assume no XOR parameter
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JR      Z,J402C                 ; yep, start wait
        RST     SYNCHR
        DEFB    ","
        CALL    C521C                   ; evaluate byte operand
J402C:  POP     AF
        LD      D,A                     ; AND parameter
        POP     BC                      ; i/o address
J402F:  CALL    CKCNTC
        IN      A,(C)
        XOR     E
        AND     D
        JR      Z,J402F
        RET

;       Subroutine      at end of BASIC program
;       Inputs          ________________________
;       Outputs         ________________________

J4039:  CALL    H.PRGE                  ; hook program ends
        LD      HL,(CURLIN)
        LD      A,H
        AND     L
        INC     A                       ; interpreter in direct mode ?
        JR      Z,J404C                 ; yep, skip error handling stuff
        LD      A,(ONEFLG)
        OR      A                       ; in ERROR handling routine ?
        LD      E,21
        JR      NZ,J406F                ; yep, no resume error
J404C:  JP      J6401                   ; END without closing i/o channels, clearing

J404F:  LD      HL,(DATLIN)
        LD      (CURLIN),HL
J4055:  LD      E,2
        DEFB    001H
J4058:  LD      E,11
        DEFB    001H
J405B:  LD      E,1
        DEFB    001H
J405E:  LD      E,10
        DEFB    001H
J4061:  LD      E,18
        DEFB    001H
J4064:  LD      E,22
        DEFB    001H
J4067:  LD      E,6
        DEFB    001H
J406A:  LD      E,24
        DEFB    001H
J406D:  LD      E,13

;       Subroutine      BASIC error
;       Inputs          E = errornumber
;       Outputs         ________________________

J406F:  CALL    H.ERRO                  ; hook start of the BASIC error routine
        XOR     A
        LD      (NLONLY),A              ; not loading basic program, close i/o channels when requested
        LD      HL,(VLZADR)
        LD      A,H
        OR      L
        JR      Z,J4087
        LD      A,(VLZDAT)
        LD      (HL),A
        LD      HL,0
        LD      (VLZADR),HL
J4087:  EI
        LD      HL,(CURLIN)
        LD      (ERRLIN),HL             ; linenumber at error
        LD      A,H
        AND     L
        INC     A                       ; error occured in direct mode ?
        JR      Z,J4096
        LD      (DOT),HL                ; nope, set DOT
J4096:  LD      BC,I40A4
        JR      J409E

;       Subroutine      warm start MSX BASIC
;       Inputs          -
;       Outputs         -

J409B:  LD      BC,J411E                ; ok and mainloop (+POP)
J409E:  LD      HL,(SAVSTK)
        JP      J62F0                   ; reinitialize stack

I40A4:  POP     BC
        LD      A,E
        LD      C,E
        LD      (ERRFLG),A              ; save errorcode
        LD      HL,(SAVTXT)
        LD      (ERRTXT),HL             ; BASICpointer at error
        EX      DE,HL
        LD      HL,(ERRLIN)
        LD      A,H
        AND     L
        INC     A                       ; error occured in direct mode ?
        JR      Z,J40C0
        LD      (OLDLIN),HL
        EX      DE,HL
        LD      (OLDTXT),HL             ; nope, save linenumber and BASICpointer for continue
J40C0:  LD      HL,(ONELIN)
        LD      A,H
        OR      L                       ; ERROR handler defined ?
        EX      DE,HL
        LD      HL,ONEFLG
        JR      Z,J40D3                 ; nope, abort
        AND     (HL)                    ; in ERROR handler ?
        JR      NZ,J40D3                ; yep, abort
        DEC     (HL)                    ; flag in ERROR handler
        EX      DE,HL
        JP      J4620                   ; execute statement (execute ERROR handler)

J40D3:  XOR     A
        LD      (HL),A                  ; not in ERROR handler
        LD      E,C                     ; errorcode
        CALL    C7323                   ; fresh line to interpreter output
        LD      HL,I3D75
        CALL    H.ERRP                  ; hook error pointer
        LD      A,E
        CP      60                      ; errorcode 60-255 ?
        JR      NC,J40EC                ; yep, use unprintable error string
        CP      50                      ; errorcode 50-59 ?
        JR      NC,J40EE                ; adjust and search errorstring
        CP      26                      ; errorcode 1-25 ?
        JR      C,J40F1                 ; yep, search errorstring
J40EC:  LD      A,47                    ; unprintable error
J40EE:  SUB     24
        LD      E,A
J40F1:  CALL    C485D                   ; skip to end of BASIC line (to search end of errorstring)
        INC     HL
        DEC     E
        JR      NZ,J40F1                ; next errorstring
        PUSH    HL
        LD      HL,(ERRLIN)
        EX      (SP),HL                 ; save linenumber error

J40FD:  CALL    H.ERRF
        PUSH    HL
        CALL    TOTEXT                  ; force to text screenmode
        POP     HL
        LD      A,(HL)
        CP      "?"                     ; errorstring start with a "?"
        JR      NZ,J4110                ; nope, print errormessage
        POP     HL                      ; error linenumber
        LD      HL,I3D75
        JR      J40EC                   ; use unprintable error

J4110:  LD      A,7
        RST     OUTDO                   ; beep to interpreter output
        CALL    C6678                   ; message to interpreter output
        POP     HL                      ; error linenumber
        LD      A,H
        AND     L
        INC     A                       ; error occured in direct mode ?
        CALL    NZ,C340A                ; nope, "in" number to interpreter output
        DEFB    03EH                    ; skip next instruction

;       Subroutine      ok and mainloop (+POP)
;       Inputs          ________________________
;       Outputs         ________________________

J411E:  POP     BC

;       Subroutine      ok and mainloop
;       Inputs          ________________________
;       Outputs         ________________________

J411F:  CALL    TOTEXT                  ; force text screenmode
        CALL    C7304                   ; end printeroutput
        CALL    C6D7B                   ; close i/o channel 0 and load HL from (TEMP)
        CALL    H.READ                  ; hook prompt ready
        CALL    C7323                   ; fresh line to interpreter output
        LD      HL,I3FD7                ; "Ok" message
        CALL    C6678                   ; message to interpreter output

;       Subroutine      mainloop
;       Inputs          ________________________
;       Outputs         ________________________

J4134:  CALL    H.MAIN                  ; hook start mainloop
        LD      HL,0FFFFH
        LD      (CURLIN),HL             ; interpreter in direct mode
        LD      HL,ENDPRG
        LD      (SAVTXT),HL
        LD      A,(AUTFLG)
        OR      A                       ; in auto linenumber mode ?
        JR      Z,J415F                 ; nope, skip auto linenumber
        LD      HL,(AUTLIN)             ; current auto linenumber
        PUSH    HL
        CALL    C3412                   ; number to interpreter output
        POP     DE
        PUSH    DE
        CALL    C4295                   ; search linenumber
        LD      A,"*"
        JR      C,J415B                 ; found, existing line indicator
        LD      A," "                   ; not found, new line indicator
J415B:  RST     OUTDO                   ; lineindicator to interpreter output
        LD      (AUTFLG),A              ; save line exist status
J415F:  CALL    ISFLIO                  ; interpreter input/output device = file ?
        JR      NZ,J4170                ; yep,
        CALL    PINLIN                  ; get line from keyboard
        JR      NC,J4173                ; not aborted, continue
        XOR     A
        LD      (AUTFLG),A              ; quit auto linenumber mode
        JP      J4134                   ; mainloop

J4170:  CALL    C7374                   ; get line from interpreter input file
J4173:  RST     CHRGTR                  ; get next BASIC character
        INC     A
        DEC     A                       ; empty line ?
        JR      Z,J4134                 ; yep, restart mainloop
        PUSH    AF
        CALL    C4769                   ; collect linenumber
        JR      NC,J4184                ; linenumber ok,
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        JP      Z,J4055                 ; nope, syntax error
J4184:  CALL    C4514                   ; skip space chars
        LD      A,(AUTFLG)
        OR      A                       ; in auto linenumber mode ?
        JR      Z,J4195                 ; nope, skip check
        CP      "*"                     ; existing linenumber ?
        JR      NZ,J4195                ; nope,
        CP      (HL)                    ; yep, is this the "*" char ?
        JR      NZ,J4195
        INC     HL                      ; yep, skip it
J4195:  LD      A,D
        OR      E
        JR      Z,J419F
        LD      A,(HL)
        CP      " "
        JR      NZ,J419F
        INC     HL
J419F:  PUSH    DE
        CALL    C42B2                   ; encode BASIC line
        POP     DE
        POP     AF
        LD      (SAVTXT),HL
        CALL    H.DIRD
        JR      C,J41B4
        XOR     A
        LD      (AUTFLG),A              ; quit auto linenumber mode
        JP      J6D48                   ; handle direct statement

J41B4:  PUSH    DE
        PUSH    BC
        RST     CHRGTR                  ; get next BASIC character
        OR      A
        PUSH    AF                      ; Zx set if empty line
        LD      A,(AUTFLG)
        AND     A                       ; in auto linenumber mode ?
        JR      Z,J41C2                 ; nope,
        POP     AF
        SCF                             ; auto linenumber mode
        PUSH    AF
J41C2:  LD      (DOT),DE
        LD      HL,(AUTINC)
        ADD     HL,DE                   ; new linenumber for auto linenumber mode
        JR      C,J41D7                 ; >65535, end auto line number mode
        PUSH    DE
        LD      DE,65530
        RST     DCOMPR
        POP     DE                      ; new linenumber < 65530 ?
        LD      (AUTLIN),HL             ; new auto linenumber
        JR      C,J41DB                 ; yep, contine
J41D7:  XOR     A
        LD      (AUTFLG),A              ; quit auto linenumber mode
J41DB:  CALL    C4295                   ; search linenumber
        JR      C,C41ED                 ; found,
        POP     AF
        PUSH    AF
        JR      NZ,J41EA                ; not found + non empty line,
        JP      NC,J481C                ; not found + no auto + empty line, undefined line number error
                                        ; not found + auto + empty, do nothing
J41E7:  PUSH    BC
        JR      J4237

J41EA:  OR      A                       ; flag line addition
        JR      J41F4

C41ED:  POP     AF
        PUSH    AF
        JR      NZ,J41F3                ; found + non empty line, flag line removeable
        JR      C,J41E7                 ; found + auto + empty line, do nothing
                                        ; found + no auto + empty line, flag line removeable
J41F3:  SCF
J41F4:  PUSH    BC
        PUSH    AF
        PUSH    HL
        CALL    C54EA                   ; convert to linepointers to linenumbers if needed
        POP     HL
        POP     AF
        POP     BC
        PUSH    BC
        CALL    C,C5405                 ; flag remove, remove line
        POP     DE
        POP     AF                      ; empty line ?
        PUSH    DE
        JR      Z,J4237                 ; yep, skip line adding
        POP     DE
        LD      HL,0
        LD      (ONELIN),HL             ; disable ERROR handler
        LD      HL,(VARTAB)
        EX      (SP),HL
        POP     BC
        PUSH    HL
        ADD     HL,BC
        PUSH    HL
        CALL    C6250                   ; check for enough stackspace and move data
        POP     HL
        LD      (VARTAB),HL
        EX      DE,HL
        LD      (HL),H
        POP     BC
        POP     DE
        PUSH    HL
        INC     HL
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      DE,KBUF
        DEC     BC
        DEC     BC
        DEC     BC
        DEC     BC
J422E:  LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        DEC     BC
        LD      A,C
        OR      B
        JR      NZ,J422E
J4237:  CALL    H.FINI
        POP     DE
        CALL    C4257                   ; setup BASIC linelinks from this point
        LD      HL,(PTRFIL)
        LD      (TEMP2),HL              ; save interpreter input/output device
        CALL    C629A                   ; initialize interpreter, basic pointer at start of program
        CALL    H.FINE
        LD      HL,(TEMP2)
        LD      (PTRFIL),HL             ; restore interpreter input/output device
        JP      J4134                   ; main loop

;       Subroutine      setup BASIC linelinks
;       Inputs          ________________________
;       Outputs         ________________________

C4253:  LD      HL,(TXTTAB)
        EX      DE,HL

;       Subroutine      setup BASIC linelinks from this point
;       Inputs          ________________________
;       Outputs         ________________________

C4257:  LD      H,D
        LD      L,E
        LD      A,(HL)
        INC     HL
        OR      (HL)                    ; end of program ?
        RET     Z                       ; yep, quit
        INC     HL
        INC     HL                      ; skip over linenuber
J425F:  INC     HL
        LD      A,(HL)
J4261:  OR      A                       ; end of BASIC line ?
        JR      Z,J4272                 ; yep, fill linelink
        CP      20H                     ; character or non numeric token ?
        JR      NC,J425F                ; yep, next
        CP      0BH                     ; multi byte numeric token ?
        JR      C,J425F                 ; nope, next
        CALL    C466A                   ; get BASIC character (numeric token)
        RST     CHRGTR                  ; get next BASIC character (get value)
        JR      J4261

J4272:  INC     HL
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        JR      C4257                   ; next line

;       Subroutine      evaluate linenumber (range) and search start linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C4279:  LD      DE,0                    ; default start linenumber = 0
        PUSH    DE
        JR      Z,J4288                 ; end of statement, skip start
        POP     DE
        CALL    C475F                   ; collect linenumber (with DOT supported)
        PUSH    DE                      ; save start linenumber
        JR      Z,J4291                 ; end of statement,
        RST     SYNCHR
        DEFB    0F2H                    ; check for -
J4288:  LD      DE,65530                ; default end linenumber = 65530
        CALL    NZ,C475F                ; not end of statement, collect linenumber (with DOT supported)
        JP      NZ,J4055                ; not end of statement, syntax error
J4291:  EX      DE,HL
        POP     DE                      ; start linenumber

;       Subroutine      stack HL and search linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C4293:  EX      (SP),HL
        PUSH    HL                      ; save end linenumber on stack

;       Subroutine      search linenumber
;       Inputs          DE = linenumber to search
;       Outputs         ________________________

C4295:  LD      HL,(TXTTAB)             ; start of BASIC program

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4298:  LD      B,H
        LD      C,L                     ; save start of line
        LD      A,(HL)
        INC     HL
        OR      (HL)                    ; endpointer ?
        DEC     HL
        RET     Z                       ; yep, quit
        INC     HL
        INC     HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A                     ; linenumber
        RST     DCOMPR                  ; compare with the one we search
        LD      H,B
        LD      L,C
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A                     ; start of next line
        CCF
        RET     Z                       ; exactly the
        CCF
        RET     NC
        JR      C4298

;       Subroutine      encode BASIC line
;       Inputs          ________________________
;       Outputs         ________________________

C42B2:  XOR     A
        LD      (DONUM),A               ; normal behavior numeric constant
        LD      (DORES),A               ; not in DATA statement
        CALL    H.CRUN
        LD      BC,315
        LD      DE,KBUF
J42C2:  LD      A,(HL)
        OR      A                       ; end of line ?
        JR      NZ,J42D9                ; nope,
J42C6:  LD      HL,320
        LD      A,L
        SUB     C
        LD      C,A
        LD      A,H
        SBC     A,B
        LD      B,A
        LD      HL,KBFMIN               ; statement seperator, before KBUF
        XOR     A
        LD      (DE),A                  ; end of BASIC line
        INC     DE
        LD      (DE),A
        INC     DE
        LD      (DE),A                  ; pointer, end of BASIC program
        RET

J42D9:  CP      '"'                     ; start of string ?
        JP      Z,J4316                 ; yep, put " in KBUF and all chars that follow until " or end of line reached
        CP      " "                     ; space ?
        JR      Z,J42E9                 ; yep, put in KBUF and continue
        LD      A,(DORES)
        OR      A                       ; in DATA statement ?
        LD      A,(HL)
        JR      Z,J4326                 ; nope, normal behavior
J42E9:  INC     HL
        PUSH    AF
        CP      01H                     ; MSX graphic char header ?
        JR      NZ,J42F3                ; nope, put in KBUF
        LD      A,(HL)
        AND     A                       ; end of line ?
        LD      A,01H
J42F3:  CALL    NZ,C44E0                ; nope, put in KBUF
        POP     AF
        SUB     ":"                     ; statement seperator ?
        JR      Z,J4301                 ; yep, not in DATA statement and normal numeric behavior
        CP      84H-":"                 ; DATA token ?
        JR      NZ,J4307                ; nope, skip
        LD      A,1                     ; yep, set DATA statement flag, numeric to linenumber
J4301:  LD      (DORES),A               ; in DATA statement
        LD      (DONUM),A               ; numeric behavior
J4307:  SUB     8FH-":"                 ; REM token ?
        JR      NZ,J42C2                ; nope,
        PUSH    AF                      ; no special end char
J430C:  LD      A,(HL)
        OR      A                       ; end of line ?
        EX      (SP),HL
        LD      A,H
        POP     HL
        JR      Z,J42C6                 ; yep, stop encoding
        CP      (HL)
        JR      Z,J42E9                 ; yep, put in KBUF and continue
J4316:  PUSH    AF
        LD      A,(HL)
J4318:  INC     HL
        CP      01H                     ; MSX graphic char header ?
        JR      NZ,J4321                ; nope, put in KBUF
        LD      A,(HL)
        AND     A                       ; end of line ?
        LD      A,01H
J4321:  CALL    NZ,C44E0                ; nope, put in KBUF
        JR      J430C

J4326:  INC     HL
        OR      A                       ; 80H-0FFH ?
        JP      M,J42C2                 ; yep, skip
        CP      01H                     ; MSX graphic char header ?
        JR      NZ,J4336                ; nope,
        LD      A,(HL)
        AND     A                       ; end of line ?
        JR      Z,J42C6                 ; yep, stop encoding
        INC     HL
        JR      J42C2                   ; skip MSX graphic char

J4336:  DEC     HL
        CP      "?"                     ; short for PRINT ?
        LD      A,91H                   ; PRINT token
        PUSH    DE
        PUSH    BC
        JP      Z,J43A3                 ; yep,
        LD      A,(HL)
        CP      "_"                     ; short for CALL ?
        JP      Z,J43A3                 ; yep,
        LD      DE,I3D26                ; ??, useless instruction
        CALL    C4EA9                   ; get char uppercase
        CALL    C64A8                   ; is upcase letter character ?
        JP      C,J441D                 ; nope, not a keyword
        PUSH    HL
        CALL    H.CRUS
        LD      HL,I3A3E
        SUB     "A"
        ADD     A,A
        LD      C,A
        LD      B,0
        ADD     HL,BC
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL                      ; get pointer the keywords which start with the given letter
        INC     HL
J4365:  PUSH    HL
J4366:  CALL    C4EA9                   ; get char uppercase
        LD      C,A
        LD      A,(DE)
        AND     7FH                     ; end of the keyword list ?
        JP      Z,J44EB                 ; yep, no keyword
        INC     HL
        CP      C                       ; match ?
        JR      NZ,J4398                ; no, next keyword
        LD      A,(DE)
        INC     DE
        OR      A                       ; end of keyword ?
        JP      P,J4366                 ; nope, next char
        POP     AF                      ; remove pointer from stack
        LD      A,(DE)                  ; token
        CALL    H.ISRE
        OR      A                       ; function token ?
        JP      M,J43A2                 ; nope,
        POP     BC
        POP     DE                      ; KBUF vars
        OR      80H                     ; set b7
        PUSH    AF
        LD      A,0FFH                  ; function token header
        CALL    C44E0                   ; put in KBUF
        XOR     A
        LD      (DONUM),A               ; back to normal numeric behavior
        POP     AF                      ; function token
        CALL    C44E0                   ; put in KBUF
        JP      J42C2                   ; next

J4398:  POP     HL
J4399:  LD      A,(DE)
        INC     DE
        OR      A                       ; end of keyword ?
        JP      P,J4399                 ; nope, skip next
        INC     DE
        JR      J4365                   ; try next keyword

J43A2:  DEC     HL
J43A3:  PUSH    AF
        CALL    H.NTFN
        LD      DE,I43B5                ; table tokens with linenumber as operand
        LD      C,A
J43AB:  LD      A,(DE)
        OR      A                       ; end of table ?
        JR      Z,J43C4                 ; yep, not a linenumber token
        INC     DE
        CP      C                       ; match ?
        JR      NZ,J43AB                ; nope, next
        JR      J43C6                   ; linenumber token

;       Table   tokens with linenumber as operand

I43B5:  DEFB    08CH
        DEFB    0A9H
        DEFB    0AAH
        DEFB    0A8H
        DEFB    0A7H
        DEFB    0E1H
        DEFB    0A1H
        DEFB    08AH
        DEFB    093H
        DEFB    09EH
        DEFB    089H
        DEFB    08EH
        DEFB    0DAH
        DEFB    08DH
        DEFB    0

J43C4:  XOR     A                       ; normal numeric behavior
        DEFB    0C2H                    ; JP NZ,xxxx (Skip next statement)
J43C6:  LD      A,1                     ; numeric is linenumber
J43C8:  LD      (DONUM),A
        POP     AF                      ; char/token
J43CC:  POP     BC
        POP     DE                      ; KBUF vars
        CP      0A1H                    ; ELSE token ?
        PUSH    AF
        CALL    Z,C44DE                 ; yep, put statement seperator in KBUF
        POP     AF
        CP      0CAH                    ; CALL token ?
        JR      Z,J43DD                 ; yep, put in KBUF
        CP      "_"                     ; short for CALL ?
        JR      NZ,J4406                ; nope, other
J43DD:  CALL    NC,C44E0                ; yep, put in KBUF
J43E0:  INC     HL
        CALL    C4EA9                   ; get char uppercase
        AND     A                       ; end of line ?
J43E5:  JP      Z,J42C6                 ; yep, stop encoding
        JP      M,J43E0                 ; 80H-0FFH, skip
        CP      01H                     ; MSX graphic char header ?
        JR      NZ,J43F6                ; nope,
        INC     HL
        LD      A,(HL)
        AND     A                       ; end of line ?
        JR      Z,J43E5                 ; yep, stop encoding
        JR      J43E0                   ; next

J43F6:  CP      " "                     ; space char ?
        JR      Z,J43DD                 ; yep, put in KBUF and continue
        CP      ":"                     ; statement seperator ?
        JR      Z,J443A                 ; yep, put in KBUF and continue
        CP      "("                     ; start of a parenthesized operand ?
        JR      Z,J443A                 ; yep, put in KBUF and continue
        CP      "0"                     ; 30H-7FH ?
        JR      J43DD                   ; yep, put in KBUF and continue else skip and continue

J4406:  CP      0E6H                    ; token for ' ?
        JP      NZ,J44B4                ; nope, other
        PUSH    AF
        CALL    C44DE                   ; put statement seperator in KBUF
        LD      A,8FH                   ; REM token
        CALL    C44E0                   ; put in KBUF
        POP     AF
        PUSH    HL
        LD      HL,0
        EX      (SP),HL                 ; no special end char
        JP      J4318                   ; put in REM token KBUF and all chars that follow until end of line is reached

J441D:  LD      A,(HL)
        CP      "."
        JR      Z,J442C
        CP      "9"+1
        JP      NC,J44A2                ; not numeric, check for 1 character tokens
        CP      "0"
        JP      C,J44A2                 ; not numeric, check for 1 character tokens
J442C:  LD      A,(DONUM)
        OR      A
        LD      A,(HL)
        POP     BC
        POP     DE
        JP      M,J42E9                 ; no numeric conversion, put in KBUF and continue
        JR      Z,J4457                 ; normal behavior
        CP      "."
J443A:  JP      Z,J42E9                 ; put in KBUF and continue
        LD      A,0EH                   ; linenumber token
        CALL    C44E0                   ; put in KBUF
        PUSH    DE
        CALL    C4769                   ; collect linenumber
        CALL    C4514                   ; skip space chars
J4449:  EX      (SP),HL
        EX      DE,HL
J444B:  LD      A,L
        CALL    C44E0                   ; put in KBUF
        LD      A,H
J4450:  POP     HL
        CALL    C44E0                   ; put in KBUF
        JP      J42C2                   ; next

J4457:  PUSH    DE
        PUSH    BC
        LD      A,(HL)
        CALL    C3299                   ; convert text to number
        CALL    C4514                   ; skip space chars
        POP     BC
        POP     DE
        PUSH    HL
        LD      A,(VALTYP)
        CP      2                       ; integer number ?
        JR      NZ,J447F                ; nope, put constant in KBUF
        LD      HL,(DAC+2)
        LD      A,H
        OR      A                       ; number 0-255 ?
        LD      A,2
        JR      NZ,J447F                ; nope, put integer in KBUF
        LD      A,L
        LD      H,L                     ; number
        LD      L,0FH                   ; token for numeric byte constant
        CP      10                      ; number 0-9 ?
        JR      NC,J444B                ; nope, put word in KBUF and continue
        ADD     A,11H                   ; tokens for numeric constant 0-9
        JR      J4450                   ; put byte in KBUF and continue

J447F:  PUSH    AF
        RRCA
        ADD     A,1BH                   ; 1CH for integer, 1DH for single real, 1FH for double real
        CALL    C44E0                   ; put in KBUF
        LD      HL,DAC
        LD      A,(VALTYP)
        CP      2
        JR      NZ,J4493
        LD      HL,DAC+2
J4493:  POP     AF
J4494:  PUSH    AF
        LD      A,(HL)
        CALL    C44E0                   ; put in KBUF
        POP     AF
        INC     HL
        DEC     A
        JR      NZ,J4494
        POP     HL
        JP      J42C2                   ; next

J44A2:  LD      DE,I3D26-1              ; special 1 character tokens
J44A5:  INC     DE
        LD      A,(DE)
        AND     7FH                     ; end of table ?
        JP      Z,J44FA                 ; yep, others
        INC     DE
        CP      (HL)                    ; match ?
        LD      A,(DE)
        JR      NZ,J44A5                ; nope, next
        JP      J4509                   ; yep,

J44B4:  CP      "&"                     ; header for other radix ?
        JP      NZ,J42E9                ; nope, put in KBUF and continue
        PUSH    HL
        RST     CHRGTR                  ; get next BASIC character (a bit strange but works)
        POP     HL
        CALL    C4EAA                   ; upcase char
        CP      "H"                     ; hexadecimal ?
        JR      Z,J44D0                 ; yep, put hexadecimal constant in KBUF
        CP      "O"                     ; octal ?
        JR      Z,J44CC                 ; yep, put octal constant in KBUF
        LD      A,"&"
        JP      J42E9                   ; put "&" in KBUF and continue

J44CC:  LD      A,0BH                   ; token for octal constant
        JR      J44D2

J44D0:  LD      A,0CH                   ; token for hexadecimal constant
J44D2:  CALL    C44E0                   ; put in KBUF
        PUSH    DE
        PUSH    BC
        CALL    C4EB8                   ; convert text with radix indication to number
        POP     BC
        JP      J4449                   ; put word on stack in KBUF

;       Subroutine      put statement seperator in KBUF
;       Inputs          ________________________
;       Outputs         ________________________

C44DE:  LD      A,":"

;       Subroutine      put in KBUF
;       Inputs          A = data
;       Outputs         ________________________

C44E0:  LD      (DE),A
        INC     DE
        DEC     BC
        LD      A,C
        OR      B
        RET     NZ
        LD      E,25
        JP      J406F                   ; line buffer overflow error

J44EB:  CALL    H.NOTR
        POP     HL
        DEC     HL
        DEC     A
        LD      (DONUM),A               ; numeric not converted
        CALL    C4EA9                   ; get char uppercase
        JP      J43CC

J44FA:  LD      A,(HL)
        CP      20H                     ; 20H-7FH ?
        JR      NC,J4509                ; yep,
        CP      09H                     ; TAB ?
        JR      Z,J4509                 ; yep,
        CP      0AH                     ; LF ?
        JR      Z,J4509                 ; yep,
        LD      A," "                   ; others are replaced by a space
J4509:  PUSH    AF
        LD      A,(DONUM)
        INC     A                       ; numeric not converted ?
        JR      Z,J4511                 ; yep, back to normal numeric behavior
        DEC     A                       ; numeric is not converted
J4511:  JP      J43C8


;       Subroutine      skip space chars
;       Inputs          ________________________
;       Outputs         ________________________

C4514:  DEC     HL
        LD      A,(HL)
        CP      " "
        JR      Z,C4514
        CP      09H
        JR      Z,C4514
        CP      0AH
        JR      Z,C4514
        INC     HL
        RET

;       Subroutine      FOR statement
;       Inputs          ________________________
;       Outputs         ________________________

C4524:  LD      A,64H
        LD      (SUBFLG),A              ; variable search flag = loopvariable
        CALL    C4880                   ; LET statement (initialize loopvariable)
        POP     BC
        PUSH    HL
        CALL    C485B                   ; skip to end of statement
        LD      (ENDFOR),HL
        LD      HL,2
        ADD     HL,SP                   ; skip 1st word
J4538:  CALL    C3FE6                   ; search FOR block on stack
        JR      NZ,J4554                ; not found, continue
        ADD     HL,BC                   ; to next block
        PUSH    DE
        DEC     HL
        LD      D,(HL)
        DEC     HL
        LD      E,(HL)                  ; ENDFOR address
        INC     HL
        INC     HL
        PUSH    HL
        LD      HL,(ENDFOR)
        RST     DCOMPR                  ; same as this ENDFOR ?
        POP     HL
        POP     DE
        JR      NZ,J4538                ; nope, search next FOR block
        POP     DE                      ; restore BASIC pointer
        LD      SP,HL                   ; remove FOR blocks from stack
        LD      (SAVSTK),HL
        DEFB    00EH                    ; skip next instruction
J4554:  POP     DE
        EX      DE,HL
        LD      C,12
        CALL    C625E                   ; check if enough stackspace for 12 words
        PUSH    HL
        LD      HL,(ENDFOR)
        EX      (SP),HL
        PUSH    HL
        LD      HL,(CURLIN)
        EX      (SP),HL
        RST     SYNCHR
        DEFB    0D9H                    ; check for TO
        RST     GETYPR                  ; get DAC type
        JP      Z,J406D                 ; string, type mismatch error
        PUSH    AF
        CALL    C4C64                   ; evaluate expression
        POP     AF
        PUSH    HL
        JR      NC,J458B                ; loopvariable double real,
        JP      P,J45C2                 ; loopvariable single real,
        CALL    C2F8A                   ; convert DAC to integer
        EX      (SP),HL
        LD      DE,1                    ; default STEP value is 1
        LD      A,(HL)
        CP      0DCH                    ; STEP token ?
        CALL    Z,C520E                 ; yep, skip STEP token and evaluate integer operand
        PUSH    DE
        PUSH    HL
        EX      DE,HL
        CALL    C2EAB                   ; get sign of integer
        JR      J45E8                   ; push step value on stack and continue

J458B:  CALL    C303A                   ; convert DAC to double real
        POP     DE
        LD      HL,-8
        ADD     HL,SP
        LD      SP,HL
        PUSH    DE
        CALL    C2F10                   ; HL = DAC
        POP     HL
        LD      A,(HL)
        CP      0DCH                    ; STEP token ?
        LD      DE,I2D1B                ; 1.0 double real
        LD      A,1                     ; sign is positive
        JR      NZ,J45B2                ; nope, use 1.0 as STEP value
        RST     CHRGTR                  ; get next BASIC character
        CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C303A                   ; convert DAC to double real
        CALL    C2E71                   ; get sign DAC
        LD      DE,DAC
        POP     HL
J45B2:  LD      B,H
        LD      C,L
        LD      HL,-8
        ADD     HL,SP
        LD      SP,HL
        PUSH    AF
        PUSH    BC
        CALL    C2EF3                   ; HL = DE (valtyp)
        POP     HL
        POP     AF
        JR      J45EF                   ; continue

J45C2:  CALL    C2FB2                   ; convert DAC to single real
        CALL    C2ECC                   ; DEBC = DAC (single)
        POP     HL
        PUSH    BC
        PUSH    DE
        LD      BC,1041H
        LD      DE,0000H                ; 1.0 single real
        CALL    H.SNGF
        LD      A,(HL)
        CP      0DCH                    ; STEP token ?
        LD      A,1                     ; sign is positive
        JR      NZ,J45E9                ; nope, push step value on stack and continue
        CALL    C4C65                   ; skip character and evaluate expression
        PUSH    HL
        CALL    C2FB2                   ; convert DAC to single real
        CALL    C2ECC                   ; DEBC = DAC (single real)
        CALL    C2E71                   ; get sign DAC
J45E8:  POP     HL
J45E9:  PUSH    DE
        PUSH    BC
        PUSH    BC
        PUSH    BC
        PUSH    BC
        PUSH    BC
J45EF:  OR      A
        JR      NZ,J45F4
        LD      A,2
J45F4:  LD      C,A
        RST     GETYPR                  ; get DAC type
        LD      B,A                     ;
        PUSH    BC
        PUSH    HL
        LD      HL,(TEMP)
        EX      (SP),HL
J45FD:  LD      B,82H
        PUSH    BC
        INC     SP

;       Subroutine      execute new statement
;       Inputs          ________________________
;       Outputs         ________________________

C4601:  CALL    H.NEWS
        LD      (SAVSTK),SP
        CALL    ISCNTC                  ; check CTRL-STOP
        LD      A,(ONGSBF)
        OR      A                       ; trap occured ?
        CALL    NZ,C6389                ; yep, handle trap
J4612:  EI
        LD      (SAVTXT),HL
        LD      A,(HL)
        CP      ":"
        JR      Z,J4640                 ; statement seperator, skip new line stuff
        OR      A
        JP      NZ,J4055                ; spurious text after statement, syntax error
        INC     HL
J4620:  LD      A,(HL)
        INC     HL
        OR      (HL)                    ; end of basictext ?
        JP      Z,J4039                 ; yep, at end of BASIC program
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; linenumber
        EX      DE,HL
        LD      (CURLIN),HL             ; update current linenumber
        LD      A,(TRCFLG)
        OR      A                       ; trace mode ?
        JR      Z,J463F                 ; skip trace
        PUSH    DE
        LD      A,"["
        RST     OUTDO                   ; "[" to interpreter output
        CALL    C3412                   ; number to interpreter output
        LD      A,"]"
        RST     OUTDO                   ; "]" to interpreter output
        POP     DE
J463F:  EX      DE,HL
J4640:  RST     CHRGTR                  ; get next BASIC character
        LD      DE,C4601
        PUSH    DE
        RET     Z                       ; end of BASIC line, execute new statement
J4646:  CALL    H.GONE
        CP      "_"                     ; CALL ?
        JP      Z,J55A7                 ; yep, execute CALL statement
        SUB     81H                     ; statement token ? (081H-0D8H)
        JP      C,C4880                 ; nope, LET statement
        CP      0D9H-081H               ; valid statement token ?
        JP      NC,J51AD                ; nope, check if function token allowed as statement
        RLCA
        LD      C,A
        LD      B,0
        EX      DE,HL
        LD      HL,I392E
        ADD     HL,BC
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        PUSH    BC                      ; execute statement after this
        EX      DE,HL

;       Subroutine      CHRGTR (get next BASIC char)
;       Inputs          ________________________
;       Outputs         ________________________

C4666:  CALL    H.CHRG
        INC     HL

;       Subroutine      get BASIC char
;       Inputs          ________________________
;       Outputs         ________________________

C466A:  LD      A,(HL)
        CP      3AH                     ; 3AH-FFH, quit with Cx reset. Zx set if statement seperator
        RET     NC
        CP      " "                     ; SPACE ?
        JR      Z,C4666                 ; yep, skip
        JR      NC,J46E0                ; 21H-39H,
        OR      A                       ; end of BASIC line ?
        RET     Z                       ; yep, quit with Cx reset, Zx set
        CP      0BH                     ; 01H-0AH ?
        JR      C,J46DB
        CP      1EH                     ; 1EH token ?
        JR      NZ,J4683                ; nope,
        LD      A,(CONSAV)
        OR      A                       ; yep, orginal numeric token
        RET

J4683:  CP      10H                     ; 10H token ?
        JR      Z,J46BB                 ; yep, return to orginal BASIC pointer
        PUSH    AF                      ; save numeric token
        INC     HL
        LD      (CONSAV),A              ; save token
        SUB     1CH                     ; 1CH, 1DH or 1FH token ?
        JR      NC,J46C0                ; yep, numeric constant
        SUB     11H-1CH                 ; 11H-1BH token ?
        JR      NC,J469A                ; yep, numeric constant 0-10
        CP      0FEH                    ; 0FH token ?
        JR      NZ,J46AE                ; nope, token 0BH,0CH,0DH or 0EH, numeric word constant
        LD      A,(HL)                  ; yep, get byte constant
        INC     HL
J469A:  LD      (CONTXT),HL             ; where BASIC pointer continues
        LD      H,0                     ; clear highbyte
J469F:  LD      L,A
        LD      (CONLO),HL              ; save constant
        LD      A,2
        LD      (CONTYP),A              ; integer type
        LD      HL,I46E6                ; special internal token sequence
        POP     AF                      ; restore numeric token
        OR      A                       ; Cx reset, Zx reset
        RET

J46AE:  LD      A,(HL)                  ; get lowbyte constant
        INC     HL
        INC     HL
        LD      (CONTXT),HL             ; where BASIC pointer continues
        DEC     HL
        LD      H,(HL)                  ; get highbyte constant
        JR      J469F                   ; save constant

J46B8:  CALL    C46E8                   ; get numeric constant (in DAC)
J46BB:  LD      HL,(CONTXT)             ; restore BASIC pointer
        JR      C466A                   ; get BASIC character

J46C0:  INC     A                       ; 1,2 or 4
        RLCA                            ; 2,4 or 8
        LD      (CONTYP),A              ; type
        PUSH    DE
        PUSH    BC
        LD      DE,CONLO
        EX      DE,HL
        LD      B,A
        CALL    C2EF7
        EX      DE,HL
        POP     BC
        POP     DE                      ; copy to CONLO
        LD      (CONTXT),HL             ; where BASIC pointer continues
        POP     AF
        LD      HL,I46E6                ; special internal token sequence
        OR      A                       ; Cx reset, Zx reset
        RET

J46DB:  CP      09H                     ; 09H or 0AH ?
        JP      NC,C4666                ; yep, skip
J46E0:  CP      "0"
        CCF                             ; Cx set if digit
        INC     A
        DEC     A                       ; Zx reset
        RET

I46E6:  DEFB    01EH                    ; internal token for returning the orginal numeric token
        DEFB    010H                    ; resume BASIC pointer

;       Subroutine      get numeric constant (in DAC)
;       Inputs          ________________________
;       Outputs         ________________________

C46E8:  LD      A,(CONSAV)
        CP      0FH                     ; numeric tokens 0FH,11H-1BH,1AH,1BH,1CH,1DH,1FH ?
        JR      NC,J4702                ; yep,
        CP      0DH                     ; numeric tokens 0BH,0CH ?
        JR      C,J4702                 ; yep,
        LD      HL,(CONLO)              ; linenumber/linepointer
        JR      NZ,J46FF                ; numeric token 0EH, linenumber
        INC     HL
        INC     HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL                   ; linenumber
J46FF:  JP      C3236                   ; convert unsigned integer to single real

J4702:  LD      A,(CONTYP)
        LD      (VALTYP),A
        CP      2
        JR      NZ,J4712
        LD      HL,(CONLO)
        LD      (DAC+2),HL
J4712:  LD      HL,CONLO
        JP      C2F08                   ; DAC = CONLO

;       Subroutine      DEFSTR statement
;       Inputs          ________________________
;       Outputs         ________________________

C4718:  LD      E,3                     ; string
        DEFB    01H

;       Subroutine      DEFINT statement
;       Inputs          ________________________
;       Outputs         ________________________

C471B:  LD      E,2                     ; integer
        DEFB    01H

;       Subroutine      DEFSNG statement
;       Inputs          ________________________
;       Outputs         ________________________

C471E:  LD      E,4                     ; single real
        DEFB    01H

;       Subroutine      DEFDBL statement
;       Inputs          ________________________
;       Outputs         ________________________

C4721:  LD      E,8                     ; double real
J4723:  CALL    C64A7                   ; is current BASIC character a upcase letter ?
        LD      BC,J4055
        PUSH    BC
        RET     C                       ; nope, syntax error
        SUB     "A"
        LD      C,A
        LD      B,A
        RST     CHRGTR                  ; get next BASIC character (upcase letter)
        CP      0F2H                    ; - token ?
        JR      NZ,J473D                ; nope,
        RST     CHRGTR                  ; get next BASIC character (- token)
        CALL    C64A7                   ; is current BASIC character a upcase letter ?
        RET     C                       ; nope, syntax error
        SUB     "A"
        LD      B,A
        RST     CHRGTR                  ; get next BASIC character (upcase letter)
J473D:  LD      A,B
        SUB     C                       ; postive range ?
        RET     C                       ; nope, syntax error
        INC     A
        EX      (SP),HL                 ; save BASIC pointer (and remove syntax error address)
        LD      HL,DEFTBL
        LD      B,0
        ADD     HL,BC                   ; to start letter
J4748:  LD      (HL),E                  ; default variabele type
        INC     HL
        DEC     A
        JR      NZ,J4748                ; next
        POP     HL                      ; restore BASIC pointer
        LD      A,(HL)
        CP      ","                     ; an other range follows ?
        RET     NZ                      ; nope, quit
        RST     CHRGTR                  ; get next BASIC character (, char)
        JR      J4723                   ; next range


;       Subroutine      skip basic char, evaluate word operand and check for 0-32767 range
;       Inputs          ________________________
;       Outputs         ________________________

C4755:  RST     CHRGTR                  ; get next BASIC character

;       Subroutine      evaluate word operand and check for 0-32767 range
;       Inputs          ________________________
;       Outputs         ________________________

C4756:  CALL    C520F                   ; evaluate integer operand
        RET     P

;       Subroutine      illegal function call
;       Inputs          ________________________
;       Outputs         ________________________

C475A:  LD      E,5
        JP      J406F                   ; illegal function call

;       Subroutine      collect linenumber (with DOT supported)
;       Inputs          ________________________
;       Outputs         ________________________

C475F:  LD      A,(HL)
        CP      "."
        LD      DE,(DOT)
        JP      Z,C4666                 ; get next BASIC character and quit

;       Subroutine      collect linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C4769:  DEC     HL

;       Subroutine      collect linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C476A:  RST     CHRGTR                  ; get next BASIC character
        CP      0EH                     ; linenumber token ?
        JR      Z,C4771                 ; yep,
        CP      0DH                     ; linepointer token ?

;       Subroutine      get linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C4771:  LD      DE,(CONLO)
        JP      Z,C4666                 ; yep, get next BASIC character
        XOR     A
        LD      (CONSAV),A
        LD      DE,0
        DEC     HL
J4780:  RST     CHRGTR                  ; get next BASIC character
        RET     NC
        PUSH    HL
        PUSH    AF
        LD      HL,6552
        RST     DCOMPR
        JR      C,J479B
        LD      H,D
        LD      L,E
        ADD     HL,DE
        ADD     HL,HL
        ADD     HL,DE
        ADD     HL,HL
        POP     AF
        SUB     30H
        LD      E,A
        LD      D,0
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        JR      J4780

J479B:  POP     AF
        POP     HL
        RET

;       Subroutine      RUN statement
;       Inputs          ________________________
;       Outputs         ________________________


C479E:  JP      Z,C629A                 ; end of statement, initialize interpreter, basic pointer at start of program and quit (which start the program!)
        CP      0EH                     ; linenumber token ?
        JR      Z,J47AA                 ; yep, RUN line
        CP      0DH                     ; linepointer token ?
        JP      NZ,J6B5B                ; nope, RUN file
J47AA:  CALL    C62A1                   ; initialize interpreter
        LD      BC,C4601
        JR      J47E7                   ; execute GOTO statement, after that execute new statement

;       Subroutine      GOSUB statement
;       Inputs          ________________________
;       Outputs         ________________________

C47B2:  LD      C,3
        CALL    C625E                   ; check if enough stackspace for 3 words
        CALL    C4769                   ; collect linenumber
        POP     BC
        PUSH    HL                      ; save current BASIC pointer
        PUSH    HL
        LD      HL,(CURLIN)
        EX      (SP),HL                 ; save current linenumber
        LD      BC,0
        PUSH    BC                      ; 0, not a trapentry
        LD      BC,C4601
        LD      A,8DH
        PUSH    AF
        INC     SP                      ; GOSUB parameter block
        PUSH    BC                      ; after this, execute new statement
        JR      C47EB                   ; goto linenumber

;       Subroutine      GOSUB traphandler
;       Inputs          ________________________
;       Outputs         ________________________

J47CF:  PUSH    HL                      ; save current BASIC pointer
        PUSH    HL
        LD      HL,(CURLIN)
        EX      (SP),HL                 ; save current linenumber
        PUSH    BC                      ; save trapentry
        LD      A,8DH
        PUSH    AF
        INC     SP                      ; GOSUB parameter block
        EX      DE,HL
        DEC     HL
        LD      (SAVTXT),HL             ; start of traphandler as start for CONT
        INC     HL
        LD      (SAVSTK),SP             ; current stackpointer
        JP      J4620                   ; start executing traphandler

J47E7:  PUSH    BC

;       Subroutine      GOTO statement
;       Inputs          ________________________
;       Outputs         ________________________

C47E8:  CALL    C4769                   ; collect linenumber

;       Subroutine      goto linenumber
;       Inputs          ________________________
;       Outputs         ________________________

C47EB:  LD      A,(CONSAV)
        CP      0DH                     ; linepointer token ?
        EX      DE,HL
        RET     Z                       ; yep, quit
        CP      0EH                     ; linenumber token ?
        JP      NZ,J4055                ; nope, syntax error
        EX      DE,HL
        PUSH    HL
        LD      HL,(CONTXT)
        EX      (SP),HL
        CALL    C485D                   ; skip to end of BASIC line
        INC     HL
        PUSH    HL
        LD      HL,(CURLIN)
        RST     DCOMPR
        POP     HL
        CALL    C,C4298
        CALL    NC,C4295                ; nope, search linenumber
        JR      NC,J481C                ; not found, undefined line number error
        DEC     BC
        LD      A,0DH
        LD      (PTRFLG),A
        POP     HL
        CALL    C5583
        LD      H,B
        LD      L,C
        RET

J481C:  LD      E,8
        JP      J406F                   ; undefined line number error

;       Subroutine      RETURN statement
;       Inputs          ________________________
;       Outputs         ________________________

C4821:  CALL    H.RETU                  ; hook start return statement
        LD      (TEMP),HL
        LD      D,0FFH                  ; DE=0FFxxH (impossible loop variable address)
        CALL    C3FE2                   ; search FOR block on stack (skip 2 words)
        CP      8DH                     ; search stopped by a GOSUB block ?
        JR      Z,J4831                 ; yep,
        DEC     HL
J4831:  LD      SP,HL
        LD      (SAVSTK),HL
        LD      E,3
        JP      NZ,J406F                ; nope, return without gosub error
        POP     HL
        LD      A,H
        OR      L                       ; return from trap handler ?
        JR      Z,J4845                 ; nope,
        LD      A,(HL)
        AND     01H                     ; trap enabled ?
        CALL    NZ,C633E                ; yep, unpause trap
J4845:  POP     BC
        LD      HL,C4601
        EX      (SP),HL                 ; after this, execute new statement
        EX      DE,HL
        LD      HL,(TEMP)
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JP      NZ,C47E8                ; not end of statement, goto statement
        LD      H,B
        LD      L,C
        LD      (CURLIN),HL
        EX      DE,HL
        DEFB    03EH                    ; skip next instruction and skip to end of statement


;       Subroutine      skip to end of statement
;       Inputs          ________________________
;       Outputs         ________________________

J485A:  POP     HL

;       Subroutine      skip to end of statement (also DATA statement handler)
;       Inputs          ________________________
;       Outputs         ________________________

C485B:  DEFB    001H                    ; LD BC,xx3AH, skip to 485E
        DEFB    ":"                     ; end search character outside string = :

;       Subroutine      skip to end of BASIC line (also REM/ELSE statement handler)
;       Inputs          ________________________
;       Outputs         ________________________

C485D:  LD      C,0                     ; end search character outside string = none
        LD      B,0                     ; end search character inside string = none

;       Subroutine      skip to end of BASIC line with extra end characters
;       Inputs          C = end search character outside string, B = end search character inside string
;       Outputs         ________________________

J4861:  LD      A,C
        LD      C,B
        LD      B,A
J4864:  DEC     HL
J4865:  RST     CHRGTR                  ; get next BASIC character
        OR      A                       ; end of BASIC line ?
        RET     Z                       ; yep, quit
        CP      B
        RET     Z
        INC     HL
        CP      '"'
        JR      Z,J4861
        INC     A                       ; function token header ?
        JR      Z,J4865                 ; skip function token as well
        SUB     8BH+1                   ; IF token ?
        JR      NZ,J4864                ; nope, next
        CP      B                       ; end search character defined ?
        ADC     A,D
        LD      D,A                     ; yep, increase IF nesting level
        JR      J4864                   ; next

J487B:  POP     AF
        ADD     A,3
        JR      J4892

;       Subroutine      LET statement
;       Inputs          ________________________
;       Outputs         ________________________

C4880:  CALL    C5EA4                   ; locate variable
        RST     SYNCHR
        DEFB    0EFH                    ; check for =
        LD      (TEMP),DE               ; save variable address
        PUSH    DE
        LD      A,(VALTYP)
        PUSH    AF                      ; save variable type
        CALL    C4C64                   ; evaluate expression
        POP     AF
J4892:  EX      (SP),HL
J4893:  LD      B,A
        LD      A,(VALTYP)
        CP      B
        LD      A,B                     ; result expression of the same type as variable ?
        JR      Z,J48A1                 ; yep, no need to convert
        CALL    C517A                   ; convert to DAC to new type
J489E:  LD      A,(VALTYP)
J48A1:  LD      DE,DAC
        CP      2                       ; integer ?
        JR      NZ,J48AB
        LD      DE,DAC+2                ; yep, use DAC+2
J48AB:  PUSH    HL
        CP      3                       ; string ?
        JR      NZ,J48DE                ; nope, just copy value in variable
        LD      HL,(DAC+2)
        PUSH    HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; pointer to string
        LD      HL,KBUF-1
        RST     DCOMPR
        JR      C,J48D2                 ; string in KBUF, copy in string storage area
        LD      HL,(STREND)
        RST     DCOMPR
        POP     DE                      ; stringdescriptor
        JR      NC,J48DA                ; string in programtext, no need to copy
        LD      HL,DSCTMP-1
        RST     DCOMPR
        JR      C,J48D1                 ; temporary stringdescriptor, copy string in string storage area
        LD      HL,TEMPST-1
        RST     DCOMPR
        JR      C,J48DA                 ; no temporaty result stringdesciptor, no need to copy
J48D1:  DEFB    03EH                    ; skip next instruction
J48D2:  POP     DE                      ;
        CALL    C67EE                   ; free descriptor if temporary and on top of heap
        EX      DE,HL
        CALL    C6611                   ; copy string to new temporary string
J48DA:  CALL    C67EE                   ; free descriptor if temporary and on top of heap
        EX      (SP),HL
J48DE:  CALL    C2EF3                   ; HL=DE (valtyp)
        POP     DE
        POP     HL
        RET

;       Subroutine      ON statement
;       Inputs          ________________________
;       Outputs         ________________________

C48E4:  CP      0A6H                    ; ERROR token ?
        JR      NZ,J490D
        RST     CHRGTR                  ; get next BASIC character (ERROR token)
        RST     SYNCHR
        DEFB    089H                    ; check for GOTO token
        CALL    C4769                   ; collect linenumber
        LD      A,D
        OR      E                       ; linenumber zero ?
        JR      Z,J48FB                 ; yep, no ERROR handling
        CALL    C4293                   ; stack HL and search linenumber
        LD      D,B
        LD      E,C
        POP     HL                      ; restore BASIC pointer
        JP      NC,J481C                ; linenumber not found, undefined line number error
J48FB:  LD      (ONELIN),DE             ; set ERROR handler
        RET     C                       ; not ON ERROR GOTO 0, quit
        LD      A,(ONEFLG)
        OR      A                       ; in ERROR handling routine ?
        LD      A,E                     ; ?? unneeded instruction ??
        RET     Z                       ; nope, quit
        LD      A,(ERRFLG)
        LD      E,A                     ; saved errorcode
        JP      J4096                   ; BASIC error

;       Subroutine      ON statement (not ON ERROR)
;       Inputs          ________________________
;       Outputs         ________________________

J490D:  CALL    C7810
        JR      C,J4943
        PUSH    BC
        RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    08DH                    ; check for GOSUB token
        XOR     A
J4917:  POP     BC
        PUSH    BC
        CP      C
        JP      NC,J4055                ; nope, syntax error
        PUSH    AF
        CALL    C4769                   ; collect linenumber
        LD      A,D
        OR      E
        JR      Z,J492E
        CALL    C4293                   ; stack HL and search linenumber
        LD      D,B
        LD      E,C
        POP     HL
        JP      NC,J481C                ; nope, undefined line number error
J492E:  POP     AF
        POP     BC
        PUSH    AF
        ADD     A,B
        PUSH    BC
        CALL    C785C
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        POP     BC
        POP     DE
        RET     Z
        PUSH    BC
        PUSH    DE
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        POP     AF
        INC     A
        JR      J4917

J4943:  CALL    C521C                   ; evaluate byte operand
        LD      A,(HL)
        LD      B,A
        CP      8DH                     ; GOSUB token ?
        JR      Z,J494F
        RST     SYNCHR
        DEFB    089H                    ; check for GOTO token
        DEC     HL
J494F:  LD      C,E
J4950:  DEC     C
        LD      A,B
        JP      Z,J4646
        CALL    C476A                   ; collect linenumber
        CP      ","
        RET     NZ
        JR      J4950

;       Subroutine      RESUME statement
;       Inputs          ________________________
;       Outputs         ________________________

C495D:  LD      A,(ONEFLG)
        OR      A                       ; in ERROR handling routine ?
        JR      NZ,J496C                ; yep,
        LD      (ONELIN+0),A
        LD      (ONELIN+1),A            ; disable ERROR handler
        JP      J4064                   ; resume without error

J496C:  INC     A
        LD      (ERRFLG),A              ; clear errorcode
        LD      A,(HL)
        CP      83H                     ; NEXT token ?
        JR      Z,J4985                 ; yep,
        CALL    C4769                   ; collect linenumber
        RET     NZ                      ; not end of statement, quit (which generates syntax error)
        LD      A,D
        OR      E                       ; linenumber zero ?
        JR      Z,J4989                 ; yep, resume at error position
        CALL    C47EB                   ; goto linenumber
        XOR     A
        LD      (ONEFLG),A              ; not in ERROR handling routine anymore
        RET

J4985:  RST     CHRGTR                  ; get next BASIC character
        RET     NZ                      ; not end of statement, quit (which generates syntax error)
        JR      J498E                   ; flag RESUME 0

J4989:  XOR     A
        LD      (ONEFLG),A              ; not in ERROR handling routine
        INC     A                       ; flag RESUME NEXT
J498E:  LD      HL,(ERRTXT)
        EX      DE,HL
        LD      HL,(ERRLIN)
        LD      (CURLIN),HL             ; current linenumber = linenumber when error occured
        EX      DE,HL                   ; BASIC pointer = BASIC pointer when error occured
        RET     NZ                      ; RESUME NEXT, quit
        LD      A,(HL)
        OR      A                       ; at end of BASIC line ?
        JR      NZ,J49A2                ; nope,
        INC     HL
        INC     HL
        INC     HL
        INC     HL                      ; skip linelink and linenumber
J49A2:  INC     HL
        XOR     A
        LD      (ONEFLG),A              ; not in ERROR handling routine
        JP      C485B                   ; skip to end of statement

;       Subroutine      ERROR statement
;       Inputs          ________________________
;       Outputs         ________________________

C49AA:  CALL    C521C                   ; evaluate byte operand
        RET     NZ                      ; not end of statement, quit (which generates a syntax error)
        OR      A                       ; errornumber 0 ?
        JP      Z,C475A                 ; yep, illegal function call
        JP      J406F                   ; BASIC error

;       Subroutine      AUTO statement
;       Inputs          ________________________
;       Outputs         ________________________

C49B5:  LD      DE,10
        PUSH    DE
        JR      Z,J49D1
        CALL    C475F                   ; collect linenumber (with DOT supported)
        EX      DE,HL
        EX      (SP),HL
        JR      Z,J49D2
        EX      DE,HL
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        LD      DE,(AUTINC)
        JR      Z,J49D1
        CALL    C4769                   ; collect linenumber
        JP      NZ,J4055                ; nope, syntax error
J49D1:  EX      DE,HL
J49D2:  LD      A,H
        OR      L
        JP      Z,C475A                 ; illegal function call
        LD      (AUTINC),HL
        LD      (AUTFLG),A              ; in auto linenumber mode
        POP     HL
        LD      (AUTLIN),HL
        POP     BC
        JP      J4134                   ; mainloop

;       Subroutine      IF statement
;       Inputs          ________________________
;       Outputs         ________________________

C49E5:  CALL    C4C64                   ; evaluate expression
        LD      A,(HL)
        CP      ","
        CALL    Z,C4666                 ; yep, get next BASIC character
        CP      89H                     ; GOTO token ?
        JR      Z,J49F5                 ; yep,
        RST     SYNCHR
        DEFB    0DAH                    ; check for THEN token
        DEC     HL
J49F5:  PUSH    HL
        CALL    C2EA1                   ; get sign DAC
        POP     HL
        JR      Z,J4A0C                 ; DAC is zero, execute ELSE part (if any)
J49FC:  RST     CHRGTR                  ; get next BASIC character
        RET     Z                       ; end of statement, quit
        CP      0EH                     ; linenumber follows ?
        JP      Z,C47E8                 ; yep, goto statement
        CP      0DH                     ; linepointer follows ?
        JP      NZ,J4646                ; nope, execute THEN part
        LD      HL,(CONLO)
        RET

J4A0C:  LD      D,1                     ; IF nesting level=1
J4A0E:  CALL    C485B                   ; skip to end of statement
        OR      A                       ; end of BASIC line ?
        RET     Z                       ; yep, quit
        RST     CHRGTR                  ; get next BASIC character
        CP      0A1H                    ; ELSE token ?
        JR      NZ,J4A0E                ; nope, skip more
        DEC     D
        JR      NZ,J4A0E
        JR      J49FC

;       Subroutine      LPRINT statement
;       Inputs          ________________________
;       Outputs         ________________________

C4A1D:  LD      A,1
        LD      (PRTFLG),A              ; interpreter output to printer
        JR      J4A29

;       Subroutine      PRINT statement
;       Inputs          ________________________
;       Outputs         ________________________

C4A24:  LD      C,2                     ; requested filemode = output
        CALL    C6D57                   ; redirect interpreter output if i/o channel specified
J4A29:  DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        CALL    Z,C7328                 ; no operands, newline to interpreter output
J4A2E:  JP      Z,C4AFF                 ; return interpreter output to screen and quit
        CP      0E4H
        JP      Z,J60B1                 ; USING token,
        CP      0DBH
        JP      Z,J4AC6                 ; TAB( token,
        CP      0DFH
        JP      Z,J4AC6                 ; SPC( token,
        PUSH    HL
        CP      ","
        JR      Z,J4A94
        CP      ";"
        JP      Z,J4AFA
        POP     BC
        CALL    C4C64                   ; evaluate expression
        PUSH    HL
        RST     GETYPR                  ; get DAC type
        JR      Z,J4A8D                 ; string,
        CALL    C3425                   ; convert DAC to text, unformatted
        CALL    C6635                   ; analyse string and create temporary stringdescriptor
        LD      (HL),20H
        LD      HL,(DAC+2)
        INC     (HL)
        CALL    H.PRTF
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        JR      NZ,J4A89                ; yep,
        LD      HL,(DAC+2)
        LD      A,(PRTFLG)
        OR      A                       ; interpreter output to screen ?
        JR      Z,J4A77                 ; yep,
        LD      A,(LPTPOS)
        ADD     A,(HL)
        CP      255
        JR      J4A81

J4A77:  LD      A,(LINLEN)
        LD      B,A
        LD      A,(TTYPOS)
        ADD     A,(HL)
        DEC     A
        CP      B
J4A81:  JR      C,J4A89
        CALL    Z,C7331                 ; yep, interpreter output pos = 0
        CALL    NZ,C7328                ; nope, newline to interpreter output
J4A89:  CALL    C667B                   ; free string and string to interpreter output
        OR      A
J4A8D:  CALL    Z,C667B                 ; free string and string to interpreter output
        POP     HL
        JP      J4A29

J4A94:  CALL    H.COMP
        LD      BC,8
        LD      HL,(PTRFIL)
        ADD     HL,BC
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        LD      A,(HL)
        JR      NZ,J4ABF                ; yep,
        LD      A,(PRTFLG)
        OR      A                       ; interpreter output to screen ?
        JR      Z,J4AB1                 ; yep,
        LD      A,(LPTPOS)
        CP      0EEH
        JR      J4AB9

J4AB1:  LD      A,(CLMLST)
        LD      B,A
        LD      A,(TTYPOS)
        CP      B
J4AB9:  CALL    NC,C7328                ; newline to interpreter output
        JP      NC,J4AFA
J4ABF:  SUB     0EH
        JR      NC,J4ABF
        CPL
        JR      J4AF3

J4AC6:  PUSH    AF
        CALL    C521B                   ; skip basic char and evaluate byte operand
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        DEC     HL
        POP     AF
        SUB     0DFH
        PUSH    HL
        JR      Z,J4AEF
        LD      BC,8
        LD      HL,(PTRFIL)
        ADD     HL,BC
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        LD      A,(HL)
        JR      NZ,J4AEF                ; yep,
        LD      A,(PRTFLG)
        OR      A                       ; interpreter output to screen ?
        JP      Z,J4AEC                 ; yep,
        LD      A,(LPTPOS)
        JR      J4AEF

J4AEC:  LD      A,(TTYPOS)
J4AEF:  CPL
        ADD     A,E
        JR      NC,J4AFA
J4AF3:  INC     A
        LD      B,A
        LD      A," "
J4AF7:  RST     OUTDO                   ; space to interpreter output
        DJNZ    J4AF7
J4AFA:  POP     HL
        RST     CHRGTR                  ; get next BASIC character
        JP      J4A2E

;       Subroutine      return interpreter output to screen
;       Inputs          ________________________
;       Outputs         ________________________

C4AFF:  CALL    H.FINP
        XOR     A
        LD      (PRTFLG),A              ; interpreter output to screen
        PUSH    HL
        LD      H,A
        LD      L,A
        LD      (PTRFIL),HL             ; interpreter input/output device = keyboard/screen
        POP     HL
        RET

;       Subroutine      LINE statement
;       Inputs          ________________________
;       Outputs         ________________________

C4B0E:  CP      85H                     ; next character INPUT token ?
        JP      NZ,J58A7                ; nope, graphics LINE statement
        RST     SYNCHR
        DEFB    085H                    ; check for INPUT token
        CP      "#"                     ; bufferid follows ?
        JP      Z,J6D8F                 ; yep, LINEINPUT for files
        CALL    C4B7B
        CALL    C5EA4                   ; locate variable
        CALL    C3058                   ; check if string
        PUSH    DE
        PUSH    HL
        CALL    INLIN
        POP     DE
        POP     BC
        JP      C,J63FE                 ; aborted,
        PUSH    BC
        PUSH    DE
        LD      B,0
        CALL    C6638                   ; analyze string with specified endmaker (1st char is skipped) and create temporary stringdescriptor
        POP     HL
        LD      A,3
        JP      J4892

I4B3A:  DEFB    "?Redo from start",13,10,0

J4B4D:  CALL    H.TRMN
        LD      A,(FLGINP)
J4B53:  OR      A
        JP      NZ,J404F
        POP     BC
        LD      HL,I4B3A
        CALL    C6678                   ; message to interpreter output
        LD      HL,(SAVTXT)
        RET

J4B62:  CALL    C6D55                   ; redirect interpreter input if i/o channel specified
        PUSH    HL                      ; save BASIC pointer
        LD      HL,BUFMIN
        JP      J4B9B

;       Subroutine      INPUT statement
;       Inputs          ________________________
;       Outputs         ________________________

C4B6C:  CP      "#"                     ; bufferid follows ?
        JR      Z,J4B62                 ; yep,
        PUSH    HL
        PUSH    AF
        CALL    TOTEXT                  ; force text screenmode
        POP     AF
        POP     HL
        LD      BC,I4B8B
        PUSH    BC

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4B7B:  CP      '"'                     ; inputprompt specified ?
        LD      A,0
        RET     NZ                      ; nope, start input
        CALL    C6636                   ; analyze string with " as endmarker (1st char is skipped) and create temporary stringdescriptor
        RST     SYNCHR
        DEFB    ";"                     ; check for ;
        PUSH    HL
        CALL    C667B                   ; free string and string to interpreter output
        POP     HL
        RET

I4B8B:  PUSH    HL
        CALL    QINLIN
        POP     BC
        JP      C,J63FE                 ; aborted,
        INC     HL
        LD      A,(HL)
        OR      A
        DEC     HL
        PUSH    BC
        JP      Z,J485A                 ; skip to end of statement
J4B9B:  LD      (HL),","
        JR      J4BA4

;       Subroutine      READ statement
;       Inputs          ________________________
;       Outputs         ________________________


C4B9F:  PUSH    HL
        LD      HL,(DATPTR)
        DEFB    0F6H                    ; XOR xx, skip next instruction
J4BA4:  XOR     A
        LD      (FLGINP),A
        EX      (SP),HL
        DEFB    001H                    ; LD BC,xxxx, skip next instruction
J4BAA:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C5EA4                   ; locate variable
        EX      (SP),HL
        PUSH    DE
        LD      A,(HL)
        CP      ","
        JR      Z,J4BD1
        LD      A,(FLGINP)
J4BB9:  OR      A
        JP      NZ,J4C40
        LD      A,"?"
        RST     OUTDO                   ; "?" to interpreter output
        CALL    QINLIN
        POP     DE
        POP     BC
        JP      C,J63FE                 ; aborted,
        INC     HL
        LD      A,(HL)
        DEC     HL
        OR      A
        PUSH    BC
        JP      Z,J485A                 ; skip to end of statement
        PUSH    DE
J4BD1:  CALL    ISFLIO                  ; interpreter input/output device = file ?
        JP      NZ,J6D83                ; yep,
        RST     GETYPR                  ; get DAC type
        PUSH    AF
        JR      NZ,J4BFD                ; not a string,
        RST     CHRGTR                  ; get next BASIC character
        LD      D,A
        LD      B,A
        CP      '"'
        JR      Z,J4BEE
        LD      A,(FLGINP)
        OR      A
        LD      D,A
        JR      Z,J4BEB
        LD      D,":"
J4BEB:  LD      B,","
        DEC     HL
J4BEE:  CALL    C6639                   ; analyse string with specified endmarkers (1st char is skipped) and create temporary stringdescriptor
I4BF1:  POP     AF
        ADD     A,3
        EX      DE,HL
        LD      HL,I4C05
        EX      (SP),HL
        PUSH    DE
        JP      J4893

J4BFD:  RST     CHRGTR                  ; get next BASIC character
        LD      BC,I4BF1
        PUSH    BC
        JP      C3299                   ; convert text to number

I4C05:  DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JR      Z,J4C0E
        CP      ","
        JP      NZ,J4B4D
J4C0E:  EX      (SP),HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JP      NZ,J4BAA
        POP     DE
        LD      A,(FLGINP)
        OR      A
        EX      DE,HL
        JP      NZ,J63DE                ; set new DATA pointer and quit
        PUSH    DE
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        JR      NZ,J4C2B                ; yep, skip extra ignored
        LD      A,(HL)
        OR      A

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4C25:  LD      HL,I4C2F
        CALL    NZ,C6678                ; nope, message to interpreter output
J4C2B:  POP     HL
        JP      C4AFF                   ; return interpreter output to screen

I4C2F:  DEFB    "?Extra ignored",13,10,0

J4C40:  CALL    C485B
        OR      A
        JR      NZ,J4C57
        INC     HL
        LD      A,(HL)
        INC     HL
        OR      (HL)
        LD      E,4
        JP      Z,J406F                 ; yep, out of data error
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      (DATLIN),DE
J4C57:  RST     CHRGTR                  ; get next BASIC character
        CP      84H
        JR      NZ,J4C40
        JP      J4BD1

;       Subroutine      evaluate = expression
;       Inputs          HL = basicpointer
;       Outputs         ________________________

C4C5F:  RST     SYNCHR
        DEFB    0EFH                    ; check for =
        DEFB    001H                    ; LD BC,xxxx, skip next instruction

;       Subroutine      evaluate ( expression
;       Inputs          HL = basicpointer
;       Outputs         ________________________


C4C62:  RST     SYNCHR
        DEFB    "("                     ; check for (

;       Subroutine      FRMEVL (Expression Evaluator)
;       Inputs          HL = BASIC pointer
;       Outputs         ________________________

C4C64:  DEC     HL


;       Subroutine      skip character and evaluate expression
;       Inputs          ________________________
;       Outputs         ________________________

C4C65:  LD      D,0                     ; current precedence level 0

;       Subroutine      skip character and evaluate expression with precendence level
;       Inputs          ________________________
;       Outputs         ________________________

C4C67:  PUSH    DE
        LD      C,1
        CALL    C625E                   ; check if enough stackspace for 1 word
        CALL    H.FRME
        CALL    C4DC7                   ; evaluate factor
I4C73:  LD      (TEMP2),HL
J4C76:  LD      HL,(TEMP2)
        POP     BC
        LD      A,(HL)
        LD      (TEMP3),HL
        CP      0EEH                    ; token EEH or above ?
        RET     C                       ; nope, quit (expression ends)
        CP      0F1H                    ; math operator ?
        JR      C,J4CE4                 ; nope, relational operators (EEH-F0H)
        SUB     0F1H
        LD      E,A
        JR      NZ,J4C93                ; not a addition
        LD      A,(VALTYP)
        CP      3                       ; string ?
        LD      A,E
        JP      Z,J6787                 ; yep, concat strings
J4C93:  CP      0FDH-0F1H               ; token FDH-FFH ?
        RET     NC                      ; yep, quit
        LD      HL,I3D3B                ; table for math operator precedence level
        LD      D,0
        ADD     HL,DE
        LD      A,B
        LD      D,(HL)
        CP      D                       ; same or smaller precedence level ?
        RET     NC                      ; yep,
J4CA0:  PUSH    BC                      ; save current precedence level
        LD      BC,J4C76
        PUSH    BC                      ; return
        LD      A,D
        CALL    H.NTPL
        CP      51H
        JR      C,J4CFD
        AND     0FEH
        CP      7AH
        JR      Z,J4CFD
J4CB3:  LD      HL,DAC+2
        LD      A,(VALTYP)
        SUB     3
        JP      Z,J406D                 ; type mismatch
        OR      A
        LD      HL,(DAC+2)
        PUSH    HL
        JP      M,J4CD5                 ; integer
        LD      HL,(DAC+0)
        PUSH    HL
        JP      PO,J4CD5
        LD      HL,(DAC+6)
        PUSH    HL
        LD      HL,(DAC+4)
        PUSH    HL
J4CD5:  ADD     A,3
        LD      C,E
        LD      B,A
        PUSH    BC
        LD      BC,I4D22
J4CDD:  PUSH    BC
        LD      HL,(TEMP3)
        JP      C4C67                   ; skip character and evaluate expression with precendence level

J4CE4:  LD      D,0                     ; clear flag
J4CE6:  SUB     0EEH                    ; relational operators ?
        JR      C,J4D08                 ; nope,
        CP      0F0H-0EEH+1
        JR      NC,J4D08                ; nope,
        CP      0EFH-0EEH
        RLA                             ; b0 is >, b1 is =, b2 is <
        XOR     D
        CP      D                       ; > = > >= >< >=< =<
        LD      D,A
        JP      C,J4055                 ; nope, syntax error
        LD      (TEMP3),HL
        RST     CHRGTR                  ; get next BASIC character
        JR      J4CE6

J4CFD:  PUSH    DE
        CALL    C2F8A                   ; convert DAC to integer
        POP     DE
        PUSH    HL
        LD      BC,I4F78
        JR      J4CDD

J4D08:  LD      A,B
        CP      64H
        RET     NC
        PUSH    BC
        PUSH    DE
        LD      DE,I6405
        LD      HL,I4F57
        PUSH    HL
        RST     GETYPR                  ; get DAC type
        JP      NZ,J4CB3                ; not a string,
        LD      HL,(DAC+2)
        PUSH    HL
        LD      BC,I65C8
        JR      J4CDD

;       Subroutine      apply infix math operator
;       Inputs          ________________________
;       Outputs         ________________________

I4D22:  POP     BC
        LD      A,C
        LD      (DORES),A
        LD      A,(VALTYP)
        CP      B
        JR      NZ,J4D38
        CP      2
        JR      Z,J4D50
        CP      4
        JP      Z,J4D9D
        JR      NC,J4D63
J4D38:  LD      D,A
        LD      A,B
        CP      8
        JR      Z,J4D60
        LD      A,D
        CP      8
        JR      Z,J4D87
        LD      A,B
        CP      4
        JR      Z,J4D9A
        LD      A,D
        CP      3
        JP      Z,J406D                 ; type mismatch
        JR      NC,J4DA4
J4D50:  LD      HL,I3D69
        LD      B,00H
        ADD     HL,BC
        ADD     HL,BC
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        POP     DE
        LD      HL,(DAC+2)
        PUSH    BC
        RET

J4D60:  CALL    C303A                   ; convert DAC to double real
J4D63:  CALL    C2F0D                   ; ARG = DAC
        POP     HL
        LD      (DAC+4),HL
        POP     HL
        LD      (DAC+6),HL
J4D6E:  POP     BC
        POP     DE
        CALL    C2EC1                   ; DAC = (single)
J4D73:  CALL    C303A                   ; convert DAC to double real
        LD      HL,I3D51
J4D79:  LD      A,(DORES)
        RLCA
        ADD     A,L
        LD      L,A
        ADC     A,H
        SUB     L
        LD      H,A
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        JP      (HL)

J4D87:  LD      A,B
        PUSH    AF
        CALL    C2F0D                   ; ARG = DAC
        POP     AF
        LD      (VALTYP),A
        CP      4
        JR      Z,J4D6E
        POP     HL
        LD      (DAC+2),HL
        JR      J4D73

J4D9A:  CALL    C2FB2                   ; convert DAC to single real
J4D9D:  POP     BC
        POP     DE
J4D9F:  LD      HL,I3D5D
        JR      J4D79

J4DA4:  POP     HL
        CALL    C2EB1                   ; push DAC (single)
        CALL    C2FCB                   ; convert to single precision real
        CALL    C2ECC                   ; DEBC = DAC (single)
        POP     HL
        LD      (DAC+0),HL
        POP     HL
        LD      (DAC+2),HL
        JR      J4D9F

C4DB8:  PUSH    HL
        EX      DE,HL
        CALL    C2FCB                   ; convert to single precision real
        POP     HL
        CALL    C2EB1                   ; push DAC (single)
        CALL    C2FCB                   ; convert to single precision real
        JP      J3265

;       Subroutine      Factor Evaluator
;       Inputs          ________________________
;       Outputs         ________________________

C4DC7:  RST     CHRGTR                  ; get next BASIC character
        JP      Z,J406A                 ; end of statement, missing operand error
        JP      C,C3299                 ; convert text to number
        CALL    C64A8                   ; is upcase letter character ?
        JP      NC,C4E9B                ; yep, get variable value
        CP      20H                     ; numeric token ?
        JP      C,J46B8                 ; yep, get constant value
        CALL    H.EVAL
        INC     A                       ; function token ?
        JP      Z,J4EFC                 ; yep, handle function
        DEC     A
        CP      0F1H                    ; + token ?
        JR      Z,C4DC7                 ; yep, again
        CP      0F2H                    ; - token ?
        JP      Z,J4E8D                 ; yep,
        CP      '"'
        JP      Z,C6636                 ; analyze string with " as endmarker (1st char is skipped) and create temporary stringdescriptor and quit
        CP      0E0H                    ; NOT token ?
        JP      Z,J4F63                 ; yep,
        CP      "&"
        JP      Z,C4EB8                 ; convert text with radix indication to number
        CP      0E2H                    ; ERR token ?
        JR      NZ,J4E07                ; nope, other

;       Subroutine      ERR function
;       Inputs          ________________________
;       Outputs         ________________________

        RST     CHRGTR                  ; get next BASIC character
        LD      A,(ERRFLG)
        PUSH    HL
        CALL    C4FCF                   ; byte to DAC
        POP     HL
        RET

J4E07:  CP      0E1H                    ; ERL token ?
        JR      NZ,J4E15                ; nope, other

;       Subroutine      ERL function
;       Inputs          ________________________
;       Outputs         ________________________

        RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      HL,(ERRLIN)
        CALL    C3236                   ; convert unsigned integer to single real
        POP     HL
        RET

J4E15:  CP      0EDH                    ; POINT token ?
        JP      Z,J5803                 ; yep, POINT function handler
        CP      0CBH                    ; TIME token ?
        JP      Z,J7900                 ; yep, TIME function handler
        CP      0C7H                    ; SPRITE token ?
        JP      Z,J7A84                 ; yep, SPRITE function handler
        CP      0C8H                    ; VDP token ?
        JP      Z,J7B47                 ; yep, VDP function handler
        CP      0C9H                    ; BASE token ?
        JP      Z,J7BCB                 ; yep, BASE function handler
        CP      0C1H                    ; PLAY token ?
        JP      Z,J791B                 ; yep, PLAY function handler
        CP      0EAH                    ; DSKI$ token ?
        JP      Z,J7C3E                 ; yep, DSKI$ function handler
        CP      0E9H                    ; ATTR$ token ?
        JP      Z,J7C43                 ; yep, ATTR$ function handler
        CP      0E7H                    ; VARPTR token ?
        JR      NZ,J4E64                ; nope, other

;       Subroutine      VARPTR function
;       Inputs          ________________________
;       Outputs         ________________________

        RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    "("                     ; check for (
        CP      "#"
        JR      NZ,J4E53                ; no fileid, varptr for variables
        CALL    C521B                   ; skip basic char and evaluate byte operand
        PUSH    HL
        CALL    C6A6D                   ; get i/o channel control block
        EX      DE,HL
        POP     HL
        JR      J4E56

J4E53:  CALL    C5F5D                   ; locate variable (search only)
J4E56:  RST     SYNCHR
        DEFB    ")"                     ; check for )
        PUSH    HL
        EX      DE,HL
        LD      A,H
        OR      L                       ; variable found ?
        JP      Z,C475A                 ; nope, illegal function call
        CALL    C2F99                   ; put HL in DAC
        POP     HL
        RET

J4E64:  CP      0DDH                    ; USR token ?
        JP      Z,J4FD5                 ; yep, USR function handler
        CP      0E5H                    ; INSTR token ?
        JP      Z,J68EB                 ; yep, INSTR function handler
        CP      0ECH                    ; INKEY$ token ?
        JP      Z,J7347                 ; yep, INKEY$ function handler
        CP      0E3H                    ; STRING$ token ?
        JP      Z,J6829                 ; yep, STRING$ function handler
        CP      85H                     ; INPUT token ?
        JP      Z,J6C87                 ; yep, INPUT function handler
        CP      0E8H                    ; CSRLIN token ?
        JP      Z,J790A                 ; yep, CSRLIN function handler
        CP      0DEH                    ; FN token ?
        JP      Z,J5040                 ; yep, FN function handler

;       Subroutine      evaluate ( expression )
;       Inputs          ________________________
;       Outputs         ________________________

C4E87:  CALL    C4C62                   ; evaluate ( expression
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        RET

J4E8D:  LD      D,7DH
        CALL    C4C67                   ; skip character and evaluate expression with precendence level
        LD      HL,(TEMP2)
        PUSH    HL
        CALL    C2E86                   ; negate
I4E99:  POP     HL
        RET

;       Subroutine      get variable value
;       Inputs          ________________________
;       Outputs         ________________________

C4E9B:  CALL    C5EA4                   ; locate variable (without creation)
        PUSH    HL
        EX      DE,HL
        LD      (DAC+2),HL
        RST     GETYPR                  ; get DAC type
        CALL    NZ,C2F08                ; not a string, DAC = HL
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C4EA9:  LD      A,(HL)

;       Subroutine      upcase char
;       Inputs          ________________________
;       Outputs         ________________________

C4EAA:  CP      "a"
        RET     C
        CP      "z"+1
        RET     NC
        AND     5FH
        RET

;       Unused Code
;       Not called from anywhere, leftover from a early Microsoft BASIC

?4EB3:  CP      "&"
        JP      NZ,C4769                ; collect linenumber

;       Subroutine      convert text with radix indication to number
;       Inputs          ________________________
;       Outputs         ________________________

C4EB8:  LD      DE,0
        RST     CHRGTR                  ; get next BASIC character
        CALL    C4EAA
        LD      BC,0102H
        CP      "B"
        JR      Z,J4ED5
        LD      BC,0308H
        CP      "O"
        JR      Z,J4ED5
        LD      BC,0410H
        CP      "H"
        JP      NZ,J4055                ; nope, syntax error
J4ED5:  INC     HL
        LD      A,(HL)
        EX      DE,HL
        CALL    C4EAA
        CP      "9"+1
        JR      C,J4EE5
        CP      "A"
        JR      C,J4EF7
        SUB     7
J4EE5:  SUB     "0"
        CP      C
        JR      NC,J4EF7
        PUSH    BC
J4EEB:  ADD     HL,HL
        JP      C,J4067                 ; overflow error
        DJNZ    J4EEB
        POP     BC
        OR      L
        LD      L,A
        EX      DE,HL
        JR      J4ED5

J4EF7:  CALL    C2F99                   ; put HL in DAC
        EX      DE,HL
        RET

J4EFC:  INC     HL
        LD      A,(HL)
        SUB     81H
        LD      B,00H
        RLCA
        LD      C,A
        PUSH    BC
        RST     CHRGTR                  ; get next BASIC character
        LD      A,C
        CP      05H
        JR      NC,J4F21
        CALL    C4C62                   ; evaluate ( expression
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C3058                   ; check if string
        EX      DE,HL
        LD      HL,(DAC+2)
        EX      (SP),HL
        PUSH    HL
        EX      DE,HL
        CALL    C521C                   ; evaluate byte operand
        EX      DE,HL
        EX      (SP),HL
        JR      J4F3B

J4F21:  CALL    C4E87                   ; evaluate ( expression )
        EX      (SP),HL
        LD      A,L
        CP      0CH
        JR      C,J4F37

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4F2A:  CP      1BH
        CALL    H.OKNO
        JR      NC,J4F37
        RST     GETYPR                  ; get DAC type
        PUSH    HL
        CALL    C,C303A                 ; not a double real, convert DAC to double real
        POP     HL
J4F37:  LD      DE,I4E99
        PUSH    DE
J4F3B:  LD      BC,I39DE
        CALL    H.FING

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4F41:  ADD     HL,BC
        LD      C,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,C
        JP      (HL)


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C4F47:  DEC     D
        CP      0F2H
        RET     Z
        CP      "-"
        RET     Z
        INC     D
        CP      "+"
        RET     Z
        CP      0F1H
        RET     Z
        DEC     HL
        RET

;       Subroutine      apply infix relational operator
;       Inputs          ________________________
;       Outputs         ________________________


I4F57:  INC     A
        ADC     A,A
        POP     BC
        AND     B
        ADD     A,0FFH
        SBC     A,A
        CALL    C2E9A
        JR      J4F75

J4F63:  LD      D,5AH
        CALL    C4C67                   ; skip character and evaluate expression with precendence level
        CALL    C2F8A                   ; convert DAC to integer
        LD      A,L
        CPL
        LD      L,A
        LD      A,H
        CPL
        LD      H,A
        LD      (DAC+2),HL
        POP     BC
J4F75:  JP      J4C76

;       Subroutine      apply infix logical operator
;       Inputs          ________________________
;       Outputs         ________________________


I4F78:  LD      A,B
        PUSH    AF
        CALL    C2F8A                   ; convert DAC to integer
        POP     AF
        POP     DE
        CP      7AH
        JP      Z,C323A                 ; integer mod
        CP      7BH
        JP      Z,C31E6                 ; integer divide
        LD      BC,I4FD1
        PUSH    BC
        CP      46H
        JR      NZ,J4F97
        LD      A,E
        OR      L
        LD      L,A
        LD      A,H
        OR      D
        RET

J4F97:  CP      50H
        JR      NZ,J4FA1
        LD      A,E
        AND     L
        LD      L,A
        LD      A,H
        AND     D
        RET

J4FA1:  CP      3CH
        JR      NZ,J4FAB
        LD      A,E
        XOR     L
        LD      L,A
        LD      A,H
        XOR     D
        RET

J4FAB:  CP      32H
        JR      NZ,J4FB7
        LD      A,E
        XOR     L
        CPL
        LD      L,A

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C4FB3:  LD      A,H
        XOR     D
        CPL
        RET

J4FB7:  LD      A,L
        CPL
        AND     E
        CPL
        LD      L,A
        LD      A,H
        CPL
        AND     D
        CPL
        RET

J4FC1:  OR      A
        SBC     HL,DE
        JP      C3236                   ; convert unsigned integer to single real

;       Subroutine      LPOS function
;       Inputs          ________________________
;       Outputs         ________________________


C4FC7:  LD      A,(LPTPOS)
        JR      C4FCF                   ; byte to DAC

;       Subroutine      POS function
;       Inputs          ________________________
;       Outputs         ________________________


C4FCC:  LD      A,(TTYPOS)

;       Subroutine      put byte in DAC
;       Inputs          ________________________
;       Outputs         ________________________

C4FCF:  LD      L,A
        XOR     A
I4FD1:  LD      H,A
        JP      C2F99                   ; put HL in DAC

;       Subroutine      USR function
;       Inputs          ________________________
;       Outputs         ________________________
;       Remark  user machinecode subroutine gets the following parameters:
;               HL = DAC, A = variabletype, DE = start of string

J4FD5:  CALL    C4FF4                   ; get usernumber and USRTAB entry
        PUSH    DE
        CALL    C4E87                   ; evaluate ( expression )
        EX      (SP),HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,J3297
        PUSH    HL                      ; return here to restore basictext pointer after user subroutine
        PUSH    DE
        LD      A,(VALTYP)
        PUSH    AF
        CP      3
        CALL    Z,C67D3                 ; parameter is a string, free temporary string in DAC
        POP     AF
        EX      DE,HL
        LD      HL,DAC
        RET                             ; start user machinecode subroutine


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C4FF4:  RST     CHRGTR                  ; get next BASIC character
        LD      BC,0
        CP      1BH
        JR      NC,J5007
        CP      11H
        JR      C,J5007
        RST     CHRGTR                  ; get next BASIC character
        LD      A,(CONLO)
        OR      A
        RLA
        LD      C,A
J5007:  EX      DE,HL
        LD      HL,USRTAB
        ADD     HL,BC
        EX      DE,HL
        RET

;       Subroutine      DEF USR statement
;       Inputs          ________________________
;       Outputs         ________________________


J500E:  CALL    C4FF4
        PUSH    DE
        RST     SYNCHR
        DEFB    0EFH                    ; check for =
        CALL    C542F                   ; evaluate address operand
        EX      (SP),HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        POP     HL
        RET

;       Subroutine      DEF statement
;       Inputs          ________________________
;       Outputs         ________________________


C501D:  CP      0DDH
        JR      Z,J500E                 ; USR token, DEFUSR
        CALL    C51A1                   ; check for FN and create functionname var
        CALL    C5193                   ; illegal direct when in direct mode
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        EX      DE,HL                   ; save pointer to functiondefinition
        LD      A,(HL)
        CP      "("
        JP      NZ,C485B                ; no parameters, skip to next statement and continue
        RST     CHRGTR                  ; get next BASIC character
J5033:  CALL    C5EA4                   ; locate variable
        LD      A,(HL)
        CP      ")"
        JP      Z,C485B                 ; end of parameters, skip to next statement and continue
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        JR      J5033                   ; parse through parameters

;       Subroutine      FN function
;       Inputs          ________________________
;       Outputs         ________________________

J5040:  CALL    C51A1                   ; check for FN and locate functionname var
        LD      A,(VALTYP)
        OR      A
        PUSH    AF
        LD      (TEMP2),HL              ; save BASIC pointer
        EX      DE,HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A                     ; pointer to functiondefinition
        LD      A,H
        OR      L
        JP      Z,J4061                 ; not defined, undefined user function error
        LD      A,(HL)
        CP      "("
        JP      NZ,J50F4                ; no parameters, skip
        RST     CHRGTR                  ; get next BASIC character
        LD      (TEMP3),HL              ; save functiondefinition pointer
        EX      DE,HL
        LD      HL,(TEMP2)
        RST     SYNCHR
        DEFB    "("                     ; check for (
        XOR     A
        PUSH    AF
        PUSH    HL
        EX      DE,HL
J5069:  LD      A,80H
        LD      (SUBFLG),A              ; variable search flag = function variable
        CALL    C5EA4                   ; locate variable
        EX      DE,HL
        EX      (SP),HL
        LD      A,(VALTYP)
        PUSH    AF
        PUSH    DE
        CALL    C4C64                   ; evaluate expression
        LD      (TEMP2),HL              ; save basictext pointer
        POP     HL
        LD      (TEMP3),HL
        POP     AF
        CALL    C517A                   ; convert to DAC to new type
        LD      C,4
        CALL    C625E                   ; check if enough stackspace for 4 words
        LD      HL,-8
        ADD     HL,SP
        LD      SP,HL
        CALL    C2F10                   ; HL = DAC
        LD      A,(VALTYP)
        PUSH    AF
        LD      HL,(TEMP2)              ; restore basictext pointer
        LD      A,(HL)
        CP      ")"
        JR      Z,J50AD
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        PUSH    HL
        LD      HL,(TEMP3)
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        JR      J5069

I50A9:  POP     AF
        LD      (PRMLN2),A
J50AD:  POP     AF
        OR      A
        JR      Z,J50E9
        LD      (VALTYP),A
        LD      HL,0
        ADD     HL,SP
        CALL    C2F08                   ; DAC = HL
        LD      HL,8
        ADD     HL,SP
        LD      SP,HL
        POP     DE
        LD      L,03H
        DEC     DE
        DEC     DE
        DEC     DE
        LD      A,(VALTYP)
        ADD     A,L
        LD      B,A
        LD      A,(PRMLN2)
        LD      C,A
        ADD     A,B
        CP      64H
        JP      NC,C475A                ; illegal function call
        PUSH    AF
        LD      A,L
        LD      B,00H
        LD      HL,PARM2
        ADD     HL,BC
        LD      C,A
        CALL    C518E
        LD      BC,I50A9
        PUSH    BC
        PUSH    BC
        JP      J489E

J50E9:  LD      HL,(TEMP2)
        RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      HL,(TEMP3)
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        DEFB    03EH                    ; LD A,xx, skip next instruction
J50F4:  PUSH    DE
        LD      (TEMP3),HL
        LD      A,(PRMLEN)
        ADD     A,4
        PUSH    AF
        RRCA
        LD      C,A                     ; number of words
        CALL    C625E                   ; check if enough stackspace
        POP     AF
        LD      C,A
        CPL
        INC     A
        LD      L,A
        LD      H,0FFH
        ADD     HL,SP
        LD      SP,HL
        PUSH    HL
        LD      DE,PRMSTK
        CALL    C518E
        POP     HL
        LD      (PRMSTK),HL
        LD      HL,(PRMLN2)
        LD      (PRMLEN),HL
        LD      B,H
        LD      C,L
        LD      HL,PARM1
        LD      DE,PARM2
        CALL    C518E
        LD      H,A
        LD      L,A
        LD      (PRMLN2),HL
        LD      HL,(FUNACT)
        INC     HL
        LD      (FUNACT),HL
        LD      A,H
        OR      L
        LD      (NOFUNS),A
        LD      HL,(TEMP3)
        CALL    C4C5F                   ; evaluate = expression
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JP      NZ,J4055                ; nope, syntax error
        RST     GETYPR                  ; get DAC type
        JR      NZ,J5156                ; not a string,
        LD      DE,DSCTMP
        LD      HL,(DAC+2)
        RST     DCOMPR
        JR      C,J5156
        CALL    C6611                   ; copy string to new temporary string
        CALL    C6658                   ; push descriptor to temporary desciptor heap
J5156:  LD      HL,(PRMSTK)
        LD      D,H
        LD      E,L
        INC     HL
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     BC
        INC     BC
        INC     BC
        INC     BC
        LD      HL,PRMSTK
        CALL    C518E
        EX      DE,HL
        LD      SP,HL
        LD      HL,(FUNACT)
        DEC     HL
        LD      (FUNACT),HL
        LD      A,H
        OR      L
        LD      (NOFUNS),A
        POP     HL
        POP     AF

;       Subroutine      convert DAC to other type
;       Inputs          A = new type, (VALTYP) = current type, (DAC) = current value
;       Outputs         ________________________

C517A:  PUSH    HL
        AND     07H
        LD      HL,I3D47
        LD      C,A
        LD      B,00H
        ADD     HL,BC
        CALL    C4F41
        POP     HL
        RET

J5189:  LD      A,(DE)
        LD      (HL),A
        INC     HL
        INC     DE
        DEC     BC

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C518E:  LD      A,B
        OR      C
        JR      NZ,J5189
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5193:  PUSH    HL
        LD      HL,(CURLIN)
        INC     HL
        LD      A,H
        OR      L                       ; interpreter in direct mode ?
        POP     HL
        RET     NZ                      ; nope, quit
        LD      E,12
        JP      J406F                   ; illegal direct error

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C51A1:  RST     SYNCHR
        DEFB    0DEH                    ; check for FN token
        LD      A,080H
        LD      (SUBFLG),A              ; variable search flag = function variable
        OR      (HL)
        LD      C,A                     ; first varletter with b7 set
        JP      J5EA9                   ; locate functionname variable

;       Subroutine      check if function token allowed as statement
;       Inputs          ________________________
;       Outputs         ________________________

J51AD:  CP      0FFH-081H               ; function token header ?
        JR      NZ,J51C6                ; nope, syntax error
        INC     HL
        LD      A,(HL)                  ; get function token
        INC     HL
        CP      83H                     ; MID$ ?
        JP      Z,J696E                 ; yep, execute MID$ statement
        CP      0A3H                    ; STRIG ?
        JP      Z,J77BF                 ; yep, execute STRIG statement
        CP      85H                     ; INT ?
        JP      Z,J77B1                 ; yep, check if INTERVAL
        CALL    H.ISMI                  ; hook for more function tokens as statement
J51C6:  JP      J4055                   ; syntax error

;       Subroutine      WIDTH statement
;       Inputs          ________________________
;       Outputs         ________________________


C51C9:  CALL    C521C                   ; evaluate byte operand
        CALL    H.WIDT
        AND     A                       ; width 0 ?
        jr      z,A51DF
        ld      a,(OLDSCR)
        and     a
        ld      a,e
        jr      z,A51DD
        cp      32+1
        jr      nc,A51DF
A51DD:  cp      40+1
A51DF:  jp      nc,C475A
        ld      a,(LINLEN)
        cp      e
        ret     z
        ld      a,00CH
        rst     OUTDO
        ld      a,e
        ld      (LINLEN),a
        ld      a,(OLDSCR)
        dec     a
        ld      a,e
        jr      nz,A51FA
        ld      (LINL32),a
        jr      A51FD

A51FA:  ld      (LINL40),a
A51FD:  ld      a,00CH
        rst     OUTDO
        ld      a,e
A5201:  sub     00EH
        jr      nc,A5201
        add     a,01CH
        cpl
        inc     a
        add     a,e
        ld      (CLMLST),a
        ret

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C520E:  RST     CHRGTR                  ; get next BASIC character

;       Subroutine      evaluate integer operand
;       Inputs          ________________________
;       Outputs         ________________________

C520F:  CALL    C4C64                   ; evaluate expression

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5212:  PUSH    HL
        CALL    C2F8A                   ; convert DAC to integer
        EX      DE,HL
        POP     HL
        LD      A,D
        OR      A
        RET

;       Subroutine      skip basic char and evaluate byte operand
;       Inputs          ________________________
;       Outputs         ________________________

C521B:  RST     CHRGTR                  ; get next BASIC character

;       Subroutine      evaluate byte operand
;       Inputs          ________________________
;       Outputs         ________________________

C521C:  CALL    C4C64                   ; evaluate expression

;       Subroutine      check for byte value
;       Inputs          ________________________
;       Outputs         ________________________

C521F:  CALL    C5212
        JP      NZ,C475A                ; illegal function call
        DEC     HL
        RST     CHRGTR                  ; set end of statement flag
        LD      A,E
        RET

;       Subroutine      LLIST statement
;       Inputs          ________________________
;       Outputs         ________________________

C5229:  LD      A,1
        LD      (PRTFLG),A              ; interpreter output to printer

;       Subroutine      LIST statement
;       Inputs          ________________________
;       Outputs         ________________________

C522E:  CALL    H.LIST
        POP     BC
        CALL    C4279                   ; evaluate linenumber (range) and search start linenumber
        PUSH    BC                      ; save pointer to startline
J5236:  LD      HL,0FFFFH
        LD      (CURLIN),HL             ; interpreter in direct mode
        POP     HL                      ; pointer startline
        POP     DE                      ; end linenumber
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; linepointer
        INC     HL
        LD      A,B
        OR      C                       ; end of program ?
        JP      Z,J411F                 ; yep, ok and mainloop
        CALL    ISFLIO                  ; interpreter input/output device = file ?
        CALL    Z,ISCNTC                ; nope, check CTRL-STOP
        PUSH    BC                      ; save start of next line
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; linenumber
        INC     HL
        PUSH    BC
        EX      (SP),HL
        EX      DE,HL
        RST     DCOMPR                  ; compare with end linenumber
        POP     BC
        JP      C,J411E                 ; all done, ok and mainloop (+POP)
        EX      (SP),HL
        PUSH    HL
        PUSH    BC
        EX      DE,HL
        LD      (DOT),HL
        CALL    C3412                   ; number to interpreter output
        POP     HL
        LD      A,(HL)
        CP      09H                     ; TAB ?
        JR      Z,J526D                 ; yep, skip space
        LD      A," "
        RST     OUTDO                   ; space to interpreter output
J526D:  CALL    C5284                   ; decode BASIC line
        LD      HL,BUF
        CALL    C527B                   ; string to interpreter output
        CALL    C7328                   ; newline to interpreter output
        JR      J5236                   ; next line

;       Subroutine      string to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

C527B:  LD      A,(HL)
        OR      A
        RET     Z
        CALL    C7367                   ; char to interpreter output, LF expanded

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5281:  INC     HL
        JR      C527B

;       Subroutine      decode BASIC line
;       Inputs          ________________________
;       Outputs         ________________________

C5284:  LD      BC,BUF
        LD      D,255
        XOR     A
        LD      (DORES),A               ; clear decode status
        JR      J5293

J528F:  INC     BC
        INC     HL
        DEC     D
        RET     Z                       ; buffer full, quit
J5293:  LD      A,(HL)
        OR      A                       ; end of BASIC line ?
        LD      (BC),A
        RET     Z                       ; yep, quit
        CP      0BH                     ; 01H-0AH ?
        JR      C,J52C0                 ; yep, next BASIC char
        CP      20H                     ; 0BH-1FH ?
        JP      C,J5361                 ; yep, numeric token
        CP      '"'                     ; begin/end of string ?
        JR      NZ,J52AE                ; nope,
        LD      A,(DORES)
        XOR     01H
        LD      (DORES),A               ; toggle string status
        LD      A,'"'
J52AE:  CP      ":"                     ; statement seperator ?
        JR      NZ,J52C0                ; nope,
        LD      A,(DORES)
        RRA                             ; in string ?
        JR      C,J52BE                 ; yep,
        RLA
        AND     0FDH
        LD      (DORES),A               ; clear data statement flag
J52BE:  LD      A,":"
J52C0:  OR      A                       ; 01H-7FH ?
        JP      P,J528F                 ; yep, next BASIC char
        LD      A,(DORES)
        RRA                             ; in string ?
        JR      C,J52F8                 ; yep, next BASIC char
        RRA
        RRA                             ; in rem statement ?
        JR      NC,J530C                ; nope,
        LD      A,(HL)
        CP      0E6H                    ; ' token ?
        PUSH    HL
        PUSH    BC
        LD      HL,I52F5
        PUSH    HL                      ; when quit, next BASIC char
        RET     NZ                      ; nope, next BASIC char
        DEC     BC
        LD      A,(BC)
        CP      "M"
        RET     NZ
        DEC     BC
        LD      A,(BC)
        CP      "E"
        RET     NZ
        DEC     BC
        LD      A,(BC)
        CP      "R"
        RET     NZ
        DEC     BC
        LD      A,(BC)
        CP      ":"                     ; preceeded by :REM ?
        RET     NZ                      ; nope, next BASIC char
        POP     AF                      ; remove returnaddress
        POP     AF                      ; remove buf pointer
        POP     HL                      ; restore line pointer
        INC     D
        INC     D
        INC     D
        INC     D                       ; remove :REM
        JR      J531A                   ; translate '

I52F5:  POP     BC
        POP     HL
        LD      A,(HL)
J52F8:  JP      J528F

;       Subroutine      set data statement flag
;       Inputs          ________________________
;       Outputs         ________________________

C52FB:  LD      A,(DORES)
        OR      02H
J5300:  LD      (DORES),A
        XOR     A
        RET

;       Subroutine      set rem statement flag
;       Inputs          ________________________
;       Outputs         ________________________

C5305:  LD      A,(DORES)
        OR      04H
        JR      J5300

J530C:  RLA                             ; in data statement ?
        JR      C,J52F8                 ; yep, next BASIC char
        LD      A,(HL)
        CP      84H                     ; DATA token ?
        CALL    Z,C52FB                 ; yep, set data statement flag
        CP      8FH                     ; REM token ?
        CALL    Z,C5305                 ; yep, set rem statement flag
J531A:  LD      A,(HL)
        INC     A                       ; function token header ?
        LD      A,(HL)
        JR      NZ,J5323                ; nope,
        INC     HL
        LD      A,(HL)                  ; function token
        AND     7FH                     ; to 000H-07FH range
J5323:  INC     HL
        CP      0A1H                    ; ELSE token ?
        JR      NZ,J532A                ; nope,
        DEC     BC
        INC     D
J532A:  PUSH    HL
        PUSH    BC
        PUSH    DE
        CALL    H.BUFL
        LD      HL,T3A72-1
        LD      B,A
        LD      C,"A"-1
J5336:  INC     C
J5337:  INC     HL
        LD      D,H
        LD      E,L
J533A:  LD      A,(HL)
        OR      A
        JR      Z,J5336
        INC     HL
        JP      P,J533A
        LD      A,(HL)
        CP      B
        JR      NZ,J5337
        EX      DE,HL
        LD      A,C
        POP     DE
        POP     BC
        CP      "Z"+1                   ; end of normal tokenlist ?
        JR      NZ,J5350                ; nope,
J534E:  LD      A,(HL)                  ; single char token
        INC     HL
J5350:  LD      E,A
        AND     7FH
        LD      (BC),A
        INC     BC
        DEC     D
        JP      Z,J66A7
        OR      E
        JP      P,J534E
        POP     HL
        JP      J5293

;       Subroutine      decode numeric tokens
;       Inputs          ________________________
;       Outputs         ________________________

J5361:  DEC     HL
        RST     CHRGTR                  ; get numeric token
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    C46E8                   ; get numeric constant
        POP     AF
        LD      BC,I537E
        PUSH    BC
        CP      0BH
        JP      Z,C371E                 ; convert integer to octal text
        CP      0CH
        JP      Z,C3722                 ; convert integer to hexadecimal text
        LD      HL,(CONLO)
        JP      C3425                   ; convert DAC to text, unformatted

I537E:  POP     BC
        POP     DE
        LD      A,(CONSAV)
        LD      E,"O"
        CP      0BH                     ; octal constant ?
        JR      Z,J538F                 ; yep, &O
        CP      0CH                     ; hexadecimal constant ?
        LD      E,"H"
        JR      NZ,J539A                ; nope, skip &x
J538F:  LD      A,"&"
        LD      (BC),A
        INC     BC
        DEC     D
        RET     Z
        LD      A,E
        LD      (BC),A
        INC     BC
        DEC     D
        RET     Z
J539A:  LD      A,(CONTYP)
        CP      4                       ; single real ?
        LD      E,0
        JR      C,J53A9                 ; integer,
        LD      E,"!"
        JR      Z,J53A9                 ; single real,
        LD      E,"#"                   ; double real
J53A9:  LD      A,(HL)
        CP      " "
        JR      NZ,J53AF

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C53AE:  INC     HL
J53AF:  LD      A,(HL)
        INC     HL
        OR      A
        JR      Z,J53D4
        LD      (BC),A

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C53B5:  INC     BC
        DEC     D
        RET     Z
        LD      A,(CONTYP)
        CP      4
        JR      C,J53AF
        DEC     BC
        LD      A,(BC)
        INC     BC
        JR      NZ,J53C8
        CP      "."
        JR      Z,J53D0
J53C8:  CP      "D"
        JR      Z,J53D0
        CP      "E"
        JR      NZ,J53AF
J53D0:  LD      E,00H
        JR      J53AF

J53D4:  LD      A,E
        OR      A
        JR      Z,J53DC
        LD      (BC),A
        INC     BC
        DEC     D
        RET     Z
J53DC:  LD      HL,(CONTXT)
        JP      J5293

;       Subroutine      DELETE statement
;       Inputs          ________________________
;       Outputs         ________________________

C53E2:  CALL    C4279                   ; evaluate linenumber (range) and search start linenumber
        PUSH    BC
        CALL    C54EA                   ; convert to linepointers to linenumbers if needed
        POP     BC
        POP     DE
        PUSH    BC
        PUSH    BC
        CALL    C4295                   ; search linenumber (end linenumber)
        JR      NC,J53F7                ; not found, illegal function call
        LD      D,H
        LD      E,L
        EX      (SP),HL
        PUSH    HL
        RST     DCOMPR
J53F7:  JP      NC,C475A                ; illegal function call
        LD      HL,I3FD7
        CALL    C6678                   ; message to interpreter output
        POP     BC
        LD      HL,J4237
        EX      (SP),HL

;       Subroutine      remove line(s)
;       Inputs          HL = start of BASIC text that follows, BC = start of deleted BASIC text
;       Outputs         ________________________

C5405:  EX      DE,HL
        LD      HL,(VARTAB)
J5409:  LD      A,(DE)
        LD      (BC),A
        INC     BC
        INC     DE
        RST     DCOMPR
        JR      NZ,J5409
        LD      H,B
        LD      L,C
        LD      (VARTAB),HL             ; start variable area
        LD      (ARYTAB),HL             ; start arrayvariable area = start variable area (no variables)
        LD      (STREND),HL             ; start free area = start variable area (no arrayvariables)
        RET

;       Subroutine      PEEK function
;       Inputs          ________________________
;       Outputs         ________________________


C541C:  CALL    C5439                   ; convert address to integer
        LD      A,(HL)
        JP      C4FCF                   ; byte to DAC

;       Subroutine      POKE statement
;       Inputs          ________________________
;       Outputs         ________________________


C5423:  CALL    C542F                   ; evaluate address operand
        PUSH    DE
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
        POP     DE
        LD      (DE),A
        RET

;       Subroutine      evaluate address operand
;       Inputs          ________________________
;       Outputs         ________________________

C542F:  CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C5439                   ; convert address to integer
        EX      DE,HL
        POP     HL
        RET

;       Subroutine      convert address to integer
;       Inputs          ________________________
;       Outputs         ________________________

C5439:  LD      BC,C2F8A
        PUSH    BC                      ; convert DAC to integer
        RST     GETYPR                  ; get DAC type
        RET     M                       ; already a integer, quit
        CALL    H.FRQI
        CALL    C2E71                   ; get sign DAC
        RET     M                       ; DAC is negative, just convert
        CALL    C2FB2                   ; convert DAC to single real
        LD      BC,03245H
        LD      DE,08076H               ; 32768
        CALL    C2F21                   ; single real compare
        RET     C                       ; smaller as 32768, just convert
        LD      BC,06545H
        LD      DE,06053H               ; 65536
        CALL    C2F21                   ; single real compare
        JP      NC,J4067                ; bigger as 65535, overflow error
        LD      BC,065C5H
        LD      DE,06053H               ; -65536
        JP      C324E                   ; single real addition

;       Subroutine      RENUM statement
;       Inputs          ________________________
;       Outputs         ________________________

C5468:  LD      BC,10
        PUSH    BC
        LD      D,B
        LD      E,B
        JR      Z,J5496
        CP      ","
        JR      Z,J547D
        PUSH    DE
        CALL    C475F                   ; collect linenumber (with DOT supported)
        LD      B,D
        LD      C,E
        POP     DE
        JR      Z,J5496
J547D:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C475F                   ; collect linenumber (with DOT supported)
        JR      Z,J5496
        POP     AF
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        PUSH    DE
        CALL    C4769                   ; collect linenumber
        JP      NZ,J4055                ; nope, syntax error
        LD      A,D
        OR      E
        JP      Z,C475A                 ; illegal function call
        EX      DE,HL
        EX      (SP),HL
        EX      DE,HL
J5496:  PUSH    BC
        CALL    C4295                   ; search linenumber
        POP     DE
        PUSH    DE
        PUSH    BC
        CALL    C4295                   ; search linenumber
        LD      H,B
        LD      L,C
        POP     DE
        RST     DCOMPR
        EX      DE,HL
        JP      C,C475A                 ; illegal function call
        POP     DE
        POP     BC
        POP     AF
        PUSH    HL
        PUSH    DE
        JR      J54BD

J54AF:  ADD     HL,BC
        JP      C,C475A                 ; illegal function call
        EX      DE,HL
        PUSH    HL
        LD      HL,0FFF9H
        RST     DCOMPR
        POP     HL
        JP      C,C475A                 ; illegal function call
J54BD:  PUSH    DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,D
        OR      E
        EX      DE,HL

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C54C4:  POP     DE
        JR      Z,J54CE
        LD      A,(HL)
        INC     HL
        OR      (HL)
        DEC     HL
        EX      DE,HL
        JR      NZ,J54AF
J54CE:  PUSH    BC
        CALL    C54F6                   ; convert linenumbers to pointers
        POP     BC
        POP     DE
        POP     HL
J54D5:  PUSH    DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,D
        OR      E
        JR      Z,J54F1
        EX      DE,HL
        EX      (SP),HL
        EX      DE,HL
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        EX      DE,HL
        ADD     HL,BC
        EX      DE,HL
        POP     HL
        JR      J54D5

;       Subroutine      convert to linepointers to linenumbers if needed
;       Inputs          ________________________
;       Outputs         ________________________

C54EA:  LD      A,(PTRFLG)
        OR      A
        RET     Z
        JR      J54F7                   ; convert pointers to linenumbers

J54F1:  LD      BC,J411E
        PUSH    BC                      ; ok and mainloop (+POP)
        DEFB    0FEH                    ; CP xx, skip to J54F7

;       Subroutine      convert linenumbers to pointers
;       Inputs          ________________________
;       Outputs         ________________________

C54F6:  DEFB    0F6H                    ; OR xx, skip next instruction, A<>0 (now linepointers)

;       Subroutine      convert pointers to linenumbers
;       Inputs          ________________________
;       Outputs         ________________________

J54F7:  XOR     A                       ; now linenumbers
        LD      (PTRFLG),A
        LD      HL,(TXTTAB)
        DEC     HL
J54FF:  INC     HL
        LD      A,(HL)
        INC     HL
        OR      (HL)                    ; endpointer ?
        RET     Z                       ; yep, quit
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; linenumber
J5508:  RST     CHRGTR                  ; get next BASIC character
J5509:  OR      A                       ; end of line ?
        JR      Z,J54FF                 ; yep, next line
        LD      C,A
        LD      A,(PTRFLG)
        OR      A                       ; convert to linenumbers ?
        LD      A,C
        JR      Z,J556A                 ; yep, handle
        CALL    H.SCNE
        CP      0A6H                    ; ERROR token ?
        JR      NZ,J552F                ; nope,
        RST     CHRGTR                  ; get next BASIC character
        CP      89H                     ; GOTO token ?
        JR      NZ,J5509                ; nope,
        RST     CHRGTR                  ; get next BASIC character
        CP      0EH                     ; linenumber token ?
        JR      NZ,J5509                ; nope,
        PUSH    DE
        CALL    C4771                   ; get linenumber
        LD      A,D
        OR      E                       ; linenumber 0 ?
        JR      NZ,J5537                ; nope,
        JR      J5556

J552F:  CP      0EH                     ; linenumber token ?
        JR      NZ,J5508                ; nope, next char
        PUSH    DE
        CALL    C4771                   ; get linenumber
J5537:  PUSH    HL
        CALL    C4295                   ; search linenumber
        DEC     BC
        LD      A,0DH                   ; linepointer token
        JR      C,J557C                 ; found, replace linenumber with pointer
        CALL    C7323                   ; fresh line to interpreter output
        LD      HL,I555A
        PUSH    DE
        CALL    C6678                   ; message to interpreter output
        POP     HL
        CALL    C3412                   ; number to interpreter output
        POP     BC
        POP     HL
        PUSH    HL
        PUSH    BC
        CALL    C340A                   ; "in" number to interpreter output
I5555:  POP     HL
J5556:  POP     DE
        DEC     HL
J5558:  JR      J5508                   ; next

I555A:  DEFB    "Undefined line ",0

J556A:  CP      0DH                     ; linepointer token ?
        JR      NZ,J5558                ; nope, next
        PUSH    DE
        CALL    C4771                   ; get linepointer
        PUSH    HL
        EX      DE,HL
        INC     HL
        INC     HL
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; linenumber
        LD      A,0EH                   ; linenumber token
J557C:  LD      HL,I5555
        PUSH    HL
        LD      HL,(CONTXT)

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5583:  PUSH    HL
        DEC     HL
        LD      (HL),B
        DEC     HL
        LD      (HL),C
        DEC     HL
        LD      (HL),A
        POP     HL
        RET

;       Subroutine      SYNCHR
;       Inputs          ________________________
;       Outputs         ________________________

C558C:  LD      A,(HL)
        EX      (SP),HL
        CP      (HL)
        INC     HL
        EX      (SP),HL
        JP      NZ,J4055                ; nope, syntax error
        JP      C4666                   ; get next BASIC character

;       Subroutine      GETYPR
;       Inputs          ________________________
;       Outputs         ________________________

C5597:  LD      A,(VALTYP)
        CP      8
        JR      NC,J55A3
        SUB     3
        OR      A
        SCF
        RET

J55A3:  SUB     3
        OR      A
        RET

J55A7:  RST     CHRGTR                  ; get next BASIC character

;       Subroutine      CALL statement
;       Inputs          ________________________
;       Outputs         ________________________

C55A8:  LD      DE,PROCNM
        LD      B,15
J55AD:  LD      A,(HL)
        AND     A
        JR      Z,J55BE                 ; end of line, end of name
        CP      ":"
        JR      Z,J55BE                 ; statement seperator, end of name
        CP      "("
        JR      Z,J55BE                 ; parameter, end of name
        LD      (DE),A
        INC     DE
        INC     HL
        DJNZ    J55AD
J55BE:  LD      A,B
        CP      15
        JR      Z,J55D8                 ; no name, syntax error
J55C3:  XOR     A
        LD      (DE),A
        DEC     DE
        LD      A,(DE)
        CP      " "
        JR      Z,J55C3                 ; remove trailing spaces and place endmarker in name
        LD      B,64
        LD      DE,SLTATR
J55D0:  LD      A,(DE)
J55D1:  AND     20H
        JR      NZ,J55DB                ; expansion ROM has statement handler, try it
J55D5:  INC     DE
        DJNZ    J55D0                   ; next page/slot
J55D8:  JP      J4055                   ; syntax error

J55DB:  PUSH    BC
        PUSH    DE
        PUSH    HL
        CALL    C7E2A                   ; translate SLTATR loopvar to address and slotid
        PUSH    AF
        LD      C,A
        LD      L,4                     ; statement entry offset
        CALL    C7E1A                   ; read expansion ROM entry
        PUSH    DE
        POP     IX
        POP     IY
        POP     HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        CALL    CALSLT                  ; call statement handler
        POP     DE
        POP     BC
        JR      C,J55D5                 ; statement not recognized, try next
        RET                             ; statement recognized, quit

; external device handler

J55F8:  POP     HL
        LD      A,B
        CP      16
        JR      C,J5600
        LD      B,15                    ; devicename length is max 15

J5600:

        IF      NDEVFIX EQ 0
;
; #####################
; early MSX 1 version code:

        LD      DE,PROCNM

        ELSE

; #####################
; later MSX versions have a patch for zero length devicename


        CALL    C7FB7                   ; bugfix for zero length devicename

; #####################

        ENDIF

J5603:  CALL    C4EA9                   ; get char uppercase
        LD      (DE),A
        INC     HL
        INC     DE
        DJNZ    J5603                   ; copy devicename in PROCNM
        XOR     A
        LD      (DE),A                  ; zero terminator
        LD      B,64
        LD      DE,SLTATR
J5612:  LD      A,(DE)
        AND     40H
        JR      NZ,J561D                ; has device entry, try it
J5617:  INC     DE
        DJNZ    J5612                   ; next page
J561A:  JP      J6E6B                   ; devicename not recognized, bad filename error

J561D:  PUSH    BC
        PUSH    DE
        CALL    C7E2A                   ; translate SLTATR loopvar to address and slotid
        PUSH    AF
        LD      C,A
        LD      L,6                     ; device entry offset
        CALL    C7E1A                   ; read expansion ROM entry
        PUSH    DE
        POP     IX
        POP     IY
        LD      A,0FFH                  ; check if devicename recognized
        CALL    CALSLT                  ; call device handler
        POP     DE
        POP     BC
        JR      C,J5617                 ; devicename not recognized, try next
        LD      C,A                     ; relative devicecode
        LD      A,40H
        SUB     B
        ADD     A,A
        ADD     A,A
        OR      C                       ; calculate devicecode
        CP      9                       ; devicecode in the internal diskdrive devicecode range ?
        JR      C,J561A                 ; yep, bad filename error
        CP      0FCH                    ; devicecode in the internal devicecode range ?
        JR      NC,J561A                ; yep, bad filename error
        POP     HL
        POP     DE
        AND     A                       ; Cx reset
        RET

;       Subroutine      i/o function dispatcher for expansion ROM
;       Inputs          ________________________
;       Outputs         ________________________

J564A:  PUSH    BC
        PUSH    AF
        RRA
        RRA
        AND     3FH
        CALL    C7E2D                   ; translate SLTATR entrynumber to address and slotid
        PUSH    AF
        LD      C,A
        LD      L,6
        CALL    C7E1A
        PUSH    DE
        POP     IX
        POP     IY
        POP     AF
        AND     03H
        LD      (DEVICE),A
        POP     BC
        POP     AF
        POP     DE
        POP     HL
        JP      CALSLT

J566C:  LD      (MCLTAB),DE
        CALL    C4C64                   ; evaluate expression
        PUSH    HL
        LD      DE,0
        PUSH    DE
        PUSH    AF
J5679:  CALL    C67D0                   ; free temporary string with type check
        CALL    C2EDF                   ; load from HL (single)
        LD      B,C
        LD      C,D                     ; pointer to string
        LD      D,E                     ; size of string
        LD      A,B
        OR      C                       ; zero pointer ?
        JR      Z,J568C                 ; yep,
        LD      A,D
        OR      A                       ; size of string zero ?
        JR      Z,J568C                 ; yep,
        PUSH    BC
        PUSH    DE
J568C:  POP     AF
        LD      (MCLLEN),A
        POP     HL
        LD      A,H
        OR      L
        JR      NZ,J569F
        LD      A,(MCLFLG)
        OR      A
        JP      Z,J5709
        JP      J7494

J569F:  LD      (MCLPTR),HL
J56A2:  CALL    C56EE
        JR      Z,J568C
        ADD     A,A
        LD      C,A
        LD      HL,(MCLTAB)
J56AC:  LD      A,(HL)
        ADD     A,A
J56AE:  CALL    Z,C475A                 ; illegal function call
        CP      C
        JR      Z,J56B9
        INC     HL
        INC     HL
        INC     HL
        JR      J56AC

J56B9:  LD      BC,J56A2
        PUSH    BC
        LD      A,(HL)
        LD      C,A
        ADD     A,A
        JR      NC,J56E2
        OR      A
        RRA
        LD      C,A
        PUSH    BC
        PUSH    HL
        CALL    C56EE
        LD      DE,1
        JP      Z,J56DF
        CALL    C64A8                   ; is upcase letter character ?
        JP      NC,J56DC
        CALL    C571C
        SCF
        JR      J56E0

J56DC:  CALL    C570B
J56DF:  OR      A
J56E0:  POP     HL
        POP     BC
J56E2:  INC     HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        JP      (HL)


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C56E8:  CALL    C56EE
        JR      Z,J56AE
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C56EE:  PUSH    HL
J56EF:  LD      HL,MCLLEN
        LD      A,(HL)
        OR      A
        JR      Z,J5709
        DEC     (HL)
        LD      HL,(MCLPTR)
        LD      A,(HL)
        INC     HL
        LD      (MCLPTR),HL
        CP      " "
        JR      Z,J56EF
        CP      60H
        JR      C,J5709
        SUB     20H
J5709:  POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C570B:  PUSH    HL
        LD      HL,MCLLEN
        INC     (HL)
        LD      HL,(MCLPTR)
        DEC     HL
        LD      (MCLPTR),HL
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5719:  CALL    C56E8


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C571C:  CP      "="
        JP      Z,J577A
        CP      "+"
        JR      Z,C5719
        CP      "-"
        JR      NZ,C572F
        LD      DE,I5795
        PUSH    DE
        JR      C5719

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C572F:  LD      DE,0
J5732:  CP      ","
        JR      Z,C570B
        CP      ";"
        RET     Z
        CP      "9"+1
        JR      NC,C570B
        CP      "0"
        JR      C,C570B
        LD      HL,0
        LD      B,10
J5746:  ADD     HL,DE
        JR      C,J5773
        DJNZ    J5746
        SUB     "0"
        LD      E,A
        LD      D,00H
        ADD     HL,DE
        JR      C,J5773
        EX      DE,HL
        CALL    C56EE
        JR      NZ,J5732
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C575A:  CALL    C56E8
        LD      DE,BUF
        PUSH    DE
        LD      B,40
        CALL    C64A8                   ; is upcase letter character ?
        JR      C,J5773                 ; nope, illegal function call
J5768:  LD      (DE),A
        INC     DE
        CP      ";"                     ; end of variablename ?
        JR      Z,J5776                 ; yep,
        CALL    C56E8
        DJNZ    J5768
J5773:  CALL    C475A                   ; illegal function call
J5776:  POP     HL
        JP      C4E9B                   ; get variable value

J577A:  CALL    C575A
        CALL    C2F8A                   ; convert DAC to integer
        EX      DE,HL
        RET

C5782:  CALL    C575A
        LD      A,(MCLLEN)
        LD      HL,(MCLPTR)
        EX      (SP),HL
        PUSH    AF
        LD      C,2
        CALL    C625E                   ; check if enough stackspace for 2 words
        JP      J5679

I5795:  XOR     A
        SUB     E
        LD      E,A
        SBC     A,D
        SUB     E
        LD      D,A
        RET

;       Subroutine      evaluate complex graphic coordinatepair
;       Inputs          ________________________
;       Outputs         ________________________

C579C:  LD      A,(HL)
        CP      "@"
        CALL    Z,C4666                 ; yep, get next BASIC character
        LD      BC,0
        LD      D,B
        LD      E,C
        CP      0F2H
        JR      Z,J57C1

;       Subroutine      evaluate simple graphic coordinatepair
;       Inputs          ________________________
;       Outputs         ________________________

C57AB:  LD      A,(HL)
        CP      0DCH
        PUSH    AF
        CALL    Z,C4666                 ; yep, get next BASIC character
        RST     SYNCHR
        DEFB    "("                     ; check for (
        CALL    C520F                   ; evaluate integer operand
        PUSH    DE
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C520F                   ; evaluate integer operand
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        POP     BC
        POP     AF
J57C1:  PUSH    HL
        LD      HL,(GRPACX)
        JR      Z,J57CA
        LD      HL,0
J57CA:  ADD     HL,BC
        LD      (GRPACX),HL
        LD      (GXPOS),HL
        LD      B,H
        LD      C,L
        LD      HL,(GRPACY)
        JR      Z,J57DB
        LD      HL,0
J57DB:  ADD     HL,DE
        LD      (GRPACY),HL
        LD      (GYPOS),HL
        EX      DE,HL
        POP     HL
        RET

;       Subroutine      PRESET statement
;       Inputs          ________________________
;       Outputs         ________________________


C57E5:  LD      A,(BAKCLR)
        JR      J57ED

;       Subroutine      PSET statement
;       Inputs          ________________________
;       Outputs         ________________________


C57EA:  LD      A,(FORCLR)
J57ED:  PUSH    AF
        CALL    C57AB                   ; evaluate simple graphic coordinatepair
J57F1:  POP     AF
        CALL    C5850
        PUSH    HL
        CALL    SCALXY
        JR      NC,J5801
        CALL    MAPXYC
        CALL    SETC
J5801:  POP     HL
        RET
; End of change


;       Subroutine      POINT function
;       Inputs          ________________________
;       Outputs         ________________________

J5803:  RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        CALL    FETCHC
        POP     DE
        PUSH    HL
        PUSH    AF
        LD      HL,(GYPOS)
        PUSH    HL
        LD      HL,(GXPOS)
        PUSH    HL
        LD      HL,(GRPACY)
        PUSH    HL
        LD      HL,(GRPACX)
        PUSH    HL
        EX      DE,HL
        CALL    C57AB                   ; evaluate simple graphic coordinatepair
        PUSH    HL
        CALL    SCALXY
        LD      HL,0FFFFH
        JR      NC,J5831
        CALL    MAPXYC
        CALL    READC
        LD      L,A
        LD      H,00H
J5831:  CALL    C2F99                   ; put HL in DAC
        POP     DE
        POP     HL
        LD      (GRPACX),HL
        POP     HL
        LD      (GRPACY),HL
        POP     HL
        LD      (GXPOS),HL
        POP     HL
        LD      (GYPOS),HL
        POP     AF
        POP     HL
        PUSH    DE
        CALL    STOREC
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C584D:  LD      A,(FORCLR)

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5850:  PUSH    BC
        PUSH    DE
        LD      E,A
        CALL    C59BC
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JR      Z,J5863
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      ","
        JR      Z,J5863
        CALL    C521C                   ; evaluate byte operand
J5863:  LD      A,E
        PUSH    HL
        CALL    SETATR
        JP      C,C475A                 ; illegal function call
        POP     HL
        POP     DE
        POP     BC
        JP      C466A                   ; get BASIC character

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5871:  LD      HL,(GXPOS)
        LD      A,L
        SUB     C
        LD      L,A
        LD      A,H
        SBC     A,B
        LD      H,A
J587A:  RET     NC

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C587B:  XOR     A
        SUB     L
        LD      L,A
        SBC     A,H
        SUB     L
        LD      H,A
        SCF
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5883:  LD      HL,(GYPOS)
        LD      A,L
        SUB     E
        LD      L,A
        LD      A,H
        SBC     A,D
        LD      H,A
        JR      J587A


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C588E:  PUSH    HL
        LD      HL,(GYPOS)
        EX      DE,HL
        LD      (GYPOS),HL
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5898:  CALL    C588E


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C589B:  PUSH    HL
        PUSH    BC
        LD      HL,(GXPOS)
        EX      (SP),HL
        LD      (GXPOS),HL
        POP     BC
        POP     HL
        RET

;       Subroutine      LINE statement (graphical)
;       Inputs          ________________________
;       Outputs         ________________________

J58A7:  CALL    C579C                   ; evaluate complex graphic coordinatepair
J58AA:  PUSH    BC
        PUSH    DE
        RST     SYNCHR
        DEFB    0F2H                    ; check for -
        CALL    C57AB                   ; evaluate simple graphic coordinatepair
        CALL    C584D
        POP     DE
        POP     BC
        JR      Z,C58FC
        RST     SYNCHR
        DEFB    ","
        RST     SYNCHR
        DEFB    "B"                     ; check for ,B
        JP      Z,J5912                 ; box option

; line box fill option (,BF)

        RST     SYNCHR
        DEFB    "F"                     ; check for F
        PUSH    HL
        CALL    SCALXY
        CALL    C5898
        CALL    SCALXY
        CALL    C5883
        CALL    C,C588E
        INC     HL
        PUSH    HL
        CALL    C5871
        CALL    C,C589B
        INC     HL
        PUSH    HL
        CALL    MAPXYC
        POP     DE
        POP     BC
J58E0:  PUSH    DE
        PUSH    BC
J58E2:  CALL    FETCHC
        PUSH    AF
        PUSH    HL
        EX      DE,HL
        CALL    NSETCX
        POP     HL
        POP     AF
        CALL    STOREC
        CALL    DOWNC
        POP     BC
        POP     DE
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,J58E0
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C58FC:  PUSH    BC
        PUSH    DE
        PUSH    HL
        CALL    C593C
        LD      HL,(GRPACX)
        LD      (GXPOS),HL
        LD      HL,(GRPACY)
        LD      (GYPOS),HL
        POP     HL
        POP     DE
        POP     BC
        RET

J5912:  PUSH    HL
        LD      HL,(GYPOS)
        PUSH    HL
        PUSH    DE
        EX      DE,HL
        CALL    C58FC
        POP     HL
        LD      (GYPOS),HL
        EX      DE,HL
        CALL    C58FC
        POP     HL
        LD      (GYPOS),HL
        LD      HL,(GXPOS)
        PUSH    BC
        LD      B,H
        LD      C,L
        CALL    C58FC
        POP     HL
        LD      (GXPOS),HL
        LD      B,H
        LD      C,L
        CALL    C58FC
        POP     HL
        RET

;       Subroutine      draw line
;       Inputs          ________________________
;       Outputs         ________________________

C593C:  CALL    H.DOGR
        CALL    SCALXY
J5942:  CALL    C5898
        CALL    SCALXY
        CALL    C5883
        CALL    C,C5898
        PUSH    DE
        PUSH    HL
        CALL    C5871
        EX      DE,HL
        LD      HL,00FCH
        JR      NC,J595C
        LD      HL,00FFH
J595C:  EX      (SP),HL
        RST     DCOMPR
        JR      NC,J5970
        LD      (MINDEL),HL
        POP     HL
        LD      (MAXUPD+1),HL
        LD      HL,0108H
        LD      (MINUPD+1),HL
        EX      DE,HL
        JR      J597F

J5970:  EX      (SP),HL
        LD      (MINUPD+1),HL
        LD      HL,0108H
        LD      (MAXUPD+1),HL
        EX      DE,HL
        LD      (MINDEL),HL
        POP     HL
J597F:  POP     DE
        PUSH    HL
        CALL    C587B
        LD      (MAXDEL),HL
        CALL    MAPXYC
        POP     DE
        PUSH    DE
        CALL    C59B4
        POP     BC
        INC     BC
        JR      J599A

J5993:  POP     HL
        LD      A,B
        OR      C
        RET     Z
J5997:  CALL    MAXUPD
J599A:  CALL    SETC
        DEC     BC
        PUSH    HL
        LD      HL,(MINDEL)
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(MAXDEL)
        ADD     HL,DE
        JR      NC,J5993
        EX      DE,HL
        POP     HL
        LD      A,B
        OR      C
        RET     Z
        CALL    MINUPD
        JR      J5997


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C59B4:  LD      A,D
        OR      A
        RRA
        LD      D,A
        LD      A,E
        RRA
        LD      E,A
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C59BC:  LD      A,(SCRMOD)
        CP      2
        RET     P
        JP      C475A                   ; illegal function call

;       Subroutine      PAINT statement
;       Inputs          ________________________
;       Outputs         ________________________

C59C5:  CALL    C579C                   ; evaluate complex graphic coordinatepair
J59C8:  PUSH    BC
        PUSH    DE
        CALL    C584D
        LD      A,(ATRBYT)
        LD      E,A
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JR      Z,J59DA
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
J59DA:  LD      A,E
        CALL    PNTINI
        JP      C,C475A                 ; illegal function call
        POP     DE
        POP     BC
        PUSH    HL
        CALL    C5E91
        CALL    MAPXYC
        LD      DE,1
        LD      B,00H
        CALL    C5ADC
        JR      Z,J5A08
        PUSH    HL
        CALL    C5AED
        POP     DE
        ADD     HL,DE
        EX      DE,HL
        XOR     A
        CALL    C5ACE
        LD      A,40H
        CALL    C5ACE
        LD      B,0C0H
        JR      J5A26

J5A08:  POP     HL
        RET

J5A0A:  CALL    CKCNTC
        LD      A,(LOHDIR)
        OR      A
        JR      Z,J5A1F
        LD      HL,(LOHADR)
        PUSH    HL
        LD      HL,(LOHMSK)
        PUSH    HL
        LD      HL,(LOHCNT)
        PUSH    HL
J5A1F:  POP     DE
        POP     BC
        POP     HL
        LD      A,C
        CALL    STOREC
J5A26:  LD      A,B
        LD      (PDIREC),A
        ADD     A,A
        JR      Z,J5A08
        PUSH    DE
        JR      NC,J5A35
        CALL    TUPC
        JR      J5A38

J5A35:  CALL    TDOWNC
J5A38:  POP     DE
        JR      C,J5A1F
        LD      B,00H
        CALL    C5ADC
        JP      Z,J5A1F
        XOR     A
        LD      (LOHDIR),A
        CALL    C5AED
        LD      E,L
        LD      D,H
        OR      A
        JR      Z,J5A69
        DEC     HL
        DEC     HL
        LD      A,H
        ADD     A,A
        JR      C,J5A69
        LD      (LOHCNT),DE
        CALL    FETCHC
        LD      (LOHADR),HL
        LD      (LOHMSK),A
        LD      A,(PDIREC)
        CPL
        LD      (LOHDIR),A
J5A69:  LD      HL,(MOVCNT)
        ADD     HL,DE
        EX      DE,HL
        CALL    C5AC2
J5A71:  LD      HL,(CSAVEA)
        LD      A,(CSAVEM)
        CALL    STOREC
J5A7A:  LD      HL,(SKPCNT)
        LD      DE,(MOVCNT)
        OR      A
        SBC     HL,DE
        JR      Z,J5ABF
        JR      C,J5AA4
        EX      DE,HL
        LD      B,01H
        CALL    C5ADC
        JR      Z,J5ABF
        OR      A
        JR      Z,J5A7A
        EX      DE,HL
        LD      HL,(CSAVEA)
        LD      A,(CSAVEM)
        LD      C,A
        LD      A,(PDIREC)
        LD      B,A
        CALL    C5AD3
        JR      J5A7A

J5AA4:  CALL    C587B
        DEC     HL
        DEC     HL
        LD      A,H
        ADD     A,A
        JR      C,J5ABF
        INC     HL
        PUSH    HL
J5AAF:  CALL    LEFTC
        DEC     HL
        LD      A,H
        OR      L
        JR      NZ,J5AAF
        POP     DE
        LD      A,(PDIREC)
        CPL
        CALL    C5ACE
J5ABF:  JP      J5A0A


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5AC2:  LD      A,(LFPROG)
        LD      C,A
        LD      A,(RTPROG)
        OR      C
        RET     Z
        LD      A,(PDIREC)

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5ACE:  LD      B,A
        CALL    FETCHC
        LD      C,A

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5AD3:  EX      (SP),HL
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      C,2
        JP      C625E                   ; check if enough stackspace for 2 words and quit


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5ADC:  CALL    SCANR
        LD      (SKPCNT),DE
        LD      (MOVCNT),HL
        LD      A,H
        OR      L
        LD      A,C
        LD      (RTPROG),A
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5AED:  CALL    FETCHC
        PUSH    HL
        PUSH    AF
        LD      HL,(CSAVEA)
        LD      A,(CSAVEM)
        CALL    STOREC
        POP     AF
        POP     HL
        LD      (CSAVEA),HL
        LD      (CSAVEM),A
        CALL    SCANL
        LD      A,C
        LD      (LFPROG),A
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5B0B:  EX      DE,HL
        CALL    C587B
        EX      DE,HL
        RET

;       Subroutine      CIRCLE statement
;       Inputs          ________________________
;       Outputs         ________________________


C5B11:  CALL    C579C                   ; evaluate complex graphic coordinatepair
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C520F                   ; evaluate integer operand
        PUSH    HL
        EX      DE,HL
        LD      (GXPOS),HL
        CALL    C2F99                   ; put HL in DAC
        CALL    C2FB2                   ; convert DAC to single real
        LD      BC,7040H
        LD      DE,0771H
        CALL    C325C                   ; single real muliply
        CALL    C2F8A                   ; convert DAC to integer
        LD      (CNPNTS),HL
        XOR     A
        LD      (CLINEF),A
        LD      (CSCLXY),A
        POP     HL
        CALL    C584D
        LD      C,01H
        LD      DE,0
        CALL    C5D17
        PUSH    DE
        LD      C,80H
        LD      DE,0FFFFH
        CALL    C5D17
        EX      (SP),HL
        XOR     A
        EX      DE,HL
        RST     DCOMPR
        LD      A,00H
        JR      NC,J5B66
        DEC     A
        EX      DE,HL
        PUSH    AF
        LD      A,(CLINEF)
        LD      C,A
        RLCA
        RLCA
        OR      C
        RRCA
        LD      (CLINEF),A
        POP     AF
J5B66:  LD      (CPLOTF),A
        LD      (CSTCNT),DE
        LD      (CENCNT),HL
        POP     HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JR      NZ,J5B85
        PUSH    HL
        CALL    GTASPC
        LD      A,H
        OR      A
        JR      Z,J5BAF
        LD      A,01H
        LD      (CSCLXY),A
        EX      DE,HL
        JR      J5BAF

J5B85:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C2FB2                   ; convert DAC to single real
        CALL    C2E71                   ; get sign DAC
        JP      Z,C475A                 ; DAC is zero, illegal function call
        JP      M,C475A                 ; DAC is negative, illegal function call
        CALL    C5D63
        JR      NZ,J5BA3
        INC     A
        LD      (CSCLXY),A
        CALL    C3267                   ; single real divide
J5BA3:  LD      BC,02543H
        LD      DE,00060H
        CALL    C325C                   ; single real muliply
        CALL    C2F8A                   ; convert DAC to integer
J5BAF:  LD      (ASPECT),HL
        LD      DE,0
        LD      (CRCSUM),DE
        LD      HL,(GXPOS)
        ADD     HL,HL
J5BBD:  CALL    CKCNTC
        LD      A,E
        RRA
        JR      C,J5BDA
        PUSH    DE
        PUSH    HL
        INC     HL
        EX      DE,HL
        CALL    C59B4
        EX      DE,HL
        INC     DE
        CALL    C59B4
        CALL    C5C06
        POP     DE
        POP     HL
        RST     DCOMPR
        JP      NC,J5A08
        EX      DE,HL
J5BDA:  LD      B,H
        LD      C,L
        LD      HL,(CRCSUM)
        INC     HL
        ADD     HL,DE
        ADD     HL,DE
        LD      A,H
        ADD     A,A
        JR      C,J5BF2
        PUSH    DE
        EX      DE,HL
        LD      H,B
        LD      L,C
        ADD     HL,HL
        DEC     HL
        EX      DE,HL
        OR      A
        SBC     HL,DE
        DEC     BC
        POP     DE
J5BF2:  LD      (CRCSUM),HL
        LD      H,B
        LD      L,C
        INC     DE
        JR      J5BBD


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5BFA:  PUSH    DE
        CALL    C5CEB
        POP     HL
        LD      A,(CSCLXY)
        OR      A
        RET     Z
        EX      DE,HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5C06:  LD      (CPCNT),DE
        PUSH    HL
        LD      HL,0
        LD      (CPCNT8),HL
        CALL    C5BFA
        LD      (CXOFF),HL
        POP     HL
        EX      DE,HL
        PUSH    HL
        CALL    C5BFA
        LD      (CYOFF),DE
        POP     DE
        CALL    C5B0B
        CALL    C5C48
        PUSH    HL
        PUSH    DE
        LD      HL,(CNPNTS)
        LD      (CPCNT8),HL
        LD      DE,(CPCNT)
        OR      A
        SBC     HL,DE
        LD      (CPCNT),HL
        LD      HL,(CXOFF)
        CALL    C587B
        LD      (CXOFF),HL
        POP     DE
        POP     HL
        CALL    C5B0B

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5C48:  LD      A,04H
J5C4A:  PUSH    AF
        PUSH    HL
        PUSH    DE
        PUSH    HL
        PUSH    DE
        LD      DE,(CPCNT8)
        LD      HL,(CNPNTS)
        ADD     HL,HL
        ADD     HL,DE
        LD      (CPCNT8),HL
        LD      HL,(CPCNT)
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(CSTCNT)
        RST     DCOMPR
        JR      Z,J5C80
        JR      NC,J5C70
        LD      HL,(CENCNT)
        RST     DCOMPR
        JR      Z,J5C78
        JR      NC,J5C90
J5C70:  LD      A,(CPLOTF)
        OR      A
        JR      NZ,J5C9A
        JR      J5C96

J5C78:  LD      A,(CLINEF)
        ADD     A,A
        JR      NC,J5C9A
        JR      J5C86

J5C80:  LD      A,(CLINEF)
        RRA
        JR      NC,J5C9A
J5C86:  POP     DE
        POP     HL
        CALL    C5CDC
        CALL    C5CCD
        JR      J5CAA

J5C90:  LD      A,(CPLOTF)
        OR      A
        JR      Z,J5C9A
J5C96:  POP     DE
        POP     HL
        JR      J5CAA

J5C9A:  POP     DE
        POP     HL
        CALL    C5CDC
        CALL    SCALXY
        JR      NC,J5CAA
        CALL    MAPXYC
        CALL    SETC
J5CAA:  POP     DE
        POP     HL
        POP     AF
        DEC     A
        RET     Z
        PUSH    AF
        PUSH    DE
        LD      DE,(CXOFF)
        CALL    C5B0B
        LD      (CXOFF),HL
        EX      DE,HL
        POP     DE
        PUSH    HL
        LD      HL,(CYOFF)
        EX      DE,HL
        LD      (CYOFF),HL
        CALL    C5B0B
        POP     HL
        POP     AF
        JP      J5C4A


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5CCD:  LD      HL,(GRPACX)
        LD      (GXPOS),HL
        LD      HL,(GRPACY)
        LD      (GYPOS),HL
        JP      C593C


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5CDC:  PUSH    DE
        LD      DE,(GRPACX)
        ADD     HL,DE
        LD      B,H
        LD      C,L
        POP     DE
        LD      HL,(GRPACY)
        ADD     HL,DE
        EX      DE,HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5CEB:  LD      HL,(ASPECT)
        LD      A,L
        OR      A
        JR      NZ,J5CF6
        OR      H
        RET     NZ
        EX      DE,HL
        RET

J5CF6:  LD      C,D
        LD      D,00H
        PUSH    AF
        CALL    C5D0A
        LD      E,80H
        ADD     HL,DE
        LD      E,C
        LD      C,H
        POP     AF
        CALL    C5D0A
        LD      E,C
        ADD     HL,DE
        EX      DE,HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5D0A:  LD      B,08H
        LD      HL,0
J5D0F:  ADD     HL,HL
        ADD     A,A
        JR      NC,J5D14
        ADD     HL,DE
J5D14:  DJNZ    J5D0F
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5D17:  DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        RET     Z
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      ","
        RET     Z
        PUSH    BC
        CALL    C4C64                   ; evaluate expression
        EX      (SP),HL
        PUSH    HL
        CALL    C2FB2                   ; convert DAC to single real
        POP     BC
        LD      HL,DAC
        LD      A,(HL)
        OR      A
        JP      P,J5D3A
        AND     7FH
        LD      (HL),A
        LD      HL,CLINEF
        LD      A,(HL)
        OR      C
        LD      (HL),A
J5D3A:  LD      BC,1540H
        LD      DE,5591H
        CALL    C325C                   ; single real muliply
        CALL    C5D63
        JP      Z,C475A                 ; illegal function call
        CALL    C2EB1                   ; push DAC (single)
        LD      HL,(CNPNTS)
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        CALL    C2F99                   ; put HL in DAC
        CALL    C2FB2                   ; convert DAC to single real
        POP     BC
        POP     DE
        CALL    C325C                   ; single real muliply
        CALL    C2F8A                   ; convert DAC to integer
        POP     DE
        EX      DE,HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5D63:  LD      BC,1041H
        LD      DE,0000H
        CALL    C2F21                   ; single real compare
        DEC     A
        RET

;       Subroutine      DRAW statement
;       Inputs          ________________________
;       Outputs         ________________________


C5D6E:  LD      A,(SCRMOD)
        CP      2
        JP      C,C475A                 ; illegal function call
        LD      DE,I5D83
        XOR     A
        LD      (DRWFLG),A
        LD      (MCLFLG),A
        JP      J566C

I5D83:  DEFB    "U"+128
        DEFW    C5DB1
        DEFB    "D"+128
        DEFW    C5DB4
        DEFB    "L"+128
        DEFW    C5DB9
        DEFB    "R"+128
        DEFW    C5DBC
        DEFB    "M"
        DEFW    C5DD8
        DEFB    "E"+128
        DEFW    C5DCA
        DEFB    "F"+128
        DEFW    C5DC6
        DEFB    "G"+128
        DEFW    C5DD1
        DEFB    "H"+128
        DEFW    C5DC3
        DEFB    "A"+128
        DEFW    C5E4E
        DEFB    "B"
        DEFW    C5E46
        DEFB    "N"
        DEFW    C5E42
        DEFB    "X"
        DEFW    C5782
        DEFB    "C"+128
        DEFW    C5E87
        DEFB    "S"+128
        DEFW    C5E59
        DEFB    0

C5DB1:  CALL    C5B0B
C5DB4:  LD      BC,0
        JR      J5DFF


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5DB9:  CALL    C5B0B
C5DBC:  LD      B,D
        LD      C,E
        LD      DE,0
        JR      J5DFF

C5DC3:  CALL    C5B0B
C5DC6:  LD      B,D
        LD      C,E
        JR      J5DFF

C5DCA:  LD      B,D
        LD      C,E
J5DCC:  CALL    C5B0B
        JR      J5DFF

C5DD1:  CALL    C5B0B
        LD      B,D
        LD      C,E
        JR      J5DCC

C5DD8:  CALL    C56E8
        LD      B,00H
        CP      "+"
        JR      Z,J5DE6
        CP      "-"
        JR      Z,J5DE6
        INC     B
J5DE6:  LD      A,B
        PUSH    AF
        CALL    C570B
        CALL    C5719
        PUSH    DE
        CALL    C56E8
        CP      ","
        JP      NZ,C475A                ; illegal function call
        CALL    C5719
        POP     BC
        POP     AF
        OR      A
        JR      NZ,J5E22
J5DFF:  CALL    C5E66
        PUSH    DE
        LD      D,B
        LD      E,C
        CALL    C5E66
        EX      DE,HL
        POP     DE
        LD      A,(DRWANG)
        RRA
        JR      NC,J5E16
        PUSH    AF
        CALL    C587B
        EX      DE,HL
        POP     AF
J5E16:  RRA
        JR      NC,J5E1F
        CALL    C587B
        CALL    C5B0B
J5E1F:  CALL    C5CDC
J5E22:  LD      A,(DRWFLG)
        ADD     A,A
        JR      C,J5E31
        PUSH    AF
        PUSH    BC
        PUSH    DE
        CALL    C5CCD
        POP     DE
        POP     BC
        POP     AF
J5E31:  ADD     A,A
        JR      C,J5E3D
        LD      (GRPACY),DE
        LD      H,B
        LD      L,C
        LD      (GRPACX),HL
J5E3D:  XOR     A
        LD      (DRWFLG),A
        RET

C5E42:  LD      A,40H
        JR      J5E48

C5E46:  LD      A,80H
J5E48:  LD      HL,DRWFLG
        OR      (HL)
        LD      (HL),A
        RET

C5E4E:  JR      NC,C5E59
        LD      A,E
        CP      04H
        JR      NC,C5E59
        LD      (DRWANG),A
        RET

C5E59:  JP      NC,C475A                ; illegal function call
        LD      A,D
        OR      A
        JP      NZ,C475A                ; illegal function call
        LD      A,E
        LD      (DRWSCL),A
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C5E66:  LD      A,(DRWSCL)
        OR      A
        RET     Z
        LD      HL,0
J5E6E:  ADD     HL,DE
        DEC     A
        JR      NZ,J5E6E
        EX      DE,HL
        LD      A,D
        ADD     A,A
        PUSH    AF
        JR      NC,J5E79
        DEC     DE
J5E79:  CALL    C59B4
        CALL    C59B4
        POP     AF
        RET     NC
        LD      A,D
        OR      0C0H
        LD      D,A
        INC     DE
        RET

C5E87:  JR      NC,C5E59
        LD      A,E
        CALL    SETATR
        JP      C,C475A                 ; illegal function call
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C5E91:  PUSH    HL
        CALL    SCALXY
        JP      NC,C475A                ; illegal function call
        POP     HL
        RET

I5E9A:  DEC     HL
        RST     CHRGTR                  ; end of statement ?
        RET     Z                       ; yep, quit
        RST     SYNCHR
        DEFB    ","                     ; check for ,

;       Subroutine      DIM statement
;       Inputs          ________________________
;       Outputs         ________________________

C5E9F:  LD      BC,I5E9A
        PUSH    BC                      ;

;       Subroutine      locate array variable
;       Inputs          ________________________
;       Outputs         ________________________

        DEFB    0F6H                    ; OR 0AFH, skip next instruction

;       Subroutine      locate variable
;       Inputs          ________________________
;       Outputs         ________________________

C5EA4:  XOR     A                       ; not DIM
        LD      (DIMFLG),A
        LD      C,(HL)
J5EA9:  CALL    H.PTRG
        CALL    C64A7                   ; is current BASIC character a upcase letter ?
        JP      C,J4055                 ; nope, syntax error
        XOR     A
        LD      B,A                     ; assume no 2nd variablename character
        RST     CHRGTR                  ; get next BASIC character
        JR      C,J5EBC                 ; digit, use as 2nd variablename character
        CALL    C64A8                   ; is upcase letter character ?
        JR      C,J5EC5                 ; nope, may be a variabletype indicator
J5EBC:  LD      B,A                     ; 2nd variablename character
J5EBD:  RST     CHRGTR                  ; get next BASIC character
        JR      C,J5EBD                 ; digit, skip
        CALL    C64A8                   ; is upcase letter character ?
        JR      NC,J5EBD                ; yep, skip
J5EC5:  CP      26H
        JR      NC,J5EE0                ; speedup for 26H-0FFH
        LD      DE,I5EEE
        PUSH    DE
        LD      D,2                     ; integer
        CP      "%"                     ; integer type indicator ?
        RET     Z                       ; yep, do not use default type
        INC     D                       ; string
        CP      "$"                     ; string type indicator ?
        RET     Z                       ; yep, do not use default type
        INC     D                       ; single real
        CP      "!"                     ; single real indicator ?
        RET     Z                       ; yep, do not use default type
        LD      D,8                     ; double real
        CP      "#"                     ; double real indicator ?
        RET     Z                       ; yep, do not use default type
        POP     AF
J5EE0:  LD      A,C
        AND     7FH                     ; clear b7 (for function variable)
        LD      E,A
        LD      D,0
        PUSH    HL
        LD      HL,DEFTBL-"A"
        ADD     HL,DE
        LD      D,(HL)                  ; default type
        POP     HL
        DEC     HL                      ; BASIC pointer back to compensate upcoming CHRGTR
I5EEE:  LD      A,D
        LD      (VALTYP),A              ; set DAC type
        RST     CHRGTR                  ; get next BASIC character (type indicator)
        LD      A,(SUBFLG)
        DEC     A                       ; variable search flags
        JP      Z,J5FE8                 ; search for ERASE statement,
        JP      P,J5F08                 ; search for function variables or loop variables, do not check for subscript
        LD      A,(HL)
        SUB     "("
        JP      Z,J5FBA                 ; array variable
        SUB     "["-"("
        JP      Z,J5FBA                 ; array variable
J5F08:  XOR     A
        LD      (SUBFLG),A              ; flag normal variable
        PUSH    HL                      ; save BASIC pointer
        LD      A,(NOFUNS)
        OR      A                       ; local function variables ?
        LD      (PRMFLG),A              ; yep, search simple variables afterwards
        JR      Z,J5F52                 ; nope, continue with simple variables
        LD      HL,(PRMLEN)
        LD      DE,PARM1                ; start of the local function variables
        ADD     HL,DE
        LD      (ARYTA2),HL             ; end of the local function variables
        EX      DE,HL
        JR      J5F3A                   ; start search

J5F23:  LD      A,(DE)
        LD      L,A                     ; variable type (also the length)
        INC     DE
        LD      A,(DE)                  ; first variablename character
        INC     DE
        CP      C                       ; match ?
        JR      NZ,J5F36                ; nope,
        LD      A,(VALTYP)
        CP      L                       ; correct variabletype ?
        JR      NZ,J5F36                ; nope,
        LD      A,(DE)                  ; second variablename character
        CP      B                       ; match ?
        JP      Z,J5FA4                 ; variable found, quit
J5F36:  INC     DE
        LD      H,0
        ADD     HL,DE                   ; to next variable
J5F3A:  EX      DE,HL
        LD      A,(ARYTA2+0)
        CP      E                       ; end of area ?
        JP      NZ,J5F23                ; nope, next variable
        LD      A,(ARYTA2+1)
        CP      D                       ; end of area ?
        JR      NZ,J5F23                ; nope, next variable
        LD      A,(PRMFLG)
        OR      A                       ; in local function variable search ?
        JR      Z,J5F66                 ; nope, not found
        XOR     A
        LD      (PRMFLG),A              ; now search the simple variables
J5F52:  LD      HL,(ARYTAB)
        LD      (ARYTA2),HL             ; end of searcharea is the start of the array variable area
        LD      HL,(VARTAB)             ; start of area is the start of the simple variable area
        JR      J5F3A                   ; start search

;       Subroutine      locate variable (search only)
;       Inputs          ________________________
;       Outputs         ________________________

C5F5D:  CALL    C5EA4                   ; locate variable
        RET

J5F61:  LD      D,A
        LD      E,A                     ; null pointer
        POP     BC
        EX      (SP),HL
        RET

J5F66:  POP     HL
        EX      (SP),HL                 ; call address
        PUSH    DE
        LD      DE,C5F5D+3
        RST     DCOMPR                  ; called from C5F5D (varptr) ?
        JR      Z,J5F61                 ; yep, return without creating a variable
        LD      DE,C4E9B+3
        RST     DCOMPR                  ; called from C4E9B (factor evaluator) ?
        POP     DE
        JR      Z,J5FA7                 ; yep, return value 0
        EX      (SP),HL
        PUSH    HL
        PUSH    BC
        LD      A,(VALTYP)
        LD      C,A
        PUSH    BC
        LD      B,0                     ; size of variable
        INC     BC
        INC     BC
        INC     BC                      ; three bytes for housekeeping
        LD      HL,(STREND)
        PUSH    HL
        ADD     HL,BC
        POP     BC
        PUSH    HL
        CALL    C6250                   ; check for enough stackspace and move data
        POP     HL
        LD      (STREND),HL
        LD      H,B
        LD      L,C
        LD      (ARYTAB),HL
J5F96:  DEC     HL
        LD      (HL),0
        RST     DCOMPR
        JR      NZ,J5F96                ; clear variable
        POP     DE
        LD      (HL),E                  ; variable type
        INC     HL
        POP     DE
        LD      (HL),E
        INC     HL
        LD      (HL),D                  ; variable name
        EX      DE,HL
J5FA4:  INC     DE
        POP     HL
        RET

J5FA7:  LD      (DAC+0),A               ; if single real or double real, DAC = 0
        LD      H,A
        LD      L,A
        LD      (DAC+2),HL              ; if integer, DAC = 0
        RST     GETYPR                  ; get DAC type
        JR      NZ,J5FB8                ; not a string, quit
        LD      HL,I3FD6
        LD      (DAC+2),HL              ; empty string
J5FB8:  POP     HL                      ; restore BASIC pointer
        RET

;       Subroutine      locate array variable with subscript
;       Inputs          ________________________
;       Outputs         ________________________

J5FBA:  PUSH    HL
        LD      HL,(DIMFLG)
        EX      (SP),HL                 ; save DIMFLG
        LD      D,A                     ; index 0
J5FC0:  PUSH    DE
        PUSH    BC
        CALL    C4755                   ; skip basic char, evaluate word operand and check for 0-32767 range
        POP     BC
        POP     AF
        EX      DE,HL
        EX      (SP),HL
        PUSH    HL
        EX      DE,HL                   ; subscript on stack
        INC     A
        LD      D,A                     ; next index
        LD      A,(HL)
        CP      ","                     ; more subscripts ?
        JP      Z,J5FC0                 ; yep, get next subscript
        CP      ")"
        JR      Z,J5FDC
        CP      "]"
        JP      NZ,J4055                ; nope, syntax error
J5FDC:  RST     CHRGTR                  ; get next BASIC character
        LD      (TEMP2),HL              ; save BASIC pointer
        POP     HL
        LD      (DIMFLG),HL             ; restore DIMFLG
        LD      E,0
        PUSH    DE
        DEFB    011H                    ; LD DE,xxxx, skip next 2 statements
J5FE8:  PUSH    HL
        PUSH    AF
        LD      HL,(ARYTAB)             ; start of the array variable area
        DEFB    03EH                    ; LD A,xx, skip next instruction
J5FEE:  ADD     HL,DE
        LD      DE,(STREND)
        RST     DCOMPR                  ; end of the array variable area ?
        JR      Z,J6023                 ; yep, create array
        LD      E,(HL)                  ; arraytype
        INC     HL
        LD      A,(HL)                  ; first name character
        INC     HL
        CP      C                       ; match ?
        JR      NZ,J6005                ; nope, not found
        LD      A,(VALTYP)
        CP      E                       ; correct arraytype ?
        JR      NZ,J6005                ; nope, not found
        LD      A,(HL)                  ; second name character
        CP      B                       ; match ?
J6005:  INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; offset to next array
        INC     HL
        JR      NZ,J5FEE                ; no match, next array
        LD      A,(DIMFLG)
        OR      A                       ; DIM statement ?
        JP      NZ,J405E                ; yep, redimensioned array error
        POP     AF
        LD      B,H
        LD      C,L
        JP      Z,J3297                 ; ERASE, restore BASIC pointer and quit
        SUB     (HL)                    ; dimension correct ?
        JP      Z,J607D                 ; yep,
J601D:  LD      DE,9                    ; ?? LD E,9 should be enough ??
        JP      J406F                   ; subscript out of range error

J6023:  LD      A,(VALTYP)
        LD      (HL),A
        INC     HL
        LD      E,A
        LD      D,0
        POP     AF
        JP      Z,C475A                 ; ERASE, illegal function call
        LD      (HL),C
        INC     HL
        LD      (HL),B                  ; variablename
        INC     HL
        LD      C,A                     ; number of words
        CALL    C625E                   ; check if enough stackspace
        INC     HL
        INC     HL                      ; leave offset empty for now
        LD      (TEMP3),HL
        LD      (HL),C                  ; dimension
        INC     HL
        LD      A,(DIMFLG)
        RLA                             ; DIM statement ?
        LD      A,C
J6043:  LD      BC,11
        JR      NC,J604A                ; nope, use a default of 11
        POP     BC                      ; subscript
        INC     BC
J604A:  LD      (HL),C
        PUSH    AF
        INC     HL
        LD      (HL),B
        INC     HL
        CALL    C314A                   ; unsigned integer multiply
        POP     AF
        DEC     A
        JR      NZ,J6043                ; next
        PUSH    AF
        LD      B,D
        LD      C,E
        EX      DE,HL
        ADD     HL,DE
        JP      C,J6275                 ; out of memory
        CALL    C6267                   ; check if enough stackspace left
        LD      (STREND),HL             ; new end of array area
J6064:  DEC     HL
        LD      (HL),0
        RST     DCOMPR
        JR      NZ,J6064                ; clear array
        INC     BC
        LD      D,A
        LD      HL,(TEMP3)
        LD      E,(HL)
        EX      DE,HL
        ADD     HL,HL
        ADD     HL,BC
        EX      DE,HL
        DEC     HL
        DEC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        POP     AF
        JR      C,J60AD
J607D:  LD      B,A
        LD      C,A
        LD      A,(HL)
        INC     HL
        DEFB    016H                    ; LD D,xx, skip next instruction
J6082:  POP     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        EX      (SP),HL
        PUSH    AF
        RST     DCOMPR
        JP      NC,J601D                ; subscript out of range
        CALL    C314A                   ; unsigned integer multiply
        ADD     HL,DE
        POP     AF
        DEC     A
        LD      B,H
        LD      C,L
        JR      NZ,J6082
        LD      A,(VALTYP)
        LD      B,H
        LD      C,L
        ADD     HL,HL
        SUB     4
        JR      C,J60A5
        ADD     HL,HL
        JR      Z,J60AA
        ADD     HL,HL
J60A5:  OR      A
        JP      PO,J60AA
        ADD     HL,BC
J60AA:  POP     BC
        ADD     HL,BC
        EX      DE,HL
J60AD:  LD      HL,(TEMP2)
        RET

;       Subroutine      PRINT USING statement
;       Inputs          ________________________
;       Outputs         ________________________

J60B1:  CALL    C4C65                   ; skip character and evaluate expression
        CALL    C3058                   ; check if string
        RST     SYNCHR
        DEFB    ";"                     ; check for ";"
        EX      DE,HL
        LD      HL,(DAC+2)              ; formatstring descriptor
        JR      J60C7

J60BF:  LD      A,(FLGINP)
        OR      A
        JR      Z,J60D2
        POP     DE
        EX      DE,HL
J60C7:  PUSH    HL
        XOR     A
        LD      (FLGINP),A              ; flag
        INC     A
        PUSH    AF
        PUSH    DE
        LD      B,(HL)
        INC     B
        DEC     B                       ; empty format string ?
J60D2:  JP      Z,C475A                 ; yep, illegal function call
        INC     HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A                     ; start of string
        JR      J60F6

; part of string handler

J60DC:  LD      E,B                     ; save length
        PUSH    HL                      ; save pointer
        LD      C,2                     ; at least 2 chars
J60E0:  LD      A,(HL)
        INC     HL
        CP      CHRFLN
        JP      Z,J6210                 ; end marker, print string
        CP      " "
        JR      NZ,J60EE                ; not a space between markers, so no part string!
        INC     C
        DJNZ    J60E0                   ; next char, non left means no endmarker and no part string!
J60EE:  POP     HL                      ; restore pointer
        LD      B,E                     ; restore length
        LD      A,CHRFLN                ; just print the CHRFLN char
J60F2:  CALL    C6246
        RST     OUTDO                   ; char to interpreter output
J60F6:  XOR     A
        LD      E,A
        LD      D,A
J60F9:  CALL    C6246
        LD      D,A
        LD      A,(HL)
        INC     HL
        CP      "!"
        JP      Z,J620D                 ; "1 char of string" format char, handle
        CP      "#"
        JR      Z,J6144                 ; # numeric format char, handle
        CP      CHRVLN
        JP      Z,J6209                 ; "whole string" format char, handle
        DEC     B                       ; other format chars need at least 1 extra char
        JP      Z,J61F5                 ; not there, end it
        CP      "+"
        LD      A,08H
        JR      Z,J60F9                 ; +, set sign flag and continue
        DEC     HL
        LD      A,(HL)
        INC     HL
        CP      "."
        JR      Z,J615E                 ; may be .# combi, check
        CP      CHRFLN
        JR      Z,J60DC                 ; "part of string" format char, handle
        CP      (HL)
        JR      NZ,J60F2                ; not two equal chars, just print it
        CP      CHRCUR
        JR      Z,J613D                 ; double currency char, handle
        CP      "*"
        JR      NZ,J60F2

; ** format

        INC     HL
        LD      A,B
        CP      02H
        JR      C,J6136                 ; none or only 1 char follows,
        LD      A,(HL)
        CP      CHRCUR
J6136:  LD      A," "
        JR      NZ,J6141

; **cur format

        DEC     B
        INC     E
        DEFB    0FEH                    ; skip next instruction
J613D:  XOR     A
        ADD     A,10H
        INC     HL
J6141:  INC     E
        ADD     A,D
        LD      D,A
J6144:  INC     E
        LD      C,00H
        DEC     B
        JR      Z,J6192
        LD      A,(HL)
        INC     HL
        CP      "."
        JR      Z,J6169
        CP      "#"
        JR      Z,J6144
        CP      ","
        JR      NZ,J6173
        LD      A,D
        OR      40H
        LD      D,A
        JR      J6144

J615E:  LD      A,(HL)
        CP      "#"
        LD      A,"."
        JP      NZ,J60F2
        LD      C,01H
        INC     HL
J6169:  INC     C
        DEC     B
        JR      Z,J6192
        LD      A,(HL)
        INC     HL
        CP      "#"
        JR      Z,J6169
J6173:  PUSH    DE
        LD      DE,I6190
        PUSH    DE
        LD      D,H
        LD      E,L
        CP      5EH
        RET     NZ
        CP      (HL)
        RET     NZ
        INC     HL
        CP      (HL)
        RET     NZ
        INC     HL
        CP      (HL)
        RET     NZ
        INC     HL
        LD      A,B
        SUB     04H
        RET     C
        POP     DE
        POP     DE
        LD      B,A
        INC     D
        INC     HL
        DEFB    0CAH                    ; JP Z,xxxx skip next 2 instructions
I6190:  EX      DE,HL
        POP     DE
J6192:  LD      A,D
        DEC     HL
        INC     E
        AND     08H
        JR      NZ,J61AE
        DEC     E
        LD      A,B
        OR      A
        JR      Z,J61AE
        LD      A,(HL)
        SUB     "-"
        JR      Z,J61A9
        CP      0FEH
        JR      NZ,J61AE
        LD      A,08H
J61A9:  ADD     A,04H
        ADD     A,D
        LD      D,A
        DEC     B
J61AE:  POP     HL
        POP     AF
        JR      Z,J61FE
        PUSH    BC
        PUSH    DE
        CALL    C4C64                   ; evaluate expression
        POP     DE
        POP     BC
        PUSH    BC
        PUSH    HL
        LD      B,E
        LD      A,B
        ADD     A,C
        CP      19H
        JP      NC,C475A                ; illegal function call
        LD      A,D
        OR      80H
        CALL    C3426                   ; convert DAC to text, formatted
        CALL    C6678                   ; message to interpreter output
J61CC:  POP     HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        SCF
        JR      Z,J61DD
        LD      (FLGINP),A
        CP      ";"
        JR      Z,J61DC
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        DEFB    006H                    ; skip next instruction
J61DC:  RST     CHRGTR                  ; get next BASIC character
J61DD:  POP     BC
        EX      DE,HL
        POP     HL
        PUSH    HL
        PUSH    AF
        PUSH    DE
        LD      A,(HL)
        SUB     B
        INC     HL
        LD      D,00H
        LD      E,A
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        ADD     HL,DE
        LD      A,B
        OR      A
        JP      NZ,J60F6
        JR      J61F9

J61F5:  CALL    C6246
        RST     OUTDO                   ; char to interpreter output
J61F9:  POP     HL
        POP     AF
        JP      NZ,J60BF
J61FE:  CALL    C,C7328                 ; newline to interpreter output
        EX      (SP),HL
        CALL    C67D6                   ; free temporary string (descriptor in HL)
        POP     HL
        JP      C4AFF                   ; return interpreter output to screen

; handle char

J6209:  LD      C,00H
        JR      J6211

; handle ! char

J620D:  LD      C,01H
        DEFB    03EH                    ; LD A,xx, skip next instruction
J6210:  POP     AF
J6211:  DEC     B
        CALL    C6246
        POP     HL
        POP     AF
        JR      Z,J61FE
        PUSH    BC
        CALL    C4C64                   ; evaluate expression
        CALL    C3058                   ; check if string
        POP     BC
        PUSH    BC
        PUSH    HL
        LD      HL,(DAC+2)
        LD      B,C
        LD      C,00H
        LD      A,B
        PUSH    AF
        OR      A
        CALL    NZ,C6868
        CALL    C667B                   ; free string and string to interpreter output
        LD      HL,(DAC+2)
        POP     AF
        OR      A
        JP      Z,J61CC
        SUB     (HL)
        LD      B,A
        LD      A," "
        INC     B
J623F:  DEC     B
        JP      Z,J61CC
        RST     OUTDO                   ; space to interpreter output
        JR      J623F


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C6246:  PUSH    AF
        LD      A,D
        OR      A
        LD      A,"+"
        CALL    NZ,OUTDO                ; yep, "+" to interpreter output
        POP     AF
        RET

;       Subroutine      check for enough stackspace and move data
;       Inputs          ________________________
;       Outputs         ________________________

C6250:  CALL    C6267                   ; check if enough stackspace left

;       Subroutine      move data
;       Inputs          BC = source end, DE = source start, HL = destination end
;       Outputs         BC = destination start, DE = source start, HL = source start

C6253:  PUSH    BC
        EX      (SP),HL
        POP     BC
J6256:  RST     DCOMPR
        LD      A,(HL)
        LD      (BC),A
        RET     Z
        DEC     BC
        DEC     HL
        JR      J6256

;       Subroutine      check if enough stackspace
;       Inputs          C = number of words
;       Outputs         ________________________

C625E:  PUSH    HL
        LD      HL,(STREND)
        LD      B,0
        ADD     HL,BC
        ADD     HL,BC
        DEFB    03EH                    ; LD A,xx, skip next instruction

;       Subroutine      check if enough stackspace left
;       Inputs          HL = end of area to use
;       Outputs         ________________________

C6267:  PUSH    HL
        LD      A,LOW -120
        SUB     L
        LD      L,A
        LD      A,HIGH -120
        SBC     A,H
        LD      H,A
        JR      C,J6275                 ; out of memory
        ADD     HL,SP
        POP     HL
        RET     C
J6275:  CALL    C4253                   ; setup BASIC linelinks
        LD      HL,(STKTOP)
        DEC     HL
        DEC     HL
        LD      (SAVSTK),HL
        LD      DE,7                    ; ?? LD E,7 should be enough ??
        JP      J406F                   ; out of memory error

;       Subroutine      NEW statement
;       Inputs          ________________________
;       Outputs         ________________________

C6286:  RET     NZ                      ; not end of statement, quit (which will generate a syntax error)

;       Subroutine      clear basic program
;       Inputs          ________________________
;       Outputs         ________________________

C6287:  LD      HL,(TXTTAB)
        CALL    C6439                   ; trace off
        LD      (AUTFLG),A              ; quit auto linenumber mode
        LD      (PTRFLG),A              ; output to screen
        LD      (HL),A
        INC     HL
        LD      (HL),A                  ; endpointer at basic text (no program text)
        INC     HL
        LD      (VARTAB),HL             ; initialize start of basic variable area

;       Subroutine      initialize interpreter, basicpointer at start of program
;       Inputs          ________________________
;       Outputs         ________________________


C629A:  CALL    H.RUNC
        LD      HL,(TXTTAB)
        DEC     HL

;       Subroutine      initialize interpreter
;       Inputs          HL = BASIC pointer
;       Outputs         ________________________


C62A1:  CALL    H.CLEA
        LD      (TEMP),HL

;       Subroutine      initialize interpreter, basicpointer from TEMP
;       Inputs          ________________________
;       Outputs         ________________________

C62A7:  CALL    C636E                   ; clear trap variables
        LD      B,26
        LD      HL,DEFTBL
        CALL    H.LOPD
J62B2:  LD      (HL),8
        INC     HL
        DJNZ    J62B2                   ; default type for variables is double real
        CALL    C2C24                   ; initialize RNDX
        XOR     A
        LD      (ONEFLG),A              ; not in ERROR handling routine
        LD      L,A
        LD      H,A
        LD      (ONELIN),HL             ; no "on error" handler
        LD      (OLDTXT),HL             ; CONT statement not possible
        LD      HL,(MEMSIZ)
        LD      (FRETOP),HL             ; empty stringspace
        CALL    C63C9                   ; restore statement
        LD      HL,(VARTAB)
        LD      (ARYTAB),HL             ; begin of arrayvariables space = begin of variable space (no variables)
        LD      (STREND),HL             ; end of basicprogram workarea = begin of variable space (no array variables)
        CALL    C6C1C                   ; close all i/o channels
        LD      A,(NLONLY)
        AND     01H                     ; loading basic program ?
        JR      NZ,C62E5
        LD      (NLONLY),A              ; nope, close i/o channels when requested

;       Subroutine      initialize stack
;       Inputs          ________________________
;       Outputs         ________________________

C62E5:  POP     BC                      ; get return address from stack
        LD      HL,(STKTOP)
        DEC     HL
        DEC     HL
        LD      (SAVSTK),HL
        INC     HL
        INC     HL

;       Subroutine      reinitialize stack, reset interpreter output, clear FN vars, clear variable search flag
;       Inputs          HL = top of new stack
;       Outputs         ________________________

J62F0:  CALL    H.STKE
        LD      SP,HL                   ; initialize stackpointer
        LD      HL,TEMPST
        LD      (TEMPPT),HL             ; clear stringdescriptor stack
        CALL    C7304                   ; end printeroutput
        CALL    C4AFF                   ; return interpreter output to screen
        XOR     A
        LD      H,A
        LD      L,A
        LD      (PRMLEN),HL
        LD      (NOFUNS),A
        LD      (PRMLN2),HL
        LD      (FUNACT),HL
        LD      (PRMSTK),HL             ; clear FN variables
        LD      (SUBFLG),A              ; clear variable search flag
        PUSH    HL                      ; terminator zero word for FOR and GOSUB
        PUSH    BC                      ; return address back on stack
I6317:  LD      HL,(TEMP)
        RET

;       Subroutine      enable trap
;       Inputs          HL = pointer to trap block
;       Outputs         ________________________

J631B:  DI
        LD      A,(HL)
        AND     04H                     ; keep trap occured flag
        OR      01H                     ; trap enabled
        CP      (HL)                    ; trap already enabled AND not paused ?
        LD      (HL),A
        JR      Z,J6329                 ; yep, quit
        AND     04H                     ; trap occured ?
        JR      NZ,J634F                ; yep, increase trap counter and quit
J6329:  EI
        RET

;       Subroutine      disable trap
;       Inputs          ________________________
;       Outputs         ________________________

J632B:  DI
        LD      A,(HL)
        LD      (HL),0                  ; clear trap occured, trap not paused, trap disabled
        JR      J6338                   ; decrease trap counter if needed

;       Subroutine      pause trap
;       Inputs          ________________________
;       Outputs         ________________________

C6331:  DI
        LD      A,(HL)
        PUSH    AF
        OR      02H
        LD      (HL),A                  ; trap paused
        POP     AF
J6338:  XOR     05H                     ; trap occured AND trap was not paused AND trap enabled ?
        JR      Z,J6362                 ; yep, decrease trap counter
        EI
        RET

;       Subroutine      unpause trap
;       Inputs          ________________________
;       Outputs         ________________________

C633E:  DI
        LD      A,(HL)
        AND     05H                     ; keep trap occured and trap enabled flags
        CP      (HL)                    ; was trap paused ?
        LD      (HL),A                  ; trap not paused anymore
        JR      NZ,J6348                ; yep,
        EI
        RET

J6348:  XOR     05H                     ; trap occured AND trap enabled ?
        JR      Z,J634F                 ; yep, increase trap counter and quit
        EI
        RET

;       Subroutine      increase trap counter
;       Inputs          ________________________
;       Outputs         ________________________
;       Remark          Unused Code, Not called from anywhere

?634E:  DI

;       Subroutine      increase trap counter
;       Inputs          ________________________
;       Outputs         ________________________

J634F:  LD      A,(ONGSBF)
        INC     A
        LD      (ONGSBF),A
        EI
        RET

;       Subroutine      acknowledge trap
;       Inputs          ________________________
;       Outputs         ________________________

C6358:  DI
        LD      A,(HL)
        AND     03H                     ; keep trap paused and trap enabled flags
        CP      (HL)                    ; trap occured ?
        LD      (HL),A                  ; clear trap occured
        JR      NZ,J6362                ; yep, decrease trap counter
J6360:  EI
        RET

;       Subroutine      decrease trap counter
;       Inputs          ________________________
;       Outputs         ________________________

J6362:  LD      A,(ONGSBF)
        SUB     01H
        JR      C,J6360                 ; already zero, quit
        LD      (ONGSBF),A
        EI
        RET

;       Subroutine      clear trap variables
;       Inputs          ________________________
;       Outputs         ________________________

C636E:  LD      HL,TRPTBL
        LD      B,26
        XOR     A
J6374:  LD      (HL),A
        INC     HL
        LD      (HL),A
        INC     HL
        LD      (HL),A
        INC     HL
        DJNZ    J6374
        LD      HL,FNKFLG
        LD      B,10
J6381:  LD      (HL),A
        INC     HL
        DJNZ    J6381
        LD      (ONGSBF),A              ; clear trap counter
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6389:  LD      A,(ONEFLG)
        OR      A                       ; in ERROR handling routine ?
        RET     NZ                      ; yep, quit
        PUSH    HL
        LD      HL,(CURLIN)
        LD      A,H
        AND     L
        INC     A                       ; interpreter in direct mode ?
        JR      Z,J63A6                 ; yep, quit
        LD      HL,TRPTBL
        LD      B,26
J639C:  LD      A,(HL)
        CP      05H                     ; trap occured AND trap not paused AND trap enabled ?
        JR      Z,J63A8                 ; yep, handle trap
J63A1:  INC     HL
        INC     HL
        INC     HL
        DJNZ    J639C                   ; next trap
J63A6:  POP     HL
        RET

J63A8:  PUSH    BC
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; linepointer trap handler
        DEC     HL
        DEC     HL
        LD      A,D
        OR      E                       ; has this trap a handler ?
        POP     BC
        JR      Z,J63A1                 ; nope, next trap
        PUSH    DE
        PUSH    HL
        CALL    C6358                   ; acknowledge trap
        CALL    C6331                   ; pause trap
        LD      C,3
        CALL    C625E                   ; check if enough stackspace for 3 words
        POP     BC                      ; trapentry
        POP     DE                      ; linepointer
        POP     HL                      ; BASIC pointer
        EX      (SP),HL
        POP     HL                      ; remove returnaddress
        JP      J47CF                   ; GOSUB traphandler

;       Subroutine      RESTORE statement
;       Inputs          ________________________
;       Outputs         ________________________

C63C9:  EX      DE,HL
        LD      HL,(TXTTAB)
        JR      Z,J63DD                 ; end of statement, use start of BASIC program
        EX      DE,HL
        CALL    C4769                   ; collect linenumber
        PUSH    HL
        CALL    C4295                   ; search linenumber
        LD      H,B
        LD      L,C
        POP     DE
        JP      NC,J481C                ; not found, undefined line number error
J63DD:  DEC     HL
J63DE:  LD      (DATPTR),HL             ; new DATA pointer
        EX      DE,HL
        RET

;       Subroutine      STOP statement
;       Inputs          ________________________
;       Outputs         ________________________

C63E3:  JP      NZ,J77A5                ; not end of statement, STOP statement (trap)

;       Subroutine      STOP used by BIOS ROM
;       Inputs          ________________________
;       Outputs         ________________________
;       Remark          Entrypoint unneeded, because it is called with A=0 and Zx set
;                       Replacement with C63E3 is ok. RET NZ at 63E6 could be removed

C63E6:  RET     NZ
        INC     A                       ; A = 1 (flag STOP)
        JR      J63F4

;       Subroutine      END statement
;       Inputs          ________________________
;       Outputs         ________________________

C63EA:  RET     NZ                      ; not end of statement, quit (which generates syntax error)
        XOR     A
        LD      (ONEFLG),A              ; not in ERROR handler routine
        PUSH    AF
        CALL    Z,C6C1C                 ; close all i/o channels (?? should be CALL C6C1C ??)
        POP     AF
J63F4:  LD      (SAVTXT),HL             ; save BASIC pointer
        LD      HL,TEMPST
        LD      (TEMPPT),HL             ; clear stringdescriptor stack
        DEFB    021H                    ; skip next instruction
J63FE:  OR      0FFH                    ; flag aborted input
        POP     BC
J6401:  LD      HL,(CURLIN)
        PUSH    HL
I6405:  PUSH    AF
        LD      A,L
        AND     H
        INC     A                       ; interpreter in direct mode ?
        JR      Z,J6414                 ; yep, do not save
        LD      (OLDLIN),HL
        LD      HL,(SAVTXT)
        LD      (OLDTXT),HL             ; nope, save BASIC pointer and linenumber for CONT
J6414:  CALL    C7304                   ; end printeroutput
        CALL    C7323                   ; fresh line to interpreter output
        POP     AF                      ; END ?
        LD      HL,I3FDC
        JP      NZ,J40FD                ; nope, aborted input or STOP,
        JP      J411E                   ; END, ok and mainloop (+POP)

;       Subroutine      CONT statement
;       Inputs          ________________________
;       Outputs         ________________________


C6424:  LD      HL,(OLDTXT)
        LD      A,H
        OR      L
        LD      DE,17                   ; ?? LD E,17 should be enough ??
        JP      Z,J406F                 ; nope, can not continue error
        LD      DE,(OLDLIN)
        LD      (CURLIN),DE
        RET

;       Subroutine      TRON
;       Inputs          ________________________
;       Outputs         ________________________


C6438:  DEFB    03EH                    ; LD A,xx, skip next instruction

;       Subroutine      TROFF
;       Inputs          ________________________
;       Outputs         ________________________


C6439:  XOR     A
        LD      (TRCFLG),A
        RET

;       Subroutine      SWAP statement
;       Inputs          ________________________
;       Outputs         ________________________

C643E:  CALL    C5EA4                   ; locate variable
        PUSH    DE
        PUSH    HL
        LD      HL,SWPTMP
        CALL    C2EF3                   ; HL = DE (valtyp), save 1st var in SWPTMP
        LD      HL,(ARYTAB)
        EX      (SP),HL                 ; save (ARYTAB), restore BASIC pointer
        RST     GETYPR                  ; get DAC type
        PUSH    AF                      ; save type
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C5EA4                   ; locate variable
        POP     AF
        LD      B,A
        RST     GETYPR
        CP      B
        JP      NZ,J406D                ; not the same type, type mismatch error
        EX      (SP),HL
        EX      DE,HL
        PUSH    HL
        LD      HL,(ARYTAB)             ; has (ARYTAB) changed (2nd variable does not exists) ?
        RST     DCOMPR
        JR      NZ,J6474                ; yep, illegal function call
        POP     DE                      ; pointer to 2nd variable
        POP     HL
        EX      (SP),HL                 ; save BASIC pointer, get pointer to 1st variable
        PUSH    DE
        CALL    C2EF3                   ; HL = DE (valtyp), 1st var = 2nd var
        POP     HL
        LD      DE,SWPTMP
        CALL    C2EF3                   ; HL = DE (valtyp), 2nd var = SWPTMP
        POP     HL
        RET

J6474:  JP      C475A                   ; illegal function call

;       Subroutine      ERASE statement
;       Inputs          ________________________
;       Outputs         ________________________

C6477:  LD      A,1
        LD      (SUBFLG),A              ; variable search flag = arrayvariable
        CALL    C5EA4                   ; locate variable
        PUSH    HL
        LD      (SUBFLG),A
        LD      H,B
        LD      L,C
        DEC     BC
        DEC     BC
        DEC     BC
        DEC     BC
        DEC     BC
        ADD     HL,DE
        EX      DE,HL
        LD      HL,(STREND)
J648F:  RST     DCOMPR
        LD      A,(DE)
        LD      (BC),A
        INC     DE
        INC     BC
        JR      NZ,J648F
        DEC     BC
        LD      H,B
        LD      L,C
        LD      (STREND),HL
        POP     HL
        LD      A,(HL)
        CP      ","
        RET     NZ
        RST     CHRGTR                  ; get next BASIC character
        JR      C6477

;       Unused Code
;       Not called from anywhere, leftover from a early Microsoft BASIC ?

?64A4:  POP     AF
        POP     HL
        RET

;       Subroutine      is current BASIC character a upcase letter ?
;       Inputs          ________________________
;       Outputs         ________________________

C64A7:  LD      A,(HL)

;       Subroutine      is upcase letter character ?
;       Inputs          ________________________
;       Outputs         ________________________

C64A8:  CP      "A"
        RET     C
        CP      "Z"+1
        CCF
        RET

;       Subroutine      CLEAR statement
;       Inputs          ________________________
;       Outputs         ________________________

C64AF:  JP      Z,C62A1                 ; end of statement, initialize interpreter and quit
        CALL    C4756                   ; evaluate word operand and check for 0-32767 range
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        PUSH    HL
        LD      HL,(HIMEM)
        LD      B,H
        LD      C,L                     ; current top BASIC memory
        LD      HL,(MEMSIZ)             ; current top of string heap
        JR      Z,J64EC                 ; end of statement (no new top specified), use current
        POP     HL
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        PUSH    DE
        CALL    C542F                   ; evaluate address operand
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JP      NZ,J4055                ; nope, syntax error
        EX      (SP),HL
        EX      DE,HL
        LD      A,H
        AND     A                       ; top BASIC memory in 8000H-0FFFFH range ?
        JP      P,C475A                 ; nope, illegal function call
        PUSH    DE
        LD      DE,VARWRK+1
        RST     DCOMPR                  ; top BASIC memory <= VARWRK ?
        JP      NC,C475A                ; nope, illegal function call
        POP     DE                      ; size of string heap
        PUSH    HL
        LD      BC,-(256+9+2)
        LD      A,(MAXFIL)
J64E5:  ADD     HL,BC
        DEC     A
        JP      P,J64E5                 ; next i/o channel
J64EA:  POP     BC                      ; new top address
        DEC     HL                      ; new top of string heap
J64EC:  LD      A,L
        SUB     E
        LD      E,A
        LD      A,H
        SBC     A,D
        LD      D,A                     ; bottom of string heap
        JP      C,J6275                 ; <0, out of memory
        PUSH    HL
        LD      HL,(VARTAB)
        PUSH    BC
        LD      BC,160
        ADD     HL,BC
        POP     BC
        RST     DCOMPR                  ; enough space for stack ?
        JP      NC,J6275                ; nope, out of memory
        EX      DE,HL
        LD      (STKTOP),HL             ; new start Z80 stack
        LD      H,B
        LD      L,C
        LD      (HIMEM),HL              ; new top BASIC memory
        POP     HL
        LD      (MEMSIZ),HL             ; new top of string heap
        POP     HL                      ; restore BASIC pointer
        CALL    C62A1                   ; initialize interpreter
        LD      A,(MAXFIL)              ; number of i/o channels
        CALL    C7E6B                   ; allocate i/o channels
        LD      HL,(TEMP)               ; restore BASIC pointer
        JP      C4601                   ; execute new statement

;       Unused Code
;       Not called from anywhere, leftover from a early Microsoft BASIC ?
;
;       Subroutine      DE=HL-DE
;       Inputs          ________________________
;       Outputs         ________________________

?6520:  LD      A,L
        SUB     E
        LD      E,A
        LD      A,H
        SBC     A,D
        LD      D,A
        RET

;       Subroutine      NEXT statement
;       Inputs          ________________________
;       Outputs         ________________________

C6527:  LD      DE,0                    ; any loop variable

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C652A:  CALL    NZ,C5EA4                ; not end of statement, locate variable
        LD      (TEMP),HL               ; save BASIC pointer
        CALL    C3FE2                   ; search FOR block on stack (skip 2 words)
        JP      NZ,J405B                ; not found,
        LD      SP,HL
        PUSH    DE
        LD      A,(HL)
        PUSH    AF
        INC     HL
        PUSH    DE
        LD      A,(HL)
        INC     HL
        OR      A
        JP      M,J656B
        DEC     A
        JR      NZ,J6549
        LD      BC,8
        ADD     HL,BC
J6549:  ADD     A,4
        LD      (VALTYP),A
        CALL    C2F08                   ; DAC = HL
        EX      DE,HL
        EX      (SP),HL
        PUSH    HL
        RST     GETYPR                  ; get DAC type
        JR      NC,J65A5                ; double real,
        CALL    C2ED6                   ; load from HL
        CALL    C324E                   ; single real addition
        POP     HL
        CALL    C2EE8                   ; DAC = (single)
        POP     HL
        CALL    C2EDF                   ; load from HL
        PUSH    HL
        CALL    C2F21                   ; single real compare
        JR      J6594

J656B:  LD      BC,000CH
        ADD     HL,BC
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        EX      (SP),HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        PUSH    HL
        LD      L,C
        LD      H,B
        CALL    C3172                   ; add integer
        LD      A,(VALTYP)
        CP      2
        JP      NZ,J4067                ; overflow error
        EX      DE,HL
        POP     HL
        LD      (HL),D
        DEC     HL
        LD      (HL),E
        POP     HL
        PUSH    DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        EX      (SP),HL
        CALL    C2F4D                   ; compare integer
J6594:  POP     HL
        POP     BC
        SUB     B
        CALL    C2EDF                   ; load from HL
        JR      Z,J65B6
        EX      DE,HL
        LD      (CURLIN),HL
        LD      L,C
        LD      H,B
        JP      J45FD

J65A5:  CALL    C2697                   ; double real addition (HL)
        POP     HL
        CALL    C2F10                   ; HL = DAC
        POP     HL
        CALL    C2EEF                   ; ARG = HL
        PUSH    DE
        CALL    C2F5C                   ; compare double real
        JR      J6594

J65B6:  LD      SP,HL
        LD      (SAVSTK),HL
        EX      DE,HL
        LD      HL,(TEMP)
        LD      A,(HL)
        CP      ","
        JP      NZ,C4601                ; nope, execute new statement
        RST     CHRGTR                  ; get next BASIC character
        CALL    C652A
I65C8:  CALL    C67D0                   ; free temporary string with type check
        LD      A,(HL)                  ; size of string
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; pointer to string
        POP     DE
        PUSH    BC
        PUSH    AF
        CALL    C67D7                   ; free temporary string (descriptor in DE)
        POP     AF
        LD      D,A
        LD      E,(HL)                  ; size of string
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; pointer to string
        POP     HL
J65DE:  LD      A,E
        OR      D                       ; end of both strings ?
        RET     Z                       ; yep, quit (A=0, equal)
        LD      A,D
        SUB     1                       ; end of first string ?
        RET     C                       ; yep, quit (A=FF, less)
        XOR     A
        CP      E                       ; end of second string ?
        INC     A
        RET     NC                      ; yep, quit (A=1, bigger)
        DEC     D
        DEC     E                       ; adjust counter
        LD      A,(BC)
        INC     BC
        CP      (HL)                    ; equal ?
        INC     HL
        JR      Z,J65DE                 ; yep, next
        CCF
        JP      J2E79                   ; set compare value

;       Subroutine      OCT$ function
;       Inputs          ________________________
;       Outputs         ________________________


C65F5:  CALL    C371E                   ; convert integer to octal text
        JR      J6607

;       Subroutine      HEX$ function
;       Inputs          ________________________
;       Outputs         ________________________


C65FA:  CALL    C3722                   ; convert integer to hexadecimal text
        JR      J6607

;       Subroutine      BIN$ function
;       Inputs          ________________________
;       Outputs         ________________________


C65FF:  CALL    C371A                   ; convert integer to binary text
        JR      J6607

;       Subroutine      STR$ function
;       Inputs          ________________________
;       Outputs         ________________________

C6604:  CALL    C3425                   ; convert DAC to text, unformatted
J6607:  CALL    C6635                   ; analyse string and create temporary stringdescriptor
        CALL    C67D3                   ; free temporary string in DAC
        LD      BC,J6825
        PUSH    BC                      ; copy string to new temporary string, temporary stringdescriptor to heap and quit

;       Subroutine      copy string to new temporary string
;       Inputs          HL = source string descriptor
;       Outputs         ________________________

C6611:  LD      A,(HL)                  ; size of string
        INC     HL
        PUSH    HL
        CALL    C668E                   ; allocate stringspace
        POP     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)                  ; pointer to string
        CALL    C662A                   ; make temporary stringdescriptor
        PUSH    HL
        LD      L,A                     ; size of string
        CALL    C67C7                   ; copy string
        POP     DE
        RET

;       Subroutine      allocate temporary string of 1 char
;       Inputs          ________________________
;       Outputs         DE = pointer to string, HL = descriptor

C6625:  LD      A,1

;       Subroutine      allocate temporary string
;       Inputs          A = stringsize
;       Outputs         DE = pointer to string, HL = descriptor

C6627:  CALL    C668E                   ; allocate stringspace

;       Subroutine      make temporary stringdescriptor
;       Inputs          A = stringsize, DE = pointer to string
;       Outputs         HL = pointer to temporary stringdescriptor

C662A:  LD      HL,DSCTMP
        PUSH    HL
        LD      (HL),A
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        POP     HL
        RET

;       Subroutine      analyse string and create temporary stringdescriptor
;       Inputs          HL = pointer to string to be analysed
;       Outputs         ________________________

C6635:  DEC     HL

;       Subroutine      analyze string with " as endmarker (1st char is skipped) and create temporary stringdescriptor
;       Inputs          ________________________
;       Outputs         ________________________

C6636:  LD      B,'"'

;       Subroutine      analyze string with specified endmaker (1st char is skipped) and create temporary stringdescriptor
;       Inputs          ________________________
;       Outputs         ________________________

C6638:  LD      D,B

;       Subroutine      analyse string with specified endmarkers (1st char is skipped) and create temporary stringdescriptor
;       Inputs          HL = pointer to string to be analysed, B = end character 1, D = end character 2
;       Outputs         ________________________

C6639:  PUSH    HL
        LD      C,-1
J663C:  INC     HL
        LD      A,(HL)
        INC     C
        OR      A                       ; end of BASIC line/string ?
        JR      Z,J6648                 ; yep,
        CP      D                       ; end character 1 ?
        JR      Z,J6648                 ; yep,
        CP      B                       ; end character 2 ?
        JR      NZ,J663C                ; nope, skip
J6648:  CP      '"'                     ; string marker ?
        CALL    Z,C4666                 ; yep, get next BASIC character
        EX      (SP),HL
        INC     HL
        EX      DE,HL
        LD      A,C
        CALL    C662A                   ; make temporary stringdescriptor

;       Subroutine      push temporary descriptor to temporary desciptor heap
;       Inputs          ________________________
;       Outputs         ________________________

J6654:  LD      DE,DSCTMP
        DEFB    03EH                    ; LD A,xx, skip next instruction

;       Subroutine      push descriptor to temporary desciptor heap
;       Inputs          DE = desciptor
;       Outputs         ________________________

C6658:  PUSH    DE
        LD      HL,(TEMPPT)
        LD      (DAC+2),HL
        LD      A,3
        LD      (VALTYP),A
        CALL    C2EF3                   ; HL = DE (valtyp)
        LD      DE,TEMPST+30+3
        RST     DCOMPR                  ; temporary descriptor heap full ?
        LD      (TEMPPT),HL
        POP     HL
        LD      A,(HL)
        RET     NZ
        LD      DE,16                   ; ?? LD E,16 should be enough ??
        JP      J406F                   ; yep, string formula too complex error

;       Subroutine      skip first character, message to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

I6677:  INC     HL

;       Subroutine      message to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

C6678:  CALL    C6635                   ; analyse string and create temporary stringdescriptor

;       Subroutine      free string and string to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

C667B:  CALL    C67D3                   ; free temporary string in DAC
        CALL    C2EE1                   ; get size and address of string
        INC     D
J6682:  DEC     D
        RET     Z
        LD      A,(BC)
        RST     OUTDO                   ; char to interpreter output
        CP      0DH                     ; CR ?
        CALL    Z,C7331                 ; yep, interpreter output pos = 0
        INC     BC
        JR      J6682

;       Subroutine      allocate stringspace
;       Inputs          A = size of string
;       Outputs         DE = pointer to stringspace

C668E:  OR      A                       ; because size<>0, Zx is reset (no garbage collect done)
        DEFB    00EH                    ; LD C,xx, skip next instruction
I6690:  POP     AF
        PUSH    AF
        LD      HL,(STKTOP)
        EX      DE,HL                   ; lowest stringspace
        LD      HL,(FRETOP)
        CPL
        LD      C,A
        LD      B,0FFH
        ADD     HL,BC
        INC     HL                      ; lower stringspace - stringsize = new lower
        RST     DCOMPR                  ; space available at bottom ?
        JR      C,J66A9                 ; nope, try garbage collect
        LD      (FRETOP),HL             ; new lower stringspace
        INC     HL
        EX      DE,HL
J66A7:  POP     AF
        RET

J66A9:  POP     AF                      ; garbage collect already done ?
        LD      DE,14                   ; ?? LD E,14 should be enough ??
        JP      Z,J406F                 ; yep, out of string space error
        CP      A                       ; Zx set (garbage collect done)
        PUSH    AF
        LD      BC,I6690
        PUSH    BC                      ; do a garbage collect and try allocate again

;       Subroutine      garbage collect
;       Inputs          ________________________
;       Outputs         ________________________

C66B6:  LD      HL,(MEMSIZ)             ; stringheap pointer to top of stringspace
J66B9:  LD      (FRETOP),HL
        LD      HL,0
        PUSH    HL                      ; descriptor current top string
        LD      HL,(STREND)
        PUSH    HL                      ; current top string (strings in BASIC text or variables is excluded)
        LD      HL,TEMPST               ; start with the temporary stringdescriptors
I66C7:  LD      DE,(TEMPPT)
        RST     DCOMPR                  ; stringdescriptor heap empty ?
        LD      BC,I66C7
        JP      NZ,J6742                ; nope, adjust if new topstring and next descriptor
        LD      HL,PRMPRV
        LD      (TEMP9),HL
        LD      HL,(ARYTAB)
        LD      (ARYTA2),HL             ; stop searching when the array variables are reached
        LD      HL,(VARTAB)             ; start searching in the simple variables
J66E1:  LD      DE,(ARYTA2)
        RST     DCOMPR                  ; end of searcharea ?
        JR      Z,J66FA                 ; yep,
        LD      A,(HL)                  ; variable type
        INC     HL
        INC     HL
        INC     HL                      ; skip variablename, to variable value
        CP      3                       ; string ?
        JR      NZ,J66F4                ; nope, next variable
        CALL    C6743                   ; adjust if new topstring
        XOR     A
J66F4:  LD      E,A
        LD      D,0
        ADD     HL,DE
        JR      J66E1                   ; next variable

J66FA:  LD      HL,(TEMP9)              ; current FN parameter block
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,D
        OR      E                       ; end of FN parameter block list ?
        LD      HL,(ARYTAB)
        JR      Z,J671A                 ; yep, continue with the arrayvariables
        EX      DE,HL
        LD      (TEMP9),HL              ; update current FN parameter block
        INC     HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        EX      DE,HL
        ADD     HL,DE
        LD      (ARYTA2),HL
        EX      DE,HL
        JR      J66E1                   ; search FN parameter block variables

J6719:  POP     BC
J671A:  LD      DE,(STREND)
        RST     DCOMPR                  ; end of arrayvariables ?
        JP      Z,J6763                 ; yep, move topstring up when possible
        LD      A,(HL)                  ; variable type
        INC     HL
        CALL    C2EDF                   ; load from HL (arrayoffset and variablename)
        PUSH    HL
        ADD     HL,BC                   ; to next variable
        CP      3                       ; string ?
        JR      NZ,J6719                ; nope, next variable
        LD      (TEMP8),HL              ; next variable
        POP     HL
        LD      C,(HL)
        LD      B,0
        ADD     HL,BC
        ADD     HL,BC
        INC     HL                      ; to the first arrayelement
I6737:  EX      DE,HL
        LD      HL,(TEMP8)
        EX      DE,HL
        RST     DCOMPR                  ; end of this arrayvariable ?
        JR      Z,J671A                 ; yep, next arrayvariable
        LD      BC,I6737                ; adjust if new topstring and next arrayelement
J6742:  PUSH    BC

;       Subroutine      adjust if new topstring
;       Inputs          ________________________
;       Outputs         ________________________

C6743:  XOR     A
        OR      (HL)                    ; empty string ?
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; pointer to string
        INC     HL
        RET     Z                       ; empty string, quit
        LD      B,H
        LD      C,L
        LD      HL,(FRETOP)
        RST     DCOMPR                  ; string above current top of heap ?
        LD      H,B
        LD      L,C
        RET     C                       ; yep, quit
        POP     HL
        EX      (SP),HL
        RST     DCOMPR                  ; string below current top string ?
        EX      (SP),HL
        PUSH    HL
        LD      H,B
        LD      L,C
        RET     NC                      ; yep, quit
        POP     BC                      ; return address
        POP     AF
        POP     AF                      ; discharge
        PUSH    HL                      ; new current descriptor topstring +3
        PUSH    DE                      ; new current topstring
        PUSH    BC
        RET

J6763:  POP     DE
        POP     HL
        LD      A,H
        OR      L                       ; topstring found ?
        RET     Z                       ; nope, quit with garabage collect
        DEC     HL
        LD      B,(HL)
        DEC     HL
        LD      C,(HL)                  ; current topstring
        PUSH    HL
        DEC     HL
        LD      L,(HL)                  ; size of string
        LD      H,0
        ADD     HL,BC
        LD      D,B
        LD      E,C                     ; start of string
        DEC     HL
        LD      B,H
        LD      C,L                     ; end of string
        LD      HL,(FRETOP)             ; top of stringspace is new end of string
        CALL    C6253                   ; move data
        POP     HL
        LD      (HL),C
        INC     HL
        LD      (HL),B                  ; new address string
        LD      H,B
        LD      L,C
        DEC     HL
        JP      J66B9                   ; new stringheap pointer and continue garbage collect

J6787:  PUSH    BC
        PUSH    HL
        LD      HL,(DAC+2)
        EX      (SP),HL
        CALL    C4DC7                   ; evaluate factor
        EX      (SP),HL
        CALL    C3058                   ; check if DAC has string
        LD      A,(HL)                  ; size of 1st string
        PUSH    HL
        LD      HL,(DAC+2)
        PUSH    HL
        ADD     A,(HL)                  ; + size of 2nd string
        LD      DE,15                   ; ?? LD E,15 should be enough ??
        JP      C,J406F                 ; resulting length >255, string too long error
        CALL    C6627                   ; allocate temporary string for result
        POP     DE
        CALL    C67D7                   ; free temporary string (descriptor in DE) -> free 2nd string
        EX      (SP),HL
        CALL    C67D6                   ; free temporary string (descriptor in HL) -> free 1st string
        PUSH    HL
        LD      HL,(DSCTMP+1)
        EX      DE,HL
        CALL    C67BF                   ; copy string (descriptor on stack) -> copy 1st string
        CALL    C67BF                   ; copy string (descriptor on stack) -> copy 2nd string
        LD      HL,I4C73
        EX      (SP),HL
        PUSH    HL
        JP      J6654                   ; push temporary descriptor to temporary desciptor heap and quit

;       Subroutine      copy string (descriptor on stack)
;       Inputs          string descriptor on stack, DE = destination string
;       Outputs         ________________________
;       Remark          works only if this routine is CALLed

C67BF:  POP     HL
        EX      (SP),HL                 ; get descriptor from stack
        LD      A,(HL)
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        LD      L,A

;       Subroutine      copy string
;       Inputs          L = size of string, BC = source string, DE = destination string
;       Outputs         ________________________

C67C7:  INC     L
J67C8:  DEC     L
        RET     Z
        LD      A,(BC)
        LD      (DE),A
        INC     BC
        INC     DE
        JR      J67C8

;       Subroutine      FRESTR (free temporary string with type check)
;       Inputs          ________________________
;       Outputs         ________________________

C67D0:  CALL    C3058                   ; check if string

;       Subroutine      free temporary string in DAC
;       Inputs          DAC = string descriptor
;       Outputs         ________________________

C67D3:  LD      HL,(DAC+2)              ; descriptor

;       Subroutine      free temporary string
;       Inputs          HL = string descriptor
;       Outputs         ________________________

C67D6:  EX      DE,HL

;       Subroutine      free temporary string
;       Inputs          DE = string descriptor
;       Outputs         HL = string descriptor

C67D7:  CALL    C67EE                   ; free descriptor if temporary and on top of heap
        EX      DE,HL
        RET     NZ                      ; no temporary descriptor on top of heap, quit
        PUSH    DE
        LD      D,B
        LD      E,C
        DEC     DE
        LD      C,(HL)                  ; size of string
        LD      HL,(FRETOP)
        RST     DCOMPR                  ; on top of string heap ?
        JR      NZ,J67EC                ; nope, quit
        LD      B,A
        ADD     HL,BC
        LD      (FRETOP),HL             ; release string from heap
J67EC:  POP     HL
        RET

;       Subroutine      free descriptor if temporary and on top of heap
;       Inputs          DE = descriptor
;       Outputs         ________________________

C67EE:  CALL    H.FRET
        LD      HL,(TEMPPT)
        DEC     HL
        LD      B,(HL)
        DEC     HL
        LD      C,(HL)                  ; pointer to string
        DEC     HL
        RST     DCOMPR                  ; desciptor on top of the heap ?
        RET     NZ                      ; nope, quit
        LD      (TEMPPT),HL             ; release descriptor from heap
        RET

;       Subroutine      LEN function
;       Inputs          ________________________
;       Outputs         ________________________

C67FF:  LD      BC,C4FCF
        PUSH    BC                      ; after this, byte to DAC

;       Subroutine      free temporary string and get size
;       Inputs          ________________________
;       Outputs         ________________________

C6803:  CALL    C67D0                   ; free temporary string with type check
        XOR     A
        LD      D,A
        LD      A,(HL)                  ; size of string
        OR      A                       ; Zx set if empty string
        RET

;       Subroutine      ASC function
;       Inputs          ________________________
;       Outputs         ________________________

C680B:  LD      BC,C4FCF                ; after this, byte to DAC
        PUSH    BC

;       Subroutine      free temporary string and get first character
;       Inputs          ________________________
;       Outputs         ________________________

C680F:  CALL    C6803                   ; free temporary string and get size
        JP      Z,C475A                 ; empty string, illegal function call
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)                  ; pointer to string
        LD      A,(DE)                  ; first character
        RET

;       Subroutine      CHR$ function
;       Inputs          ________________________
;       Outputs         ________________________


C681B:  CALL    C6625                   ; allocate temporary string of 1 char
        CALL    C521F                   ; check for byte value

;       Subroutine      set first character of temporary string and put on heap
;       Inputs          ________________________
;       Outputs         ________________________

C6821:  LD      HL,(DSCTMP+1)
        LD      (HL),E
J6825:  POP     BC
        JP      J6654                   ; push temporary descriptor to temporary desciptor heap and quit

;       Subroutine      STRING$ function
;       Inputs          ________________________
;       Outputs         ________________________

J6829:  RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    "("                     ; check for (
        CALL    C521C                   ; evaluate byte operand
        PUSH    DE
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C4C64                   ; evaluate expression
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        EX      (SP),HL
        PUSH    HL
        RST     GETYPR                  ; get DAC type
        JR      Z,J6841                 ; string,
        CALL    C521F                   ; check for byte value
        JR      J6844

J6841:  CALL    C680F                   ; free temporary string and get first character
J6844:  POP     DE                      ; number of characters
        CALL    C684D                   ; create string with characters and quit

;       Subroutine      SPACE$ function
;       Inputs          ________________________
;       Outputs         ________________________

C6848:  CALL    C521F                   ; check for byte value
        LD      A," "

;       Subroutine      create string with characters
;       Inputs          ________________________
;       Outputs         ________________________

C684D:  PUSH    AF
        LD      A,E                     ; number of characters
        CALL    C6627                   ; allocate temporary string
        LD      B,A
        POP     AF
        INC     B
        DEC     B                       ; stringsize zero ?
        JR      Z,J6825                 ; yep, temporary stringdescriptor to heap and quit
        LD      HL,(DSCTMP+1)           ; pointer to temporary string
J685B:  LD      (HL),A
        INC     HL
        DJNZ    J685B                   ; fill string
        JR      J6825                   ; temporary stringdescriptor to heap and quit

;       Subroutine      LEFT$ function
;       Inputs          ________________________
;       Outputs         ________________________

C6861:  CALL    C68E3
        XOR     A
J6865:  EX      (SP),HL
        LD      C,A
        DEFB    03EH                    ; LD A,xx (to skip next statement)
C6868:  PUSH    HL
I6869:  PUSH    HL
        LD      A,(HL)
        CP      B
        JR      C,J6870
        LD      A,B
        DEFB    011H                    ; LD DE,xxxx (to skip next statement)
J6870:  LD      C,0
        PUSH    BC
        CALL    C668E                   ; allocate stringspace
        POP     BC
        POP     HL
        PUSH    HL
        INC     HL
        LD      B,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,B
        LD      B,00H
        ADD     HL,BC
        LD      B,H
        LD      C,L
        CALL    C662A                   ; make temporary stringdescriptor
        LD      L,A
        CALL    C67C7                   ; copy string
        POP     DE
        CALL    C67D7                   ; free temporary string (descriptor in DE)
        JP      J6654                   ; push temporary descriptor to temporary desciptor heap and quit

;       Subroutine      RIGHT$ function
;       Inputs          ________________________
;       Outputs         ________________________

C6891:  CALL    C68E3
        POP     DE
        PUSH    DE
        LD      A,(DE)
        SUB     B
        JR      J6865

;       Subroutine      MID$ function
;       Inputs          ________________________
;       Outputs         ________________________

C689A:  EX      DE,HL
        LD      A,(HL)
        CALL    C68E6
        INC     B
        DEC     B
        JP      Z,C475A                 ; illegal function call
        PUSH    BC
        CALL    C69E4
        POP     AF
        EX      (SP),HL
        LD      BC,I6869
        PUSH    BC
        DEC     A
        CP      (HL)
        LD      B,00H
        RET     NC
        LD      C,A
        LD      A,(HL)
        SUB     C
        CP      E
        LD      B,A
        RET     C
        LD      B,E
        RET

;       Subroutine      VAL function
;       Inputs          ________________________
;       Outputs         ________________________

C68BB:  CALL    C6803                   ; free temporary string and get size
        JP      Z,C4FCF                 ; empty string, byte (size) to DAC
        LD      E,A
        INC     HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        PUSH    HL
        ADD     HL,DE
        LD      B,(HL)
        LD      (VLZADR),HL
        LD      A,B
        LD      (VLZDAT),A
        LD      (HL),D
        EX      (SP),HL
        PUSH    BC
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        CALL    C3299                   ; convert text to number
        LD      HL,0
        LD      (VLZADR),HL
        POP     BC
        POP     HL
        LD      (HL),B
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C68E3:  EX      DE,HL
        RST     SYNCHR
        DEFB    ")"                     ; check for )

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C68E6:  POP     BC
        POP     DE
        PUSH    BC
        LD      B,E
        RET

;       Subroutine      INSTR function
;       Inputs          ________________________
;       Outputs         ________________________

J68EB:  RST     CHRGTR                  ; get next BASIC character
        CALL    C4C62                   ; evaluate ( expression
        RST     GETYPR                  ; get DAC type
        LD      A,1
        PUSH    AF
        JR      Z,J6906                 ; string,
        POP     AF
        CALL    C521F                   ; check for byte value
        OR      A
        JP      Z,C475A                 ; illegal function call
        PUSH    AF
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C4C64                   ; evaluate expression
        CALL    C3058                   ; check if string
J6906:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        PUSH    HL
        LD      HL,(DAC+2)
        EX      (SP),HL
        CALL    C4C64                   ; evaluate expression
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        EX      DE,HL
        POP     BC
        POP     HL
        POP     AF
        PUSH    BC
        LD      BC,J3297
        PUSH    BC
        LD      BC,C4FCF
        PUSH    BC                      ; after this, byte to DAC
        PUSH    AF
        PUSH    DE
        CALL    C67D6                   ; free temporary string (descriptor in HL)
        POP     DE
        POP     AF
        LD      B,A
        DEC     A
        LD      C,A
        CP      (HL)
        LD      A,0
        RET     NC
        LD      A,(DE)
        OR      A
        LD      A,B
        RET     Z
        LD      A,(HL)
        INC     HL
        LD      B,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,B
        LD      B,0
        ADD     HL,BC
J693E:  SUB     C
        LD      B,A
        PUSH    BC
        PUSH    DE
        EX      (SP),HL
        LD      C,(HL)
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
J6949:  PUSH    HL
        PUSH    DE
        PUSH    BC
J694C:  LD      A,(DE)
        CP      (HL)
        JR      NZ,J6966
        INC     DE
        DEC     C
        JR      Z,J695D
        INC     HL
        DJNZ    J694C
        POP     DE
        POP     DE
        POP     BC
J695A:  POP     DE
        XOR     A
        RET

J695D:  POP     HL
        POP     DE
        POP     DE
        POP     BC
        LD      A,B
        SUB     H
        ADD     A,C
        INC     A
        RET

J6966:  POP     BC
        POP     DE
        POP     HL
        INC     HL
        DJNZ    J6949
        JR      J695A

;       Subroutine      MID$ statement
;       Inputs          ________________________
;       Outputs         ________________________

J696E:  RST     SYNCHR
        DEFB    "("                     ; check for (
        CALL    C5EA4                   ; locate variable
        CALL    C3058                   ; check if string
        PUSH    HL
        PUSH    DE
        EX      DE,HL
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      HL,(STREND)
        RST     DCOMPR
        JR      C,J6993
        LD      HL,(TXTTAB)
        RST     DCOMPR
        JR      NC,J6993
        POP     HL
        PUSH    HL
        CALL    C6611                   ; copy string to new temporary string
        POP     HL
        PUSH    HL
        CALL    C2EF3                   ; HL = DE (valtyp)
J6993:  POP     HL
        EX      (SP),HL
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
        OR      A                       ; startpos 0 ?
        JP      Z,C475A                 ; yep, illegal function call
        PUSH    AF
        LD      A,(HL)
        CALL    C69E4
        PUSH    DE
        CALL    C4C5F                   ; evaluate = expression
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        EX      DE,HL
        POP     HL
        POP     BC
        POP     AF
        LD      B,A
        EX      (SP),HL
        PUSH    HL
        LD      HL,J3297
        EX      (SP),HL
        LD      A,C
        OR      A
        RET     Z
        LD      A,(HL)
        SUB     B
        JP      C,C475A                 ; illegal function call
        INC     A
        CP      C
        JR      C,J69C3
        LD      A,C
J69C3:  LD      C,B
        DEC     C
        LD      B,00H
        PUSH    DE
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,E
        ADD     HL,BC
        LD      B,A
        POP     DE
        EX      DE,HL
        LD      C,(HL)
        INC     HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        EX      DE,HL
        LD      A,C
        OR      A
        RET     Z
J69DB:  LD      A,(DE)
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        RET     Z
        DJNZ    J69DB
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C69E4:  LD      E,0FFH
        CP      ")"
        JR      Z,J69EF
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
J69EF:  RST     SYNCHR
        DEFB    ")"                     ; check for )
        RET

;       Subroutine      FRE function
;       Inputs          ________________________
;       Outputs         ________________________

C69F2:  LD      HL,(STREND)
        EX      DE,HL
        LD      HL,0
        ADD     HL,SP
        RST     GETYPR                  ; get DAC type
        JP      NZ,J4FC1                ; not a string,
        CALL    C67D3                   ; free temporary string in DAC
        CALL    C66B6                   ; garbage collect
        LD      DE,(STKTOP)
        LD      HL,(FRETOP)
        JP      J4FC1

;       Subroutine      evaluate filespecification
;       Inputs          ________________________
;       Outputs         ________________________

C6A0E:  CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        LD      A,(HL)
        OR      A                       ; stringsize zero ?
        JR      Z,J6A47                 ; yep, bad filename error
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,E                     ; pointer to string
        LD      E,A                     ; size of string
        CALL    C6F15                   ; parse devicename
        PUSH    AF                      ; save devicecode
        LD      BC,FILNAM
        LD      D,11
        INC     E
J6A29:  DEC     E                       ; end of filespecification string ?
        JR      Z,J6A61                 ; yep, fill remaining FILNAME with spaces
        LD      A,(HL)
        CP      20H                     ; control characters ?
        JR      C,J6A47                 ; yep, bad filename error
        CP      "."                     ; filename/extension seperator ?
        JR      Z,J6A4D                 ; yep, handle extension
        LD      (BC),A
        INC     BC
        INC     HL
        DEC     D                       ; FILNAM full ?
        JR      NZ,J6A29                ; nope, next
J6A3B:  POP     AF
        PUSH    AF
        LD      D,A                     ; devicecode
        LD      A,(FILNAM+0)
        INC     A                       ; first character FILNAME charactercode 255 ?
        JR      Z,J6A47                 ; yep, bad filename error (because this is internally used as runflag)
        POP     AF
        POP     HL
        RET

J6A47:  JP      J6E6B                   ; bad filename

J6A4A:  INC     HL
        JR      J6A29

J6A4D:  LD      A,D
        CP      0BH
        JP      Z,J6A47
        CP      03H
        JP      C,J6A47
        JR      Z,J6A4A
        LD      A,20H
        LD      (BC),A
        INC     BC
        DEC     D
        JR      J6A4D

J6A61:  LD      A," "
        LD      (BC),A
        INC     BC
        DEC     D
        JR      NZ,J6A61
        JR      J6A3B

;       Subroutine      get i/o channel control block (DAC)
;       Inputs          (DAC) = i/o channel number
;       Outputs         ________________________

C6A6A:  CALL    C521F                   ; check for byte value

;       Subroutine      get i/o channel control block
;       Inputs          A = i/o channel number
;       Outputs         ________________________

C6A6D:  LD      L,A
        LD      A,(MAXFIL)
        CP      L
        JP      C,J6E7D                 ; bad filenumber
        LD      H,0
        ADD     HL,HL
        EX      DE,HL
        LD      HL,(FILTAB)
        ADD     HL,DE
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        LD      A,(NLONLY)
        INC     A                       ; NLONLY 0FFH ?
        RET     Z                       ; yep, quit
        LD      A,(HL)
        OR      A                       ; i/o channel open ?
        RET     Z                       ; nope, quit
        PUSH    HL
        LD      DE,4
        ADD     HL,DE
        LD      A,(HL)
        CP      9                       ; device i/o channel a diskdrive ?
        JR      NC,J6A99                ; nope, not a diskdrive device
        CALL    H.GETP                  ; hook for disk
        JP      J6E80                   ; internal error (should not return to here)

J6A99:  POP     HL
        LD      A,(HL)
        OR      A
        SCF
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6A9E:  DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        CP      "#"
        CALL    Z,C4666                 ; yep, get next BASIC character
        CALL    C521C                   ; evaluate byte operand
        EX      (SP),HL
        PUSH    HL

;       Subroutine      redirect interpreter input/output to file
;       Inputs          ________________________
;       Outputs         ________________________

C6AAA:  CALL    C6A6D                   ; get i/o channel control block
        JP      Z,J6E77                 ; i/o channel not open, file not open error
        LD      (PTRFIL),HL             ; interpreter input/output device = i/o channel
        CALL    H.SETF
        RET

;       Subroutine      OPEN statement
;       Inputs          ________________________
;       Outputs         ________________________

C6AB7:  LD      BC,C4AFF
        PUSH    BC
        CALL    C6A0E                   ; evaluate filespecification
        LD      A,(HL)
        CP      82H                     ; FOR token ?
        LD      E,4                     ; random file mode
        JR      NZ,J6AE4                ; nope, open in random mode
        RST     CHRGTR                  ; get next BASIC character
        CP      85H                     ; INPUT token ?
        LD      E,1                     ; input file mode
        JR      Z,J6AE3                 ; yep, open in input mode
        CP      9CH                     ; OUT token ?
        JR      Z,J6ADC                 ; yep, may be OUTPUT
        RST     SYNCHR
        DEFB    "A"
        RST     SYNCHR
        DEFB    "P"
        RST     SYNCHR
        DEFB    "P"
        RST     SYNCHR
        DEFB    081H                    ; check for APPEND
        LD      E,8                     ; append file mode
        JR      J6AE4                   ; open in append mode

J6ADC:  RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    0B3H                    ; check for PUT token
        LD      E,2                     ; output file mode
        JR      J6AE4                   ; open in output mode

J6AE3:  RST     CHRGTR                  ; get next BASIC character
J6AE4:  RST     SYNCHR
        DEFB    "A"
        RST     SYNCHR
        DEFB    "S"                     ; check for AS
        PUSH    DE
        LD      A,(HL)
        CP      "#"
        CALL    Z,C4666                 ; yep, get next BASIC character
        CALL    C521C                   ; evaluate byte operand
        OR      A                       ; i/o channel 0 ?
        JP      Z,J6E7D                 ; yep, bad filenumber
        CALL    H.NOFO                  ; open statement extension hook
        DEFB    01EH                    ; LD E,xx, skip next instruction

;       Subroutine      open i/o channel
;       Inputs          A = i/o channel number, E = filemode
;       Outputs         ________________________

C6AFA:  PUSH    DE
        DEC     HL
        LD      E,A
        RST     CHRGTR                  ; end of statement ?
        JP      NZ,J4055                ; nope, syntax error
        EX      (SP),HL
        LD      A,E
        PUSH    AF
        PUSH    HL
        CALL    C6A6D                   ; get i/o channel control block
        JP      NZ,J6E6E                ; i/o channel already open, file already open
        POP     DE
        LD      A,D
        CP      9                       ; diskdrive device ?
        CALL    H.NULO                  ; open for disk hook
        JP      C,J6E80                 ; internal error
        PUSH    HL
        LD      BC,4
        ADD     HL,BC
        LD      (HL),D
        LD      A,0                     ; function open
        POP     HL
        CALL    C6F8F                   ; i/o function dispatcher
        POP     AF
        POP     HL
        RET

;       Subroutine      close i/o channel
;       Inputs          A = i/o channel number
;       Outputs         ________________________

C6B24:  PUSH    HL
        OR      A                       ; i/o channel 0 ?
        JR      NZ,J6B30                ; nope, skip check
        LD      A,(NLONLY)
        AND     01H                     ; loading basic program ?
        JP      NZ,J6CF3                ; yep, do not close i/o channel
J6B30:  CALL    C6A6D                   ; get i/o channel control block
        JR      Z,J6B4A                 ; i/o channel not open,
        LD      (PTRFIL),HL             ; interpreter input/output device = i/o channel (only temporary)
        PUSH    HL
        JR      C,J6B41                 ; not a diskdrive device,
        CALL    H.NTFL                  ; close for disk hook
        JP      J6E80                   ; internal error (should not return to here)

J6B41:  LD      A,2                     ; function close
        CALL    C6F8F                   ; i/o function dispatcher
        CALL    C6CEA
        POP     HL
J6B4A:  PUSH    HL
        LD      DE,7
        ADD     HL,DE
        LD      (HL),A
        LD      H,A
        LD      L,A
        LD      (PTRFIL),HL             ; interpreter input/output device = keyboard/screen
        POP     HL
        ADD     A,(HL)
        LD      (HL),0
        POP     HL
        RET

;       Subroutine      RUN statement (with filespecification)
;       Inputs          ________________________
;       Outputs         ________________________

J6B5B:  SCF                             ; Cx=1 (RUN flag set)
        DEFB    011H                    ; skip to 6B5F

;       Subroutine      LOAD statement
;       Inputs          ________________________
;       Outputs         ________________________

C6B5D:  DEFB    0F6H                    ; OR xx, so A<>0 and Cx=0 (RUN flag not set)

;       Subroutine      MERGE statement
;       Inputs          ________________________
;       Outputs         ________________________

C6B5E:  XOR     A                       ; A=0 and Cx=0 (RUN flag not set)
        PUSH    AF                      ; save flags
        CALL    C6A0E                   ; evaluate filespecification
        CALL    H.MERG
        POP     AF
        PUSH    AF
        JR      Z,J6B76                 ; MERGE statement, no ,R option
        LD      A,(HL)
        SUB     ","
        OR      A
        JR      NZ,J6B76                ; no ,R option
        RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    "R"                     ; check for R
        POP     AF
        SCF                             ; set RUN flag
        PUSH    AF                      ; set do not close i/o channels flag
J6B76:  PUSH    AF
        XOR     A                       ; i/o channel 0
        LD      E,1                     ; input file mode
        CALL    C6AFA                   ; open i/o channel
        LD      HL,(PTRFIL)
        LD      BC,7
        ADD     HL,BC
        POP     AF
        SBC     A,A
        AND     80H                     ; do not close i/o channels flag
        OR      01H                     ; set basic program loading flag
        LD      (NLONLY),A
        POP     AF
        PUSH    AF
        SBC     A,A
        LD      (FILNAM+0),A            ; 000H for LOAD only, 0FFH for LOAD and RUN
        LD      A,(HL)
        OR      A                       ; binairy load ?
        JP      M,J6BD4                 ; yep,
        POP     AF
        CALL    NZ,C6287                ; yep, clear basic program
        XOR     A
        CALL    C6AAA                   ; redirect interpreter input/output to i/o channel 0
        JP      J4134                   ; mainloop

;       Subroutine      SAVE statement
;       Inputs          ________________________
;       Outputs         ________________________

C6BA3:  CALL    C6A0E                   ; evaluate filespecification
        CALL    H.SAVE
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        LD      E,80H
        SCF
        JR      Z,J6BB7                 ; no ,A option, use binairy save
        RST     SYNCHR
        DEFB    ","
        RST     SYNCHR
        DEFB    "A"                     ; check for ,A
        OR      A
        LD      E,2                     ; use ascii save
J6BB7:  PUSH    AF
        LD      A,D
        CP      9                       ; diskdrive device ?
        JR      C,J6BC2                 ; yep,
        LD      E,2                     ; output file mode
        POP     AF
        XOR     A                       ; use ascii save
        PUSH    AF
J6BC2:  XOR     A                       ; i/o channel 0
        CALL    C6AFA                   ; open i/o channel
        POP     AF
        JR      C,J6BCE                 ; binairy save,
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JP      C522E                   ; list statement

J6BCE:  CALL    H.BINS
        JP      J6E6B                   ; bad filename

J6BD4:  CALL    H.BINL
        JP      J6E6B                   ; bad filename

;       Subroutine      get i/o channel device
;       Inputs          (PTRFIL) = pointer to i/o channel control block
;       Outputs         ________________________
;       Unused Code
;       Not called from anywhere, leftover from a early Microsoft BASIC ?

?6BDA:  PUSH    HL
        PUSH    DE
        LD      HL,(PTRFIL)
        LD      DE,4
        ADD     HL,DE
        LD      A,(HL)
        POP     DE
        POP     HL
        RET

J6BE7:  JR      NZ,J6C02                ; not end of statement, evaluate channels
        PUSH    HL                      ; save basic pointer
J6BEA:  PUSH    BC
        PUSH    AF
        LD      DE,I6BF3
        PUSH    DE
        PUSH    BC
        OR      A
        RET                             ; close i/o channel

I6BF3:  POP     AF
        POP     BC
        DEC     A
        JP      P,J6BEA                 ; next channel
        POP     HL
        RET

I6BFB:  POP     BC                      ; close i/o channel routine
        POP     HL                      ; basic pointer
        LD      A,(HL)
        CP      ","
        RET     NZ
        RST     CHRGTR                  ; get next BASIC character
J6C02:  PUSH    BC
        LD      A,(HL)
        CP      "#"
        CALL    Z,C4666                 ; yep, get next BASIC character
        CALL    C521C                   ; evaluate byte operand
        EX      (SP),HL
        PUSH    HL
        LD      DE,I6BFB
        PUSH    DE
        SCF
        JP      (HL)                    ; close i/o channel

;       Subroutine      CLOSE statement
;       Inputs          ________________________
;       Outputs         ________________________

C6C14:  LD      BC,C6B24                ; close i/o channel routine
        LD      A,(MAXFIL)              ; default = all channels
        JR      J6BE7                   ; close i/o channel(s)

;       Subroutine      close all i/o channels
;       Inputs          ________________________
;       Outputs         ________________________

C6C1C:  LD      A,(NLONLY)
        OR      A                       ; do not close i/o channels flag set ?
        RET     M                       ; yep, quit doing nothing
        LD      BC,C6B24                ; close i/o channel routine
        XOR     A                       ; 'end of statement' flag
        LD      A,(MAXFIL)              ; all channels
        JR      J6BE7                   ; close i/o channels

;       Subroutine      LFILES statement
;       Inputs          ________________________
;       Outputs         ________________________

C6C2A:  LD      A,1
        LD      (PRTFLG),A              ; interpreter output to printer

;       Subroutine      FILES statement
;       Inputs          ________________________
;       Outputs         ________________________

C6C2F:  CALL    H.FILE
        JP      C475A                   ; illegal function call

;       Subroutine      do random input/output
;       Inputs          ________________________
;       Outputs         ________________________

J6C35:  PUSH    AF
        CALL    C6A9E
        JR      C,J6C41
        CALL    H.DGET
        JP      J6E6B                   ; bad filename

J6C41:  POP     DE
        POP     BC
        LD      A,4                     ; function random i/o
        JP      C6F8F                   ; i/o function dispatcher

;       Subroutine      do sequential output
;       Inputs          ________________________
;       Outputs         ________________________

C6C48:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    C6C62                   ; current i/o channel a diskdrive device ?
        JR      NC,J6C57                ; nope,
        CALL    H.FILO                  ; sequential ouput for disk hook
        JP      J6E6B                   ; bad filename

J6C57:  POP     AF
        PUSH    AF
        LD      C,A
        LD      A,6                     ; function sequential output
        CALL    C6F8F                   ; i/o function dispatcher
        JP      J72FF

;       Subroutine      current i/o channel a diskdrive device ?
;       Inputs          ________________________
;       Outputs         ________________________

C6C62:  PUSH    DE
        LD      HL,(PTRFIL)
        EX      DE,HL
        LD      HL,4
        ADD     HL,DE
        LD      A,(HL)
        EX      DE,HL
        POP     DE
        CP      9
        RET

;       Subroutine      get sequential input
;       Inputs          ________________________
;       Outputs         ________________________

C6C71:  PUSH    HL
J6C72:  PUSH    DE
        PUSH    BC
        CALL    C6C62                   ; current i/o channel a diskdrive device ?
        JR      NC,J6C7F                ; nope,
I6C79:  CALL    H.INDS                  ; sequential input for disk hook
        JP      J6E80                   ; internal error (should not return to here)

J6C7F:  LD      A,8                     ; function sequential input
        CALL    C6F8F                   ; i/o function dispatcher
        JP      J7300

;       Subroutine      INPUT$ function
;       Inputs          ________________________
;       Outputs         ________________________

J6C87:  RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    "$"
        RST     SYNCHR
        DEFB    "("                     ; check for $(
        PUSH    HL
        LD      HL,(PTRFIL)
        PUSH    HL                      ; save interpreter input/output device
        LD      HL,0
        LD      (PTRFIL),HL             ; interpreter input/output device = keyboard/screen
        POP     HL
        EX      (SP),HL
        CALL    C521C                   ; evaluate byte operand
        PUSH    DE
        LD      A,(HL)
        CP      ","
        JR      NZ,J6CB3
        RST     CHRGTR                  ; get next BASIC character
        CALL    C6A9E
        CP      01H
        JP      Z,J6CB0
        CP      04H
        JP      NZ,J6E83
J6CB0:  POP     HL
        XOR     A
        LD      A,(HL)
J6CB3:  PUSH    AF
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        POP     AF
        EX      (SP),HL
        PUSH    AF
        LD      A,L
        OR      A
        JP      Z,C475A                 ; illegal function call
        PUSH    HL
        CALL    C6627                   ; allocate temporary string
        EX      DE,HL
        POP     BC
J6CC4:  POP     AF
        PUSH    AF
        JR      Z,J6CE2
        CALL    CHGET
        PUSH    AF
        CALL    CKCNTC
        POP     AF
J6CD0:  LD      (HL),A
        INC     HL
        DEC     C
        JR      NZ,J6CC4
        POP     AF
        POP     BC
        POP     HL
        CALL    H.RSLF
        LD      (PTRFIL),HL             ; restore interpreter input/output device
        PUSH    BC
        JP      J6654                   ; push temporary descriptor to temporary desciptor heap and quit

J6CE2:  CALL    C6C71                   ; get sequential input
        JP      C,J6E83
        JR      J6CD0

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6CEA:  CALL    C6CFB
        PUSH    HL
        LD      B,00H
        CALL    C6CF5
J6CF3:  POP     HL
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6CF5:  XOR     A
J6CF6:  LD      (HL),A
        INC     HL
        DJNZ    J6CF6
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6CFB:  LD      HL,(PTRFIL)
        LD      DE,9
        ADD     HL,DE
        RET

;       Subroutine      LOC function
;       Inputs          ________________________
;       Outputs         ________________________

C6D03:  CALL    H.SAVD
        CALL    C6A6A                   ; get i/o channel control block (DAC)
        JR      Z,J6D2B                 ; i/o channel not open, file not open
        LD      A,10                    ; function loc
        JR      C,J6D30                 ; not a diskdrive device, i/o function dispatcher and quit
        CALL    H.LOC                   ; LOC for disk
        JR      J6D36                   ; internal error (should not return to here)

;       Subroutine      LOF function
;       Inputs          ________________________
;       Outputs         ________________________

C6D14:  CALL    H.SAVD
        CALL    C6A6A                   ; get i/o channel control block (DAC)
        JR      Z,J6D2B                 ; i/o channel not open, file not open
        LD      A,12                    ; function lof
        JR      C,J6D30                 ; not a diskdrive device, i/o function dispatcher and quit
        CALL    H.LOF                   ; LOF for disk
        JR      J6D36                   ; internal error (should not return to here)

;       Subroutine      EOF function
;       Inputs          ________________________
;       Outputs         ________________________

C6D25:  CALL    H.SAVD
        CALL    C6A6A                   ; get i/o channel control block (DAC)
J6D2B:  JP      Z,J6E77                 ; i/o channel not open, file not open
        LD      A,14                    ; function close
J6D30:  JP      C,C6F8F                 ; not a diskdrive device, i/o function dispatcher and quit
        CALL    H.EOF                   ; EOF for disk
J6D36:  JP      J6E80                   ; internal error (should not return to here)

;       Subroutine      FPOS function
;       Inputs          ________________________
;       Outputs         ________________________

C6D39:  CALL    H.SAVD
        CALL    C6A6A                   ; get i/o channel control block (DAC)
        LD      A,16                    ; function fpos
        JR      C,J6D30                 ; i/o channel open AND not a diskdrive device, i/o function dispatcher and quit
        CALL    H.FPOS                  ; FPOS for disk
        JR      J6D36                   ; internal error (should not return to here)

;       Subroutine      direct statement
;       Inputs          ________________________
;       Outputs         ________________________

J6D48:  CALL    ISFLIO                  ; interpreter input/output device = file ?
        JP      Z,J4640                 ; nope, execute direct statement
        XOR     A
        CALL    C6B24                   ; close i/o channel 0
        JP      J6E71                   ; direct statement in file error

;       Subroutine      redirect interpreter input if i/o channel specified
;       Inputs          ________________________
;       Outputs         ________________________

C6D55:  LD      C,1

;       Subroutine      redirect interpreter input/output if i/o channel specified
;       Inputs          ________________________
;       Outputs         ________________________

C6D57:  CP      "#"
        RET     NZ
        PUSH    BC
        CALL    C521B                   ; skip basic char and evaluate byte operand
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        LD      A,E
        PUSH    HL
        CALL    C6AAA                   ; redirect interpreter input/output to i/o channel
        LD      A,(HL)
        POP     HL
        POP     BC
        CP      C                       ; correct filemode ?
        JR      Z,J6D79                 ; yep, quit
        CP      4                       ; random mode ?
        JR      Z,J6D79                 ; yep, quit
        CP      8                       ; append mode ?
        JR      NZ,J6D76                ; nope, bad filenumber error
        LD      A,C
        CP      2                       ; request output mode ?
J6D76:  JP      NZ,J6E7D                ; nope, bad filenumber
J6D79:  LD      A,(HL)
        RET

;       Subroutine      close i/o channel 0 and load HL from (TEMP)
;       Inputs          ________________________
;       Outputs         ________________________

C6D7B:  LD      BC,I6317                ; load BASIC pointer from (TEMP)
        PUSH    BC
        XOR     A
        JP      C6B24                   ; close i/o channel 0

J6D83:  RST     GETYPR                  ; get DAC type
        LD      BC,I4BF1
        LD      DE,2C20H
        JR      NZ,J6DA3                ; not a string,
        LD      E,D
        JR      J6DA3

J6D8F:  LD      BC,C4AFF
        PUSH    BC
        CALL    C6D55                   ; redirect interpreter input if i/o channel specified
        CALL    C5EA4                   ; locate variable
        CALL    C3058                   ; check if string
        PUSH    DE
        LD      BC,J487B
        XOR     A
        LD      D,A
        LD      E,A
J6DA3:  PUSH    AF
        PUSH    BC
        PUSH    HL
J6DA6:  CALL    C6C71                   ; get sequential input
        JP      C,J6E83
        CP      20H
        JR      NZ,J6DB4
        INC     D
        DEC     D
        JR      NZ,J6DA6
J6DB4:  CP      22H
        JR      NZ,J6DC6
        LD      A,E
        CP      2CH
        LD      A,22H
        JR      NZ,J6DC6
        LD      D,A
        LD      E,A
        CALL    C6C71                   ; get sequential input
        JR      C,J6E0D
J6DC6:  LD      HL,BUF
        LD      B,0FFH
J6DCB:  LD      C,A
        LD      A,D
        CP      22H
        LD      A,C
        JR      Z,J6DFC
        CP      0DH
        PUSH    HL
        JR      Z,J6E27
        POP     HL
        CP      0AH
        JR      NZ,J6DFC
J6DDC:  LD      C,A
        LD      A,E
        CP      2CH
        LD      A,C
        CALL    NZ,C6E61
        CALL    C6C71                   ; get sequential input
        JR      C,J6E0D
        CP      0AH
        JR      Z,J6DDC
        CP      0DH
        JR      NZ,J6DFC
        LD      A,E
        CP      20H
        JR      Z,J6E08
        CP      2CH
        LD      A,0DH
        JR      Z,J6E08
J6DFC:  OR      A
        JR      Z,J6E08
        CP      D
        JR      Z,J6E0D
        CP      E
        JR      Z,J6E0D
        CALL    C6E61
J6E08:  CALL    C6C71                   ; get sequential input
        JR      NC,J6DCB
J6E0D:  PUSH    HL
        CP      22H
        JR      Z,J6E16
        CP      20H
        JR      NZ,J6E41
J6E16:  CALL    C6C71                   ; get sequential input
        JR      C,J6E41
        CP      20H
        JR      Z,J6E16
        CP      2CH
        JR      Z,J6E41
        CP      0DH
        JR      NZ,J6E30
J6E27:  CALL    C6C71                   ; get sequential input
        JR      C,J6E41
        CP      0AH
        JR      Z,J6E41
J6E30:  LD      C,A
        CALL    C6C62                   ; current i/o channel a diskdrive device ?
        JR      NC,J6E3C                ; nope,
        CALL    H.BAKU                  ; backup for disk hook
        JP      J6E80                   ; internal error (should not return to here)

J6E3C:  LD      A,18                    ; function backup
        CALL    C6F8F                   ; i/o function dispatcher
J6E41:  POP     HL
J6E42:  LD      (HL),00H
        LD      HL,BUFMIN
        LD      A,E
        SUB     20H
        JR      Z,J6E53
        LD      B,0
        CALL    C6638                   ; analyze string with specified endmaker (1st char is skipped) and create temporary stringdescriptor
        POP     HL
        RET

J6E53:  RST     GETYPR                  ; get DAC type
        PUSH    AF
        RST     CHRGTR                  ; get next BASIC character
        POP     AF
        PUSH    AF
        CALL    C,C3299                 ; not a double real, convert text to number
        POP     AF
        CALL    NC,C3299                ; double real, convert text to number
        POP     HL
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C6E61:  OR      A
        RET     Z
        LD      (HL),A
        INC     HL
        DEC     B
        RET     NZ
        POP     AF
        JP      J6E42

J6E6B:  LD      E,38H
        DEFB    001H

J6E6E:  LD      E,36H
        DEFB    001H

J6E71:  LD      E,39H
        DEFB    001H

J6E74:  LD      E,35H
        DEFB    001H

J6E77:  LD      E,3BH
        DEFB    001H

J6E7A:  LD      E,32H
        DEFB    001H

J6E7D:  LD      E,34H
        DEFB    001H

J6E80:  LD      E,33H
        DEFB    001H

J6E83:  LD      E,37H
        DEFB    001H

J6E86:  LD      E,3AH
        XOR     A
        LD      (NLONLY),A              ; not loading basic program, close i/o channels when requested
        LD      (FLBMEM),A
        JP      J406F

;       Subroutine      BSAVE statement
;       Inputs          ________________________
;       Outputs         ________________________


C6E92:  CALL    C6A0E                   ; evaluate filespecification
        PUSH    DE                      ; save devicecode
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C6F0B                   ; evaluate BLOAD/BSAVE address operand
        EX      DE,HL
        LD      (SAVENT),HL
        EX      DE,HL                   ; assume start address = execute address
        PUSH    DE                      ; save start address
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C6F0B                   ; evaluate BLOAD/BSAVE address operand
        EX      DE,HL
        LD      (SAVEND),HL
        EX      DE,HL                   ; save end address
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JR      Z,J6EB9                 ; yep, skip execute address
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C6F0B                   ; evaluate BLOAD/BSAVE address operand
        EX      DE,HL
        LD      (SAVENT),HL
        EX      DE,HL                   ; save execute address
J6EB9:  POP     BC                      ; start address
        POP     DE                      ; devicecode
        PUSH    HL
        PUSH    BC
        LD      A,D
        CP      0FFH                    ; device is cassette ?
        JP      Z,J6FD7                 ; yep, BSAVE to cassette
        JP      J6E6B                   ; bad filename error

;       Subroutine      BLOAD statement
;       Inputs          ________________________
;       Outputs         ________________________

C6EC6:  CALL    C6A0E                   ; evaluate filespecification
        PUSH    DE
        XOR     A
        LD      (RUNBNF),A              ; assume no execute after load
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        LD      BC,0                    ; assume offset 0
        JR      Z,J6EE8                 ; end of statement, go
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      "R"                     ; run option ?
        JR      NZ,J6EE3                ; nope, offset option
        LD      (RUNBNF),A              ; execute after load
        RST     CHRGTR                  ; get next BASIC character
        JR      Z,J6EE8                 ; end of statement, go
        RST     SYNCHR
        DEFB    ","                     ; check for ,
J6EE3:  CALL    C6F0B                   ; evaluate BLOAD/BSAVE address operand (offset)
        LD      B,D
        LD      C,E                     ; offset
J6EE8:  POP     DE                      ; devicecode
        PUSH    HL
        PUSH    BC
        LD      A,D
        CP      0FFH                    ; device is cassette ?
        JP      Z,J7014                 ; BLOAD from cassette
        JP      J6E6B                   ; bad filename

;       Subroutine      finish BLOAD
;       Inputs          ________________________
;       Outputs         ________________________

J6EF4:  LD      A,(RUNBNF)
        OR      A                       ; execute after load ?
        JR      Z,J6F06                 ; nope, close channel and quit
        XOR     A
        CALL    C6B24                   ; close i/o channel 0
        LD      HL,J6CF3
        PUSH    HL                      ; after this, retore BASIC pointer and continue
        LD      HL,(SAVENT)
        JP      (HL)                    ; start code

J6F06:  POP     HL                      ; restore BASIC pointer
        XOR     A
        JP      C6B24                   ; close i/o channel 0


;       Subroutine      evaluate BLOAD/BSAVE address operand
;       Inputs          ________________________
;       Outputs         ________________________

C6F0B:  CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C5439                   ; convert address to integer
        POP     DE
        EX      DE,HL
        RET

;       Subroutine      devicename parser
;       Inputs          ________________________
;       Outputs         ________________________

C6F15:  CALL    H.PARD                  ; hook devicename parser: start of parser
        LD      A,(HL)
        CP      3AH                     ; 00H-39H ?
        JR      C,J6F37                 ; yep, bad filename
        PUSH    HL
        LD      D,E
        LD      A,(HL)
        INC     HL
        DEC     E
        JR      Z,J6F2E                 ; filespec has length 1, no device
J6F24:  CP      ":"                     ; device seperator ?
        JR      Z,J6F3D                 ; yep,
        LD      A,(HL)
        INC     HL
        DEC     E
        JP      P,J6F24                 ; check for device
J6F2E:  LD      E,D
        POP     HL
        XOR     A                       ; Zx set
        LD      A,0FFH                  ; devicecode for CAS
        CALL    H.NODE                  ; hook devicename parser: no device specified
        RET

J6F37:  CALL    H.POSD                  ; hook devicename parser: first character filespecification has code 00-39H
        JP      J6E6B                   ; bad filename

J6F3D:  LD      A,D
        SUB     E
        DEC     A                       ; length of devicename
        POP     BC
        PUSH    DE
        PUSH    BC
        LD      C,A
        LD      B,A
        LD      DE,I6F76                ; internal devicename table
        EX      (SP),HL
        PUSH    HL
J6F4A:  CALL    C4EA9                   ; get char uppercase
        PUSH    BC
        LD      B,A
        LD      A,(DE)
        INC     HL
        INC     DE
        CP      B                       ; match ?
        POP     BC
        JR      NZ,J6F63                ; nope,
        DEC     C
        JR      NZ,J6F4A                ; next
J6F59:  LD      A,(DE)
        OR      A                       ; name in table also ends ?
        JP      P,J6F63                 ; nope, this is not it!
        POP     HL                      ; yep, A=devicecode
        POP     HL
        POP     DE
        OR      A                       ; Zx reset
        RET

J6F63:  OR      A                       ; already at devicecode ?
        JP      M,J6F59                 ; yep, found device!
J6F67:  LD      A,(DE)
        ADD     A,A
        INC     DE
        JR      NC,J6F67                ; skip to next devicename in table
        LD      C,B
        POP     HL
        PUSH    HL
        LD      A,(DE)
        OR      A
        JR      NZ,J6F4A                ; try next devicename
        JP      J55F8                   ; try external devices (in expansion roms)

I6F76:  DEFB    "CAS",0FFH
        DEFB    "LPT",0FEH
        DEFB    "CRT",0FDH
        DEFB    "GRP",0FCH
        DEFB    0

I6F87:  DEFW    C71C7                   ; CAS jumptable
        DEFW    C72A6                   ; LPT jumptable
        DEFW    C71A2                   ; CRT jumptable
        DEFW    C7182                   ; GRP jumptable

;       Subroutine      i/o function dispatcher
;       Inputs          A = function
;       Outputs         ________________________

C6F8F:  CALL    H.GEND
        PUSH    HL
        PUSH    DE
        PUSH    AF
        LD      DE,4
        ADD     HL,DE
        LD      A,(HL)
        CP      0FCH                    ; i/o channel device a internal device ?
        JP      C,J564A                 ; nope, start i/o function in expansion ROM
        LD      A,0FFH
        SUB     (HL)
        ADD     A,A
        LD      E,A
        LD      HL,I6F87
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     AF                      ; functioncode
        LD      L,A
        LD      H,0
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        POP     DE                      ; filemode
        EX      (SP),HL                 ; i/o channel control block
        RET

;       Subroutine      CSAVE statement
;       Inputs          ________________________
;       Outputs         ________________________

C6FB7:  call    A7098
        dec     hl
        rst     CHRGTR
        jr      z,A6FC3
        rst     SYNCHR
        db      ','
        call    A7A2D
A6FC3:  push    hl
        ld      a,0D3H
        call    A7125
        ld      hl,(VARTAB)
        ld      (SAVEND),hl
        ld      hl,(TXTTAB)
        call    A713E
        pop     hl
        ret
;
J6FD7:  ld      a,0D0H
        call    A7125
        xor     a
        call    C72F8
        pop     hl
        push    hl
        call    A7003
        ld      hl,(SAVEND)
        push    hl
        call    A7003
        ld      hl,(SAVENT)
        call    A7003
        pop     de
        pop     hl
A6FF4:  ld      a,(hl)
        call    C72DE
        rst     DCOMPR
        jr      nc,A6FFE
        inc     hl
        jr      A6FF4
;
A6FFE:  call    TAPOOF
        pop     hl
        ret
;
A7003:  ld      a,l
        call    C72DE
        ld      a,h
        jp      C72DE
;
A700B:  call    C72D4
        ld      l,a
        call    C72D4
        ld      h,a
        ret
;
J7014:  ld      c,0D0H
        call    A70B8
        call    C72E9
        pop     bc
        call    A700B
        add     hl,bc
        ex      de,hl
        call    A700B
        add     hl,bc
        push    hl
        call    A700B
        ld      (SAVENT),hl
        ex      de,hl
        pop     de
A702F:  call    C72D4
        ld      (hl),a
        rst     DCOMPR
        jr      z,A7039
        inc     hl
        jr      A702F
;
A7039:  call    TAPIOF
        jp      J6EF4
;
C703F:  sub     091H
        jr      z,A7045
        xor     a
        db      001H
A7045:  cpl
        inc     hl
        cp      001H
        push    af
        call    A708C                   ; evaluate filename
        ld      c,0D3H
        call    A70B8                   ; search BINBAS file
        pop     af
        ld      (DAC+2),a
        call    c,C6287                 ; CLOAD, do a NEW
        ld      a,(DAC+2)
        cp      001H
        ld      (FRCNEW),a
        push    af
        call    C54EA                   ; force linenumbers
        pop     af
        ld      hl,(TXTTAB)
        call    A715D                   ; load/compare basicprogram
        jr      nz,A707E                ; not equal
        ld      (VARTAB),hl             ; start of vararea
A7071:
        ld      hl,I3FD7                ; prompt message
        CALL    C6678                   ; message to interpreter output
        ld      hl,(TXTTAB)
        push    hl
        jp      J4237                   ; manage pointers & vars, headloop

A707E:  inc     hl
        ex      de,hl
        ld      hl,(VARTAB)
        rst     DCOMPR                  ; difference in programarea ?
        jp      c,A7071                 ; nop, then it is ok
        ld      e,014H
        jp      J406F                   ; Verify error

A708C:  dec     hl
        rst     CHRGTR
        jr      nz,A7098
        push    hl
        ld      hl,FILNAM
        ld      b,006H
        jr      A70B1

A7098:  call    C4C64                   ; eval expression
        push    hl
        call    C680F                   ; free if temp
        dec     hl
        dec     hl
        ld      b,(hl)                  ; length of string
        ld      c,006H
        ld      hl,FILNAM
A70A7:  ld      a,(de)
        ld      (hl),a
        inc     hl
        inc     de
        dec     c
        jr      z,A70B6                 ; FILNAM filled, quit
        djnz    A70A7
        ld      b,c
A70B1:  ld      (hl),' '
        inc     hl
        djnz    A70B1                   ; fill remainer with spaces
A70B6:  pop     hl
        ret
;
A70B8:  call    C72E9                   ; Check until header
        ld      b,10
A70BD:  call    C72D4                   ; read byte
        cp      c
        jr      nz,A70B8                ; other filetype, try again
        djnz    A70BD
        ld      hl,FILNM2
        push    hl
        ld      b,6
A70CB:  call    C72D4
        ld      (hl),a
        inc     hl
        djnz    A70CB                   ; read filename
        pop     hl
        ld      de,FILNAM
        ld      b,006H
A70D8:  ld      a,(de)
        inc     de
        cp      ' '
        jr      nz,A70E2
        djnz    A70D8                   ; FILNAM all spaces ?
        jr      A70EF                   ; yep, found
;
A70E2:  ld      de,FILNAM
        ld      b,006H
A70E7:  ld      a,(de)
        cp      (hl)
        jr      nz,A70F5                ; not the same, skip
        inc     hl
        inc     de
        djnz    A70E7                   ; compare next
A70EF:  ld      hl,T70FF
        jp      A710D                   ; found
;
A70F5:  push    bc
        ld      hl,T7106
        call    A710D                   ; print Skip
        pop     bc
        jr      A70B8                   ; try again
;
T70FF:  db      "Found:",0

T7106:  db      "Skip :",0

A710D:  ld      de,(CURLIN)
        inc     de
        ld      a,d
        or      e
        ret     nz
        call    C6678
        ld      hl,FILNM2
        ld      b,006H
A711D:  ld      a,(hl)
        inc     hl
        rst     OUTDO
        djnz    A711D
        jp      C7328                   ; OUTDO next line
;
A7125:  call    C72F8
        ld      b,00AH
A712A:  call    C72DE
        djnz    A712A
        ld      b,006H
        ld      hl,FILNAM
A7134:  ld      a,(hl)
        inc     hl
        call    C72DE
        djnz    A7134
        jp      TAPOOF
;
A713E:  push    hl
        call    C54EA                   ; force linenumbers
        xor     a
        call    C72F8
        pop     de
        ld      hl,(SAVEND)
A714A:  ld      a,(de)
        inc     de
        call    C72DE
        rst     DCOMPR
        jr      nz,A714A
        ld      l,007H
A7154:  call    C72DE
        dec     l
        jr      nz,A7154
        jp      TAPOOF
;
A715D:  call    C72E9
        sbc     a,a
        cpl
        ld      d,a
A7163:  ld      b,00AH
A7165:  call    C72D4
        ld      e,a
        call    C6267
        ld      a,e
        sub     (hl)
        and     d
        jp      nz,TAPIOF
        ld      (hl),e
        ld      a,(hl)
        or      a
        inc     hl
        jr      nz,A7163
        djnz    A7165
        ld      bc,-6
        add     hl,bc
        xor     a
        jp      TAPIOF
;
;       Table GRP device

C7182:  DEFW    J71B6                   ; open, check if output/append and open
        DEFW    J71C2                   ; close, quit
        DEFW    J6E86                   ; random, sequential i/o only error
        DEFW    J7196                   ; output, output char to screen
        DEFW    C475A                   ; input, illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call

J7196:  LD      A,(SCRMOD)
        CP      2                       ; in graphic screenmode ?
        JP      C,C475A                 ; nope, illegal function call
        LD      A,C
        JP      GRPPRT                  ; output char to graphic screen

;       Table CRT device

C71A2:  DEFW    J71B6                   ; open, check if output/append and open
        DEFW    J71C2                   ; close, quit
        DEFW    J6E86                   ; random, sequential i/o only error
        DEFW    J71C3                   ; output, output char to screen
        DEFW    C475A                   ; input, illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call

J71B6:  CALL    C72CD                   ; bad filename error if random mode
        CP      1
        JP      Z,J6E6B                 ; input mode, bad filename error
J71BE:  LD      (PTRFIL),HL             ; interpreter input/output device
        LD      (HL),E
J71C2:  RET

J71C3:  LD      A,C
        JP      CHPUT

;       Table CAS device

C71C7:  DEFW    C71DB                   ; open,
        DEFW    J7205                   ; close,
        DEFW    J6E86                   ; random, sequential i/o only error
        DEFW    J722A                   ; output,
        DEFW    C723F                   ; input,
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    J726D                   ;
        DEFW    C475A                   ; illegal function call
        DEFW    J727C                   ;

C71DB:  push    hl
        push    de
        ld      bc,6
        add     hl,bc
        xor     a
        ld      (hl),a
        ld      (CASPRV),a
        call    C72CD
        cp      004H
        jp      z,J6E6B
        cp      001H
        jr      z,A71FB
        ld      a,0EAH
        call    A7125
A71F7:  pop     de
        pop     hl
        jr      J71BE
;
A71FB:  ld      c,0EAH
        call    A70B8
        call    TAPIOF
        jr      A71F7

J7205:  ld      a,(hl)
        cp      001H
        jr      z,A7225
        ld      a,01AH
        push    hl
        call    A728B
        call    z,A722F
        pop     hl
        call    A7281
        jr      z,A7225
        push    hl
        add     hl,bc
A721B:  ld      (hl),01AH
        inc     hl
        inc     c
        jr      nz,A721B
        pop     hl
        call    A722F
A7225:  xor     a
        ld      (CASPRV),a
        ret

J722A:  ld      a,c
        call    A728B
        ret     nz
A722F:  xor     a
        call    C72F8
        ld      b,000H
A7235:  ld      a,(hl)
        call    C72DE
        inc     hl
        djnz    A7235
        jp      TAPOOF
;
C723F:  ex      de,hl
        ld      hl,CASPRV
        call    C72BE
        ex      de,hl
        call    A729B
        jr      nz,A7260
        push    hl
        call    C72E9
        pop     hl
        ld      b,000H
A7253:  call    C72D4
        ld      (hl),a
        inc     hl
        djnz    A7253
        call    TAPIOF
        dec     h
        xor     a
        ld      b,a
A7260:  ld      c,a
        add     hl,bc
        ld      a,(hl)
        cp      01AH
        scf
        ccf
        ret     nz
        ld      (CASPRV),a
        scf
        ret

J726D:  call    C723F
        ld      hl,CASPRV
        ld      (hl),a
        sub     01AH
        sub     001H
        sbc     a,a
        jp      C2E9A

J727C:  ld      hl,CASPRV
        ld      (hl),c
        ret
;
A7281:  ld      bc,6
        add     hl,bc
        ld      a,(hl)
        ld      c,a
        ld      (hl),000H
        jr      A72A1
;
A728B:  ld      e,a
        ld      bc,6
        add     hl,bc
        ld      a,(hl)
        inc     (hl)
        inc     hl
        inc     hl
        inc     hl
        push    hl
        ld      c,a
        add     hl,bc
        ld      (hl),e
        pop     hl
        ret
;
A729B:  ld      bc,6
        add     hl,bc
        ld      a,(hl)
        inc     (hl)
A72A1:  inc     hl
        inc     hl
        inc     hl
        and     a
        ret


;       Table LPT device

C72A6:  DEFW    J71B6                   ; open, check if output/append and open
        DEFW    J71C2                   ; close, quit
        DEFW    J6E86                   ; random, sequential i/o only error
        DEFW    J72BA                   ; output, output char to printer
        DEFW    C475A                   ; input, illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call
        DEFW    C475A                   ; illegal function call

J72BA:  LD      A,C
        JP      OUTDLP

;       Subroutine      get cassette putback character if any
;       Inputs          ________________________
;       Outputs         ________________________

C72BE:  LD      A,(HL)
        LD      (HL),0
        AND     A
        RET     Z
        INC     SP
        INC     SP
        CP      1AH
        SCF
        CCF
        RET     NZ
        LD      (HL),A
        SCF
        RET

;       Subroutine      bad filename error if random mode
;       Inputs          ________________________
;       Outputs         ________________________

C72CD:  LD      A,E
        CP      8
        JP      Z,J6E6B                 ; bad filename
        RET

;       Subroutine      read character from cassette
;       Inputs          ________________________
;       Outputs         ________________________

C72D4:  PUSH    HL
        PUSH    DE
        PUSH    BC
        CALL    TAPIN
        JR      NC,J7300
        JR      J72F2

;       Subroutine      write character to cassette
;       Inputs          ________________________
;       Outputs         ________________________

C72DE:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    TAPOUT
        JR      NC,J72FF
        JR      J72F2

;       Subroutine      start cassette input
;       Inputs          ________________________
;       Outputs         ________________________

C72E9:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    TAPION
        JR      NC,J72FF
J72F2:  CALL    TAPIOF
        JP      J73B2                   ; device I/O error

;       Subroutine      start cassette output
;       Inputs          ________________________
;       Outputs         ________________________

C72F8:  PUSH    HL
        PUSH    DE
        PUSH    BC
        PUSH    AF
        CALL    TAPOON
J72FF:  POP     AF
J7300:  POP     BC
        POP     DE
        POP     HL
        RET

;       Subroutine      end printeroutput
;       Inputs          ________________________
;       Outputs         ________________________

C7304:  XOR     A
        LD      (PRTFLG),A              ; interpreter output to screen
        LD      A,(LPTPOS)
        OR      A
        RET     Z
        LD      A,0DH
        CALL    C731C
        LD      A,0AH
        CALL    C731C
        XOR     A
        LD      (LPTPOS),A
        RET

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C731C:  CALL    LPTOUT
        RET     NC
        JP      J73B2                   ; device I/O error

;       Subroutine      fresh line to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

C7323:  LD      A,(TTYPOS)
        OR      A
        RET     Z

;       Subroutine      newline to interpreter output
;       Inputs          ________________________
;       Outputs         ________________________

C7328:  CALL    H.CRDO
        LD      A,0DH
        RST     OUTDO
        LD      A,0AH
        RST     OUTDO

;       Subroutine      interpreter output pos = 0
;       Inputs          ________________________
;       Outputs         ________________________

C7331:  CALL    ISFLIO                  ; interpreter input/output device = file ?
        JR      Z,J7338                 ; nope,
        XOR     A
        RET

J7338:  LD      A,(PRTFLG)
        OR      A                       ; interpreter output to screen ?
        JR      Z,J7343                 ; yep, ttypos = 0
        XOR     A
        LD      (LPTPOS),A              ; nope, lptpos = 0
        RET

J7343:  LD      (TTYPOS),A
        RET

;       Subroutine      INKEY$ function
;       Inputs          ________________________
;       Outputs         ________________________

J7347:  RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        CALL    CHSNS
        JR      Z,J735A
        CALL    CHGET
        PUSH    AF
        CALL    C6625                   ; allocate temporary string of 1 char
        POP     AF
        LD      E,A
        CALL    C6821                   ; set first character of temporary string and put on heap and quit
J735A:  LD      HL,I3FD6
        LD      (DAC+2),HL
        LD      A,3
        LD      (VALTYP),A              ; empty string
        POP     HL
        RET

;       Subroutine      char to interpreter output, LF expanded
;       Inputs          ________________________
;       Outputs         ________________________

C7367:  RST     OUTDO
        CP      0AH
        RET     NZ
        LD      A,0DH
        RST     OUTDO
        CALL    C7331                   ; interpreter output pos = 0
        LD      A,0AH
        RET

;       Subroutine      get line from interpreter input file
;       Inputs          ________________________
;       Outputs         ________________________

C7374:  CALL    H.DSKC
        LD      B,255
        LD      HL,BUF
J737C:  CALL    C6C71                   ; get sequential input
        JR      C,J7397
        LD      (HL),A
        CP      0DH                     ; CR ?
        JR      Z,J7391                 ; yep, stop input
        CP      09H                     ; TAB ?
        JR      Z,J738E                 ; yep, continue
        CP      0AH                     ; LF ?
        JR      Z,J737C                 ; yep, ignore
J738E:  INC     HL
        DJNZ    J737C                   ; next
J7391:  XOR     A
        LD      (HL),A                  ; endmarker
        LD      HL,BUFMIN
        RET

J7397:  INC     B                       ; empty line ?
        JR      NZ,J7391                ; nope, return line
C739A:  LD      A,(NLONLY)
        AND     80H
        LD      (NLONLY),A              ; basic program not loading
        CALL    C6D7B                   ; close i/o channel 0 and load HL from (TEMP)
        LD      A,(FILNAM)
        AND     A                       ; RUN after LOAD ?
        JP      Z,J411E                 ; nope, ok and mainloop (+POP)
        CALL    C629A                   ; initialize interpreter, basic pointer at start of program
        JP      C4601                   ; execute new statement

;       Subroutine      device I/O error
;       Inputs          ________________________
;       Outputs         ________________________

J73B2:  LD      E,19
        JP      J406F                   ; device i/o error

;       Subroutine      MOTOR statement
;       Inputs          ________________________
;       Outputs         ________________________

C73B7:  ld      e,0FFH
        jr      z,A73C6                 ; end of statement, toggle
        sub     0EBH
        ld      e,a                     ; OFF token ?
        jr      z,A73C5                 ; yep, off
        rst     SYNCHR
        db      095H                    ; ON must follow
        ld      e,001H                  ; on
        db      03EH
A73C5:  rst     CHRGTR
A73C6:  ld      a,e
        jp      STMOTR

;       Subroutine      SOUND statement
;       Inputs          ________________________
;       Outputs         ________________________

C73CA:  CALL    C521C                   ; evaluate byte operand
        CP      14                      ; register 0-13 ?
        JP      NC,C475A                ; nope, illegal function call
        PUSH    AF
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
        POP     AF
        CP      7                       ; register 7 ?
        JR      NZ,J73E1                ; nope, write PSG register
        RES     6,E
        SET     7,E                     ; make sure PSG I/O port definition is not changed
J73E1:  JP      WRTPSG                  ; write PSG register

I73E4:  DEFB    " "

;       Subroutine      PLAY statement
;       Inputs          ________________________
;       Outputs         ________________________


C73E5:  CALL    H.PLAY
        PUSH    HL
        LD      HL,I752E
        LD      (MCLTAB),HL
        LD      A,0
        LD      (PRSCNT),A
        LD      HL,-10
        ADD     HL,SP
        LD      (SAVSP),HL
        POP     HL
        PUSH    AF
J73FD:  CALL    C4C64                   ; evaluate expression
        EX      (SP),HL
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        CALL    C2EDF                   ; load from HL
        LD      A,E
        OR      A                       ; stringsize zero ?
        JR      NZ,J7413                ; nope,
        LD      E,1
        LD      BC,I73E4
        LD      D,C
        LD      C,B
J7413:  POP     AF
        PUSH    AF
        CALL    GETVCP
        LD      (HL),E                  ; stringsize
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (HL),C                  ; pointer
        INC     HL
        LD      D,H
        LD      E,L
        LD      BC,001CH
        ADD     HL,BC
        EX      DE,HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        POP     BC
        POP     HL
        INC     B
        LD      A,B
        CP      03H
        JR      NC,J7446
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        JR      Z,J7439
        PUSH    BC
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        JR      J73FD

J7439:  LD      A,B
        LD      (VOICEN),A
        CALL    C7507
        INC     B
        LD      A,B
        CP      03H
        JR      C,J7439
J7446:  DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JP      NZ,J4055                ; nope, syntax error
        PUSH    HL
J744C:  XOR     A
J744D:  PUSH    AF
        LD      (VOICEN),A
        LD      B,A
        CALL    C7521
        JP      C,J74D6
        LD      A,B
        CALL    GETVCP
        LD      A,(HL)
        OR      A
        JP      Z,J74D6
        LD      (MCLLEN),A
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      (MCLPTR),DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        PUSH    HL
        LD      L,24H
        CALL    GETVC2
        PUSH    HL
        LD      HL,(SAVSP)
        DEC     HL
        POP     BC
        DI
        CALL    C6253                   ; move data
        POP     DE
        LD      H,B
        LD      L,C
        LD      SP,HL
        EI
        LD      A,0FFH
        LD      (MCLFLG),A
        JP      J56A2

J748E:  LD      A,(MCLLEN)
        OR      A
        JR      NZ,J7497
J7494:  CALL    C7507
J7497:  LD      A,(VOICEN)
        CALL    GETVCP
        LD      A,(MCLLEN)
        LD      (HL),A
        INC     HL
        LD      DE,(MCLPTR)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        LD      HL,0
        ADD     HL,SP
        EX      DE,HL
        LD      HL,(SAVSP)
        DI
        LD      SP,HL
        POP     BC
        POP     BC
        POP     BC
        PUSH    HL
        OR      A
        SBC     HL,DE
        JR      Z,J74D4
        LD      A,0F0H
        AND     L
        OR      H
        JP      NZ,C475A                ; illegal function call
        LD      L,24H
        CALL    GETVC2
        POP     BC
        DEC     BC
        CALL    C6253                   ; move data
        POP     HL
        DEC     HL
        LD      (HL),B
        DEC     HL
        LD      (HL),C
        JR      J74D6

J74D4:  POP     BC
        POP     BC
J74D6:  EI
        POP     AF
        INC     A
        CP      03H
        JP      C,J744D
        DI
        LD      A,(INTFLG)
        CP      03H
        JR      Z,J7502
        LD      A,(PRSCNT)
        RLCA
        JR      C,J74F3
        LD      HL,PLYCNT
        INC     (HL)
        CALL    STRTMS
J74F3:  EI
        LD      HL,PRSCNT
        LD      A,(HL)
        OR      80H
        LD      (HL),A
        CP      83H
        JP      NZ,J744C
J7500:  POP     HL
        RET

J7502:  CALL    GICINI
        JR      J7500


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C7507:  LD      A,(PRSCNT)
        INC     A
        LD      (PRSCNT),A
        LD      E,0FFH


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C7510:  PUSH    HL
        PUSH    BC
J7512:  PUSH    DE
        LD      A,(VOICEN)
        DI
        CALL    PUTQ
        EI
        POP     DE
        JR      Z,J7512
        POP     BC
        POP     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C7521:  LD      A,(VOICEN)
        PUSH    BC
        DI
        CALL    LFTQ
        EI
        POP     BC
        CP      8
        RET

I752E:  DEFB    "A"
        DEFW    C763E
        DEFB    "B"
        DEFW    C763E
        DEFB    "C"
        DEFW    C763E
        DEFB    "D"
        DEFW    C763E
        DEFB    "E"
        DEFW    C763E
        DEFB    "F"
        DEFW    C763E
        DEFB    "G"
        DEFW    C763E
        DEFB    "M"+128
        DEFW    C759E
        DEFB    "V"+128
        DEFW    C7586
        DEFB    "S"+128
        DEFW    C75BE
        DEFB    "N"+128
        DEFW    C7621
        DEFB    "O"+128
        DEFW    C75EF
        DEFB    "R"+128
        DEFW    C75FC
        DEFB    "T"+128
        DEFW    C75E2
        DEFB    "L"+128
        DEFW    C75C8
        DEFB    "X"
        DEFW    C5782
        DEFB    0

I755F:  DEFB    010H,012H,014H,016H,000H,000H,002H,004H
        DEFB    006H,008H,00AH,00AH,00CH,00EH,010H

I756E:  DEFW    00D5DH
        DEFW    00C9CH
        DEFW    00BE7H
        DEFW    00B3CH
        DEFW    00A9BH
        DEFW    00A02H
        DEFW    00973H
        DEFW    008EBH
        DEFW    0086BH
        DEFW    007F2H
        DEFW    00780H
        DEFW    00714H

C7586:  JR      C,J758A
        LD      E,08H
J758A:  LD      A,0FH
        CP      E
        JR      C,J75DF
J758F:  XOR     A
        OR      D
        JR      NZ,J75DF
        LD      L,12H
        CALL    GETVC2
        LD      A,40H
        AND     (HL)
        OR      E
        LD      (HL),A
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C759E:  LD      A,E
        JR      C,J75A4
        CPL
        INC     A
        LD      E,A
J75A4:  OR      D
        JR      Z,J75DF
        LD      L,13H
        CALL    GETVC2
        PUSH    HL
        LD      A,(HL)
        INC     HL
        LD      H,(HL)
        LD      L,A
        RST     DCOMPR
        POP     HL
        RET     Z
        LD      (HL),E
        INC     HL
        LD      (HL),D
        DEC     HL
        DEC     HL
        LD      A,40H
        OR      (HL)
        LD      (HL),A
        RET

C75BE:  LD      A,E
        CP      10H
        JR      NC,J75DF
        OR      10H
        LD      E,A
        JR      J758F


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C75C8:  JR      C,J75CC
        LD      E,4
J75CC:  LD      A,E
        CP      64+1
        JR      NC,J75DF
        LD      L,10H
J75D3:  CALL    GETVC2
        XOR     A
        OR      D
        JR      NZ,J75DF
        OR      E
        JR      Z,J75DF
        LD      (HL),A
        RET

J75DF:  CALL    C475A                   ; illegal function call

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C75E2:  JR      C,J75E6
        LD      E,120
J75E6:  LD      A,E
        CP      32
        JR      C,J75DF
        LD      L,11H
        JR      J75D3

C75EF:  JR      C,J75F3
        LD      E,4
J75F3:  LD      A,E
        CP      8+1
        JR      NC,J75DF
        LD      L,0FH
        JR      J75D3

C75FC:  JR      C,J7600
        LD      E,4
J7600:  XOR     A
        OR      D
        JR      NZ,J75DF
        OR      E
        JR      Z,J75DF
        CP      64+1
        JR      NC,J75DF
J760B:  LD      HL,0
        PUSH    HL
        LD      L,10H
        CALL    GETVC2
        PUSH    HL
        INC     HL
        INC     HL
        LD      A,(HL)
        LD      (SAVVOL),A
        LD      (HL),80H
        DEC     HL
        DEC     HL
        JR      J769C

C7621:  JR      NC,J75DF
        XOR     A
        OR      D
        JR      NZ,J75DF
        OR      E
        JR      Z,J760B
        CP      96+1
        JR      NC,J75DF
        LD      A,E
        LD      B,00H
        LD      E,B
J7632:  SUB     12
        INC     E
        JR      NC,J7632
        ADD     A,12
        ADD     A,A
        LD      C,A
        JP      J7673

C763E:  LD      B,C
        LD      A,C
        SUB     40H
        ADD     A,A
        LD      C,A
        CALL    C56EE
        JR      Z,J7665
        CP      "#"
        JR      Z,J7666
        CP      "+"
        JR      Z,J7666
        CP      "-"
        JR      Z,J765A
        CALL    C570B
        JR      J7665

J765A:  DEC     C
        LD      A,B
        CP      "C"
        JR      Z,J7664
        CP      "F"
        JR      NZ,J7665
J7664:  DEC     C
J7665:  DEC     C
J7666:  LD      L,0FH
        CALL    GETVC2
        LD      E,(HL)
        LD      B,00H
        LD      HL,I755F
        ADD     HL,BC
        LD      C,(HL)
J7673:  LD      HL,I756E
        ADD     HL,BC
        LD      A,E
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
J767B:  DEC     A
        JR      Z,J7687
        SRL     D
        RR      E
        JR      J767B

J7684:  CALL    C475A                   ; illegal function call
J7687:  ADC     A,E
        LD      E,A
        ADC     A,D
        SUB     E
        LD      D,A
        PUSH    DE
        LD      L,10H
        CALL    GETVC2
        LD      C,(HL)
        PUSH    HL
        CALL    C56EE
        JR      Z,J76A9
        CALL    C572F
J769C:  LD      A,40H
        CP      E
        JR      C,J7684
        XOR     A
        OR      D
        JR      NZ,J7684
        OR      E
        JR      Z,J76A9
        LD      C,E
J76A9:  POP     HL
        LD      D,00H
        LD      B,D
        INC     HL
        LD      E,(HL)
        PUSH    HL
        CALL    C314A                   ; unsigned integer multiply
        EX      DE,HL
        CALL    C2FCB                   ; convert to single precision real
        CALL    C2F0D                   ; ARG = DAC
        LD      HL,I7754
        CALL    C2EBE                   ; DAC = (single)
        CALL    C289F                   ; DAC / ARG
        CALL    C2F8A                   ; convert DAC to integer
        LD      D,H
        LD      E,L
J76C8:  CALL    C56EE
        JR      Z,J76E3
        CP      "."
        JR      NZ,J76E0
        SRL     D
        RR      E
        ADC     HL,DE
        LD      A,0E0H
        AND     H
        JR      Z,J76C8
        XOR     H
        LD      H,A
        JR      J76E3

J76E0:  CALL    C570B
J76E3:  LD      DE,5
        RST     DCOMPR
        JR      C,J76EA
        EX      DE,HL
J76EA:  LD      BC,-9
        POP     HL
        PUSH    HL
        ADD     HL,BC
        LD      (HL),D
        INC     HL
        LD      (HL),E
        INC     HL
        LD      C,02H
        EX      (SP),HL
        INC     HL
        LD      E,(HL)
        LD      A,E
        AND     0BFH
        LD      (HL),A
        EX      (SP),HL
        LD      A,80H
        OR      E
        LD      (HL),A
        INC     HL
        INC     C
        EX      (SP),HL
        LD      A,E
        AND     40H
        JR      Z,J7716
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        LD      (HL),D
        INC     HL
        LD      (HL),E
        INC     HL
        INC     C
        INC     C
        DEFB    0FEH                    ; CP xx, skip next instruction
J7716:  POP     HL
        POP     DE
        LD      A,D
        OR      E
        JR      Z,J7721
        LD      (HL),D
        INC     HL
        LD      (HL),E
        INC     C
        INC     C
J7721:  LD      L,07H
        CALL    GETVC2
        LD      (HL),C
        LD      A,C
        SUB     02H
        RRCA
        RRCA
        RRCA
        INC     HL
        OR      (HL)
        LD      (HL),A
        DEC     HL
        LD      A,D
        OR      E
        JR      NZ,J7741
        PUSH    HL
        LD      A,(SAVVOL)
        OR      80H
        LD      BC,11
        ADD     HL,BC
        LD      (HL),A
        POP     HL
J7741:  POP     DE
        LD      B,(HL)
        INC     HL
J7744:  LD      E,(HL)
        INC     HL
        CALL    C7510
        DJNZ    J7744
        CALL    C7521
        JP      C,J748E
        JP      J56A2


        IF INTHZ EQ 60

I7754:  DEFB    040H,000H,045H,014H             ; 14400

        ELSE

I7754:  DEFB    000H,000H,045H,012H             ; 12000

        ENDIF


;       Subroutine      PUT statement
;       Inputs          ________________________
;       Outputs         ________________________


C7758:  LD      B,80H                   ; PUT flag
        DEFB    011H                    ; skip next instruction

;       Subroutine      GET statement
;       Inputs          ________________________
;       Outputs         ________________________


C775B:  LD      B,0
        CP      0C7H                    ; SPRITE token follows ?
        JP      Z,J7AAF
J7762:  LD      A,B
        JP      J6C35                   ; do random input/output

;       Subroutine      LOCATE statement
;       Inputs          ________________________
;       Outputs         ________________________

C7766:  LD      DE,(CSRY)
        PUSH    DE                      ; use current coordinates as default
        CP      ","                     ; x coordinate not specified ?
        JR      Z,J777A                 ; yep, use current
        CALL    C521C                   ; evaluate byte operand
        INC     A                       ; x coordinate (1 based)
        POP     DE
        LD      D,A
        PUSH    DE
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JR      Z,J779F                 ; yep, set cursor position and quit
J777A:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      ","                     ; y coordinate not specified ?
        JR      Z,J778B                 ; yep, use current
        CALL    C521C                   ; evaluate byte operand
        INC     A                       ; y coordinate (1 based)
        POP     DE
        LD      E,A
        PUSH    DE                      ; save coordinates
        DEC     HL
        RST     CHRGTR                  ; end of statement ?
        JR      Z,J779F                 ; yep, set cursor position and quit
J778B:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
        AND     A
        LD      A,"y"
        JR      NZ,J7796                ; <>0, cursor on (ESC y 5)
        DEC     A                       ; =0, cursor off (ESC x 5)
J7796:  PUSH    AF
        LD      A,1BH
        RST     OUTDO                   ; ESC to interpreter output
        POP     AF
        RST     OUTDO                   ; "x" or "y" to interpreter output
        LD      A,"5"
        RST     OUTDO                   ; "5" to interpreter output
J779F:  EX      (SP),HL
        CALL    POSIT                   ; set cursor position
        POP     HL
        RET

;       Subroutine      STOP statement (trap)
;       Inputs          ________________________
;       Outputs         ________________________

J77A5:  PUSH    HL
        LD      HL,TRPTBL+30
        JR      J77CF

;       Subroutine      SPRITE statement (trap)
;       Inputs          ________________________
;       Outputs         ________________________

J77AB:  PUSH    HL
        LD      HL,TRPTBL+33
        JR      J77CF

;       Subroutine      INTERVAL statement
;       Inputs          ________________________
;       Outputs         ________________________

J77B1:  RST     SYNCHR
        DEFB    "E"
        RST     SYNCHR
        DEFB    "R"
        RST     SYNCHR
        DEFB    0FFH
        RST     SYNCHR
        DEFB    094H                    ; check for ERVAL
        PUSH    HL
        LD      HL,TRPTBL+51
        JR      J77CF

;       Subroutine      STRIG statement
;       Inputs          ________________________
;       Outputs         ________________________

J77BF:  LD      A,3+1                   ; max is 4
        CALL    C7C08                   ; evaluate parenthesized byte operand with a maximum
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      D,00H
        LD      HL,TRPTBL+36
        ADD     HL,DE
        ADD     HL,DE
        ADD     HL,DE
J77CF:  CALL    C77FE                   ; check for trap tokens and act upon
        JR      J77E2                   ; new statement without CTRL-STOP and trap check

;       Subroutine      KEY statement (trap)
;       Inputs          ________________________
;       Outputs         ________________________

J77D4:  CALL    C521C                   ; evaluate byte operand
        DEC     A
        CP      10                      ; functionkeynumber 1-10 ?
        JP      NC,C475A                ; nope, illegal function call
        LD      A,(HL)                  ; ?? function key number already in A ??
        PUSH    HL
        CALL    C77E8                   ; set trapentry of functionkey
J77E2:  POP     HL
        POP     AF
        RST     CHRGTR                  ; get next BASIC character
        JP      J4612                   ; new statement without CTRL-STOP and trap check

;       Subroutine      set trapentry of functionkey
;       Inputs          ________________________
;       Outputs         ________________________

C77E8:  LD      D,0
        LD      HL,FNKFLG-1
        ADD     HL,DE
        PUSH    HL
        LD      HL,TRPTBL-3
        ADD     HL,DE
        ADD     HL,DE
        ADD     HL,DE
        CALL    C77FE                   ; check for trap tokens and act upon
        LD      A,(HL)
        AND     01H                     ; functionkey trap enabled
        POP     HL
        LD      (HL),A                  ; set FNKFLG if trap enabled
        RET

;       Subroutine      check for trap tokens and act upon
;       Inputs          ________________________
;       Outputs         ________________________

C77FE:  CP      95H                     ; ON token ?
        JP      Z,J631B                 ; yep, enable trap
        CP      0EBH                    ; OFF token ?
        JP      Z,J632B                 ; yep, disable trap
        CP      90H                     ; STOP token ?
        JP      Z,C6331                 ; yep, pause trap
        JP      J4055                   ; syntax error

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C7810:  CALL    H.ONGO
        LD      BC,10
        CP      0CCH
        RET     Z
        LD      BC,0A01H
        CP      90H
        RET     Z
        INC     B
        CP      0C7H
        RET     Z
        CP      0FFH
        RET     C
        PUSH    HL
        RST     CHRGTR                  ; get next BASIC character
        CP      0A3H
        JR      Z,J7833
        CP      85H
        JR      Z,J7838
J7830:  POP     HL
        SCF
        RET

J7833:  POP     BC
        LD      BC,0C05H
        RET

J7838:  RST     CHRGTR                  ; get next BASIC character
        CP      "E"
        JR      NZ,J7830
        POP     BC
        RST     CHRGTR                  ; get next BASIC character
        RST     SYNCHR
        DEFB    "R"
        RST     SYNCHR
        DEFB    0FFH
        RST     SYNCHR
        DEFB    094H
        RST     SYNCHR
        DEFB    0EFH                    ; check for RVAL=
        CALL    C542F                   ; evaluate address operand
        LD      A,D
        OR      E
        JP      Z,C475A                 ; illegal function call
        EX      DE,HL
        LD      (INTVAL),HL
        LD      (INTCNT),HL
        EX      DE,HL
        LD      BC,1101H
        DEC     HL
        RET


;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________


C785C:  PUSH    HL
        LD      B,A
        ADD     A,A
        ADD     A,B
        LD      L,A
        LD      H,00H
        LD      BC,TRPTBL+1
        ADD     HL,BC
        LD      (HL),E
        INC     HL
        LD      (HL),D
        POP     HL
        RET

;       Subroutine      KEY statement
;       Inputs          ________________________
;       Outputs         ________________________

C786C:  CP      93H                     ; LIST token ?
        JR      NZ,J78AE                ; nope, other KEY statement variant
        RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      HL,FNKSTR
        LD      C,0AH
J7877:  LD      B,10H
J7879:  LD      A,(HL)
        INC     HL
        CALL    CNVCHR
        JR      C,J7891
        DEC     B
        JR      Z,J789E
        LD      A,(HL)
        INC     HL
        LD      E,A
        CALL    CNVCHR
        JR      Z,J7891
        LD      A,1
        RST     OUTDO                   ; MSX to interpreter output
        LD      A,E
        JR      J789B

J7891:  CP      7FH
        JR      Z,J7899
        CP      20H
        JR      NC,J789B
J7899:  LD      A," "
J789B:  RST     OUTDO                   ; char to interpreter output
        DJNZ    J7879
J789E:  CALL    C7328                   ; newline to interpreter output
        DEC     C
        JR      NZ,J7877
        POP     HL
        RET

J78A6:  RST     CHRGTR                  ; get next BASIC character
        JP      DSPFNK

J78AA:  RST     CHRGTR                  ; get next BASIC character
        JP      ERAFNK

J78AE:  CP      "("
        JP      Z,J77D4                 ; KEY statement (trap)
        CP      95H                     ; ON token ?
        JR      Z,J78A6                 ; yep, enable display functionkeys
        CP      0EBH                    ; OFF token ?
        JR      Z,J78AA                 ; yep, disable display functionkeys
        CALL    C521C                   ; evaluate byte operand
        DEC     A
        CP      10                      ; functionkeynumber 1-10 ?
        JP      NC,C475A                ; nope, illegal function call
        EX      DE,HL
        LD      L,A
        LD      H,0
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL                   ; * 16
        LD      BC,FNKSTR
        ADD     HL,BC
        PUSH    HL
        EX      DE,HL
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C4C64                   ; evaluate expression
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        LD      B,(HL)
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        EX      (SP),HL
        LD      C,0FH
        LD      A,B
        AND     A
        JR      Z,J78F5
J78E8:  LD      A,(DE)
        AND     A
        JP      Z,C475A                 ; illegal function call
        LD      (HL),A
        INC     DE
        INC     HL
        DEC     C
        JR      Z,J78FA
        DJNZ    J78E8
J78F5:  LD      (HL),B
        INC     HL
        DEC     C
        JR      NZ,J78F5
J78FA:  LD      (HL),C
        CALL    FNKSB
        POP     HL
        RET

;       Subroutine      TIME function
;       Inputs          ________________________
;       Outputs         ________________________

J7900:  RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      HL,(JIFFY)
        CALL    C3236                   ; convert unsigned integer to single real
        POP     HL
        RET

;       Subroutine      CSRLIN function
;       Inputs          ________________________
;       Outputs         ________________________

J790A:  RST     CHRGTR                  ; get next BASIC character
        PUSH    HL
        LD      A,(CSRY)
        JR      J7932

;       Subroutine      TIME statement
;       Inputs          ________________________
;       Outputs         ________________________

C7911:  RST     SYNCHR
        DEFB    0EFH                    ; check for =
        CALL    C542F                   ; evaluate address operand
        LD      (JIFFY),DE
        RET

;       Subroutine      PLAY function
;       Inputs          ________________________
;       Outputs         ________________________

J791B:  RST     CHRGTR                  ; get next BASIC character
        LD      A,2+1                   ; max is 3
        CALL    C7C08                   ; evaluate parenthesized byte operand with a maximum
        PUSH    HL
        LD      A,(MUSICF)
        DEC     E
        JP      M,J7938
J7929:  RRCA
        DEC     E
        JP      P,J7929
        LD      A,00H
        JR      NC,J7933
J7932:  DEC     A
J7933:  CALL    C2E9A
        POP     HL
        RET

J7938:  AND     07H
        JR      Z,J7933
        LD      A,0FFH
        JR      J7933

;       Subroutine      STICK function
;       Inputs          ________________________
;       Outputs         ________________________


C7940:  CALL    C521F                   ; check for byte value
        CP      03H
        JR      NC,J7951
        CALL    GTSTCK
        JR      J7966

;       Subroutine      TRIG function
;       Inputs          ________________________
;       Outputs         ________________________

C794C:  CALL    C521F                   ; check for byte value
        CP      05H
J7951:  JP      NC,C475A                ; illegal function call
        CALL    GTTRIG
J7957:  JP      C2E9A

;       Subroutine      PDL function
;       Inputs          ________________________
;       Outputs         ________________________

C795A:  CALL    C521F                   ; check for byte value
        DEC     A
        CP      0CH
        JR      NC,J7951
        INC     A
        CALL    GTPDL
J7966:  JP      C4FCF                   ; byte to DAC

;       Subroutine      PAD function
;       Inputs          ________________________
;       Outputs         ________________________

C7969:  CALL    C521F                   ; check for byte value
        CP      8
        JR      NC,J7951
        PUSH    AF
        CALL    GTPAD
        LD      B,A
        POP     AF
        AND     03H                     ; ignore port bit
        DEC     A                       ; 0 and 3 are boolean
        CP      2
        LD      A,B
        JR      C,J7966
        JR      J7957           ; 0 or -1

;       Subroutine      COLOR statement
;       Inputs          ________________________
;       Outputs         ________________________

C7980:  ld      bc,C475A
        push    bc
        ld      de,(FORCLR)
        push    de
        cp      02CH
        jr      z,A799A
        call    C521C
        pop     de
        cp      010H
        ret     nc
        ld      e,a
        push    de
        dec     hl
        rst     CHRGTR
        jr      z,A79BC
A799A:  rst     SYNCHR
        db      ','
        jr      z,A79BC
        cp      02CH
        jr      z,A79AF
        call    C521C
        pop     de
        cp      010H
        ret     nc
        ld      d,a
        push    de
        dec     hl
        rst     CHRGTR
        jr      z,A79BC
A79AF:  rst     SYNCHR
        db      ','
        call    C521C
        pop     de
        cp      010H
        ret     nc
        ld      (BDRCLR),a
        push    de
A79BC:  pop     de
        pop     af
        push    hl
        ex      de,hl
        ld      (FORCLR),hl
        ld      a,l
        ld      (ATRBYT),a
        call    CHGCLR
        pop     hl
        ret

;       Subroutine      SCREEN statement
;       Inputs          ________________________
;       Outputs         ________________________

C79CC:  call    H.SCRE
        cp      02CH
        jr      z,A79EA
        call    C521C
        cp      004H
        jp      nc,C475A
        push    hl
        call    CHGMOD
        ld      a,(LINLEN)
        ld      e,a
        call    A5201
        pop     hl
        dec     hl
        rst     CHRGTR
        ret     z
A79EA:  rst     SYNCHR
        db      ','
        cp      02CH
        jr      z,A7A09
        call    C521C
        cp      004H
        jp      nc,C475A
        ld      a,(RG1SAV)
        and     0FCH
        or      e
        ld      (RG1SAV),a
        push    hl
        call    CLRSPR
        pop     hl
        dec     hl
        rst     CHRGTR
        ret     z
A7A09:  rst     SYNCHR
        db      ','
        cp      02CH
        jr      z,A7A18
        call    C521C
        ld      (CLIKSW),a
        dec     hl
        rst     CHRGTR
        ret     z
A7A18:  rst     SYNCHR
        db      ','
        cp      02CH
        jr      z,A7A24
        call    A7A2D
        dec     hl
        rst     CHRGTR
        ret     z
A7A24:  rst     SYNCHR
        db      ','
        call    C521C
        ld      (NTMSXP),a
        ret

A7A2D:  call    C521C
        dec     a
        cp      002H
        jp      nc,C475A
        push    hl
        ld      bc,5
        and     a
        ld      hl,CS1200
        jr      z,A7A41
        add     hl,bc
A7A41:  ld      de,LOW.
        ldir
        pop     hl
        ret

;       Subroutine      SPRITE statement
;       Inputs          ________________________
;       Outputs         ________________________

C7A48:  CP      "$"
        JP      NZ,J77AB
        LD      A,(SCRMOD)
        AND     A
        JP      Z,C475A                 ; illegal function call
        CALL    C7AA0
        PUSH    DE
        CALL    C4C5F                   ; evaluate = expression
        EX      (SP),HL
        PUSH    HL
        CALL    C67D0                   ; free temporary string with type check
        INC     HL
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        CALL    GSPSIZ
        LD      C,A
        LD      B,00H
        DEC     HL
        DEC     HL
        DEC     A
        CP      (HL)
        LD      A,(HL)
        JR      C,J7A7D
        POP     HL
        PUSH    HL
        PUSH    AF
        XOR     A
        CALL    FILVRM
        POP     AF
        AND     A
        LD      C,A
        LD      B,00H
J7A7D:  EX      DE,HL
        POP     DE
        CALL    NZ,LDIRVM
        POP     HL
        RET

;       Subroutine      SPRITE function
;       Inputs          ________________________
;       Outputs         ________________________

J7A84:  CALL    C7A9F
        PUSH    HL
        PUSH    DE
        CALL    GSPSIZ
        LD      C,A
        LD      B,00H
        PUSH    BC
        CALL    C6627                   ; allocate temporary string
        LD      HL,(DSCTMP+1)
        EX      DE,HL
        POP     BC
        POP     HL
        CALL    LDIRMV
        JP      J6654                   ; push temporary descriptor to temporary desciptor heap and quit

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C7A9F:  RST     CHRGTR                  ; get next BASIC character

;       Subroutine      __________________________
;       Inputs          ________________________
;       Outputs         ________________________

C7AA0:  RST     SYNCHR
        DEFB    "$"                     ; check for $
        LD      A,256-1                 ; max is 255
        CALL    C7C08                   ; evaluate parenthesized byte operand with a maximum
        PUSH    HL
        LD      A,E
        CALL    CALPAT
        EX      DE,HL
        POP     HL
        RET

;       Subroutine      PUT/GET SPRITE
;       Inputs          ________________________
;       Outputs         ________________________

J7AAF:  DEC     B                       ; PUT ?
        JP      M,C475A                 ; nope, illegal function call
        ld      a,(SCRMOD)
J7AB6:  AND     A
        JP      Z,C475A                 ; illegal function call
        RST     CHRGTR                  ; get next BASIC character
        CALL    C521C                   ; evaluate byte operand
        CP      32                      ; planenumber 0-31 ?
        JP      NC,C475A                ; nope, illegal function call
        PUSH    HL
        CALL    CALATR
        EX      (SP),HL
        RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      ","
        JR      Z,J7AF9
        CALL    C579C                   ; evaluate complex graphic coordinatepair
        EX      (SP),HL
        LD      A,E
        CALL    WRTVRM
        LD      A,B
        ADD     A,A
        LD      A,C
        LD      B,00H
        JR      NC,J7AE1
        ADD     A,20H
        LD      B,80H
J7AE1:  INC     HL
        CALL    WRTVRM
        INC     HL
        INC     HL
        CALL    RDVRM
        AND     0FH
        OR      B
        CALL    WRTVRM
        DEC     HL
        DEC     HL
        DEC     HL
        EX      (SP),HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        POP     BC
        RET     Z
        PUSH    BC
J7AF9:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CP      ","
        JR      Z,J7B1D
        CALL    C521C                   ; evaluate byte operand
        CP      16                      ; colornumber 0-15 ?
        JP      NC,C475A                ; nope, illegal function call
        EX      (SP),HL
        INC     HL
        INC     HL
        INC     HL
        CALL    RDVRM
        AND     80H
        OR      E
        CALL    WRTVRM
        DEC     HL
        DEC     HL
        DEC     HL
        EX      (SP),HL
        DEC     HL
        RST     CHRGTR                  ; get next BASIC character
        POP     BC
        RET     Z
        PUSH    BC
J7B1D:  RST     SYNCHR
        DEFB    ","                     ; check for ,
        CALL    C521C                   ; evaluate byte operand
        CALL    GSPSIZ
        LD      A,E
        JR      NC,J7B2F                ; 8x8 sprite, spritenumber ok
        CP      64                      ; 16x16 sprite, sprite number 0-63 ?
        JP      NC,C475A                ; nope, illegal function call
        ADD     A,A
        ADD     A,A                     ; *4 = spritenumber used by the VDP
J7B2F:  EX      (SP),HL
        INC     HL
        INC     HL
        CALL    WRTVRM
        POP     HL
        RET

;       Subroutine      VDP statement
;       Inputs          ________________________
;       Outputs         ________________________

C7B37:  ld      a,007H
        call    C7C08
        push    de
        rst     SYNCHR
        db      0EFH
        call    C521C
        pop     bc
        ld      b,a
        jp      WRTVDP

;       Subroutine      VDP function
;       Inputs          ________________________
;       Outputs         ________________________

J7B47:  rst     CHRGTR
        ld      a,008H
        call    C7C08
        push    hl
        ld      d,000H
        ld      hl,RG0SAV
        add     hl,de
        ld      a,(hl)
        call    C4FCF
        pop     hl
        ret

;       Subroutine      BASE statement
;       Inputs          ________________________
;       Outputs         ________________________

C7B5A:  ld      a,013H
        call    C7C08
        ld      d,000H
        push    de
        rst     SYNCHR
        db      0EFH
        call    C4C64                   ; eval expression
        ex      (sp),hl
        push    hl
        call    A7BFE
        ld      c,l
        ld      b,h
        pop     hl
        ld      a,l
        push    af
        add     hl,hl
        ex      de,hl
        ld      hl,T7BA3
        add     hl,de
        ld      a,c
        and     (hl)
        jr      nz,A7B7E
        inc     hl
        ld      a,b
        and     (hl)
A7B7E:  jp      nz,C475A
        ld      hl,TXTNAM
        add     hl,de
        ld      (hl),c
        inc     hl
        ld      (hl),b
        pop     af
        ld      e,0FFH
A7B8B:  inc     e
        sub     005H
        jr      nc,A7B8B
        ld      a,(SCRMOD)
        cp      e
        call    z,A7B99
        pop     hl
        ret

A7B99:  dec     a
        jp      m,SETTXT
        jp      z,SETGRP
        jp      SETMLT

T7BA3:  dw      003FFH
        dw      0003FH
        dw      007FFH
        dw      0007FH
        dw      007FFH
        dw      003FFH
        dw      0003FH
        dw      007FFH
        dw      0007FH
        dw      007FFH
        dw      003FFH
        dw      01FFFH
        dw      01FFFH
        dw      0007FH
        dw      007FFH
        dw      003FFH
        dw      0003FH
        dw      007FFH
        dw      0007FH
        dw      007FFH

;       Subroutine      BASE function
;       Inputs          ________________________
;       Outputs         ________________________

J7BCB:  rst     CHRGTR
        ld      a,013H
        call    C7C08
        push    hl
        ld      d,000H
        ld      hl,TXTNAM
        add     hl,de
        add     hl,de
A7BD9:  ld      a,(hl)
        inc     hl
        ld      h,(hl)
        ld      l,a
        call    C3236
        pop     hl
        ret

;       Subroutine      VPOKE statement
;       Inputs          ________________________
;       Outputs         ________________________

C7BE2:  call    C4C64                   ; eval expression
        push    hl
        call    A7BFE
        ex      (sp),hl
        rst     SYNCHR
        db      ','
        call    C521C
        ex      (sp),hl
        call    WRTVRM
        pop     hl
        ret

;       Subroutine      VPEEK function
;       Inputs          ________________________
;       Outputs         ________________________

C7BF5:  call    A7BFE
        call    RDVRM
        jp      C4FCF

A7BFE:  call    C2F8A
        ld      de,04000H
        rst     DCOMPR
        ret     c
        jr      J7C73

;       Subroutine      evaluate parenthesized byte operand with a maximum
;       Inputs          A = maximum
;       Outputs         A = value, E = value

C7C08:  PUSH    AF
        RST     SYNCHR
        DEFB    "("                     ; check for (
        CALL    C521C                   ; evaluate byte operand
        POP     AF
        CP      E
        JR      C,J7C73
        RST     SYNCHR
        DEFB    ")"                     ; check for )
        LD      A,E
        RET

;       Subroutine      DSKO$ statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C16:  CALL    H.DSKO
        JR      J7C73

;       Subroutine      SET statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C1B:  CALL    H.SETS
        JR      J7C73

;       Subroutine      NAME statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C20:  CALL    H.NAME
        JR      J7C73

;       Subroutine      KILL statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C25:  CALL    H.KILL
        JR      J7C73

;       Subroutine      IPL statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C2A:  CALL    H.IPL
        JR      J7C73

;       Subroutine      COPY statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C2F:  CALL    H.COPY
        JR      J7C73

;       Subroutine      CMD statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C34:  CALL    H.CMD
        JR      J7C73

;       Subroutine      DSKF function
;       Inputs          ________________________
;       Outputs         ________________________

C7C39:  CALL    H.DSKF
        JR      J7C73

;       Subroutine      DSKI$ function
;       Inputs          ________________________
;       Outputs         ________________________

J7C3E:  CALL    H.DSKI
        JR      J7C73

;       Subroutine      ATTR$ function
;       Inputs          ________________________
;       Outputs         ________________________

J7C43:  CALL    H.ATTR
        JR      J7C73

;       Subroutine      LSET statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C48:  CALL    H.LSET
        JR      J7C73

;       Subroutine      RSET statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C4D:  CALL    H.RSET
        JR      J7C73

;       Subroutine      FIELD statement
;       Inputs          ________________________
;       Outputs         ________________________

C7C52:  CALL    H.FIEL
        JR      J7C73

;       Subroutine      MKI$ function
;       Inputs          ________________________
;       Outputs         ________________________

C7C57:  CALL    H.MKI$
        JR      J7C73

;       Subroutine      MKS$ function
;       Inputs          ________________________
;       Outputs         ________________________

C7C5C:  CALL    H.MKS$
        JR      J7C73

;       Subroutine      MKD$ function
;       Inputs          ________________________
;       Outputs         ________________________

C7C61:  CALL    H.MKD$
        JR      J7C73

;       Subroutine      CVI function
;       Inputs          ________________________
;       Outputs         ________________________

C7C66:  CALL    H.CVI
        JR      J7C73

;       Subroutine      CVS function
;       Inputs          ________________________
;       Outputs         ________________________

C7C6B:  CALL    H.CVS
        JR      J7C73

;       Subroutine      CVD function
;       Inputs          ________________________
;       Outputs         ________________________

C7C70:  CALL    H.CVD
J7C73:  JP      C475A                   ; illegal function call

;       Subroutine      System initialization routine
;       Remark          RAM is invoked, EXPTBL and SLTTBL are initialized

C7C76:  LD      SP,VARWRK-10            ; temporary stack
        LD      BC,00230H-1
        LD      DE,H.KEYI+1
        LD      HL,H.KEYI
        LD      (HL),0C9H
        LDIR                            ; initialize hooks
        LD      HL,VARWRK
        LD      (HIMEM),HL              ; highest BASIC RAM address
        CALL    C7D5D                   ; search lowest BASIC RAM address
        LD      (BOTTOM),HL             ; save in BOTTOM
        LD      BC,00090H
        LD      DE,VARWRK
        LD      HL,I7F27
        LDIR                            ; initialize some systemvariables
        CALL    INIFNK                  ; initialize functionkeys
        XOR     A
        LD      (ENDBUF),A              ; endmarker for BUF
        LD      (NLONLY),A              ; not loading basic program, close i/o channels when requested
        LD      A,","
        LD      (BUFMIN),A              ; dummy prefix for BUF
        LD      A,":"
        LD      (KBFMIN),A              ; dummy prefix for KBUF
        LD      HL,(CGTABL)
        LD      (CGPNT+1),HL            ; address charactergenerator (but what about the slotid in CGPNT+0 ??)
        LD      HL,PRMSTK
        LD      (PRMPRV),HL             ; initialize previous FN block pointer
        LD      (STKTOP),HL             ; Z80 stack temporary at PRMSTK
        LD      BC,200
        ADD     HL,BC
        LD      (MEMSIZ),HL             ; a fake string heap of 200 bytes
        LD      A,1
        LD      (VARTAB+1),A            ; a fake simple variable start at 0100H
        CALL    C7E6B                   ; allocate 1 i/o channel (also reinitialize STKTOP, MEMSIZ)
        CALL    C62E5                   ; initialize stack
        LD      HL,(BOTTOM)
        XOR     A
        LD      (HL),A                  ; end of BASIC line token before BASIC text
        INC     HL
        LD      (TXTTAB),HL             ; start of BASIC text
        CALL    C6287                   ; clear BASIC program
        CALL    INITIO                  ; initialize I/O devices (PSG and LPT)
        call    INIT32                  ; screen 1
        call    CLRSPR                  ; clear sprites
        ld      hl,00A0BH
        ld      (CSRY),hl               ; cursor at 10,11
        ld      hl,T7ED8
        call    C6678                   ; print MSX system
        ld      hl,00A0CH
        ld      (CSRY),hl               ; cursor at 10,12
        ld      hl,T7EE4
        call    C6678                   ; print version 1.0
        ld      hl,0020EH
        ld      (CSRY),hl               ; cursor at 2,14
        ld      hl,T7EFD
        call    C6678                   ; print copyright 1983 by Microsoft
        ld      b,006H
A7D0D:  dec     hl
        ld      a,l
        or      h
        jr      nz,A7D0D
        djnz    A7D0D                   ; wait 3 seconds
J7D14:  CALL    C7D75                   ; do extension ROMs

; Entrypoint used by diskrom
; used when H.STKE was hooked by a extension ROM. BASIC programs in extension ROMs are NOT executed

J7D17:  LD      HL,(BOTTOM)
        XOR     A
        LD      (HL),A                  ; end of BASIC line before BASIC text
        INC     HL
        LD      (TXTTAB),HL
        CALL    C6287                   ; clear basic program
        CALL    C7D29                   ; display BASIC startscreen
        JP      J411F                   ; ok and mainloop

;       Subroutine      display BASIC startscreen
;       Inputs          ________________________
;       Outputs         ________________________

C7D29:
        ld      a,0FFH
        ld      (CNSDFG),a              ; KEY ON
M7D2E:
        IF      CNTRY EQ 0

        call    INIT32

        ELSE

        call    INITXT                  ; text mode

        ENDIF

J7D31:  ld      hl,T7EF2
        call    C6678
        ld      hl,T7EE4
        call    C6678
?7D3D:  LD      HL,T7EFD                ; copyright message
        CALL    C6678                   ; message to interpreter output
        LD      HL,(VARTAB)
        EX      DE,HL
        LD      HL,(STKTOP)
        LD      A,L
        SUB     E
        LD      L,A
        LD      A,H
        SBC     A,D
        LD      H,A
        LD      BC,-14
        ADD     HL,BC
        CALL    C3412                   ; number to interpreter output
        LD      HL,I7F1B
        JP      C6678                   ; message to interpreter output

;       Subroutine      search for start of ram 0EFFFH - 08000H area (downwards)
;       Inputs          ________________________
;       Outputs         ________________________

C7D5D:  LD      HL,0EF00H
J7D60:  LD      A,(HL)
        CPL
        LD      (HL),A
        CP      (HL)
        CPL
        LD      (HL),A
        JR      NZ,J7D71                ; no RAM, quit search
        INC     L
        JR      NZ,J7D60
        LD      A,H
        DEC     A
        RET     P
        LD      H,A
        JR      J7D60

J7D71:  LD      L,0
        INC     H
        RET

;       Subroutine      do extension ROMs
;       Inputs          ________________________
;       Outputs         ________________________

C7D75:  DI
        LD      C,0                     ; primairy slot
        LD      DE,EXPTBL
        LD      HL,SLTATR
J7D7E:  LD      A,(DE)
        OR      C
        LD      C,A
        PUSH    DE
J7D82:  INC     HL
        PUSH    HL
        LD      HL,04000H
J7D87:  CALL    C7E1A
        PUSH    HL
        LD      HL,04241H
        RST     DCOMPR
        POP     HL                      ; expansion ROM ?
        LD      B,0
        JR      NZ,J7DBE                ; nope, next slot
        CALL    C7E1A                   ; read INIT entry
        PUSH    HL
        PUSH    BC
        PUSH    DE
        POP     IX
        LD      A,C
        PUSH    AF
        POP     IY
        CALL    NZ,CALSLT               ; if extension ROM has INIT, call INIT
        POP     BC
        POP     HL
        CALL    C7E1A                   ; read STATEMENT entry
        ADD     A,0FFH
        RR      B
        CALL    C7E1A                   ; read DEVICE entry
        ADD     A,0FFH
        RR      B
        CALL    C7E1A                   ; read BAS entry
        ADD     A,0FFH
        RR      B
        LD      DE,-8
        ADD     HL,DE
J7DBE:  EX      (SP),HL
        LD      (HL),B                  ; adjust SLTATR
        INC     HL
        EX      (SP),HL
        LD      DE,04000H-2
        ADD     HL,DE                   ; next page
        LD      A,H
        CP      0C0H
        JR      C,J7D87                 ; we are doing only page 1 and 2
        POP     HL
        INC     HL
        LD      A,C
        AND     A
        LD      DE,000CH
        JP      P,J7DE0                 ; primary slot, next primary
        ADD     A,04H
        LD      C,A
        CP      90H
        JR      C,J7D82                 ; next secundair slot
        AND     03H
        LD      C,A
        DEFB    03EH                    ; skip next instruction
J7DE0:  ADD     HL,DE
        POP     DE
        INC     DE
        INC     C
        LD      A,C
        CP      04H
        JR      C,J7D7E                 ; next primary
        LD      HL,SLTATR
        LD      B,40H
J7DEE:  LD      A,(HL)
        ADD     A,A
        JR      C,J7DF6                 ; extension ROM has BAS entry, run it
        INC     HL
        DJNZ    J7DEE
        RET

;       Subroutine      start basic program in extension ROM
;       Inputs          ________________________
;       Outputs         ________________________

J7DF6:  CALL    C7E2A                   ; translate SLTATR loopvar to address and slotid
        CALL    ENASLT                  ; enable slot on page 2
        LD      HL,(VARTAB)
        LD      DE,0C000H
        RST     DCOMPR
        JR      NC,J7E09                ; VARTAB is already in page 3, leave it alone
        EX      DE,HL
        LD      (VARTAB),HL             ; VARTAB = 0C000H (otherwise VARTAB would point into ROM)
J7E09:  LD      HL,(08000H+8)
        INC     HL
        LD      (TXTTAB),HL             ; start of basiccode
        LD      A,H
        LD      (BASROM),A              ; flag execution of basic program in ROM (cannot be aborted)

; Entrypoint used by diskrom to start extension ROM with basic program

C7E14:  CALL    C629A                   ; initialize interpreter, basic pointer at start of program
        JP      C4601                   ; execute new statement

;       Subroutine      read word from extension ROM
;       Inputs          HL = address, C = slotid
;       Outputs         DE = word, Zx set if word is zero

C7E1A:  CALL    C7E1E                   ; read byte from extension ROM
        LD      E,D
C7E1E:  LD      A,C
        PUSH    BC
        PUSH    DE
        CALL    RDSLT
        POP     DE
        POP     BC
        LD      D,A
        OR      E
        INC     HL
        RET

;       Subroutine      translate SLTATR loopvar to address and slotid
;       Inputs          ________________________
;       Outputs         ________________________

C7E2A:  LD      A,64
        SUB     B

;       Subroutine      translate SLTATR entrynumber to address and slotid
;       Inputs          ________________________
;       Outputs         ________________________

C7E2D:  LD      B,A
        LD      H,0
        RRA
        RR      H
        RRA
        RR      H                       ; highbyte address in page
        RRA
        RRA
        AND     03H                     ; primairy slot
        LD      C,A
        LD      A,B
        LD      B,0
        PUSH    HL
        LD      HL,EXPTBL
        ADD     HL,BC
        AND     0CH                     ; secundairy slot
        OR      C                       ; + primairy slot
        LD      C,A
        LD      A,(HL)
        POP     HL
        OR      C                       ; + slot expanded flag
        RET

;       Subroutine      MAX statement
;       Inputs          ________________________
;       Outputs         ________________________

C7E4B:  RST     SYNCHR
        DEFB    0B7H
        RST     SYNCHR
        DEFB    0EFH                    ; check for FILES=
        CALL    C521C                   ; evaluate byte operand
        JP      NZ,J4055                ; not end of statement, syntax error
        CP      16                      ; number of i/o channels <16 ?
        JP      NC,C475A                ; nope, illegal function call
        LD      (TEMP),HL               ; save BASIC pointer in TEMP
        PUSH    AF
        CALL    C6C1C                   ; close all i/o channels
        POP     AF
        CALL    C7E6B                   ; allocate i/o channels
        CALL    C62A7                   ; initialize interpreter, BASIC pointer from TEMP
        JP      C4601                   ; execute new statement

;       Subroutine      allocate i/o channels
;       Inputs          A = number of user i/o channels
;       Outputs         ________________________

C7E6B:  PUSH    AF
        LD      HL,(HIMEM)
        LD      DE,-(256+9+2)
J7E72:  ADD     HL,DE
        DEC     A
        JP      P,J7E72
        EX      DE,HL                   ; calculate FILTAB address
        LD      HL,(STKTOP)
        LD      B,H
        LD      C,L
        LD      HL,(MEMSIZ)
        LD      A,L
        SUB     C
        LD      L,A
        LD      A,H
        SBC     A,B
        LD      H,A                     ; size of the string heap
        POP     AF
        PUSH    HL
        PUSH    AF
        LD      BC,140
        ADD     HL,BC
        LD      B,H
        LD      C,L                     ; size of the string heap +140
        LD      HL,(VARTAB)             ; start of the simple variables
        ADD     HL,BC                   ; + size
        RST     DCOMPR                  ; does this fit ?
        JP      NC,J6275                ; nope, out of memory
        POP     AF
        LD      (MAXFIL),A              ; set number of i/o channels (excluding i/o channel 0)
        LD      L,E
        LD      H,D
        LD      (FILTAB),HL             ; start of i/o channel pointers
        DEC     HL
        DEC     HL                      ; ?? why need a extra byte ??
        LD      (MEMSIZ),HL             ; start of the string heap
        POP     BC                      ; size of the string heap
        LD      A,L
        SUB     C
        LD      L,A
        LD      A,H
        SBC     A,B
        LD      H,A
        LD      (STKTOP),HL             ; start of Z80 stack, end of string heap
        DEC     HL
        DEC     HL
        POP     BC                      ; return address
        LD      SP,HL                   ; new stack with dummy word on stack
        PUSH    BC                      ; return address on stack
        LD      A,(MAXFIL)
        LD      L,A
        INC     L                       ; number of i/o channels
        LD      H,0
        ADD     HL,HL                   ; *2
        ADD     HL,DE
        EX      DE,HL
        PUSH    DE                      ; start of i/o channel buffers
        LD      BC,-2+256+9+2
J7EC2:  LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL                      ; pointer to i/o channel buffer
        EX      DE,HL
        LD      (HL),0                  ; i/o channel closed
        ADD     HL,BC                   ; to the next i/o channel buffer
        EX      DE,HL
        DEC     A
        JP      P,J7EC2                 ; next i/o channel
        POP     HL                      ; start of i/o channel buffer
        LD      BC,9
        ADD     HL,BC
        LD      (NULBUF),HL             ; pointer to the i/o channel 0 buffer
        RET

T7ED8:  DEFB    "MSX  system"
        DEFB    0

T7EE4:  DEFB    "version 1.0",13,10
        DEFB    0

T7EF2:  DEFB    "MSX BASIC "
        DEFB    0
T7EFD:  DEFB    "Copyright 1983 by Microsoft",13,10
        DEFB    0

I7F1B:  DEFB    " Bytes free"
        DEFB    0


; Initial Workarea variables


I7F27:

        .PHASE  VARWRK

RDPRIM: OUT     (0A8H),A
        LD      E,(HL)
        JR      J7F2F

WRPRIM: OUT     (0A8H),A
        LD      (HL),E
J7F2F:  LD      A,D
        OUT     (0A8H),A
        RET

CLPRIM: OUT     (0A8H),A
        EX      AF,AF'
        CALL    CLPRM1
        EX      AF,AF'
        POP     AF
        OUT     (0A8H),A
        EX      AF,AF'
        RET

CLPRM1:
        JP      (IX)

USRTAB: defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call
        defw    C475A                   ; illegal function call

LINL40:
        IF BASVER EQ 0
        defb    39
        ELSE
        defb    37
        ENDIF

LINL32: defb    29

LINLEN: defb    29

CRTCNT: defb    24

CLMLST: defb    14

TXTNAM: defw    0
TXTCOL: defw    0
TXTCGP: defw    00800H
TXTATR: defw    0
TXTPAT: defw    0

T32NAM: defw    01800H
T32COL: defw    02000H
T32CGP: defw    0
T32ATR: defw    01B00H
T32PAT: defw    03800H

GRPNAM: defw    01800H
GRPCOL: defw    02000H
GRPCGP: defw    0
GRPATR: defw    01B00H
GRPPAT: defw    03800H

MLTNAM: defw    00800H
MLTCOL: defw    0
MLTCGP: defw    0
MLTATR: defw    01B00H
MLTPAT: defw    03800H

CLIKSW: defb    1
CSRY:   defb    1
CSRX:   defb    1
CNSDFG: defb    0

RG0SAV: defb    000H
RG1SAV: defb    0E0H
RG2SAV: defb    000H
RG3SAV: defb    000H
RG4SAV: defb    000H
RG5SAV: defb    000H
RG6SAV: defb    000H
RG7SAV: defb    000H
STATFL: defb    000H
TRGFLG: defb    0FFH
FORCLR: defb    15
BAKCLR: defb    4

BDRCLR:
        IF BASVER EQ 0
        defb    7
        ELSE
        defb    4
        ENDIF

MAXUPD: jp      0
MINUPD: jp      0
ATRBYT: defb    15
QUEUES: defw    QUETAB
FRCNEW: defb    0FFH
SCNCNT: defb    1
REPCNT: defb    50
PUTPNT: defw    KEYBUF
GETPNT: defw    KEYBUF
CS1200: defb    053H,05CH,026H,02DH,00FH
CS2400: defb    025H,02DH,00EH,016H,01FH
        defb    053H,05CH
        defb    026H,02DH
        defb    00FH
ASPCT1: defw    00100H
ASPCT2: defw    00100H
ENDPRG: defb    ':'

        .DEPHASE


;       Bugfix          check for zero length devicenames (e.g. ":xxx" filenames)
;       Inputs          ________________________
;       Outputs         ________________________

        IF      NDEVFIX EQ 1

; bugfix for zero length devicename

C7FB7:  LD      DE,PROCNM
        AND     A
        RET     NZ
        INC     B                       ; use length 1 (name ":" is used)
        RET

        ENDIF

        IF      SLOTFIX EQ 1

M7FBE:  CALL    C7FCB
        LD      E,(HL)
        JR      J7FC8

M7FC4:  CALL    C7FCB
        LD      (HL),E
J7FC8:  LD      A,B
        JR      J7FD9

C7FCB:  RRCA
        RRCA
        AND     3
        LD      D,A
        LD      A,(D.FFFF)
        CPL
        LD      B,A
        AND     0FCH
        OR      D
        LD      D,A
J7FD9:  LD      (D.FFFF),A
        LD      A,E
        RET

        ENDIF

