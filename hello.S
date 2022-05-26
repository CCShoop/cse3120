# file hello32_noc.S​

.code32​

.text​

.global mybegin​

mybegin:​

mov $4, %eax​

 mov $1, %ebx​

 mov $L_HW, %ecx​

 mov $13, %edx​

 int $0x80​

# 32 bit version​

 mov $1, %eax​

 mov $0, %ebx​

 int $0x80​

​

L_HW:​

.asciz "Hello World!\n"​

​

# as --32 hello32_noc.S -o hello32_noc.o ​

#  ld -e mybegin -m elf_i386 -o hello32_noc hello32_noc.o​