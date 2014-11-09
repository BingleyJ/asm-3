title Homework #3 john bingley input to UPPERCASE
;LEA loads a pointer to the item you're addressing 
;whereas MOV loads the actual value at that address. 
;LEA proved very effective for this assignment
	.MODEL SMALL
	.386
	.stack 50h
        .DATA

                promptuser  DB  0DH,0AH, ' give me a string :  $'
                prompt2 DB  0DH,0AH, ' converted  :  $'
                tempstring DB  255 DUP(?)
          .CODE

main:
          MOV AX,@DATA
          MOV DS,AX

          LEA DX,promptuser
          MOV AH,09H
          INT 21H

          LEA SI,tempstring
          MOV AH,01H

iteratestring:
          INT 21H
          MOV BL,AL

          CMP AL,0DH
          JE  outputstring

          XOR AL,20H
          MOV [SI],AL
          INC SI

          JMP iteratestring
          
outputstring:

          MOV AL,'$'
          MOV [SI],AL

          LEA DX,prompt2
          MOV AH,09H
          INT 21H

          LEA DX,tempstring
          MOV AH,09H
          INT 21H
          .EXIT

END main 
