// Code your testbench here
// or browse Examples

module tb();
  byte qu[$];
  
  initial begin
    qu.push_front(2);
    qu.push_front(12);
    qu.push_front(22);
    qu.push_back(11);
    qu.push_back(99);
    $display("%0d",qu.size());
    $display("%0d",qu.pop_front());
    $display("%0d",qu.pop_back());
    qu.delete(1);
    $display("%0d",qu.size());
    $display("%0p",qu);
  end
  
endmodule 
