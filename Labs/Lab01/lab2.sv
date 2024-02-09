// Code your testbench here
// or browse Examples
module SV();
  string mystr="Hello World";
  string tmp;
  initial begin
    $display("str.len()=%d",mystr.len());
    tmp=mystr;
    tmp.putc(2,"m");
    $display("tmp.putc(2,m)=%s",tmp);
    $display("str.getc(0)=%s",mystr.getc(0));
    $display("str.tolower()=%s",mystr.tolower);
  end
endmodule