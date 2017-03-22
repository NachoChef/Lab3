--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***


with Ada.Text_IO; use Ada.Text_IO;
with genericTopSort;

procedure main is
   type Parent;
   type ParentPointer is access all Parent'Class;
   type Parent is tagged record
      next : ParentPointer := null;
   end record; 
begin
   put("Test");
   
end main;