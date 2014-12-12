#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=avr-gcc
CCC=avr-g++
CXX=avr-g++
FC=gfortran
AS=avr-as

# Macros
CND_PLATFORM=Arduino-Linux-x86
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/1701242807/EEPROM.o \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/src/hash/md5/md5.o \
	${OBJECTDIR}/src/hash/md5/md5_sbox.o \
	${OBJECTDIR}/src/hmac/hmac-md5/hmac-md5.o \
	${OBJECTDIR}/src/trivium/trivium.o


# C Compiler Flags
CFLAGS=-pedantic -std=c99 -Wstrict-prototypes -Os -Wall -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=100 -fpermissive

# CC Compiler Flags
CCFLAGS=-pedantic -std=c99 -Wstrict-prototypes -Os -Wall -fno-exceptions -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=100 -fpermissive
CXXFLAGS=-pedantic -std=c99 -Wstrict-prototypes -Os -Wall -fno-exceptions -ffunction-sections -fdata-sections -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=100 -fpermissive

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lm libarduino_corelib.a

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/arduino-des

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/arduino-des: libarduino_corelib.a

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/arduino-des: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	avr-gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/arduino-des ${OBJECTFILES} ${LDLIBSOPTIONS} -Os -Wl,--gc-sections -mmcu=atmega328p

${OBJECTDIR}/_ext/1701242807/EEPROM.o: /usr/share/arduino/libraries/EEPROM/EEPROM.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1701242807
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1701242807/EEPROM.o /usr/share/arduino/libraries/EEPROM/EEPROM.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/hash/md5/md5.o: src/hash/md5/md5.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hash/md5
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hash/md5/md5.o src/hash/md5/md5.cpp

${OBJECTDIR}/src/hash/md5/md5_sbox.o: src/hash/md5/md5_sbox.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hash/md5
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hash/md5/md5_sbox.o src/hash/md5/md5_sbox.cpp

${OBJECTDIR}/src/hmac/hmac-md5/hmac-md5.o: src/hmac/hmac-md5/hmac-md5.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hmac/hmac-md5
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hmac/hmac-md5/hmac-md5.o src/hmac/hmac-md5/hmac-md5.cpp

${OBJECTDIR}/src/trivium/trivium.o: src/trivium/trivium.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/trivium
	${RM} "$@.d"
	$(COMPILE.cc) -g -I/usr/share/arduino/hardware/arduino/cores/arduino -I/usr/share/arduino/libraries/EEPROM -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/trivium/trivium.o src/trivium/trivium.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/arduino-des

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
