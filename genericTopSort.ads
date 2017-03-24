--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***
with Ada.Unchecked_Deallocation;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with AbstStack;
generic
   type Parent;
   type SortElement;
	with function get(Item:  in SortElement) return Parent;
	with procedure put(Item:  in Parent'Class);
package GenericTopSort is
   --Parent for all input nodes
   
   type PPoint is access all Parent'Class;
   type Parent is tagged record
      next : PPoint;
      previous : PPoint;
   end record;
   
   --element that will be in data structure, holds parent/children, count, stack pointer
   type SortPointer is access SortElement;
   type SortElement is record
      Obj : PPoint;
   	Count: Integer := 0;
   	Top: AbstStack.AbstractStackElementPtr;
   end record;
   objList : PPoint;
   type SortStructure is array(Positive range <>) of SortElement;
   procedure initialize (inputfile : in string; outputfile : string; obj : PPoint); --obj points to the list of parent children that we use
	procedure TopologicalSort (struct : SortStructure; NA : integer; objList : PPoint);
end GenericTopSort;
