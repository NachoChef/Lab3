generic
	type SortElement is private;
	with function get(Item:  out SortElement) return SortElement;
	with procedure put(Item:  in SortElement);
	with function takesPrecedence(relation : in String; predecessor : in SortElement; successor : in sortElement); 
package GenericTopSort is
   type Parent;
   type ParentPointer is access all Parent'Class;
   type Parent is tagged record
      next : ParentPointer := null;
      
   end record;   
      
   type myNames is array(Positive range <>) of Ada.Unbounded.String;
	procedure TopologicalSort ( …);
   procedure initialize (inputfile : in string; outputfile : string);
   function map (names : in myNames; obj : in SortElement) return integer;
end GenericTopSort;
