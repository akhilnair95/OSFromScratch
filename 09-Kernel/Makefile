# $@ = target file
# $< = first dependency
# $^ = all dependencies

all: run

kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o $@ -Ttext 0x1000 --oformat binary $^

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

kernel.o: kernel.c
	i386-elf-gcc -ffreestanding -c $< -o $@

bootsect.bin: bootsect.asm 
	nasm $< -f bin -o $@

os-image.bin: bootsect.bin kernel.bin
	cat $^  > $@

run: os-image.bin
	qemu-system-i386 -fda os-image.bin


kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

clean:
	rm -f *.bin *.o *.dis
