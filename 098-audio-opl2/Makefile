TEST_CASE := audio-opl2
YOSYS_PARAM := -nomx8
TOP := OPL2_demo
VERILOG_FILES := \
	OPL2_demo.v  \
	async.v \
	../lib/fpgalibs/clocks/gatemate_25MHz_pll.v \
	jtopl/jtopl.v \
	jtopl/jtopl_acc.v \
	jtopl/jtopl_csr.v \
	jtopl/jtopl_div.v \
	jtopl/jtopl_eg.v \
	jtopl/jtopl_eg_cnt.v \
	jtopl/jtopl_eg_comb.v \
	jtopl/jtopl_eg_ctrl.v \
	jtopl/jtopl_eg_final.v \
	jtopl/jtopl_eg_pure.v \
	jtopl/jtopl_eg_step.v \
	jtopl/jtopl_exprom.v \
	jtopl/jtopl_lfo.v \
	jtopl/jtopl_logsin.v \
	jtopl/jtopl_mmr.v \
	jtopl/jtopl_noise.v \
	jtopl/jtopl_op.v \
	jtopl/jtopl_pg.v \
	jtopl/jtopl_pg_comb.v \
	jtopl/jtopl_pg_inc.v \
	jtopl/jtopl_pg_rhy.v \
	jtopl/jtopl_pg_sum.v \
	jtopl/jtopl_pm.v \
	jtopl/jtopl_reg.v \
	jtopl/jtopl_reg_ch.v \
	jtopl/jtopl_sh.v \
	jtopl/jtopl_sh_rst.v \
	jtopl/jtopl_single_acc.v \
	jtopl/jtopl_slot_cnt.v \
	jtopl/jtopl_timers.v 

include ../makefile.inc
