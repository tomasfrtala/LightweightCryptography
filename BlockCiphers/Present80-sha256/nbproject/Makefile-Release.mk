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
	${OBJECTDIR}/src/hash/sha256/sha256.o \
	${OBJECTDIR}/src/hmac/hmac-sha256/hmac-sha256.o \
	${OBJECTDIR}/src/memxor/memxor.o \
	${OBJECTDIR}/src/present/present80.o \
	${OBJECTDIR}/src/present/present_common.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/present80-sha256

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/present80-sha256: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/present80-sha256 ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/1701242807/EEPROM.o: /usr/share/arduino/libraries/EEPROM/EEPROM.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/1701242807
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/1701242807/EEPROM.o /usr/share/arduino/libraries/EEPROM/EEPROM.cpp

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/hash/sha256/sha256.o: src/hash/sha256/sha256.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hash/sha256
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hash/sha256/sha256.o src/hash/sha256/sha256.cpp

${OBJECTDIR}/src/hmac/hmac-sha256/hmac-sha256.o: src/hmac/hmac-sha256/hmac-sha256.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/hmac/hmac-sha256
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/hmac/hmac-sha256/hmac-sha256.o src/hmac/hmac-sha256/hmac-sha256.cpp

${OBJECTDIR}/src/memxor/memxor.o: src/memxor/memxor.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/memxor
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/memxor/memxor.o src/memxor/memxor.cpp

${OBJECTDIR}/src/present/present80.o: src/present/present80.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/present
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/present/present80.o src/present/present80.cpp

${OBJECTDIR}/src/present/present_common.o: src/present/present_common.cpp 
	${MKDIR} -p ${OBJECTDIR}/src/present
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/present/present_common.o src/present/present_common.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/present80-sha256

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
