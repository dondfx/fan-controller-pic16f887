#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c src/admin_functions.c src/blink_swing.c src/button_handler.c src/debug_support.c src/decoder_buffer.c src/delay_ms.c src/delay_off.c src/external_interrupt_conf.c src/io_definitions.c src/iocb_config.c src/ir_functions.c src/pwm_config.c src/timer0_conf.c src/timer1_conf.c src/timer2_config.c src/triac_control.c src/uart_conf.c src/uart_support.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.p1 ${OBJECTDIR}/src/admin_functions.p1 ${OBJECTDIR}/src/blink_swing.p1 ${OBJECTDIR}/src/button_handler.p1 ${OBJECTDIR}/src/debug_support.p1 ${OBJECTDIR}/src/decoder_buffer.p1 ${OBJECTDIR}/src/delay_ms.p1 ${OBJECTDIR}/src/delay_off.p1 ${OBJECTDIR}/src/external_interrupt_conf.p1 ${OBJECTDIR}/src/io_definitions.p1 ${OBJECTDIR}/src/iocb_config.p1 ${OBJECTDIR}/src/ir_functions.p1 ${OBJECTDIR}/src/pwm_config.p1 ${OBJECTDIR}/src/timer0_conf.p1 ${OBJECTDIR}/src/timer1_conf.p1 ${OBJECTDIR}/src/timer2_config.p1 ${OBJECTDIR}/src/triac_control.p1 ${OBJECTDIR}/src/uart_conf.p1 ${OBJECTDIR}/src/uart_support.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/main.p1.d ${OBJECTDIR}/src/admin_functions.p1.d ${OBJECTDIR}/src/blink_swing.p1.d ${OBJECTDIR}/src/button_handler.p1.d ${OBJECTDIR}/src/debug_support.p1.d ${OBJECTDIR}/src/decoder_buffer.p1.d ${OBJECTDIR}/src/delay_ms.p1.d ${OBJECTDIR}/src/delay_off.p1.d ${OBJECTDIR}/src/external_interrupt_conf.p1.d ${OBJECTDIR}/src/io_definitions.p1.d ${OBJECTDIR}/src/iocb_config.p1.d ${OBJECTDIR}/src/ir_functions.p1.d ${OBJECTDIR}/src/pwm_config.p1.d ${OBJECTDIR}/src/timer0_conf.p1.d ${OBJECTDIR}/src/timer1_conf.p1.d ${OBJECTDIR}/src/timer2_config.p1.d ${OBJECTDIR}/src/triac_control.p1.d ${OBJECTDIR}/src/uart_conf.p1.d ${OBJECTDIR}/src/uart_support.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.p1 ${OBJECTDIR}/src/admin_functions.p1 ${OBJECTDIR}/src/blink_swing.p1 ${OBJECTDIR}/src/button_handler.p1 ${OBJECTDIR}/src/debug_support.p1 ${OBJECTDIR}/src/decoder_buffer.p1 ${OBJECTDIR}/src/delay_ms.p1 ${OBJECTDIR}/src/delay_off.p1 ${OBJECTDIR}/src/external_interrupt_conf.p1 ${OBJECTDIR}/src/io_definitions.p1 ${OBJECTDIR}/src/iocb_config.p1 ${OBJECTDIR}/src/ir_functions.p1 ${OBJECTDIR}/src/pwm_config.p1 ${OBJECTDIR}/src/timer0_conf.p1 ${OBJECTDIR}/src/timer1_conf.p1 ${OBJECTDIR}/src/timer2_config.p1 ${OBJECTDIR}/src/triac_control.p1 ${OBJECTDIR}/src/uart_conf.p1 ${OBJECTDIR}/src/uart_support.p1

