.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x22, h0_start
jalr x0, x22, 0
h0_start:
                  li x31, 0x40000100
                  csrw 0x301, x31
kernel_sp:        
                  la x15, kernel_stack_end

trap_vec_init:    
                  la x31, mtvec_handler
                  ori x31, x31, 1
                  csrw 0x305, x31 # MTVEC

mepc_setup:       
                  la x31, init
                  csrw 0x341, x31

init_machine_mode:
                  li x31, 0x1e00
                  csrw 0x300, x31 # MSTATUS
                  li x31, 0x0
                  csrw 0x304, x31 # MIE
                  mret
init:             
                  li x0, 0xe
                  li x1, 0x0
                  li x2, 0xf7946cbc
                  li x3, 0x95b45133
                  li x4, 0x0
                  li x5, 0xdadd4240
                  li x6, 0x0
                  li x7, 0x0
                  li x8, 0x79a9bd55
                  li x9, 0x946ee6eb
                  li x10, 0xf86e2299
                  li x11, 0xf5efaaa8
                  li x12, 0x80000000
                  li x13, 0xa
                  li x14, 0x0
                  li x16, 0xc8285963
                  li x17, 0xfd835636
                  li x18, 0xf496d0c7
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x21, 0xf10709f9
                  li x22, 0x0
                  li x23, 0x80000000
                  li x24, 0xd
                  li x25, 0x8
                  li x26, 0xfa2a4e40
                  li x28, 0xa
                  li x29, 0x5
                  li x30, 0x1326e2ad
                  li x31, 0xd92ad2de
                  la x27, user_stack_end
main:             xor         zero, s11, t5
                  slti        a7, a6, -291
                  srli        t4, s2, 5
                  auipc       s9, 686712
                  srli        sp, s3, 24
                  xori        t6, a2, 471
                  li         s10, 0x1 #start riscv_int_numeric_corner_stream_0
                  li         t6, 0x0
                  li         t5, 0x0
                  li         t3, 0x0
                  li         s4, 0x1
                  li         s8, 0x1
                  li         t1, 0x0
                  li         s2, 0x0
                  li         a4, 0x1
                  li         s0, 0x7a5d691e
                  add         a0, s1, s7
                  lui         t5, 31756
                  addi        zero, s9, -814
                  nop
                  add         a7, s0, gp
                  lui         s0, 700828
                  lui         zero, 960804
                  addi        a6, zero, -348
                  sub         gp, tp, t4
                  addi        zero, s3, 604
                  addi        s0, a6, -381
                  lui         zero, 93047
                  sub         a0, t2, s4
                  add         ra, s1, t4
                  sub         a6, t1, s3
                  lui         tp, 414847
                  lui         s8, 362972 #end riscv_int_numeric_corner_stream_0
                  nop
                  and         a3, t4, s5
                  addi        zero, zero, 966
                  sub         t4, s6, t0
                  la x22, test_done
                  jalr x0, x22, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
mmode_intr_vector_1:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_2:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_3:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_4:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_5:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_6:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_7:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_8:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_9:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_10:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_11:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_12:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_13:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_14:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

mmode_intr_vector_15:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x342 # MCAUSE
                  srli x31, x31, 0x1f
                  beqz x31, 1f
                  j mmode_intr_handler
                  1: la x22, test_done
                  jalr x0, x22, 0

.align 4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15

mmode_exception_handler:
                  csrrw x27, 0x340, x27
                  add x27, x15, zero
                  1: addi x27, x27, -124
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr x31, 0x341 # MEPC
                  csrr x31, 0x342 # MCAUSE
                  li x30, 0xb # ECALL_MMODE
                  beq x31, x30, ecall_handler
                  li x30, 0x2 # ILLEGAL_INSTRUCTION
                  beq x31, x30, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: la x22, test_done
                  jalr x1, x22, 0

ecall_handler:    
                  la x31, _start
                  sw x0, 0(x31)
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  la x22, write_tohost
                  jalr x0, x22, 0

illegal_instr_handler:
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  csrw  0x341, x31
                  lw x1, 4(x27)
                  lw x2, 8(x27)
                  lw x3, 12(x27)
                  lw x4, 16(x27)
                  lw x5, 20(x27)
                  lw x6, 24(x27)
                  lw x7, 28(x27)
                  lw x8, 32(x27)
                  lw x9, 36(x27)
                  lw x10, 40(x27)
                  lw x11, 44(x27)
                  lw x12, 48(x27)
                  lw x13, 52(x27)
                  lw x14, 56(x27)
                  lw x15, 60(x27)
                  lw x16, 64(x27)
                  lw x17, 68(x27)
                  lw x18, 72(x27)
                  lw x19, 76(x27)
                  lw x20, 80(x27)
                  lw x21, 84(x27)
                  lw x22, 88(x27)
                  lw x23, 92(x27)
                  lw x24, 96(x27)
                  lw x25, 100(x27)
                  lw x26, 104(x27)
                  lw x27, 108(x27)
                  lw x28, 112(x27)
                  lw x29, 116(x27)
                  lw x30, 120(x27)
                  lw x31, 124(x27)
                  addi x27, x27, 124
                  add x15, x27, zero
                  csrrw x27, 0x340, x27
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x31, 0x300 # MSTATUS;
                  csrr  x31, 0x304 # MIE;
                  csrr  x31, 0x344 # MIP;
                  csrrc x31, 0x344, x31 # MIP;
                  lw x1, 4(x27)
                  lw x2, 8(x27)
                  lw x3, 12(x27)
                  lw x4, 16(x27)
                  lw x5, 20(x27)
                  lw x6, 24(x27)
                  lw x7, 28(x27)
                  lw x8, 32(x27)
                  lw x9, 36(x27)
                  lw x10, 40(x27)
                  lw x11, 44(x27)
                  lw x12, 48(x27)
                  lw x13, 52(x27)
                  lw x14, 56(x27)
                  lw x15, 60(x27)
                  lw x16, 64(x27)
                  lw x17, 68(x27)
                  lw x18, 72(x27)
                  lw x19, 76(x27)
                  lw x20, 80(x27)
                  lw x21, 84(x27)
                  lw x22, 88(x27)
                  lw x23, 92(x27)
                  lw x24, 96(x27)
                  lw x25, 100(x27)
                  lw x26, 104(x27)
                  lw x27, 108(x27)
                  lw x28, 112(x27)
                  lw x29, 116(x27)
                  lw x30, 120(x27)
                  lw x31, 124(x27)
                  addi x27, x27, 124
                  add x15, x27, zero
                  csrrw x27, 0x340, x27
                  mret;

kernel_instr_end: nop
.align 2
kernel_data_start:
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
