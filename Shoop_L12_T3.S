.code32
.comm ctrlWord, 4
.text
.globl asm_main
.type  asm_main, @function
.globl square_root_proc
.type  square_root_proc, @function

square_root_proc:
  pushl %EBP
  movl %ESP, %EBP
  movl 8(%EBP), %EAX
  FINIT
  pushl %eax
  FILD (%esp)
  FSTCW ctrlWord
  orw $0b110000000000, ctrlWord
  FLDCW ctrlWord
  FSQRT
  FISTP (%esp)
  popl %eax
  andw $0b001111111111, ctrlWord
  fldcw ctrlWord
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
