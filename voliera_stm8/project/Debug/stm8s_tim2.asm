;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module stm8s_tim2
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TimeBaseInit_PARM_2
	.globl _assert_failed
	.globl _TIM2_SelectOCxM_PARM_2
	.globl _TIM2_CCxCmd_PARM_2
	.globl _TIM2_PrescalerConfig_PARM_2
	.globl _TIM2_ITConfig_PARM_2
	.globl _TIM2_PWMIConfig_PARM_5
	.globl _TIM2_PWMIConfig_PARM_4
	.globl _TIM2_PWMIConfig_PARM_3
	.globl _TIM2_PWMIConfig_PARM_2
	.globl _TIM2_ICInit_PARM_5
	.globl _TIM2_ICInit_PARM_4
	.globl _TIM2_ICInit_PARM_3
	.globl _TIM2_ICInit_PARM_2
	.globl _TIM2_OC3Init_PARM_4
	.globl _TIM2_OC3Init_PARM_3
	.globl _TIM2_OC3Init_PARM_2
	.globl _TIM2_OC2Init_PARM_4
	.globl _TIM2_OC2Init_PARM_3
	.globl _TIM2_OC2Init_PARM_2
	.globl _TIM2_OC1Init_PARM_4
	.globl _TIM2_OC1Init_PARM_3
	.globl _TIM2_OC1Init_PARM_2
	.globl _TIM2_DeInit
	.globl _TIM2_TimeBaseInit
	.globl _TIM2_OC1Init
	.globl _TIM2_OC2Init
	.globl _TIM2_OC3Init
	.globl _TIM2_ICInit
	.globl _TIM2_PWMIConfig
	.globl _TIM2_Cmd
	.globl _TIM2_ITConfig
	.globl _TIM2_UpdateDisableConfig
	.globl _TIM2_UpdateRequestConfig
	.globl _TIM2_SelectOnePulseMode
	.globl _TIM2_PrescalerConfig
	.globl _TIM2_ForcedOC1Config
	.globl _TIM2_ForcedOC2Config
	.globl _TIM2_ForcedOC3Config
	.globl _TIM2_ARRPreloadConfig
	.globl _TIM2_OC1PreloadConfig
	.globl _TIM2_OC2PreloadConfig
	.globl _TIM2_OC3PreloadConfig
	.globl _TIM2_GenerateEvent
	.globl _TIM2_OC1PolarityConfig
	.globl _TIM2_OC2PolarityConfig
	.globl _TIM2_OC3PolarityConfig
	.globl _TIM2_CCxCmd
	.globl _TIM2_SelectOCxM
	.globl _TIM2_SetCounter
	.globl _TIM2_SetAutoreload
	.globl _TIM2_SetCompare1
	.globl _TIM2_SetCompare2
	.globl _TIM2_SetCompare3
	.globl _TIM2_SetIC1Prescaler
	.globl _TIM2_SetIC2Prescaler
	.globl _TIM2_SetIC3Prescaler
	.globl _TIM2_GetCapture1
	.globl _TIM2_GetCapture2
	.globl _TIM2_GetCapture3
	.globl _TIM2_GetCounter
	.globl _TIM2_GetPrescaler
	.globl _TIM2_GetFlagStatus
	.globl _TIM2_ClearFlag
	.globl _TIM2_GetITStatus
	.globl _TIM2_ClearITPendingBit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_TIM2_OC1Init_PARM_2:
	.ds 1
_TIM2_OC1Init_PARM_3:
	.ds 2
_TIM2_OC1Init_PARM_4:
	.ds 1
_TIM2_OC2Init_PARM_2:
	.ds 1
_TIM2_OC2Init_PARM_3:
	.ds 2
_TIM2_OC2Init_PARM_4:
	.ds 1
_TIM2_OC3Init_PARM_2:
	.ds 1
_TIM2_OC3Init_PARM_3:
	.ds 2
_TIM2_OC3Init_PARM_4:
	.ds 1
_TIM2_ICInit_PARM_2:
	.ds 1
_TIM2_ICInit_PARM_3:
	.ds 1
_TIM2_ICInit_PARM_4:
	.ds 1
_TIM2_ICInit_PARM_5:
	.ds 1
_TIM2_PWMIConfig_PARM_2:
	.ds 1
_TIM2_PWMIConfig_PARM_3:
	.ds 1
_TIM2_PWMIConfig_PARM_4:
	.ds 1
_TIM2_PWMIConfig_PARM_5:
	.ds 1
_TIM2_ITConfig_PARM_2:
	.ds 1
_TIM2_PrescalerConfig_PARM_2:
	.ds 1
_TIM2_CCxCmd_PARM_2:
	.ds 1
_TIM2_SelectOCxM_PARM_2:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_TIM2_TimeBaseInit_PARM_2:
	.ds 2
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_TI1_Config_PARM_2:
	.ds 1
_TI1_Config_PARM_3:
	.ds 1
	.area	OSEG    (OVR,DATA)
_TI2_Config_PARM_2:
	.ds 1
_TI2_Config_PARM_3:
	.ds 1
	.area	OSEG    (OVR,DATA)
_TI3_Config_PARM_2:
	.ds 1
_TI3_Config_PARM_3:
	.ds 1
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_TIM2_ICInit_sloc0_1_0:
	.ds 1
_TIM2_ITConfig_sloc0_1_0:
	.ds 1
_TIM2_ClearITPendingBit_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_DeInit'
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:52: void TIM2_DeInit(void)
;	-----------------------------------------
;	 function TIM2_DeInit
;	-----------------------------------------
_TIM2_DeInit:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	../../src/stm8s_tim2.c:54: TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
	mov	dptr,#0x5300
	clr	a
	mov	b,a
	lcall	__gptrput
;	../../src/stm8s_tim2.c:55: TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
	mov	dptr,#0x5303
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:56: TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
	mov	dptr,#0x5305
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:59: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:60: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:64: TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:65: TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:66: TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:67: TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:68: TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:69: TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
	mov	dptr,#0x530c
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:70: TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
	mov	dptr,#0x530d
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:71: TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
	mov	dptr,#0x530e
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:72: TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
	mov	dptr,#0x530f
	mov	b,#0x00
	dec	a
	lcall	__gptrput
;	../../src/stm8s_tim2.c:73: TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
	mov	dptr,#0x5310
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:74: TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
	mov	dptr,#0x5311
	clr	a
	mov	b,a
	lcall	__gptrput
;	../../src/stm8s_tim2.c:75: TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
	mov	dptr,#0x5312
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:76: TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
	mov	dptr,#0x5313
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:77: TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
	mov	dptr,#0x5314
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:78: TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
	mov	dptr,#0x5315
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:79: TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
	mov	dptr,#0x5316
	mov	b,#0x00
	lcall	__gptrput
