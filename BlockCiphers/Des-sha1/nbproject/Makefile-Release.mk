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
	${OBJECTDIR}/src/des/des.o \
	${OBJECTDIR}/src/hash/sha1/sha1.o \
	${OBJECTDIR}/src/hmac/hmac-sha1/hmac-sha1.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/des-sha1

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/des-sha1: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/des-sha1 ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/1701242807/EEPROM.o: /usr/share/arduino/libraries/EEPROM/EEPROM.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1701242807
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1701242807/EEPROM.o /usr/share/arduino/libraries/EEPROM/EEPROM.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/des/des.o: src/des/des.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/des
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/des/des.o src/des/des.cpp

${OBJECTDIR}/src/hash/sha1/sha1.o: src/hash/sha1/sha1.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hash/sha1
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hash/sha1/sha1.o src/hash/sha1/sha1.cpp

${OBJECTDIR}/src/hmac/hmac-sha1/hmac-sha1.o: src/hmac/hmac-sha1/hmac-sha1.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hmac/hmac-sha1
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hmac/hmac-sha1/hmac-sha1.o src/hmac/hmac-sha1/hmac-sha1.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/des-sha1

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
