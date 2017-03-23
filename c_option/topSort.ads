with Ada.Text_IO; use Ada.Text_IO;

package topSort is
   type Node;
   type NodePtr is access all Node;
   type Node is record
      Suc : aliased Integer; --points to indices
      Next : NodePtr := null;
   end record;
   
   type Element is record
      Count : Integer := 0;
      Top : NodePtr := null;
   end record;      
   
   type SortStructure is array(Integer range <>) of Element;
   type myQueue is array(Integer range <>) of integer;
   procedure initialize(size : integer);
   function check (myQ : myQueue; node : integer) return boolean;
end topSort;