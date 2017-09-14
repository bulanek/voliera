;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module stm8s_gpio
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GPIO_ExternalPullUpConfig_PARM_3
	.globl _GPIO_ExternalPullUpConfig_PARM_2
	.globl _GPIO_ReadInputPin_PARM_2
	.globl _GPIO_WriteReverse_PARM_2
	.globl _GPIO_WriteLow_PARM_2
	.globl _GPIO_WriteHigh_PARM_2
	.globl _GPIO_Write_PARM_2
	.globl _GPIO_Init_PARM_3
	.globl _GPIO_Init_PARM_2
	.globl _GPIO_DeInit
	.globl _GPIO_Init
	.globl _GPIO_Write
	.globl _GPIO_WriteHigh
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteReverse
	.globl _GPIO_ReadOutputData
	.globl _GPIO_ReadInputData
	.globl _GPIO_ReadInputPin
	.globl _GPIO_ExternalPullUpConfig
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
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_GPIO_Init_PARM_2:
	.ds 1
_GPIO_Init_PARM_3:
	.ds 1
_GPIO_Init_GPIOx_1_309:
	.ds 3
	.area	OSEG    (OVR,DATA)
_GPIO_Write_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_GPIO_WriteHigh_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_GPIO_WriteLow_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_GPIO_WriteReverse_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_GPIO_ReadInputPin_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
_GPIO_ExternalPullUpConfig_PARM_2:
	.ds 1
_GPIO_ExternalPullUpConfig_PARM_3:
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
;Allocation info for local variables in function 'GPIO_DeInit'
;------------------------------------------------------------
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_DeInit
;	-----------------------------------------
_GPIO_DeInit:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	../../src/stm8s_gpio.c:55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	clr	a
	lcall	__gptrput
;	../../src/stm8s_gpio.c:56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
	mov	a,#0x02
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	../../src/stm8s_gpio.c:57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
	mov	a,#0x03
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	../../src/stm8s_gpio.c:58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
	mov	a,#0x04
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_Init'
;------------------------------------------------------------
;GPIO_Pin                  Allocated with name '_GPIO_Init_PARM_2'
;GPIO_Mode                 Allocated with name '_GPIO_Init_PARM_3'
;GPIOx                     Allocated with name '_GPIO_Init_GPIOx_1_309'
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
;	-----------------------------------------
;	 function GPIO_Init
;	-----------------------------------------
_GPIO_Init:
	mov	_GPIO_Init_GPIOx_1_309,dpl
	mov	(_GPIO_Init_GPIOx_1_309 + 1),dph
	mov	(_GPIO_Init_GPIOx_1_309 + 2),b
;	../../src/stm8s_gpio.c:81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	mov	a,#0x04
	add	a,_GPIO_Init_GPIOx_1_309
	mov	r2,a
	clr	a
	addc	a,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	r3,a
	mov	r4,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	mov	a,_GPIO_Init_PARM_2
	cpl	a
	mov	r0,a
	anl	ar1,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r1
	lcall	__gptrput
;	../../src/stm8s_gpio.c:87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
	mov	a,_GPIO_Init_PARM_3
	jnb	acc.7,00105$
;	../../src/stm8s_gpio.c:89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
	mov	a,_GPIO_Init_PARM_3
	jnb	acc.4,00102$
;	../../src/stm8s_gpio.c:91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
	mov	dpl,_GPIO_Init_GPIOx_1_309
	mov	dph,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	b,(_GPIO_Init_GPIOx_1_309 + 2)
	lcall	__gptrget
	mov	r1,a
	mov	a,_GPIO_Init_PARM_2
	orl	ar1,a
	mov	dpl,_GPIO_Init_GPIOx_1_309
	mov	dph,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	b,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	a,r1
	lcall	__gptrput
	sjmp	00103$
00102$:
;	../../src/stm8s_gpio.c:95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
	mov	dpl,_GPIO_Init_GPIOx_1_309
	mov	dph,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	b,(_GPIO_Init_GPIOx_1_309 + 2)
	lcall	__gptrget
	mov	r1,a
	mov	a,r0
	anl	ar1,a
	mov	dpl,_GPIO_Init_GPIOx_1_309
	mov	dph,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	b,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	a,r1
	lcall	__gptrput
00103$:
;	../../src/stm8s_gpio.c:98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
	mov	a,#0x02
	add	a,_GPIO_Init_GPIOx_1_309
	mov	r1,a
	clr	a
	addc	a,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	r6,a
	mov	r7,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	dpl,r1
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,_GPIO_Init_PARM_2
	orl	ar5,a
	mov	dpl,r1
	mov	dph,r6
	mov	b,r7
	mov	a,r5
	lcall	__gptrput
	sjmp	00106$
00105$:
;	../../src/stm8s_gpio.c:103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
	mov	a,#0x02
	add	a,_GPIO_Init_GPIOx_1_309
	mov	r5,a
	clr	a
	addc	a,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	r6,a
	mov	r7,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	a,r0
	anl	ar1,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r1
	lcall	__gptrput
00106$:
;	../../src/stm8s_gpio.c:110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
	mov	a,_GPIO_Init_PARM_3
	jnb	acc.6,00108$
