EUI64=$(shell sed -n -e "s/$(NUM): \(.*\)/\1/p" eui64.txt)
BL_DIR=osd-hardware/bootloaders/atmega-bonsai/

flash-1st-stage: clean
	@[ -n "$(NUM)" ] || { echo "\nNeed boardnumber\n"; exit 1; }
	@[ -n "$(EUI64)" ] || { echo "\nNUM $(NUM) not found in eui64.txt\n"; exit 1; }
	@echo "Using EUI64 ${EUI64}"
	# Always clean so we get the right mac
	make -C $(BL_DIR) EUI64_ADDRESS=$(EUI64) osd
	make -C $(BL_DIR) EUI64_ADDRESS=$(EUI64) osd_isp

# http://openocd.zylin.com/#/c/2790/
check:
	openocd -f merkurboard_atmega128.cfg

clean:
	-make -C $(BL_DIR) clean

.PHONY: flash-1st-stage check clean
