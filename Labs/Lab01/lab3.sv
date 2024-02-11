// Code your testbench here
// or browse Examples
module tb();
  typedef shortint unsigned ushort_i;
  typedef enum {Red, Yellow, Green} e_light;
  typedef bit [7:0] ubyte;
  initial begin
    ushort_i data=32'hface_cafe;
    e_light light=Green;
    ubyte cnt=8'hFF;
    $display("light=%s data=0x%0h cnt=%0d",light.name,data,cnt);
  end  
endmodule