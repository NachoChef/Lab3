with Ada.Strings.Unbounded; 

generic
	type SortElement is private;
	with function get(Item:  out SortElement) return SortElement;
	with procedure put(Item:  in SortElement);
package GenericTopSort is
   type Parent;
   type ParentPointer is access all Parent'Class;
   type Parent is tagged record
      next : ParentPointer := null;
      
   end record;   
   type myNames is array(Positive range <>) of Ada.Strings.Unbounded.Unbounded_String;
	procedure TopologicalSort (struct : SortStructure; KN : integer);
   procedure initialize (inputfile : in string; outputfile : string);
   function map (names : in myNames; obj : in SortElement) return integer;
end GenericTopSort;