;	../../src/stm8s_tim2.c:80: TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
	mov	dptr,#0x5304
	mov	b,#0x00
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_TimeBaseInit'
;------------------------------------------------------------
;TIM2_Period               Allocated with name '_TIM2_TimeBaseInit_PARM_2'
;TIM2_Prescaler            Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:89: void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
;	-----------------------------------------
;	 function TIM2_TimeBaseInit
;	-----------------------------------------
_TIM2_TimeBaseInit:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:93: TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
	mov	dptr,#0x530e
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:95: TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
	mov	r7,(_TIM2_TimeBaseInit_PARM_2 + 1)
	mov	dptr,#0x530f
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:96: TIM2->ARRL = (uint8_t)(TIM2_Period);
	mov	r7,_TIM2_TimeBaseInit_PARM_2
	mov	dptr,#0x5310
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC1Init'
;------------------------------------------------------------
;TIM2_OutputState          Allocated with name '_TIM2_OC1Init_PARM_2'
;TIM2_Pulse                Allocated with name '_TIM2_OC1Init_PARM_3'
;TIM2_OCPolarity           Allocated with name '_TIM2_OC1Init_PARM_4'
;TIM2_OCMode               Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:108: void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
;	-----------------------------------------
;	 function TIM2_OC1Init
;	-----------------------------------------
_TIM2_OC1Init:
;	../../src/stm8s_tim2.c:114: assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x10,00161$
	sjmp	00104$
00161$:
	cjne	r7,#0x20,00162$
	sjmp	00104$
00162$:
	cjne	r7,#0x30,00163$
	sjmp	00104$
00163$:
	cjne	r7,#0x60,00164$
	sjmp	00104$
00164$:
	cjne	r7,#0x70,00165$
	sjmp	00104$
00165$:
	mov	_assert_failed_PARM_2,#0x72
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:115: assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
	mov	a,_TIM2_OC1Init_PARM_2
	jz	00121$
	mov	a,#0x11
	cjne	a,_TIM2_OC1Init_PARM_2,00167$
	sjmp	00121$
00167$:
	mov	_assert_failed_PARM_2,#0x73
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00121$:
;	../../src/stm8s_tim2.c:116: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,_TIM2_OC1Init_PARM_4
	jz	00126$
	mov	a,#0x22
	cjne	a,_TIM2_OC1Init_PARM_4,00169$
	sjmp	00126$
00169$:
	mov	_assert_failed_PARM_2,#0x74
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00126$:
;	../../src/stm8s_tim2.c:119: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfc
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:121: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) |
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x01
	anl	a,_TIM2_OC1Init_PARM_2
	mov	r5,a
;	../../src/stm8s_tim2.c:122: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
	mov	a,#0x02
	anl	a,_TIM2_OC1Init_PARM_4
	orl	a,r5
	orl	ar6,a
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:125: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:129: TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
	mov	r7,(_TIM2_OC1Init_PARM_3 + 1)
	mov	dptr,#0x5311
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:130: TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
	mov	r7,_TIM2_OC1Init_PARM_3
	mov	dptr,#0x5312
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC2Init'
;------------------------------------------------------------
;TIM2_OutputState          Allocated with name '_TIM2_OC2Init_PARM_2'
;TIM2_Pulse                Allocated with name '_TIM2_OC2Init_PARM_3'
;TIM2_OCPolarity           Allocated with name '_TIM2_OC2Init_PARM_4'
;TIM2_OCMode               Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:142: void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
;	-----------------------------------------
;	 function TIM2_OC2Init
;	-----------------------------------------
_TIM2_OC2Init:
;	../../src/stm8s_tim2.c:148: assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x10,00161$
	sjmp	00104$
00161$:
	cjne	r7,#0x20,00162$
	sjmp	00104$
00162$:
	cjne	r7,#0x30,00163$
	sjmp	00104$
00163$:
	cjne	r7,#0x60,00164$
	sjmp	00104$
00164$:
	cjne	r7,#0x70,00165$
	sjmp	00104$
00165$:
	mov	_assert_failed_PARM_2,#0x94
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:149: assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
	mov	a,_TIM2_OC2Init_PARM_2
	jz	00121$
	mov	a,#0x11
	cjne	a,_TIM2_OC2Init_PARM_2,00167$
	sjmp	00121$
00167$:
	mov	_assert_failed_PARM_2,#0x95
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00121$:
;	../../src/stm8s_tim2.c:150: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,_TIM2_OC2Init_PARM_4
	jz	00126$
	mov	a,#0x22
	cjne	a,_TIM2_OC2Init_PARM_4,00169$
	sjmp	00126$
00169$:
	mov	_assert_failed_PARM_2,#0x96
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00126$:
;	../../src/stm8s_tim2.c:154: TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xcf
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:156: TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x10
	anl	a,_TIM2_OC2Init_PARM_2
	mov	r5,a
;	../../src/stm8s_tim2.c:157: (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
	mov	a,#0x20
	anl	a,_TIM2_OC2Init_PARM_4
	orl	a,r5
	orl	ar6,a
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:161: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) |
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:166: TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
	mov	r7,(_TIM2_OC2Init_PARM_3 + 1)
	mov	dptr,#0x5313
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:167: TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
	mov	r7,_TIM2_OC2Init_PARM_3
	mov	dptr,#0x5314
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC3Init'
;------------------------------------------------------------
;TIM2_OutputState          Allocated with name '_TIM2_OC3Init_PARM_2'
;TIM2_Pulse                Allocated with name '_TIM2_OC3Init_PARM_3'
;TIM2_OCPolarity           Allocated with name '_TIM2_OC3Init_PARM_4'
;TIM2_OCMode               Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:179: void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
;	-----------------------------------------
;	 function TIM2_OC3Init
;	-----------------------------------------
_TIM2_OC3Init:
;	../../src/stm8s_tim2.c:185: assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x10,00161$
	sjmp	00104$
00161$:
	cjne	r7,#0x20,00162$
	sjmp	00104$
00162$:
	cjne	r7,#0x30,00163$
	sjmp	00104$
00163$:
	cjne	r7,#0x60,00164$
	sjmp	00104$
00164$:
	cjne	r7,#0x70,00165$
	sjmp	00104$
00165$:
	mov	_assert_failed_PARM_2,#0xb9
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:186: assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
	mov	a,_TIM2_OC3Init_PARM_2
	jz	00121$
	mov	a,#0x11
	cjne	a,_TIM2_OC3Init_PARM_2,00167$
	sjmp	00121$
00167$:
	mov	_assert_failed_PARM_2,#0xba
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00121$:
;	../../src/stm8s_tim2.c:187: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,_TIM2_OC3Init_PARM_4
	jz	00126$
	mov	a,#0x22
	cjne	a,_TIM2_OC3Init_PARM_4,00169$
	sjmp	00126$
00169$:
	mov	_assert_failed_PARM_2,#0xbb
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00126$:
;	../../src/stm8s_tim2.c:189: TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfc
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:191: TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x01
	anl	a,_TIM2_OC3Init_PARM_2
	mov	r5,a
