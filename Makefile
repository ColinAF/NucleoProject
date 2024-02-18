include makefile.conf

PROJECT = test

.PHONY: clean

DEFINES= -D__STARTUP_CLEAR_BSS -D__START=main

OBJECTS += main.o
OBJECTS += startup_ARMCM4.o

TOOLCHAIN=arm-none-eabi-

# Source Rules 
%.o: %.S
	$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ %<

%.o: %.c
	$(TOOLCHAIN)gcc $(LFLAGS) $^ $(CFLAGS) -o $@

$(PROJECT).bin: $(PROJECT).elf
	$(TOOLCHAIN)objcopy -O binary %< $@

clean:
	rm -f *.bin *.map *.elf $(CPUDIR) output.txt *.o