# Source Files
SOURCEFILES=main.c src/admin_functions.c src/blink_swing.c src/button_handler.c src/debug_support.c src/decoder_buffer.c src/delay_ms.c src/delay_off.c src/external_interrupt_conf.c src/io_definitions.c src/iocb_config.c src/ir_functions.c src/pwm_config.c src/timer0_conf.c src/timer1_conf.c src/timer2_config.c src/triac_control.c src/uart_conf.c src/uart_support.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F887
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/admin_functions.p1: src/admin_functions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/admin_functions.p1.d 
	@${RM} ${OBJECTDIR}/src/admin_functions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/admin_functions.p1 src/admin_functions.c 
	@-${MV} ${OBJECTDIR}/src/admin_functions.d ${OBJECTDIR}/src/admin_functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/admin_functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/blink_swing.p1: src/blink_swing.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/blink_swing.p1.d 
	@${RM} ${OBJECTDIR}/src/blink_swing.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/blink_swing.p1 src/blink_swing.c 
	@-${MV} ${OBJECTDIR}/src/blink_swing.d ${OBJECTDIR}/src/blink_swing.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/blink_swing.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/button_handler.p1: src/button_handler.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/button_handler.p1.d 
	@${RM} ${OBJECTDIR}/src/button_handler.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/button_handler.p1 src/button_handler.c 
	@-${MV} ${OBJECTDIR}/src/button_handler.d ${OBJECTDIR}/src/button_handler.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/button_handler.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/debug_support.p1: src/debug_support.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/debug_support.p1.d 
	@${RM} ${OBJECTDIR}/src/debug_support.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/debug_support.p1 src/debug_support.c 
	@-${MV} ${OBJECTDIR}/src/debug_support.d ${OBJECTDIR}/src/debug_support.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/debug_support.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/decoder_buffer.p1: src/decoder_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/decoder_buffer.p1.d 
	@${RM} ${OBJECTDIR}/src/decoder_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/decoder_buffer.p1 src/decoder_buffer.c 
	@-${MV} ${OBJECTDIR}/src/decoder_buffer.d ${OBJECTDIR}/src/decoder_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/decoder_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/delay_ms.p1: src/delay_ms.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/delay_ms.p1.d 
	@${RM} ${OBJECTDIR}/src/delay_ms.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/delay_ms.p1 src/delay_ms.c 
	@-${MV} ${OBJECTDIR}/src/delay_ms.d ${OBJECTDIR}/src/delay_ms.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/delay_ms.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/delay_off.p1: src/delay_off.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/delay_off.p1.d 
	@${RM} ${OBJECTDIR}/src/delay_off.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/delay_off.p1 src/delay_off.c 
	@-${MV} ${OBJECTDIR}/src/delay_off.d ${OBJECTDIR}/src/delay_off.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/delay_off.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/external_interrupt_conf.p1: src/external_interrupt_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/external_interrupt_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/external_interrupt_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/external_interrupt_conf.p1 src/external_interrupt_conf.c 
	@-${MV} ${OBJECTDIR}/src/external_interrupt_conf.d ${OBJECTDIR}/src/external_interrupt_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/external_interrupt_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io_definitions.p1: src/io_definitions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io_definitions.p1.d 
	@${RM} ${OBJECTDIR}/src/io_definitions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/io_definitions.p1 src/io_definitions.c 
	@-${MV} ${OBJECTDIR}/src/io_definitions.d ${OBJECTDIR}/src/io_definitions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io_definitions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/iocb_config.p1: src/iocb_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/iocb_config.p1.d 
	@${RM} ${OBJECTDIR}/src/iocb_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/iocb_config.p1 src/iocb_config.c 
	@-${MV} ${OBJECTDIR}/src/iocb_config.d ${OBJECTDIR}/src/iocb_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/iocb_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/ir_functions.p1: src/ir_functions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ir_functions.p1.d 
	@${RM} ${OBJECTDIR}/src/ir_functions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/ir_functions.p1 src/ir_functions.c 
	@-${MV} ${OBJECTDIR}/src/ir_functions.d ${OBJECTDIR}/src/ir_functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/ir_functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pwm_config.p1: src/pwm_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm_config.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/pwm_config.p1 src/pwm_config.c 
	@-${MV} ${OBJECTDIR}/src/pwm_config.d ${OBJECTDIR}/src/pwm_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer0_conf.p1: src/timer0_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer0_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/timer0_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer0_conf.p1 src/timer0_conf.c 
	@-${MV} ${OBJECTDIR}/src/timer0_conf.d ${OBJECTDIR}/src/timer0_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer0_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer1_conf.p1: src/timer1_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer1_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/timer1_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer1_conf.p1 src/timer1_conf.c 
	@-${MV} ${OBJECTDIR}/src/timer1_conf.d ${OBJECTDIR}/src/timer1_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer1_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer2_config.p1: src/timer2_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer2_config.p1.d 
	@${RM} ${OBJECTDIR}/src/timer2_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer2_config.p1 src/timer2_config.c 
	@-${MV} ${OBJECTDIR}/src/timer2_config.d ${OBJECTDIR}/src/timer2_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer2_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/triac_control.p1: src/triac_control.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/triac_control.p1.d 
	@${RM} ${OBJECTDIR}/src/triac_control.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/triac_control.p1 src/triac_control.c 
	@-${MV} ${OBJECTDIR}/src/triac_control.d ${OBJECTDIR}/src/triac_control.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/triac_control.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/uart_conf.p1: src/uart_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uart_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/uart_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/uart_conf.p1 src/uart_conf.c 
	@-${MV} ${OBJECTDIR}/src/uart_conf.d ${OBJECTDIR}/src/uart_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/uart_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/uart_support.p1: src/uart_support.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uart_support.p1.d 
	@${RM} ${OBJECTDIR}/src/uart_support.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/uart_support.p1 src/uart_support.c 
	@-${MV} ${OBJECTDIR}/src/uart_support.d ${OBJECTDIR}/src/uart_support.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/uart_support.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/main.p1 main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/admin_functions.p1: src/admin_functions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/admin_functions.p1.d 
	@${RM} ${OBJECTDIR}/src/admin_functions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/admin_functions.p1 src/admin_functions.c 
	@-${MV} ${OBJECTDIR}/src/admin_functions.d ${OBJECTDIR}/src/admin_functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/admin_functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/blink_swing.p1: src/blink_swing.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/blink_swing.p1.d 
	@${RM} ${OBJECTDIR}/src/blink_swing.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/blink_swing.p1 src/blink_swing.c 
	@-${MV} ${OBJECTDIR}/src/blink_swing.d ${OBJECTDIR}/src/blink_swing.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/blink_swing.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/button_handler.p1: src/button_handler.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/button_handler.p1.d 
	@${RM} ${OBJECTDIR}/src/button_handler.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/button_handler.p1 src/button_handler.c 
	@-${MV} ${OBJECTDIR}/src/button_handler.d ${OBJECTDIR}/src/button_handler.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/button_handler.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/debug_support.p1: src/debug_support.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/debug_support.p1.d 
	@${RM} ${OBJECTDIR}/src/debug_support.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/debug_support.p1 src/debug_support.c 
	@-${MV} ${OBJECTDIR}/src/debug_support.d ${OBJECTDIR}/src/debug_support.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/debug_support.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/decoder_buffer.p1: src/decoder_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/decoder_buffer.p1.d 
	@${RM} ${OBJECTDIR}/src/decoder_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/decoder_buffer.p1 src/decoder_buffer.c 
	@-${MV} ${OBJECTDIR}/src/decoder_buffer.d ${OBJECTDIR}/src/decoder_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/decoder_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/delay_ms.p1: src/delay_ms.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/delay_ms.p1.d 
	@${RM} ${OBJECTDIR}/src/delay_ms.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/delay_ms.p1 src/delay_ms.c 
	@-${MV} ${OBJECTDIR}/src/delay_ms.d ${OBJECTDIR}/src/delay_ms.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/delay_ms.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/delay_off.p1: src/delay_off.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/delay_off.p1.d 
	@${RM} ${OBJECTDIR}/src/delay_off.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/delay_off.p1 src/delay_off.c 
	@-${MV} ${OBJECTDIR}/src/delay_off.d ${OBJECTDIR}/src/delay_off.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/delay_off.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/external_interrupt_conf.p1: src/external_interrupt_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/external_interrupt_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/external_interrupt_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/external_interrupt_conf.p1 src/external_interrupt_conf.c 
	@-${MV} ${OBJECTDIR}/src/external_interrupt_conf.d ${OBJECTDIR}/src/external_interrupt_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/external_interrupt_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io_definitions.p1: src/io_definitions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io_definitions.p1.d 
	@${RM} ${OBJECTDIR}/src/io_definitions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/io_definitions.p1 src/io_definitions.c 
	@-${MV} ${OBJECTDIR}/src/io_definitions.d ${OBJECTDIR}/src/io_definitions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io_definitions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/iocb_config.p1: src/iocb_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/iocb_config.p1.d 
	@${RM} ${OBJECTDIR}/src/iocb_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/iocb_config.p1 src/iocb_config.c 
	@-${MV} ${OBJECTDIR}/src/iocb_config.d ${OBJECTDIR}/src/iocb_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/iocb_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/ir_functions.p1: src/ir_functions.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ir_functions.p1.d 
	@${RM} ${OBJECTDIR}/src/ir_functions.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/ir_functions.p1 src/ir_functions.c 
	@-${MV} ${OBJECTDIR}/src/ir_functions.d ${OBJECTDIR}/src/ir_functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/ir_functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pwm_config.p1: src/pwm_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm_config.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/pwm_config.p1 src/pwm_config.c 
	@-${MV} ${OBJECTDIR}/src/pwm_config.d ${OBJECTDIR}/src/pwm_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer0_conf.p1: src/timer0_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer0_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/timer0_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer0_conf.p1 src/timer0_conf.c 
	@-${MV} ${OBJECTDIR}/src/timer0_conf.d ${OBJECTDIR}/src/timer0_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer0_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer1_conf.p1: src/timer1_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer1_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/timer1_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer1_conf.p1 src/timer1_conf.c 
	@-${MV} ${OBJECTDIR}/src/timer1_conf.d ${OBJECTDIR}/src/timer1_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer1_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/timer2_config.p1: src/timer2_config.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/timer2_config.p1.d 
	@${RM} ${OBJECTDIR}/src/timer2_config.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/timer2_config.p1 src/timer2_config.c 
	@-${MV} ${OBJECTDIR}/src/timer2_config.d ${OBJECTDIR}/src/timer2_config.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/timer2_config.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/triac_control.p1: src/triac_control.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/triac_control.p1.d 
	@${RM} ${OBJECTDIR}/src/triac_control.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/triac_control.p1 src/triac_control.c 
	@-${MV} ${OBJECTDIR}/src/triac_control.d ${OBJECTDIR}/src/triac_control.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/triac_control.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/uart_conf.p1: src/uart_conf.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uart_conf.p1.d 
	@${RM} ${OBJECTDIR}/src/uart_conf.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/uart_conf.p1 src/uart_conf.c 
	@-${MV} ${OBJECTDIR}/src/uart_conf.d ${OBJECTDIR}/src/uart_conf.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/uart_conf.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/uart_support.p1: src/uart_support.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/uart_support.p1.d 
	@${RM} ${OBJECTDIR}/src/uart_support.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     -o ${OBJECTDIR}/src/uart_support.p1 src/uart_support.c 
	@-${MV} ${OBJECTDIR}/src/uart_support.d ${OBJECTDIR}/src/uart_support.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/uart_support.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"include" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-osccal -mno-resetbits -mno-save-resetbits -mno-download -mno-stackcall -mno-default-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/Fan_Controller.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