;	../../src/stm8s_tim2.c:192: (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
	mov	a,#0x02
	anl	a,_TIM2_OC3Init_PARM_4
	orl	a,r5
	orl	ar6,a
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:195: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:199: TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
	mov	r7,(_TIM2_OC3Init_PARM_3 + 1)
	mov	dptr,#0x5315
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:200: TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
	mov	r7,_TIM2_OC3Init_PARM_3
	mov	dptr,#0x5316
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ICInit'
;------------------------------------------------------------
;TIM2_ICPolarity           Allocated with name '_TIM2_ICInit_PARM_2'
;TIM2_ICSelection          Allocated with name '_TIM2_ICInit_PARM_3'
;TIM2_ICPrescaler          Allocated with name '_TIM2_ICInit_PARM_4'
;TIM2_ICFilter             Allocated with name '_TIM2_ICInit_PARM_5'
;TIM2_Channel              Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:212: void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
;	-----------------------------------------
;	 function TIM2_ICInit
;	-----------------------------------------
_TIM2_ICInit:
;	../../src/stm8s_tim2.c:219: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	mov	a,dpl
	mov	r7,a
	jz	00110$
	cjne	r7,#0x01,00189$
	sjmp	00110$
00189$:
	cjne	r7,#0x02,00190$
	sjmp	00110$
00190$:
	mov	_assert_failed_PARM_2,#0xdb
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00110$:
;	../../src/stm8s_tim2.c:220: assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
	mov	a,_TIM2_ICInit_PARM_2
	jz	00118$
	mov	a,#0x44
	cjne	a,_TIM2_ICInit_PARM_2,00192$
	sjmp	00118$
00192$:
	mov	_assert_failed_PARM_2,#0xdc
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00118$:
;	../../src/stm8s_tim2.c:221: assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
	mov	a,#0x01
	cjne	a,_TIM2_ICInit_PARM_3,00193$
	sjmp	00123$
00193$:
	mov	a,#0x02
	cjne	a,_TIM2_ICInit_PARM_3,00194$
	sjmp	00123$
00194$:
	mov	a,#0x03
	cjne	a,_TIM2_ICInit_PARM_3,00195$
	sjmp	00123$
00195$:
	mov	_assert_failed_PARM_2,#0xdd
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00123$:
;	../../src/stm8s_tim2.c:222: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
	mov	a,_TIM2_ICInit_PARM_4
	jz	00131$
	mov	a,#0x04
	cjne	a,_TIM2_ICInit_PARM_4,00197$
	sjmp	00131$
00197$:
	mov	a,#0x08
	cjne	a,_TIM2_ICInit_PARM_4,00198$
	sjmp	00131$
00198$:
	mov	a,#0x0c
	cjne	a,_TIM2_ICInit_PARM_4,00199$
	sjmp	00131$
00199$:
	mov	_assert_failed_PARM_2,#0xde
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00131$:
;	../../src/stm8s_tim2.c:223: assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
	mov	a,_TIM2_ICInit_PARM_5
	add	a,#0xff - 0x0f
	mov	_TIM2_ICInit_sloc0_1_0,c
	jnc	00142$
	mov	_assert_failed_PARM_2,#0xdf
	clr	a
	mov	(_assert_failed_PARM_2 + 1),a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00142$:
;	../../src/stm8s_tim2.c:225: if (TIM2_Channel == TIM2_CHANNEL_1)
	mov	a,r7
	jnz	00105$
;	../../src/stm8s_tim2.c:230: (uint8_t)TIM2_ICFilter);
	mov	_TI1_Config_PARM_2,_TIM2_ICInit_PARM_3
	mov	_TI1_Config_PARM_3,_TIM2_ICInit_PARM_5
	mov	dpl,_TIM2_ICInit_PARM_2
	lcall	_TI1_Config
;	../../src/stm8s_tim2.c:233: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_ICInit_PARM_4
	ljmp	_TIM2_SetIC1Prescaler
00105$:
;	../../src/stm8s_tim2.c:235: else if (TIM2_Channel == TIM2_CHANNEL_2)
	cjne	r7,#0x01,00102$
;	../../src/stm8s_tim2.c:240: (uint8_t)TIM2_ICFilter);
	mov	_TI2_Config_PARM_2,_TIM2_ICInit_PARM_3
	mov	_TI2_Config_PARM_3,_TIM2_ICInit_PARM_5
	mov	dpl,_TIM2_ICInit_PARM_2
	lcall	_TI2_Config
;	../../src/stm8s_tim2.c:243: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_ICInit_PARM_4
	ljmp	_TIM2_SetIC2Prescaler
00102$:
;	../../src/stm8s_tim2.c:250: (uint8_t)TIM2_ICFilter);
	mov	_TI3_Config_PARM_2,_TIM2_ICInit_PARM_3
	mov	_TI3_Config_PARM_3,_TIM2_ICInit_PARM_5
	mov	dpl,_TIM2_ICInit_PARM_2
	lcall	_TI3_Config
;	../../src/stm8s_tim2.c:253: TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_ICInit_PARM_4
	ljmp	_TIM2_SetIC3Prescaler
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_PWMIConfig'
;------------------------------------------------------------
;TIM2_ICPolarity           Allocated with name '_TIM2_PWMIConfig_PARM_2'
;TIM2_ICSelection          Allocated with name '_TIM2_PWMIConfig_PARM_3'
;TIM2_ICPrescaler          Allocated with name '_TIM2_PWMIConfig_PARM_4'
;TIM2_ICFilter             Allocated with name '_TIM2_PWMIConfig_PARM_5'
;TIM2_Channel              Allocated to registers r7 
;icpolarity                Allocated to registers r6 
;icselection               Allocated to registers r5 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:266: void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
;	-----------------------------------------
;	 function TIM2_PWMIConfig
;	-----------------------------------------
_TIM2_PWMIConfig:
;	../../src/stm8s_tim2.c:276: assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
	mov	a,dpl
	mov	r7,a
	jz	00113$
	cjne	r7,#0x01,00184$
	sjmp	00113$
00184$:
	mov	_assert_failed_PARM_2,#0x14
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00113$:
;	../../src/stm8s_tim2.c:277: assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
	mov	a,_TIM2_PWMIConfig_PARM_2
	jz	00118$
	mov	a,#0x44
	cjne	a,_TIM2_PWMIConfig_PARM_2,00186$
	sjmp	00118$
00186$:
	mov	_assert_failed_PARM_2,#0x15
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00118$:
;	../../src/stm8s_tim2.c:278: assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
	mov	a,#0x01
	cjne	a,_TIM2_PWMIConfig_PARM_3,00187$
	sjmp	00123$
00187$:
	mov	a,#0x02
	cjne	a,_TIM2_PWMIConfig_PARM_3,00188$
	sjmp	00123$
00188$:
	mov	a,#0x03
	cjne	a,_TIM2_PWMIConfig_PARM_3,00189$
	sjmp	00123$
00189$:
	mov	_assert_failed_PARM_2,#0x16
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00123$:
;	../../src/stm8s_tim2.c:279: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
	mov	a,_TIM2_PWMIConfig_PARM_4
	jz	00131$
	mov	a,#0x04
	cjne	a,_TIM2_PWMIConfig_PARM_4,00191$
	sjmp	00131$
00191$:
	mov	a,#0x08
	cjne	a,_TIM2_PWMIConfig_PARM_4,00192$
	sjmp	00131$
00192$:
	mov	a,#0x0c
	cjne	a,_TIM2_PWMIConfig_PARM_4,00193$
	sjmp	00131$
00193$:
	mov	_assert_failed_PARM_2,#0x17
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00131$:
;	../../src/stm8s_tim2.c:282: if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
	mov	a,#0x44
	cjne	a,_TIM2_PWMIConfig_PARM_2,00194$
	sjmp	00102$
00194$:
;	../../src/stm8s_tim2.c:284: icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
	mov	r6,#0x44
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:288: icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
	mov	r6,#0x00
00103$:
;	../../src/stm8s_tim2.c:292: if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
	mov	a,#0x01
	cjne	a,_TIM2_PWMIConfig_PARM_3,00105$
;	../../src/stm8s_tim2.c:294: icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
	mov	r5,#0x02
	sjmp	00106$
00105$:
;	../../src/stm8s_tim2.c:298: icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
	mov	r5,#0x01
