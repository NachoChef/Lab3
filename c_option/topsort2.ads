with Ada.Text_IO; use Ada.Text_IO;

package topSort2 is
   type Node;
   type NodePtr is access all Node;
   type Node is record
      Suc : Integer := 0;
      Next : NodePtr := null;
   end record;
   type SortStructure is array(Integer range <>) of NodePtr;
   procedure initialize(size : integer);
end topSort2;