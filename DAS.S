.code32
.global _start
_start:
  mov $0x25, %al
  sub $0x27, %al
  call myDAS
  mov %eax, %ebx
  mov $1, %eax
  int $0x80
myDAS:
  # ... save/intialize registers
  pushw %cx
  pushw %bx
  pushf
  popw %cx
  mov %al, %bl
  I1:  # test condition AL low nibble
    andb $0x0f, %bl
    cmp $9, %bl
    ja T1
    test $0x10, %cl
    jz E1
  T1:  # on then condition 1
    subb $6, %al
    orb $0x10, %cl
    jmp I2
  E1:  # on else condition 1
    andb $0x0ef, %cl
  I2:  # test condition high nibble
    cmp $0x9F, %bl
    ja T2
    test $0x01, %cl
    jz E2
  T2:  # on then condition 2
    subb $0x60, %al
    orb $0x01, %cl
    jmp done
  E2:  # on else condition 2
    andb $0x0fe, %cl
  done:
    # ... restore al, flags and used registers
    pushw %cx
    popf
    popw %bx
    popw %cx
    ret
