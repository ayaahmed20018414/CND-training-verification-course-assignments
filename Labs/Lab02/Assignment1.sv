// Code your testbench here
// or browse Examples
module tb();
  logic [31:0] MEM [0:7][0:7];
  logic [23:0] tmp;
initial begin
  foreach(MEM[k,j]) begin
    MEM[k][j]=$random;
    end
  $display(MEM);
    foreach(MEM[k,j]) begin
      $displayb("MEM[%0d][%0d]=%0d",k,j,MEM[k][j]);
    end
    foreach(MEM[k,j]) begin
      $displayb("MEM[%0d][%0d]=%b",k,j,MEM[k][j]);
      tmp=~MEM[k][j][23:0];
      MEM[k][j][23:0]=tmp;
      $displayb("MEM[%0d][%0d]=%b",k,j,MEM[k][j]);
    end
end
endmodule  