00106$:
;	../../src/stm8s_tim2.c:301: if (TIM2_Channel == TIM2_CHANNEL_1)
	mov	a,r7
	jnz	00108$
;	../../src/stm8s_tim2.c:305: (uint8_t)TIM2_ICFilter);
	mov	_TI1_Config_PARM_2,_TIM2_PWMIConfig_PARM_3
	mov	_TI1_Config_PARM_3,_TIM2_PWMIConfig_PARM_5
	mov	dpl,_TIM2_PWMIConfig_PARM_2
	push	ar6
	push	ar5
	lcall	_TI1_Config
;	../../src/stm8s_tim2.c:308: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_PWMIConfig_PARM_4
	lcall	_TIM2_SetIC1Prescaler
	pop	ar5
	pop	ar6
;	../../src/stm8s_tim2.c:311: TI2_Config(icpolarity, icselection, TIM2_ICFilter);
	mov	_TI2_Config_PARM_2,r5
	mov	_TI2_Config_PARM_3,_TIM2_PWMIConfig_PARM_5
	mov	dpl,r6
	lcall	_TI2_Config
;	../../src/stm8s_tim2.c:314: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_PWMIConfig_PARM_4
	ljmp	_TIM2_SetIC2Prescaler
00108$:
;	../../src/stm8s_tim2.c:320: (uint8_t)TIM2_ICFilter);
	mov	_TI2_Config_PARM_2,_TIM2_PWMIConfig_PARM_3
	mov	_TI2_Config_PARM_3,_TIM2_PWMIConfig_PARM_5
	mov	dpl,_TIM2_PWMIConfig_PARM_2
	push	ar6
	push	ar5
	lcall	_TI2_Config
;	../../src/stm8s_tim2.c:323: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_PWMIConfig_PARM_4
	lcall	_TIM2_SetIC2Prescaler
	pop	ar5
	pop	ar6
;	../../src/stm8s_tim2.c:326: TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
	mov	_TI1_Config_PARM_2,r5
	mov	_TI1_Config_PARM_3,_TIM2_PWMIConfig_PARM_5
	mov	dpl,r6
	lcall	_TI1_Config
;	../../src/stm8s_tim2.c:329: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	mov	dpl,_TIM2_PWMIConfig_PARM_4
	ljmp	_TIM2_SetIC1Prescaler
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_Cmd'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:339: void TIM2_Cmd(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_Cmd
;	-----------------------------------------
_TIM2_Cmd:
;	../../src/stm8s_tim2.c:342: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x56
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:345: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:347: TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x01
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:351: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfe
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ITConfig'
;------------------------------------------------------------
;NewState                  Allocated with name '_TIM2_ITConfig_PARM_2'
;TIM2_IT                   Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:368: void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_ITConfig
;	-----------------------------------------
_TIM2_ITConfig:
;	../../src/stm8s_tim2.c:371: assert_param(IS_TIM2_IT_OK(TIM2_IT));
	mov	a,dpl
	mov	r7,a
	jz	00106$
	mov	a,r7
	add	a,#0xff - 0x0f
	mov	_TIM2_ITConfig_sloc0_1_0,c
	jnc	00107$
00106$:
	mov	_assert_failed_PARM_2,#0x73
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:372: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,_TIM2_ITConfig_PARM_2
	jz	00112$
	mov	a,#0x01
	cjne	a,_TIM2_ITConfig_PARM_2,00131$
	sjmp	00112$
00131$:
	mov	_assert_failed_PARM_2,#0x74
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00112$:
;	../../src/stm8s_tim2.c:374: if (NewState != DISABLE)
	mov	a,_TIM2_ITConfig_PARM_2
	jz	00102$
;	../../src/stm8s_tim2.c:377: TIM2->IER |= (uint8_t)TIM2_IT;
	mov	dptr,#0x5303
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,r7
	orl	ar6,a
	mov	dptr,#0x5303
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:382: TIM2->IER &= (uint8_t)(~TIM2_IT);
	mov	dptr,#0x5303
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,r7
	cpl	a
	anl	ar6,a
	mov	dptr,#0x5303
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_UpdateDisableConfig'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:392: void TIM2_UpdateDisableConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_UpdateDisableConfig
;	-----------------------------------------
_TIM2_UpdateDisableConfig:
;	../../src/stm8s_tim2.c:395: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x8b
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:398: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:400: TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x02
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:404: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfd
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_UpdateRequestConfig'
;------------------------------------------------------------
;TIM2_UpdateSource         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:416: void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
;	-----------------------------------------
;	 function TIM2_UpdateRequestConfig
;	-----------------------------------------
_TIM2_UpdateRequestConfig:
;	../../src/stm8s_tim2.c:419: assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0xa3
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:422: if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:424: TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x04
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:428: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfb
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SelectOnePulseMode'
;------------------------------------------------------------
;TIM2_OPMode               Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:440: void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
;	-----------------------------------------
;	 function TIM2_SelectOnePulseMode
;	-----------------------------------------
_TIM2_SelectOnePulseMode:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:443: assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
	cjne	r7,#0x01,00120$
	sjmp	00107$
00120$:
	mov	a,r7
	jz	00107$
	mov	_assert_failed_PARM_2,#0xbb
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:446: if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:448: TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x08
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:452: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xf7
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_PrescalerConfig'
;------------------------------------------------------------
;TIM2_PSCReloadMode        Allocated with name '_TIM2_PrescalerConfig_PARM_2'
;Prescaler                 Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:484: void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
;	-----------------------------------------
;	 function TIM2_PrescalerConfig
;	-----------------------------------------
_TIM2_PrescalerConfig:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:488: assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
	mov	a,_TIM2_PrescalerConfig_PARM_2
	jz	00104$
	mov	a,#0x01
	cjne	a,_TIM2_PrescalerConfig_PARM_2,00210$
	sjmp	00104$
00210$:
	mov	_assert_failed_PARM_2,#0xe8
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:489: assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
	mov	a,r7
	jz	00109$
	cjne	r7,#0x01,00212$
	sjmp	00109$
00212$:
	cjne	r7,#0x02,00213$
	sjmp	00109$
00213$:
	cjne	r7,#0x03,00214$
	sjmp	00109$
00214$:
	cjne	r7,#0x04,00215$
	sjmp	00109$
00215$:
	cjne	r7,#0x05,00216$
	sjmp	00109$
00216$:
	cjne	r7,#0x06,00217$
	sjmp	00109$
00217$:
	cjne	r7,#0x07,00218$
	sjmp	00109$
00218$:
	cjne	r7,#0x08,00219$
	sjmp	00109$
00219$:
	cjne	r7,#0x09,00220$
	sjmp	00109$
00220$:
	cjne	r7,#0x0a,00221$
	sjmp	00109$
00221$:
	cjne	r7,#0x0b,00222$
	sjmp	00109$
00222$:
	cjne	r7,#0x0c,00223$
	sjmp	00109$
00223$:
	cjne	r7,#0x0d,00224$
	sjmp	00109$
00224$:
	cjne	r7,#0x0e,00225$
	sjmp	00109$
00225$:
	cjne	r7,#0x0f,00226$
	sjmp	00109$