;	../../src/stm8s_gpio.c:112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	mov	a,#0x03
	add	a,_GPIO_Init_GPIOx_1_309
	mov	r5,a
	clr	a
	addc	a,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	r6,a
	mov	r7,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	a,_GPIO_Init_PARM_2
	orl	ar1,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r1
	lcall	__gptrput
	sjmp	00109$
00108$:
;	../../src/stm8s_gpio.c:116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	mov	a,#0x03
	add	a,_GPIO_Init_GPIOx_1_309
	mov	r5,a
	clr	a
	addc	a,(_GPIO_Init_GPIOx_1_309 + 1)
	mov	r6,a
	mov	r7,(_GPIO_Init_GPIOx_1_309 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	a,r0
	anl	ar1,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r1
	lcall	__gptrput
00109$:
;	../../src/stm8s_gpio.c:123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
	mov	a,_GPIO_Init_PARM_3
	jnb	acc.5,00111$
;	../../src/stm8s_gpio.c:125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	mov	a,_GPIO_Init_PARM_2
	orl	ar7,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
	ljmp	__gptrput
00111$:
;	../../src/stm8s_gpio.c:129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	anl	ar0,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r0
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_Write'
;------------------------------------------------------------
;PortVal                   Allocated with name '_GPIO_Write_PARM_2'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
;	-----------------------------------------
;	 function GPIO_Write
;	-----------------------------------------
_GPIO_Write:
;	../../src/stm8s_gpio.c:143: GPIOx->ODR = PortVal;
	mov	a,_GPIO_Write_PARM_2
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_WriteHigh'
;------------------------------------------------------------
;PortPins                  Allocated with name '_GPIO_WriteHigh_PARM_2'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
;	-----------------------------------------
;	 function GPIO_WriteHigh
;	-----------------------------------------
_GPIO_WriteHigh:
;	../../src/stm8s_gpio.c:156: GPIOx->ODR |= (uint8_t)PortPins;
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	lcall	__gptrget
	mov	r4,a
	mov	a,_GPIO_WriteHigh_PARM_2
	orl	ar4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_WriteLow'
;------------------------------------------------------------
;PortPins                  Allocated with name '_GPIO_WriteLow_PARM_2'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
;	-----------------------------------------
;	 function GPIO_WriteLow
;	-----------------------------------------
_GPIO_WriteLow:
;	../../src/stm8s_gpio.c:169: GPIOx->ODR &= (uint8_t)(~PortPins);
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	lcall	__gptrget
	mov	r4,a
	mov	a,_GPIO_WriteLow_PARM_2
	cpl	a
	anl	ar4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_WriteReverse'
;------------------------------------------------------------
;PortPins                  Allocated with name '_GPIO_WriteReverse_PARM_2'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
;	-----------------------------------------
;	 function GPIO_WriteReverse
;	-----------------------------------------
_GPIO_WriteReverse:
;	../../src/stm8s_gpio.c:182: GPIOx->ODR ^= (uint8_t)PortPins;
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
	lcall	__gptrget
	mov	r4,a
	mov	a,_GPIO_WriteReverse_PARM_2
	xrl	ar4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_ReadOutputData'
;------------------------------------------------------------
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_ReadOutputData
;	-----------------------------------------
_GPIO_ReadOutputData:
;	../../src/stm8s_gpio.c:193: return ((uint8_t)GPIOx->ODR);
	lcall	__gptrget
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_ReadInputData'
;------------------------------------------------------------
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
;	-----------------------------------------
;	 function GPIO_ReadInputData
;	-----------------------------------------
_GPIO_ReadInputData:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../src/stm8s_gpio.c:204: return ((uint8_t)GPIOx->IDR);
	inc	r5
	cjne	r5,#0x00,00103$
	inc	r6
00103$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_ReadInputPin'
;------------------------------------------------------------
;GPIO_Pin                  Allocated with name '_GPIO_ReadInputPin_PARM_2'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
;	-----------------------------------------
;	 function GPIO_ReadInputPin
;	-----------------------------------------
_GPIO_ReadInputPin:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../src/stm8s_gpio.c:215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
	inc	r5
	cjne	r5,#0x00,00103$
	inc	r6
00103$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,_GPIO_ReadInputPin_PARM_2
	anl	a,r5
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_ExternalPullUpConfig'
;------------------------------------------------------------
;GPIO_Pin                  Allocated with name '_GPIO_ExternalPullUpConfig_PARM_2'
;NewState                  Allocated with name '_GPIO_ExternalPullUpConfig_PARM_3'
;GPIOx                     Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	../../src/stm8s_gpio.c:225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
;	-----------------------------------------
;	 function GPIO_ExternalPullUpConfig
;	-----------------------------------------
_GPIO_ExternalPullUpConfig:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	../../src/stm8s_gpio.c:231: if (NewState != DISABLE) /* External Pull-Up Set*/
	mov	a,_GPIO_ExternalPullUpConfig_PARM_3
	jz	00102$
;	../../src/stm8s_gpio.c:233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	mov	a,#0x03
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	mov	a,_GPIO_ExternalPullUpConfig_PARM_2
	orl	ar1,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r1
	ljmp	__gptrput
00102$:
;	../../src/stm8s_gpio.c:236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	mov	a,#0x03
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	a,_GPIO_ExternalPullUpConfig_PARM_2
	cpl	a
	anl	ar4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
	ljmp	__gptrput
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
