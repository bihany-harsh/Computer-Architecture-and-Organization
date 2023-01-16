module lshift_reg_for(clk, rstn, load_val, load_en, op);

input clk, rstn, load_en;
input[7:0] load_val;
output reg[7:0] op;

reg temp;

integer i;

always@(posedge clk)
begin
	if (!rstn)
	begin
	   op<=0;
  end
	else
	begin
		if(load_en)
		begin
			op <= load_val;
		end
    else
     begin
        //temp=op[7];
        for(i=0;i<7;i++)
			  begin
				  op[i+1]<=op[i];
			  end
			  op[0]<=op[7];
    end
	end
end
endmodule
