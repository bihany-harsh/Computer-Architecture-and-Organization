module seq_detector(clk, rst, data_in, data_out);
input clk;
input rst;
input data_in; 
output reg data_out;

parameter S0 = 0, S1=1, S2=2, S3=3;
reg [1:0]ns,ps;

always @(posedge clk)
    begin
        if (rst) begin
            ps<=S0;
            data_out = 1'b0; end
        else 
            ps<=ns;
            
    end
    
always @(*)
    begin
       case ( ps)
         S0 : ns = data_in ? S1:S0; 
         S1 : ns = data_in ? S1:S2;
         S2 : ns = data_in ? S3:S0;
         S3 : ns = data_in ? S1:S2;
         default : ns = S0;
       endcase
    end
    
always @(*)
    begin
      case ( ps)
          S0 : data_out = 1'b0;
          S1 : data_out = 1'b0;
          S2 : data_out = 1'b0;
          S3 : data_out = data_in ? 0 : 1 ;
          default : data_out =1'b0;
       endcase          
     end    
endmodule