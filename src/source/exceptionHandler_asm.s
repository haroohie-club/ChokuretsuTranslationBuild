//install exception handler
arepl_02000C34:
	ldr r1,=ExceptionHandler
	ldr r2,=0x0208F988 //OSi_DebuggerHandler
	str r1, [r2]
	ldr r2,=0x0208F98C //OSi_UserExceptionHandler
	str r1, [r2]
	mov r1, #0
	bx lr