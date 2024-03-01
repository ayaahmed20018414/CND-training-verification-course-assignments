// Code your testbench here
// or browse Examples
module proceduer_consumer_model();
  typedef enum {Control,Message,Command} Packet_type_t;
  typedef enum {High,Medium,Low} Priority_t;
  typedef struct {int ID;
          time sent_time;
          Packet_type_t packet_type;
          Priority_t packet_priority;        
          bit [31:0] DATA;} Packet_t;
  
  mailbox MX=new();
  mailbox High_p_MX=new();
  mailbox Medium_p_MX=new();
  mailbox Low_p_MX=new();
  Packet_t packeti,packetii;;
  task producer();
    int i,k;
    forever begin
      #5;
      packeti.ID=$random;
      if(i==0) 
        packeti.packet_type=Control;
      else if(i==1)
        packeti.packet_type=Command;
      else
        packeti.packet_type=Message;
      i++;
      packeti.DATA=$random;
      k=$urandom_range(0,2);
      packeti.packet_priority=Priority_t'(k);
      packeti.sent_time=$time;
      if(packeti.packet_priority==High) begin
        High_p_MX.put(packeti);
      end
      else if(packeti.packet_priority==Medium) begin
        Medium_p_MX.put(packeti);
      end
      else begin
        Low_p_MX.put(packeti);
      end
      $display("packeti=%p",packeti);
    end

    
  endtask
  
  task consumer();
    forever begin
      #20;
      if(High_p_MX.num()!=0) begin
        High_p_MX.get(packetii);
      end
      else if(Medium_p_MX.num()!=0) begin
        Medium_p_MX.get(packetii);
      end
      else begin
        Low_p_MX.get(packetii);
      end
      $display("packetii=%p",packetii);
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