// Code your testbench here
// or browse Examples
module sv();
  typedef enum {ASIC, Vreification, Fullcustom} courses;
  courses course;
  initial begin
    course = ASIC;
    $display("course=%d, name = %s",course,course.name());
    course = Fullcustom;
    $display("course=%d, name = %s",course,course.name());
  end  
endmodule