module DUT_tb();
  logic Binary_In;
  logic CLK;
  logic RST;
  logic sequence_detected;
  bit finish,finish_check;
  bit input_queue [$]='{0, 0, 1, 1, 0, 0, 0, 1, 1, 0};
  bit detect_design_queue[$];
  bit detect_GoldenModel_queue[$]='{0, 0, 0, 1, 0, 0, 0, 0, 1, 0};
  sequence_detector DUT(.Binary_In(Binary_In),.CLK(CLK),.RST(RST),.sequence_detected(sequence_detected));
  always #5 CLK=~CLK;
  initial begin
    CLK=1'b0;
    RST=1'b0;
    repeat(2)@(posedge CLK);
    RST=1'b1;
    while(finish==1'b0) begin
      if(input_queue.size==0) begin
        finish=1'b1;
      end
      else begin
        Binary_In=input_queue.pop_back();
        @(posedge CLK);
        detect_design_queue.push_front(sequence_detected);
        $display(detect_design_queue);
      end
    end
    while(finish_check==1'b0) begin
      if(detect_GoldenModel_queue.size==0) begin
        finish_check=1'b1;
      end
      else begin
        if(detect_design_queue.pop_back()==detect_GoldenModel_queue.pop_front()) begin
          $display("design test case passed");
        end
        else begin
          $display("design test case failed");
        end
        end
    end
    #1000;
    $finish;
  end
endmodule














