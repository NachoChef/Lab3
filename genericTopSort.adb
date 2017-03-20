package body GenericTopologicalSort is
	-- This should read (get) the relations and print (put) the results.
type Node;
type NodePointer is access Node;
type Node is tagged record
	Suc:	SortElement;  -- Sort element is an “object” placed in the stack.
	Next:	NodePointer;
end record;

type JobElement is record
	Count:  Integer := 0;  -- This field should be used for counting and as queue links.
	Top:	NodePointer;
end record;

SortStructure:  Array(SortElement) of JobElement; 
-- other declarations

	procedure TopologicalSort( … ) is 
	begin -- Program to obtain the relations in the partial ordering,
          -- sort the jobs, and print results;  
end TopologicalSort;
end GenericTopologicalSort;
