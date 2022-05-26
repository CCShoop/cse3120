.code32
.text
#;.globl main
#;.type  main, @function
.globl square_root_proc
.type  square_root_proc, @function
square_root_proc:
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
#;main:
#;  mov $4, %eax
#;  call square_root_proc
#;  mov %eax, %ebx # exit code
#;  mov $1, %eax # exit syscall
int $0x80
