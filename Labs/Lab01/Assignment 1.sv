// Code your testbench here
// or browse Examples
module sv_assignment();
  typedef struct packed{
    bit [31:0] id;
    time sent_time;
    bit [31:0] data;
    enum {Control,Command,Data} packet_type;
  }packet;
  packet pkt_arrays[0:19];
  initial begin
    foreach(pkt_arrays[i]) begin
      if(i%3==0) begin
        pkt_arrays[i].id=$random();
        pkt_arrays[i].sent_time=$time();
        pkt_arrays[i].data=$random();
        pkt_arrays[i].packet_type=0;
        
      end
      else if(i%3==1) begin
        pkt_arrays[i].id=$random();
        pkt_arrays[i].sent_time=$time();
        pkt_arrays[i].data=$random();
        pkt_arrays[i].packet_type=1;
        
      end
      else if(i%3==2) begin
        pkt_arrays[i].id=$random();
        pkt_arrays[i].sent_time=$time();
        pkt_arrays[i].data=$random();
        pkt_arrays[i].packet_type=2;  
      end
      #10;
    end
      foreach(pkt_arrays[i]) begin
        $display("array[%0d]=%p",i,pkt_arrays[i]);
      end
  end 
endmodule