00226$:
	mov	_assert_failed_PARM_2,#0xe9
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00109$:
;	../../src/stm8s_tim2.c:492: TIM2->PSCR = (uint8_t)Prescaler;
	mov	dptr,#0x530e
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:495: TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
	mov	dptr,#0x5306
	mov	b,#0x00
	mov	a,_TIM2_PrescalerConfig_PARM_2
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ForcedOC1Config'
;------------------------------------------------------------
;TIM2_ForcedAction         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:507: void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
;	-----------------------------------------
;	 function TIM2_ForcedOC1Config
;	-----------------------------------------
_TIM2_ForcedOC1Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:510: assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
	cjne	r7,#0x50,00114$
	sjmp	00104$
00114$:
	cjne	r7,#0x40,00115$
	sjmp	00104$
00115$:
	mov	_assert_failed_PARM_2,#0xfe
	mov	(_assert_failed_PARM_2 + 1),#0x01
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:513: TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ForcedOC2Config'
;------------------------------------------------------------
;TIM2_ForcedAction         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:526: void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
;	-----------------------------------------
;	 function TIM2_ForcedOC2Config
;	-----------------------------------------
_TIM2_ForcedOC2Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:529: assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
	cjne	r7,#0x50,00114$
	sjmp	00104$
00114$:
	cjne	r7,#0x40,00115$
	sjmp	00104$
00115$:
	mov	_assert_failed_PARM_2,#0x11
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:532: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ForcedOC3Config'
;------------------------------------------------------------
;TIM2_ForcedAction         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:545: void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
;	-----------------------------------------
;	 function TIM2_ForcedOC3Config
;	-----------------------------------------
_TIM2_ForcedOC3Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:548: assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
	cjne	r7,#0x50,00114$
	sjmp	00104$
00114$:
	cjne	r7,#0x40,00115$
	sjmp	00104$
