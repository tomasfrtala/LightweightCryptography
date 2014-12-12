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
CND_CONF=Release
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
	${OBJECTDIR}/src/aes/aes192_dec.o \
	${OBJECTDIR}/src/aes/aes192_enc.o \
	${OBJECTDIR}/src/aes/aes_dec.o \
	${OBJECTDIR}/src/aes/aes_enc.o \
	${OBJECTDIR}/src/aes/aes_keyschedule.o \
	${OBJECTDIR}/src/aes/aes_sbox.o \
	${OBJECTDIR}/src/gf256mul/gf256mul.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aes192-none

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aes192-none: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aes192-none ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/1701242807/EEPROM.o: /usr/share/arduino/libraries/EEPROM/EEPROM.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1701242807
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1701242807/EEPROM.o /usr/share/arduino/libraries/EEPROM/EEPROM.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/aes/aes192_dec.o: src/aes/aes192_dec.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes192_dec.o src/aes/aes192_dec.cpp

${OBJECTDIR}/src/aes/aes192_enc.o: src/aes/aes192_enc.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes192_enc.o src/aes/aes192_enc.cpp

${OBJECTDIR}/src/aes/aes_dec.o: src/aes/aes_dec.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes_dec.o src/aes/aes_dec.cpp

${OBJECTDIR}/src/aes/aes_enc.o: src/aes/aes_enc.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes_enc.o src/aes/aes_enc.cpp

${OBJECTDIR}/src/aes/aes_keyschedule.o: src/aes/aes_keyschedule.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes_keyschedule.o src/aes/aes_keyschedule.cpp

${OBJECTDIR}/src/aes/aes_sbox.o: src/aes/aes_sbox.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/aes
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/aes/aes_sbox.o src/aes/aes_sbox.cpp

${OBJECTDIR}/src/gf256mul/gf256mul.o: src/gf256mul/gf256mul.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/gf256mul
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/gf256mul/gf256mul.o src/gf256mul/gf256mul.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aes192-none

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
