module lshift_reg(clk, rstn, load_val, load_en, op);

input clk, rstn, load_en;
input[7:0] load_val;
output reg[7:0] op;

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
			op<=load_val;
		end
    else
    begin
        op[0] <= op[7];
		    op[1] <= op[0];
		    op[2] <= op[1];
		    op[3] <= op[2];
		    op[4] <= op[3];
	 	    op[5] <= op[4];
		    op[6] <= op[5];
		    op[7] <= op[6];
    end
	end
end
endmodule
