;=====================================================================
; Hello World Program
;---------------------------------------------------------------------
; Runs on custom 6502 board
;---------------------------------------------------------------------
PORTB = $6000
PORTA = $6001
DDRB  = $6002     ; Data Direction Register B
DDRA  = $6003     ; Data Direction Register A
E     = %10000000 ; Enable display pin
RW    = %01000000 ; Read/Write pin
RS    = %00100000 ; Register Select pin

  .org $8000

reset:
  lda #%11111111  ; Set all port B pins on W65C22 to output
  sta DDRB
  lda #%11100000  ; Set top 3 pins on port A to output
  sta DDRA
  lda #%00111000  ; Set display to 8-bit mode; 2-line display; 5x8 font
  sta PORTB

  lda #0          ; Clear RS/RW/E bits
  sta PORTA
  lda #E          ; Set the enable bit to send the instruction
  sta PORTA
  lda #0
  sta PORTA

  lda #%00000001  ; Clear the display
  sta PORTB

  lda #0          ; Clear RS/RW/E bits
  sta PORTA
  lda #E          ; Set the enable bit to send the instruction
  sta PORTA
  lda #0
  sta PORTA

  lda #%00001110  ; Display on, Cursor on, Blink off
  sta PORTB

  lda #0          ; Clear RS/RW/E bits
  sta PORTA
  lda #E          ; Set the enable bit to send the instruction
  sta PORTA
  lda #0
  sta PORTA

  lda #%00000110  ; Increment and shift cursor; don't shift Display
  sta PORTB

  lda #0          ; Clear RS/RW/E bits
  sta PORTA
  lda #E          ; Set the enable bit to send the instruction
  sta PORTA
  lda #0
  sta PORTA

  lda #"H"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"e"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"l"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"l"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"o"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #","        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #" "        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"w"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"o"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"r"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"l"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"d"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

  lda #"!"        ; Load the character H
  sta PORTB
  lda #RS         ; Set the Register Select bit
  sta PORTA
  lda #(RS | E)   ; Set the E bit to send instruction
  sta PORTA
  LDA #RS         ; Clear E bit
  sta PORTA

loop:
  jmp loop

  .org $fffc
  .word reset
  .word $0000
