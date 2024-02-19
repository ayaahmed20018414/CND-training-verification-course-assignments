// Code your design here
module sequence_detector(input Binary_In,
                         input CLK,
                         input RST,
                        output reg sequence_detected);
  
  localparam IDLE=2'b00,
  state1=2'b01,
  state2=2'b11,
  state3=2'b10;
  reg [1:0] current_state,next_state;
  always @(posedge CLK or negedge RST) begin
    if(!RST) begin
      current_state<=IDLE;
    end
    else begin
      current_state<=next_state;
    end
  end
  
  always@(*) begin
    case(current_state)
      IDLE:begin
        if(!Binary_In) begin
          next_state=state1;
        end
        else begin
          next_state=IDLE;
        end
      end
       state1:begin
        if(Binary_In) begin
          next_state=state2;
        end
        else begin
          next_state=state1;
        end
       end
       state2:begin
        if(!Binary_In) begin
          next_state=state1;
        end
        else begin
          next_state=state3;
        end       
      end
       state3:begin
          next_state=IDLE;      
      end
      
    endcase
    
  end
  
  always@(*) begin
    case(current_state)
      IDLE:begin
        sequence_detected=1'b0;
      end
      state1:begin
        sequence_detected=1'b0;
      end
      state2:begin
        sequence_detected=1'b0;
      end
      state3:begin
        sequence_detected=1'b1;
      end  
    endcase
  end
  
  
  
endmodule