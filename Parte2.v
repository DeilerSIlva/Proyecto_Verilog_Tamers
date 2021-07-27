module  celda_ini(   //Definiendo modulo para celda inicial 
    input L,    // Definición de las entradas del modulo

    output reg X,
    output reg Y,
    output reg R,
    output reg Z);
    
    always @(*) begin
    
    	X = L;
    	Y = 0;
    	R = ~L;
    	Z = 0;
    
    end
endmodule

module  celda_tipi(   //Definiendo modulo para celda típica.
    input L,          // Definiendo entradas de la celda
    input x,        
    input y,
    input r,
    output reg X,    //Definiendo salidas de la celda
    output reg Y,
    output reg R,
    output reg Z);
    
    always @(*) begin
    
    /*Se define la función de interes, 
    por medio operadores de Verilog HDL
    */

    	X = (~x & ~r & L) | (~x & ~y & L);
    	
    	Y = (x & ~y & ~r) | ( ~x & y & r);
    	
    	R = ~L;
    	
    	Z = (~x & y & ~r) | (~x & r & L) & (x & ~y & L);
    end
endmodule

module  celda_final( //Definiendo modulo para celda típica.
    input x,         //Definiendo las entradas de la celda
    input y,        
    input r,
    input L,
    output reg I,     //Definiendo las salidas de la celda 
    output reg Z);
    
    always @(*) begin
    
    /*Se define la función de interes, 
    por medio operadores de Verilog HDL
    */

    	I = (r & ~y) | (y & ~r);
    
    	Z = (x & L) + (r & ~L) + (y & ~r & L);
    	
    end
endmodule












	
