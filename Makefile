include makefile.conf

OBJECTS += main.o

# Source Rules 
%.o: %.S
	$(TOOLCHAIN)gcc $(CFLAGS) -c -o $@ %<

%.o: %.c
	$(TOOLCHAIN)gcc $(LFLAGS) $^ $(CFLAGS) -o $@

$(PROJECT).bin: $(PROJECT).elf
	$(TOOLCHAIN)objcopy -O binary %< $@

clean:
	rm -f *.bin *.map *.elf $(CPUDIR) output.txt *.o

