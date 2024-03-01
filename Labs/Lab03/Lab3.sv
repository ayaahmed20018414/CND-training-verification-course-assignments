module proceduer_consumer_model();
  typedef enum {Control,Message,Command} Packet_type_t;
  typedef struct {int ID;
          time sent_time;
          Packet_type_t packet_type;
                  bit [31:0] DATA;} Packet_t;
  
  mailbox MX=new();
  Packet_t packeti,packetii;
  task producer();
    int i;
    forever begin
      packeti.ID=$random;
      packeti.sent_time=$time;
      if(i==0) 
        packeti.packet_type=Control;
      else if(i==1)
        packeti.packet_type=Command;
      else
        packeti.packet_type=Message;
      i++;
      packeti.DATA=$random;
      #10;
      MX.put(packeti);
    end

    
  endtask
  
  task consumer();
    forever begin
      #5;
      MX.get(packetii);
      $display("%p %t",packetii,$time);
    end
    
  endtask
  
  initial begin
    fork 
      producer;
      consumer;
    join 
    
  end
  
  initial begin
    #200;
    $finish;
    
  end
  
  
  
  
  
endmodule