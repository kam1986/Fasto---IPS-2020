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
# Function write_int
write_int:
	sw	$31, -4($29)
	sw	$16, -8($29)
	addi	$29, $29, -12
# 	ori	_param_x_1_,$2,0
	ori	$16, $2, 0
# was:	ori	_tmp_3_, _param_x_1_, 0
# 	ori	_write_intres_2_,_tmp_3_,0
	ori	$2, $16, 0
# was:	ori	$2, _write_intres_2_, 0
	jal	putint
# was:	jal	putint, $2
	ori	$2, $16, 0
# was:	ori	$2, _write_intres_2_, 0
	addi	$29, $29, 12
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function plus
plus:
	sw	$31, -4($29)
	addi	$29, $29, -8
# 	ori	_param_x_4_,$2,0
# 	ori	_param_y_5_,$3,0
# 	ori	_plus_L_7_,_param_x_4_,0
# 	ori	_plus_R_8_,_param_y_5_,0
	add	$2, $2, $3
# was:	add	_plusres_6_, _plus_L_7_, _plus_R_8_
# 	ori	$2,_plusres_6_,0
	addi	$29, $29, 8
	lw	$31, -4($29)
	jr	$31
# Function write_int_arr
write_int_arr:
	sw	$31, -4($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -28
# 	ori	_param_x_9_,$2,0
# 	ori	_arr_reg_12_,_param_x_9_,0
	lw	$16, 0($2)
# was:	lw	_size_reg_11_, 0(_arr_reg_12_)
	ori	$17, $28, 0
# was:	ori	_write_int_arrres_10_, $28, 0
	sll	$3, $16, 2
# was:	sll	_tmp_21_, _size_reg_11_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_21_, _tmp_21_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_21_
	sw	$16, 0($17)
# was:	sw	_size_reg_11_, 0(_write_int_arrres_10_)
	addi	$18, $17, 4
# was:	addi	_addr_reg_15_, _write_int_arrres_10_, 4
	ori	$19, $0, 0
# was:	ori	_i_reg_16_, $0, 0
	addi	$20, $2, 4
# was:	addi	_elem_reg_13_, _arr_reg_12_, 4
_loop_beg_17_:
	sub	$2, $19, $16
# was:	sub	_tmp_reg_19_, _i_reg_16_, _size_reg_11_
	bgez	$2, _loop_end_18_
# was:	bgez	_tmp_reg_19_, _loop_end_18_
	lw	$2, 0($20)
# was:	lw	_res_reg_14_, 0(_elem_reg_13_)
	addi	$20, $20, 4
# was:	addi	_elem_reg_13_, _elem_reg_13_, 4
# 	ori	$2,_res_reg_14_,0
	jal	write_int
# was:	jal	write_int, $2
# 	ori	_tmp_reg_20_,$2,0
# 	ori	_res_reg_14_,_tmp_reg_20_,0
	sw	$2, 0($18)
# was:	sw	_res_reg_14_, 0(_addr_reg_15_)
	addi	$18, $18, 4
# was:	addi	_addr_reg_15_, _addr_reg_15_, 4
	addi	$19, $19, 1
# was:	addi	_i_reg_16_, _i_reg_16_, 1
	j	_loop_beg_17_
_loop_end_18_:
	ori	$2, $17, 0
# was:	ori	$2, _write_int_arrres_10_, 0
	addi	$29, $29, 28
	lw	$20, -24($29)
	lw	$19, -20($29)
	lw	$18, -16($29)
	lw	$17, -12($29)
	lw	$16, -8($29)
	lw	$31, -4($29)
	jr	$31
# Function main
main:
	sw	$31, -4($29)
	sw	$21, -28($29)
	sw	$20, -24($29)
	sw	$19, -20($29)
	sw	$18, -16($29)
	sw	$17, -12($29)
	sw	$16, -8($29)
	addi	$29, $29, -32
	ori	$6, $0, 0
# was:	ori	_size_reg_35_, $0, 0
	bgez	$6, _safe_lab_36_
# was:	bgez	_size_reg_35_, _safe_lab_36_
	ori	$5, $0, 7
# was:	ori	$5, $0, 7
	la	$6, _Msg_IllegalArraySize_
# was:	la	$6, _Msg_IllegalArraySize_
	j	_RuntimeError_
_safe_lab_36_:
	ori	$16, $28, 0
# was:	ori	_arr_reg_24_, $28, 0
	sll	$3, $6, 2
# was:	sll	_tmp_42_, _size_reg_35_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_42_, _tmp_42_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_42_
	sw	$6, 0($16)
# was:	sw	_size_reg_35_, 0(_arr_reg_24_)
	addi	$5, $16, 4
# was:	addi	_addr_reg_37_, _arr_reg_24_, 4
	ori	$3, $0, 0
# was:	ori	_i_reg_38_, $0, 0
_loop_beg_39_:
	sub	$4, $3, $6
# was:	sub	_tmp_reg_41_, _i_reg_38_, _size_reg_35_
	bgez	$4, _loop_end_40_
# was:	bgez	_tmp_reg_41_, _loop_end_40_
	sw	$3, 0($5)
# was:	sw	_i_reg_38_, 0(_addr_reg_37_)
	addi	$5, $5, 4
# was:	addi	_addr_reg_37_, _addr_reg_37_, 4
	addi	$3, $3, 1
# was:	addi	_i_reg_38_, _i_reg_38_, 1
	j	_loop_beg_39_
_loop_end_40_:
	lw	$17, 0($16)
# was:	lw	_size_reg_25_, 0(_arr_reg_24_)
	ori	$18, $28, 0
# was:	ori	_letBind_23_, $28, 0
	sll	$3, $17, 2
# was:	sll	_tmp_45_, _size_reg_25_, 2
	addi	$3, $3, 4
# was:	addi	_tmp_45_, _tmp_45_, 4
	add	$28, $28, $3
# was:	add	$28, $28, _tmp_45_
	sw	$17, 0($18)
# was:	sw	_size_reg_25_, 0(_letBind_23_)
	addi	$19, $18, 4
# was:	addi	_out_elem_reg_31_, _letBind_23_, 4
	addi	$16, $16, 4
# was:	addi	_arr_reg_24_, _arr_reg_24_, 4
	lw	$3, 0($16)
# was:	lw	_tmp_reg_27_, 0(_arr_reg_24_)
# 	ori	$2,_acc_reg_34_,0
# 	ori	$3,_tmp_reg_27_,0
	jal	plus
# was:	jal	plus, $2 $3
# 	ori	_tmp_reg_43_,$2,0
# 	ori	_res_reg_33_,_tmp_reg_43_,0
	sw	$2, 0($19)
# was:	sw	_res_reg_33_, 0(_out_elem_reg_31_)
	addi	$20, $0, 1
# was:	addi	_counter_reg_32_, $0, 1
	ori	$2, $0, 0
# was:	ori	_acc_reg_34_, $0, 0
	addi	$16, $16, 4
# was:	addi	_arr_reg_24_, _arr_reg_24_, 4
	addi	$21, $0, 1
# was:	addi	_ind_var_26_, $0, 1
_loop_beg_29_:
	sub	$3, $21, $17
# was:	sub	_tmp_reg_27_, _ind_var_26_, _size_reg_25_
	bgez	$3, _loop_end_30_
# was:	bgez	_tmp_reg_27_, _loop_end_30_
	lw	$3, 0($16)
# was:	lw	_tmp_reg_27_, 0(_arr_reg_24_)
	lw	$2, 0($19)
# was:	lw	_tmp2_reg_28_, 0(_out_elem_reg_31_)
	addi	$19, $19, 4
# was:	addi	_out_elem_reg_31_, _out_elem_reg_31_, 4
# 	ori	$2,_tmp2_reg_28_,0
# 	ori	$3,_tmp_reg_27_,0
	jal	plus
# was:	jal	plus, $2 $3
# 	ori	_tmp_reg_44_,$2,0
# 	ori	_res_reg_33_,_tmp_reg_44_,0
	sw	$2, 0($19)
# was:	sw	_res_reg_33_, 0(_out_elem_reg_31_)
	addi	$16, $16, 4
# was:	addi	_arr_reg_24_, _arr_reg_24_, 4
	addi	$20, $20, 1
# was:	addi	_counter_reg_32_, _counter_reg_32_, 1
	addi	$21, $21, 1
# was:	addi	_ind_var_26_, _ind_var_26_, 1
	j	_loop_beg_29_
_loop_end_30_:
	sw	$20, 0($18)
# was:	sw	_counter_reg_32_, 0(_letBind_23_)
	ori	$2, $18, 0
# was:	ori	_arg_46_, _letBind_23_, 0
# 	ori	$2,_arg_46_,0
	jal	write_int_arr
# was:	jal	write_int_arr, $2
# 	ori	_mainres_22_,$2,0
# 	ori	$2,_mainres_22_,0
	addi	$29, $29, 32
	lw	$21, -28($29)
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