.code32
# .comm ctrlWord, 4
.text
.globl asm_main
.type  asm_main, @function
.globl square_root_proc
.type  square_root_proc, @function

square_root_proc:
  pushl %EBP
  movl %ESP, %EBP
  movl 8(%EBP), %EAX
  subl $4, %ESP
  FINIT
  pushl %eax
  FILD (%esp)
  LEA 4(%ESP), %EAX
  FSTCW (%EAX) # ctrlWord
  orw $0b110000000000, (%EAX) # ctrlWord
  FLDCW (%EAX) # ctrlWord
  FSQRT
  FISTP (%esp)
  andw $0b001111111111, (%EAX) # ctrlWord
  fldcw (%EAX) # ctrlWord
  popl %EAX
  ADDL $4, %ESP
  NOP
  NOP
  NOP
  pop %EBP
  ret

square_root_procs:
  xorl %ebx, %ebx
  movl %eax, %ecx
L1:
  movl %ebx, %eax
  mull %ebx
  cmp %eax, %ecx
  je Done
  incl %ebx
  jmp L1
Done:
  movl %ebx, %eax
  ret

asm_main:
  mov $4, %eax
  call square_root_proc
  mov %eax, %ebx # exit code
  mov $1, %eax # exit syscall
int $0x80
