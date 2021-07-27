`timescale 	1ns				/ 100ps
`include "Parte2.v"
`include "probador.v"

module banco_prueba; 

	//Entradas de la celda inicial, el clk no es entrada.	
	wire x, y, r, clk;
	
	//Conexiones intermedias
	wire X0, Y0, R0;
	
	wire X1, Y1, R1;
	
	//Cables de la salida de la red
	wire [2:0]L;
	wire [2:0]Z;
	wire I;

	celda_ini ini_inst( .L(L[0]), .X(X0), .Y(Y0), .R(R0), .Z(Z[0]));
	
	celda_tipi tipi_inst( .L(L[1]), .x(X0), .y(Y0), .r(R0), .X(X1), .Y(Y1), .R(R1), .Z(Z[1]));
	
    	celda_final final_inst(.L(L[2]), .x(X1), .y(Y1), .r(R1), .I(I), .Z(Z[2]));
	
	//Entradas y salidas de la red, provienen del probador (fuente y osiloscopio XD)
	probador prob_inst( .clk(clk), .x(x), .y(y), .r(r), .L(L), .Z(Z), .I(I));
	
endmodule
