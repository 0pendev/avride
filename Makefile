PROGRAM=arduinofirmware
SRC=src/*
BUILD_DIR=build
CC=avr-gcc
OBJCOPY=avr-objcopy
AVR=atmega328p
FREQ=16000000
CFLAGS=-DF_CPU=$(FREQ) -mmcu=$(AVR) -Wall -Werror -Wextra -Os
PORT=/dev/ttyUSB0

all: upload

compile: ${BUILD_DIR}/*.o ${PROGRAM}.elf ${PROGRAM}.hex

${BUILD_DIR}/*.o:  $(SRC)
	mkdir -p ${BUILD_DIR}/
	${CC} ${CFLAGS} -c ${SRC}
	mv *.o ${BUILD_DIR}/

${BUILD_DIR}/${PROGRAM}.elf: ${BUILD_DIR}/*.o
	${CC} ${MMCU} $^ -o $@

${BUILD_DIR}/${PROGRAM}.hex: ${BUILD_DIR}/${PROGRAM}.elf
	${OBJCOPY} -O ihex -R .eeprom $< $@

upload: ${BUILD_DIR}/${PROGRAM}.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P ${PORT} -b 115200 -U flash:w:$<

clean:
	rm -rf ${BUILD_DIR}/*
