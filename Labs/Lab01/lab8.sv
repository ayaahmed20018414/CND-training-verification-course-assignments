// Code your testbench here
// or browse Examples
module sv();
  typedef union{
    string name;
    bit [15:0] salary;
    integer id;
  } employee;
  initial begin
    employee emp;
    emp.salary='h800;
    $display("updated salary for EMP: %p",emp);
    emp.id='d1234;
    $display("updated id for EMP: %p",emp);
    
  end
endmodule