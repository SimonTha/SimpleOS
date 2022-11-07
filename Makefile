all: build/os_image.bin

build/os_image.bin : build/boot_sect.bin build/kernel.bin
	cat $^ > $@

build/kernel.bin : build/kernel_entry.o build/kernel.o
	/usr/local/i386elfgcc/bin/i386-elf-ld -o $@ -Ttext 0x1000 $^ --oformat binary

build/kernel.o : src/kernel/kernel.c
	gcc -m32 -ffreestanding -c $< -o $@

build/boot_sect.bin : src/boot/boot_sect.asm
	cd src/boot; \
		nasm boot_sect.asm -f bin -o ../../build/boot_sect.bin

build/kernel_entry.o : src/kernel/kernel_entry.asm
	nasm $< -f elf -o $@
