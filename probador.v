/*Se define un modulo "probador", vemos que hacemos un intercambio de salidas
y entradas con respecto al modulo Parte2. */ 
module probador( 
    output reg	clk,  // Salidas del probador.
    output reg 	x,
    output reg 	y,
    output reg 	r,
    output reg 	[2:0]L,
    
    input 		[2:0]Z,  //Entradas del probador. 
    input 		I
);
	

	initial begin
	$dumpfile("PARTE2.vcd"); //Se define el nombre  VCD al compilar por medio del Make. 
	$dumpvars;
	$display ("\t\t\tclk,\tx,\ty,\tr,\tL,\tI,\tZ");
	$monitor($time,"\t%b\t%b\t%b\t%b\t%b\t%b\t%b", clk, x, y, r, L, I, Z);			

	// Valores iniciales
	x <= 0;
        y <= 0;
        r <= 0;
        L[0]<= 0;
        L[1]<= 0;
        L[2]<= 0;


	//30 ciclos con valores random
	repeat(30) begin
		@(posedge clk);

        x<= $random;
        y<= $random;
        r<= $random;
        L[0]<= $random;
        L[1]<= $random;
        L[2]<= $random;
        
	end
		

	//Valores finales
	@(posedge clk);
        x <= 0;
        y <= 0;
        r <= 0;
        L[0]<= 0;
        L[1]<= 0;
        L[2]<= 0;
               


	$finish;  /*Si no se indica lo contrario la simulacion es indefinida, 
                   esto no suele ser deseable, esta función
                indica el final de la simulacion.*/				
end
	initial	begin
		clk 	<= 0;		
	
	end
	always  begin
	  		#10 clk 		<= ~clk;		// Hace "toggle"
	end


 
		

endmodule
