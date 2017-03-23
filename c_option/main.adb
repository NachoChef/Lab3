with topSort2;
with Ada.Integer_Text_IO, Ada.Text_IO; use Ada.Integer_Text_IO, Ada.Text_IO;

procedure main is
   size : integer;
begin
   Put("Enter the number of nodes: "); Get(size);
   topSort2.initialize(size);
end main;