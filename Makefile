output: machinecode.mem a.out
	vvp a.out
machinecode.mem: assembler.py
	python assembler.py
a.out: cu.v alu.v registers.v instr_reg.v memory.v 
	iverilog cu.v alu.v registers.v instr_reg.v memory.v