--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***
with Ada.Unchecked_Deallocation;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
generic
	type SortElement is private;
   type SortAccess is access SortElement;
	with function get(Item:  out SortElement) return SortElement;
	with procedure put(Item:  in SortElement);
package GenericTopSort is

   type QLink is array(Positive range <>) of integer;                                  --tracks processing order, by index
   type myNames is array(Positive range <>) of Ada.Strings.Unbounded.Unbounded_String; --stores just element names for referencing
   type Node;
   type NodePointer is access Node;
   type Node is record
   	Suc:	SortAccess;   --just the obj reference
   	Next:	NodePointer;   --link to next successor
   end record;
   type Element is record
      Obj : SortElement;
   	Count: Integer := 0;
   	Top: NodePointer;
   end record;
   
   procedure Free is new Ada.Unchecked_Deallocation (SortElement, SortAccess);
   type SortStructure is array(Positive range <>) of Element;
	procedure TopologicalSort (struct : SortStructure; NA : integer; names : myNames);
   procedure initialize (inputfile : in string; outputfile : string);
   function map (names : in myNames; obj : in SortElement) return integer;
   procedure push (NewNode : in NodePointer; NodeStack : in out NodePointer);
   procedure pop (outNode : out NodePointer; NodeStack : in out NodePointer);
end GenericTopSort;
