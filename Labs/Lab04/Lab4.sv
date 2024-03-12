// Code your testbench here
// or browse Examples
class comm_component;
  bit [31:0] data;
  bit [31:0] addr;
  virtual function void intialize();
    data = 0;
    addr = 0;
  endfunction
  
   virtual function void display();
     $display("data = %0d @%0t", data,$time);
     $display("addr = %0d @%0t", addr,$time);
  endfunction
  
endclass

class Transmitter extends comm_component ;
  mailbox send_mx_addr;
  mailbox send_mx_data;
  function new(mailbox send_mx_addr,send_mx_data);
    this.send_mx_addr=send_mx_addr;
    this.send_mx_data=send_mx_data;           
  endfunction 
  task send();
    forever begin
      #5;
      data=$random;
      addr=$random;
      send_mx_addr.put(addr);
      send_mx_data.put(data);
      display();
    end
  endtask
     virtual function void display();
       $display("sent data = %0d @%0t", data,$time);
       $display("sent addr = %0d @%0t", addr,$time);
  endfunction
endclass


class Receiver extends comm_component ;
  mailbox receive_mx_addr;
  mailbox receive_mx_data;
  function new(mailbox receive_mx_addr,receive_mx_data);
    this.receive_mx_addr=receive_mx_addr;
    this.receive_mx_data=receive_mx_data;           
  endfunction  
  task receive();
    forever begin
      #10;
      receive_mx_addr.get(addr);
      receive_mx_data.get(data);
      display();
    end
  endtask
   virtual function void display();
       $display("recieved data = %0d @%0t", data,$time);
       $display("recieved addr = %0d @%0t", addr,$time);
  endfunction
endclass
module tb();
initial begin
  mailbox TX_DATA=new();
  mailbox TX_ADDR=new();
  Transmitter tx=new(TX_DATA,TX_ADDR);
  Receiver rx=new(TX_DATA,TX_ADDR);
  tx.intialize();
  tx.display();
  
  fork
    tx.send();
    rx.receive();
  join
end
  initial begin  
  #100;
  $finish;
  end
endmodule