// Code your testbench here
// or browse Examples
module SV();
  string mystr="Hello";
  initial begin
    $display("%s",mystr);
    $display("%d",mystr.len);
    foreach(mystr[i])
      begin
        $display("%s",mystr[i]);	
      end
  end  
endmodule