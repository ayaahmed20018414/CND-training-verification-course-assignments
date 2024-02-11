// Code your testbench here
// or browse Examples
module packed_struct();
  typedef struct packed{
    bit [7:0] addr;
    bit valid;
    bit [31:0] data;
  } mem_pkt;
  mem_pkt pkt;
  initial begin
    pkt='{8'h6, 1'b1, 32'hC001_0FAB};
    $display("pkt=%p:",pkt);
    pkt.addr=8'h8;
    $display("pkt=%p:",pkt);
    pkt.data=32'hFFF0_0FFF;
    $display("pkt=%p:",pkt);
    
  end
endmodule