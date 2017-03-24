with topSort;
with Ada.Integer_Text_IO, Ada.Text_IO; use Ada.Integer_Text_IO, Ada.Text_IO;

procedure main is
   size : integer;
begin
   Put("Enter the number of nodes: "); Get(size);
   topSort.initialize(size);
end main;

--data set 1
-- 9 15 1 2 1 3 4 1 3 8 8 2 4 2 4 5 6 4 5 7 2 7 9 8 9 6 2 7 4 2 9 8

--data set 2
-- 9 18 1 2 1 3 2 3 4 1 3 8 8 9 8 2 4 2 4 5 6 4 5 7 2 7 7 9 9 8 9 6 2 7 4 2 9 8