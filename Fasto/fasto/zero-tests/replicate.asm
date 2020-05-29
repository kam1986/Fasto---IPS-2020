	.text	0x00400000
	.globl	main
	la	$28, _heap_
	la	$4, _true
# was:	la	_true_addr, _true
	ori	$3, $0, 4
# was:	ori	_true_init, $0, 4
	sw	$3, 0($4)
# was:	sw	_true_init, 0(_true_addr)
	la	$3, _false
# was:	la	_false_addr, _false
	ori	$4, $0, 5
# was:	ori	_false_init, $0, 5
	sw	$4, 0($3)
# was:	sw	_false_init, 0(_false_addr)
	jal	main
_stop_:
	ori	$2, $0, 10
	syscall
# Function writeInt
writeInt:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_b_1_,$2,0
	ori	$16, $2, 0
# was:	ori	_tmp_3_, _param_b_1_, 0
# 	ori	_writeIntres_2_,_tmp_3_,0
	ori	$2, $16, 0
# was:	ori	$2, _writeIntres_2_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $16, 0
# was:	ori	$2, _writeIntres_2_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
	ori	$7, $0, 0
# was:	ori	_size_reg_6_, $0, 0
	ori	$2, $0, 7
# was:	ori	_a_reg_7_, $0, 7
	ori	$3, $28, 0
# was:	ori	_letBind_5_, $28, 0
	sll	$4, $7, 2
# was:	sll	_tmp_13_, _size_reg_6_, 2
	addi	$4, $4, 4
# was:	addi	_tmp_13_, _tmp_13_, 4
	add	$28, $28, $4
# was:	add	$28, $28, _tmp_13_
	sw	$7, 0($3)
# was:	sw	_size_reg_6_, 0(_letBind_5_)
	ori	$6, $0, 0
# was:	ori	_i_reg_9_, $0, 0
	addi	$5, $3, 0
# was:	addi	_addr_reg_8_, _letBind_5_, 0
_loop_beg_11_:
	slt	$4, $6, $7
# was:	slt	_i_lt_n_10_, _i_reg_9_, _size_reg_6_
	beq	$4, $0, _loop_end_12_
# was:	beq	_i_lt_n_10_, $0, _loop_end_12_
	addi	$5, $5, 4
# was:	addi	_addr_reg_8_, _addr_reg_8_, 4
	sw	$2, 0($5)
# was:	sw	_a_reg_7_, 0(_addr_reg_8_)
	addi	$6, $6, 1
# was:	addi	_i_reg_9_, _i_reg_9_, 1
	j	_loop_beg_11_
_loop_end_12_:
# 	ori	_arr_reg_15_,_letBind_5_,0
	lw	$16, 0($3)
# was:	lw	_size_reg_14_, 0(_arr_reg_15_)
	ori	$17, $28, 0
# was:	ori	_mainres_4_, $28, 0
	sll	$2, $16, 2
# was:	sll	_tmp_24_, _size_reg_14_, 2
	addi	$2, $2, 4
# was:	addi	_tmp_24_, _tmp_24_, 4
	add	$28, $28, $2
# was:	add	$28, $28, _tmp_24_
	sw	$16, 0($17)
# was:	sw	_size_reg_14_, 0(_mainres_4_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_18_, _mainres_4_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_19_, $0, 0
	addi	$20, $3, 4
# was:	addi	_elem_reg_16_, _arr_reg_15_, 4
_loop_beg_20_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_22_, _i_reg_19_, _size_reg_14_
	bgez	$2, _loop_end_21_
# was:	bgez	_tmp_reg_22_, _loop_end_21_
	lw	$2, 0($20)
# was:	lw	_res_reg_17_, 0(_elem_reg_16_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_16_, _elem_reg_16_, 4
# 	ori	$2,_res_reg_17_,0
	jal	writeInt
# was:	jal	writeInt, $2
# 	ori	_tmp_reg_23_,$2,0
# 	ori	_res_reg_17_,_tmp_reg_23_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_17_, 0(_addr_reg_18_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_18_, _addr_reg_18_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_19_, _i_reg_19_, 1
	j	_loop_beg_20_
_loop_end_21_:
	ori	$2, $17, 0
# was:	ori	$2, _mainres_4_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
ord:
	jr	$31
chr:
	andi	$2, $2, 255
	jr	$31
putint:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 1
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getint:
	ori	$2, $0, 5
	syscall
	jr	$31
putchar:
	addi	$29, $29, -8
	sw	$2, 0($29)
	sw	$4, 4($29)
	ori	$4, $2, 0
	ori	$2, $0, 11
	syscall
	ori	$2, $0, 4
	la	$4, _space_
	syscall
	lw	$2, 0($29)
	lw	$4, 4($29)
	addi	$29, $29, 8
	jr	$31
getchar:
	addi	$29, $29, -8
	sw	$4, 0($29)
	sw	$5, 4($29)
	ori	$2, $0, 12
	syscall
	ori	$5, $2, 0
	ori	$2, $0, 4
	la	$4, _cr_
	syscall
	ori	$2, $5, 0
	lw	$4, 0($29)
	lw	$5, 4($29)
	addi	$29, $29, 8
	jr	$31
putstring:
	addi	$29, $29, -16
	sw	$2, 0($29)
	sw	$4, 4($29)
	sw	$5, 8($29)
	sw	$6, 12($29)
	lw	$4, 0($2)
	addi	$5, $2, 4
	add	$6, $5, $4
	ori	$2, $0, 11
putstring_begin:
	sub	$4, $5, $6
	bgez	$4, putstring_done
	lb	$4, 0($5)
	syscall
	addi	$5, $5, 1
	j	putstring_begin
putstring_done:
	lw	$2, 0($29)
	lw	$4, 4($29)
	lw	$5, 8($29)
	lw	$6, 12($29)
	addi	$29, $29, 16
	jr	$31
_RuntimeError_:
	la	$4, _ErrMsg_
	ori	$2, $0, 4
	syscall
	ori	$4, $5, 0
	ori	$2, $0, 1
	syscall
	la	$4, _colon_space_
	ori	$2, $0, 4
	syscall
	ori	$4, $6, 0
	ori	$2, $0, 4
	syscall
	la	$4, _cr_
	ori	$2, $0, 4
	syscall
	j	_stop_
	.data	
# Fixed strings for I/O
_ErrMsg_:
	.asciiz	"Runtime error at line "
_colon_space_:
	.asciiz	": "
_cr_:
	.asciiz	"\n"
_space_:
	.asciiz	" "
# Message strings for specific errors
_Msg_IllegalArraySize_:
	.asciiz	"negative array size"
_Msg_IllegalIndex_:
	.asciiz	"array index out of bounds"
_Msg_DivZero_:
	.asciiz	"division by zero"
# String Literals
	.align	2
_true:
	.space	4
	.asciiz	"true"
	.align	2
_false:
	.space	4
	.asciiz	"false"
	.align	2
_heap_:
	.space	100000