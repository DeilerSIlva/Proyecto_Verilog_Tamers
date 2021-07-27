objetivo1: dependencia1
	gtkwave PARTE2.vcd

dependencia1:
	iverilog -o resultado banco_prueba.v
	vvp resultado
	