00115$:
	mov	_assert_failed_PARM_2,#0x24
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:551: TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ARRPreloadConfig'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:561: void TIM2_ARRPreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_ARRPreloadConfig
;	-----------------------------------------
_TIM2_ARRPreloadConfig:
;	../../src/stm8s_tim2.c:564: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x34
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:567: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:569: TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x80
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:573: TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
	mov	dptr,#0x5300
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0x7f
	mov	dptr,#0x5300
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC1PreloadConfig'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:583: void TIM2_OC1PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_OC1PreloadConfig
;	-----------------------------------------
_TIM2_OC1PreloadConfig:
;	../../src/stm8s_tim2.c:586: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x4a
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:589: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:591: TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x08
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:595: TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xf7
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC2PreloadConfig'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:605: void TIM2_OC2PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_OC2PreloadConfig
;	-----------------------------------------
_TIM2_OC2PreloadConfig:
;	../../src/stm8s_tim2.c:608: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x60
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:611: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:613: TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x08
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:617: TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xf7
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC3PreloadConfig'
;------------------------------------------------------------
;NewState                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:627: void TIM2_OC3PreloadConfig(FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_OC3PreloadConfig
;	-----------------------------------------
_TIM2_OC3PreloadConfig:
;	../../src/stm8s_tim2.c:630: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x01,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0x76
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:633: if (NewState != DISABLE)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:635: TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x08
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:639: TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xf7
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GenerateEvent'
;------------------------------------------------------------
;TIM2_EventSource          Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:653: void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
;	-----------------------------------------
;	 function TIM2_GenerateEvent
;	-----------------------------------------
_TIM2_GenerateEvent:
;	../../src/stm8s_tim2.c:656: assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
	mov	a,dpl
	mov	r7,a
	jnz	00104$
	mov	_assert_failed_PARM_2,#0x90
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:659: TIM2->EGR = (uint8_t)TIM2_EventSource;
	mov	dptr,#0x5306
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC1PolarityConfig'
;------------------------------------------------------------
;TIM2_OCPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:670: void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
;	-----------------------------------------
;	 function TIM2_OC1PolarityConfig
;	-----------------------------------------
_TIM2_OC1PolarityConfig:
;	../../src/stm8s_tim2.c:673: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x22,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0xa1
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:676: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:678: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x02
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:682: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfd
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC2PolarityConfig'
;------------------------------------------------------------
;TIM2_OCPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:694: void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
;	-----------------------------------------
;	 function TIM2_OC2PolarityConfig
;	-----------------------------------------
_TIM2_OC2PolarityConfig:
;	../../src/stm8s_tim2.c:697: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x22,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0xb9
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:700: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:702: TIM2->CCER1 |= TIM2_CCER1_CC2P;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x20
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:706: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xdf
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_OC3PolarityConfig'
;------------------------------------------------------------
;TIM2_OCPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:718: void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
;	-----------------------------------------
;	 function TIM2_OC3PolarityConfig
;	-----------------------------------------
_TIM2_OC3PolarityConfig:
;	../../src/stm8s_tim2.c:721: assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
	mov	a,dpl
	mov	r7,a
	jz	00107$
	cjne	r7,#0x22,00121$
	sjmp	00107$
00121$:
	mov	_assert_failed_PARM_2,#0xd1
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:724: if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:726: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x02
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:730: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfd
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_CCxCmd'
;------------------------------------------------------------
;NewState                  Allocated with name '_TIM2_CCxCmd_PARM_2'
;TIM2_Channel              Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:745: void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function TIM2_CCxCmd
;	-----------------------------------------
_TIM2_CCxCmd:
;	../../src/stm8s_tim2.c:748: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	mov	a,dpl
	mov	r7,a
	jz	00119$
	cjne	r7,#0x01,00162$
	sjmp	00119$
00162$:
	cjne	r7,#0x02,00163$
	sjmp	00119$
00163$:
	mov	_assert_failed_PARM_2,#0xec
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00119$:
;	../../src/stm8s_tim2.c:749: assert_param(IS_FUNCTIONALSTATE_OK(NewState));
	mov	a,_TIM2_CCxCmd_PARM_2
	jz	00127$
	mov	a,#0x01
	cjne	a,_TIM2_CCxCmd_PARM_2,00165$
	sjmp	00127$
00165$:
	mov	_assert_failed_PARM_2,#0xed
	mov	(_assert_failed_PARM_2 + 1),#0x02
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00127$:
;	../../src/stm8s_tim2.c:751: if (TIM2_Channel == TIM2_CHANNEL_1)
	mov	a,r7
	jnz	00114$
;	../../src/stm8s_tim2.c:754: if (NewState != DISABLE)
	mov	a,_TIM2_CCxCmd_PARM_2
	jz	00102$
;	../../src/stm8s_tim2.c:756: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	orl	ar6,#0x01
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:760: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfe
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
00114$:
;	../../src/stm8s_tim2.c:764: else if (TIM2_Channel == TIM2_CHANNEL_2)
	cjne	r7,#0x01,00111$
;	../../src/stm8s_tim2.c:767: if (NewState != DISABLE)
	mov	a,_TIM2_CCxCmd_PARM_2
	jz	00105$
;	../../src/stm8s_tim2.c:769: TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x10
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00105$:
;	../../src/stm8s_tim2.c:773: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xef
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00111$:
;	../../src/stm8s_tim2.c:779: if (NewState != DISABLE)
	mov	a,_TIM2_CCxCmd_PARM_2
	jz	00108$
;	../../src/stm8s_tim2.c:781: TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x01
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00108$:
;	../../src/stm8s_tim2.c:785: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfe
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SelectOCxM'
;------------------------------------------------------------
;TIM2_OCMode               Allocated with name '_TIM2_SelectOCxM_PARM_2'
;TIM2_Channel              Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:810: void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
;	-----------------------------------------
;	 function TIM2_SelectOCxM
;	-----------------------------------------
_TIM2_SelectOCxM:
;	../../src/stm8s_tim2.c:813: assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
	mov	a,dpl
	mov	r7,a
	jz	00110$
	cjne	r7,#0x01,00180$
	sjmp	00110$
00180$:
	cjne	r7,#0x02,00181$
	sjmp	00110$
00181$:
	mov	_assert_failed_PARM_2,#0x2d
	mov	(_assert_failed_PARM_2 + 1),#0x03
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00110$:
;	../../src/stm8s_tim2.c:814: assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
	mov	a,_TIM2_SelectOCxM_PARM_2
	jz	00118$
	mov	a,#0x10
	cjne	a,_TIM2_SelectOCxM_PARM_2,00183$
	sjmp	00118$
00183$:
	mov	a,#0x20
	cjne	a,_TIM2_SelectOCxM_PARM_2,00184$
	sjmp	00118$
00184$:
	mov	a,#0x30
	cjne	a,_TIM2_SelectOCxM_PARM_2,00185$
	sjmp	00118$
00185$:
	mov	a,#0x60
	cjne	a,_TIM2_SelectOCxM_PARM_2,00186$
	sjmp	00118$
00186$:
	mov	a,#0x70
	cjne	a,_TIM2_SelectOCxM_PARM_2,00187$
	sjmp	00118$
00187$:
	mov	a,#0x50
	cjne	a,_TIM2_SelectOCxM_PARM_2,00188$
	sjmp	00118$
00188$:
	mov	a,#0x40
	cjne	a,_TIM2_SelectOCxM_PARM_2,00189$
	sjmp	00118$
00189$:
	mov	_assert_failed_PARM_2,#0x2e
	mov	(_assert_failed_PARM_2 + 1),#0x03
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00118$:
;	../../src/stm8s_tim2.c:816: if (TIM2_Channel == TIM2_CHANNEL_1)
	mov	a,r7
;	../../src/stm8s_tim2.c:819: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	jnz	00105$
	mov	dptr,#0x530a
	mov	b,a
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfe
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:822: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0x8f
	anl	a,r6
	orl	a,_TIM2_SelectOCxM_PARM_2
	mov	r6,a
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
00105$:
;	../../src/stm8s_tim2.c:825: else if (TIM2_Channel == TIM2_CHANNEL_2)
	cjne	r7,#0x01,00102$
;	../../src/stm8s_tim2.c:828: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xef
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:831: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x8f
	anl	a,r7
	orl	a,_TIM2_SelectOCxM_PARM_2
	mov	r7,a
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
00102$:
;	../../src/stm8s_tim2.c:837: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfe
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
;	../../src/stm8s_tim2.c:840: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	mov	a,#0x8f
	anl	a,r7
	orl	a,_TIM2_SelectOCxM_PARM_2
	mov	r7,a
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetCounter'
;------------------------------------------------------------
;Counter                   Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:851: void TIM2_SetCounter(uint16_t Counter)
;	-----------------------------------------
;	 function TIM2_SetCounter
;	-----------------------------------------
_TIM2_SetCounter:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:854: TIM2->CNTRH = (uint8_t)(Counter >> 8);
	mov	ar5,r7
	mov	dptr,#0x530c
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:855: TIM2->CNTRL = (uint8_t)(Counter);
	mov	dptr,#0x530d
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetAutoreload'
;------------------------------------------------------------
;Autoreload                Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:864: void TIM2_SetAutoreload(uint16_t Autoreload)
;	-----------------------------------------
;	 function TIM2_SetAutoreload
;	-----------------------------------------
_TIM2_SetAutoreload:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:867: TIM2->ARRH = (uint8_t)(Autoreload >> 8);
	mov	ar5,r7
	mov	dptr,#0x530f
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:868: TIM2->ARRL = (uint8_t)(Autoreload);
	mov	dptr,#0x5310
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetCompare1'
;------------------------------------------------------------
;Compare1                  Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:877: void TIM2_SetCompare1(uint16_t Compare1)
;	-----------------------------------------
;	 function TIM2_SetCompare1
;	-----------------------------------------
_TIM2_SetCompare1:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:880: TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
	mov	ar5,r7
	mov	dptr,#0x5311
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:881: TIM2->CCR1L = (uint8_t)(Compare1);
	mov	dptr,#0x5312
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetCompare2'
;------------------------------------------------------------
;Compare2                  Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:890: void TIM2_SetCompare2(uint16_t Compare2)
;	-----------------------------------------
;	 function TIM2_SetCompare2
;	-----------------------------------------
_TIM2_SetCompare2:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:893: TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
	mov	ar5,r7
	mov	dptr,#0x5313
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:894: TIM2->CCR2L = (uint8_t)(Compare2);
	mov	dptr,#0x5314
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetCompare3'
;------------------------------------------------------------
;Compare3                  Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:903: void TIM2_SetCompare3(uint16_t Compare3)
;	-----------------------------------------
;	 function TIM2_SetCompare3
;	-----------------------------------------
_TIM2_SetCompare3:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:906: TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
	mov	ar5,r7
	mov	dptr,#0x5315
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:907: TIM2->CCR3L = (uint8_t)(Compare3);
	mov	dptr,#0x5316
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetIC1Prescaler'
;------------------------------------------------------------
;TIM2_IC1Prescaler         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:920: void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
;	-----------------------------------------
;	 function TIM2_SetIC1Prescaler
;	-----------------------------------------
_TIM2_SetIC1Prescaler:
;	../../src/stm8s_tim2.c:923: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x04,00127$
	sjmp	00104$
00127$:
	cjne	r7,#0x08,00128$
	sjmp	00104$
00128$:
	cjne	r7,#0x0c,00129$
	sjmp	00104$
00129$:
	mov	_assert_failed_PARM_2,#0x9b
	mov	(_assert_failed_PARM_2 + 1),#0x03
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:926: TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0xf3
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetIC2Prescaler'
;------------------------------------------------------------
;TIM2_IC2Prescaler         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:940: void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
;	-----------------------------------------
;	 function TIM2_SetIC2Prescaler
;	-----------------------------------------
_TIM2_SetIC2Prescaler:
;	../../src/stm8s_tim2.c:943: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x04,00127$
	sjmp	00104$
00127$:
	cjne	r7,#0x08,00128$
	sjmp	00104$
00128$:
	cjne	r7,#0x0c,00129$
	sjmp	00104$
00129$:
	mov	_assert_failed_PARM_2,#0xaf
	mov	(_assert_failed_PARM_2 + 1),#0x03
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:946: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0xf3
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_SetIC3Prescaler'
;------------------------------------------------------------
;TIM2_IC3Prescaler         Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:960: void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
;	-----------------------------------------
;	 function TIM2_SetIC3Prescaler
;	-----------------------------------------
_TIM2_SetIC3Prescaler:
;	../../src/stm8s_tim2.c:964: assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
	mov	a,dpl
	mov	r7,a
	jz	00104$
	cjne	r7,#0x04,00127$
	sjmp	00104$
00127$:
	cjne	r7,#0x08,00128$
	sjmp	00104$
00128$:
	cjne	r7,#0x0c,00129$
	sjmp	00104$
00129$:
	mov	_assert_failed_PARM_2,#0xc4
	mov	(_assert_failed_PARM_2 + 1),#0x03
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:966: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,#0xf3
	anl	a,r6
	orl	ar7,a
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetCapture1'
;------------------------------------------------------------
;tmpccr1                   Allocated to registers r6 r5 
;tmpccr1l                  Allocated to registers r6 
;tmpccr1h                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:975: uint16_t TIM2_GetCapture1(void)
;	-----------------------------------------
;	 function TIM2_GetCapture1
;	-----------------------------------------
_TIM2_GetCapture1:
;	../../src/stm8s_tim2.c:981: tmpccr1h = TIM2->CCR1H;
	mov	dptr,#0x5311
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
;	../../src/stm8s_tim2.c:982: tmpccr1l = TIM2->CCR1L;
	mov	dptr,#0x5312
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
;	../../src/stm8s_tim2.c:984: tmpccr1 = (uint16_t)(tmpccr1l);
	mov	r5,#0x00
;	../../src/stm8s_tim2.c:985: tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
	mov	ar4,r7
	clr	a
	orl	ar6,a
	mov	a,r4
	orl	ar5,a
;	../../src/stm8s_tim2.c:987: return (uint16_t)tmpccr1;
	mov	dpl,r6
	mov	dph,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetCapture2'
;------------------------------------------------------------
;tmpccr2                   Allocated to registers r6 r5 
;tmpccr2l                  Allocated to registers r6 
;tmpccr2h                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:995: uint16_t TIM2_GetCapture2(void)
;	-----------------------------------------
;	 function TIM2_GetCapture2
;	-----------------------------------------
_TIM2_GetCapture2:
;	../../src/stm8s_tim2.c:1001: tmpccr2h = TIM2->CCR2H;
	mov	dptr,#0x5313
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
;	../../src/stm8s_tim2.c:1002: tmpccr2l = TIM2->CCR2L;
	mov	dptr,#0x5314
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
;	../../src/stm8s_tim2.c:1004: tmpccr2 = (uint16_t)(tmpccr2l);
	mov	r5,#0x00
;	../../src/stm8s_tim2.c:1005: tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
	mov	ar4,r7
	clr	a
	orl	ar6,a
	mov	a,r4
	orl	ar5,a
;	../../src/stm8s_tim2.c:1007: return (uint16_t)tmpccr2;
	mov	dpl,r6
	mov	dph,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetCapture3'
;------------------------------------------------------------
;tmpccr3                   Allocated to registers r6 r5 
;tmpccr3l                  Allocated to registers r6 
;tmpccr3h                  Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1015: uint16_t TIM2_GetCapture3(void)
;	-----------------------------------------
;	 function TIM2_GetCapture3
;	-----------------------------------------
_TIM2_GetCapture3:
;	../../src/stm8s_tim2.c:1021: tmpccr3h = TIM2->CCR3H;
	mov	dptr,#0x5315
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
;	../../src/stm8s_tim2.c:1022: tmpccr3l = TIM2->CCR3L;
	mov	dptr,#0x5316
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
;	../../src/stm8s_tim2.c:1024: tmpccr3 = (uint16_t)(tmpccr3l);
	mov	r5,#0x00
;	../../src/stm8s_tim2.c:1025: tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
	mov	ar4,r7
	clr	a
	orl	ar6,a
	mov	a,r4
	orl	ar5,a
;	../../src/stm8s_tim2.c:1027: return (uint16_t)tmpccr3;
	mov	dpl,r6
	mov	dph,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetCounter'
;------------------------------------------------------------
;tmpcntr                   Allocated to registers r7 r6 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1035: uint16_t TIM2_GetCounter(void)
;	-----------------------------------------
;	 function TIM2_GetCounter
;	-----------------------------------------
_TIM2_GetCounter:
;	../../src/stm8s_tim2.c:1039: tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
	mov	dptr,#0x530c
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	r7,#0x00
;	../../src/stm8s_tim2.c:1041: return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
	mov	dptr,#0x530d
	mov	b,#0x00
	lcall	__gptrget
	mov	r4,#0x00
	orl	a,r7
	mov	dpl,a
	mov	a,r4
	orl	a,r6
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetPrescaler'
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1049: TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
;	-----------------------------------------
;	 function TIM2_GetPrescaler
;	-----------------------------------------
_TIM2_GetPrescaler:
;	../../src/stm8s_tim2.c:1052: return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
	mov	dptr,#0x530e
	mov	b,#0x00
	lcall	__gptrget
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetFlagStatus'
;------------------------------------------------------------
;TIM2_FLAG                 Allocated to registers r6 r7 
;bitstatus                 Allocated to registers r7 
;tim2_flag_l               Allocated to registers r5 
;tim2_flag_h               Allocated to registers r6 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1068: FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
;	-----------------------------------------
;	 function TIM2_GetFlagStatus
;	-----------------------------------------
_TIM2_GetFlagStatus:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:1074: assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
	cjne	r6,#0x01,00150$
	cjne	r7,#0x00,00150$
	sjmp	00107$
00150$:
	cjne	r6,#0x02,00151$
	cjne	r7,#0x00,00151$
	sjmp	00107$
00151$:
	cjne	r6,#0x04,00152$
	cjne	r7,#0x00,00152$
	sjmp	00107$
00152$:
	cjne	r6,#0x08,00153$
	cjne	r7,#0x00,00153$
	sjmp	00107$
00153$:
	cjne	r6,#0x00,00154$
	cjne	r7,#0x02,00154$
	sjmp	00107$
00154$:
	cjne	r6,#0x00,00155$
	cjne	r7,#0x04,00155$
	sjmp	00107$
00155$:
	cjne	r6,#0x00,00156$
	cjne	r7,#0x08,00156$
	sjmp	00107$
00156$:
	mov	_assert_failed_PARM_2,#0x32
	mov	(_assert_failed_PARM_2 + 1),#0x04
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	push	ar6
	lcall	_assert_failed
	pop	ar6
	pop	ar7
00107$:
;	../../src/stm8s_tim2.c:1076: tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
	mov	dptr,#0x5304
	mov	b,#0x00
	lcall	__gptrget
	mov	r5,a
	mov	ar4,r6
	mov	a,r4
	anl	ar5,a
;	../../src/stm8s_tim2.c:1077: tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
	mov	ar6,r7
;	../../src/stm8s_tim2.c:1079: if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
	mov	dptr,#0x5305
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	mov	a,r6
	anl	a,r7
	orl	a,r5
	jz	00102$
;	../../src/stm8s_tim2.c:1081: bitstatus = SET;
	mov	r7,#0x01
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:1085: bitstatus = RESET;
	mov	r7,#0x00
00103$:
;	../../src/stm8s_tim2.c:1087: return (FlagStatus)bitstatus;
	mov	dpl,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ClearFlag'
;------------------------------------------------------------
;TIM2_FLAG                 Allocated to registers r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1103: void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
;	-----------------------------------------
;	 function TIM2_ClearFlag
;	-----------------------------------------
_TIM2_ClearFlag:
	mov	r6,dpl
	mov	r7,dph
;	../../src/stm8s_tim2.c:1106: assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
	mov	a,#0xf0
	anl	a,r6
	mov	r4,a
	mov	a,#0xf1
	anl	a,r7
	mov	r5,a
	orl	a,r4
	jnz	00103$
	mov	a,r6
	orl	a,r7
	jnz	00104$
00103$:
	mov	_assert_failed_PARM_2,#0x52
	mov	(_assert_failed_PARM_2 + 1),#0x04
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	push	ar6
	lcall	_assert_failed
	pop	ar6
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:1109: TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
	mov	ar5,r6
	mov	a,r5
	cpl	a
	mov	r5,a
	mov	dptr,#0x5304
	mov	b,#0x00
	mov	a,r5
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1111: TIM2->SR2 = (uint8_t)(~((uint8_t)(TIM2_FLAG >> 8))); // [Roshan, 2015-Nov-09]
	mov	ar6,r7
	mov	a,r6
	cpl	a
	mov	r6,a
	mov	dptr,#0x5305
	mov	b,#0x00
	mov	a,r6
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_GetITStatus'
;------------------------------------------------------------
;TIM2_IT                   Allocated to registers r7 
;bitstatus                 Allocated to registers r7 
;TIM2_itStatus             Allocated to registers r6 
;TIM2_itEnable             Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1124: ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
;	-----------------------------------------
;	 function TIM2_GetITStatus
;	-----------------------------------------
_TIM2_GetITStatus:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:1130: assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
	cjne	r7,#0x01,00136$
	sjmp	00108$
00136$:
	cjne	r7,#0x02,00137$
	sjmp	00108$
00137$:
	cjne	r7,#0x04,00138$
	sjmp	00108$
00138$:
	cjne	r7,#0x08,00139$
	sjmp	00108$
00139$:
	mov	_assert_failed_PARM_2,#0x6a
	mov	(_assert_failed_PARM_2 + 1),#0x04
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00108$:
;	../../src/stm8s_tim2.c:1132: TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
	mov	dptr,#0x5304
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	mov	a,r7
	anl	ar6,a
;	../../src/stm8s_tim2.c:1134: TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
	mov	dptr,#0x5303
	mov	b,#0x00
	lcall	__gptrget
	mov	r5,a
	anl	ar7,a
;	../../src/stm8s_tim2.c:1136: if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
	mov	a,r6
	jz	00102$
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:1138: bitstatus = SET;
	mov	r7,#0x01
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:1142: bitstatus = RESET;
	mov	r7,#0x00
00103$:
;	../../src/stm8s_tim2.c:1144: return (ITStatus)(bitstatus);
	mov	dpl,r7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIM2_ClearITPendingBit'
;------------------------------------------------------------
;TIM2_IT                   Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1157: void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
;	-----------------------------------------
;	 function TIM2_ClearITPendingBit
;	-----------------------------------------
_TIM2_ClearITPendingBit:
;	../../src/stm8s_tim2.c:1160: assert_param(IS_TIM2_IT_OK(TIM2_IT));
	mov	a,dpl
	mov	r7,a
	jz	00103$
	mov	a,r7
	add	a,#0xff - 0x0f
	mov	_TIM2_ClearITPendingBit_sloc0_1_0,c
	jnc	00104$
00103$:
	mov	_assert_failed_PARM_2,#0x88
	mov	(_assert_failed_PARM_2 + 1),#0x04
	clr	a
	mov	(_assert_failed_PARM_2 + 2),a
	mov	(_assert_failed_PARM_2 + 3),a
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_assert_failed
	pop	ar7
00104$:
;	../../src/stm8s_tim2.c:1163: TIM2->SR1 = (uint8_t)(~TIM2_IT);
	mov	a,r7
	cpl	a
	mov	r7,a
	mov	dptr,#0x5304
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TI1_Config'
;------------------------------------------------------------
;TIM2_ICSelection          Allocated with name '_TI1_Config_PARM_2'
;TIM2_ICFilter             Allocated with name '_TI1_Config_PARM_3'
;TIM2_ICPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1182: static void TI1_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TI1_Config
;	-----------------------------------------
_TI1_Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:1187: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfe
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1190: TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
	mov	dptr,#0x5307
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0x0c
;	../../src/stm8s_tim2.c:1191: | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	mov	a,_TI1_Config_PARM_3
	swap	a
	anl	a,#0xf0
	mov	r5,a
	orl	a,_TI1_Config_PARM_2
	orl	ar6,a
	mov	dptr,#0x5307
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1194: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:1196: TIM2->CCER1 |= TIM2_CCER1_CC1P;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x02
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:1200: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfd
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
00103$:
;	../../src/stm8s_tim2.c:1203: TIM2->CCER1 |= TIM2_CCER1_CC1E;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x01
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TI2_Config'
;------------------------------------------------------------
;TIM2_ICSelection          Allocated with name '_TI2_Config_PARM_2'
;TIM2_ICFilter             Allocated with name '_TI2_Config_PARM_3'
;TIM2_ICPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1222: static void TI2_Config(uint8_t TIM2_ICPolarity,
;	-----------------------------------------
;	 function TI2_Config
;	-----------------------------------------
_TI2_Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:1227: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xef
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1230: TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
	mov	dptr,#0x5308
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0x0c
;	../../src/stm8s_tim2.c:1231: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	mov	a,_TI2_Config_PARM_3
	swap	a
	anl	a,#0xf0
	mov	r5,a
	orl	a,_TI2_Config_PARM_2
	orl	ar6,a
	mov	dptr,#0x5308
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1235: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:1237: TIM2->CCER1 |= TIM2_CCER1_CC2P;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x20
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:1241: TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xdf
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
00103$:
;	../../src/stm8s_tim2.c:1245: TIM2->CCER1 |= TIM2_CCER1_CC2E;
	mov	dptr,#0x530a
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x10
	mov	dptr,#0x530a
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'TI3_Config'
;------------------------------------------------------------
;TIM2_ICSelection          Allocated with name '_TI3_Config_PARM_2'
;TIM2_ICFilter             Allocated with name '_TI3_Config_PARM_3'
;TIM2_ICPolarity           Allocated to registers r7 
;------------------------------------------------------------
;	../../src/stm8s_tim2.c:1262: static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
;	-----------------------------------------
;	 function TI3_Config
;	-----------------------------------------
_TI3_Config:
	mov	r7,dpl
;	../../src/stm8s_tim2.c:1266: TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0xfe
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1269: TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF)))
	mov	dptr,#0x5309
	mov	b,#0x00
	lcall	__gptrget
	mov	r6,a
	anl	ar6,#0x0c
;	../../src/stm8s_tim2.c:1270: | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
	mov	a,_TI3_Config_PARM_3
	swap	a
	anl	a,#0xf0
	mov	r5,a
	orl	a,_TI3_Config_PARM_2
	orl	ar6,a
	mov	dptr,#0x5309
	mov	b,#0x00
	mov	a,r6
	lcall	__gptrput
;	../../src/stm8s_tim2.c:1274: if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
	mov	a,r7
	jz	00102$
;	../../src/stm8s_tim2.c:1276: TIM2->CCER2 |= TIM2_CCER2_CC3P;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x02
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
	sjmp	00103$
00102$:
;	../../src/stm8s_tim2.c:1280: TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	anl	ar7,#0xfd
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	lcall	__gptrput
00103$:
;	../../src/stm8s_tim2.c:1283: TIM2->CCER2 |= TIM2_CCER2_CC3E;
	mov	dptr,#0x530b
	mov	b,#0x00
	lcall	__gptrget
	mov	r7,a
	orl	ar7,#0x01
	mov	dptr,#0x530b
	mov	b,#0x00
	mov	a,r7
	ljmp	__gptrput
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "../../src/stm8s_tim2.c"
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
