with topSort;
with Ada.Integer_Text_IO, Ada.Text_IO; use Ada.Integer_Text_IO, Ada.Text_IO;

procedure main is
   size : integer;
begin
   Put("Enter the number of nodes: "); Get(size);
   topSort.initialize(size);
end main;   