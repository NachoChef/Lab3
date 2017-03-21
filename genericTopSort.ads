generic  -- You may modify this as required but observe the spirit.
	type SortElement is private;  -- An element J (or K) of the partial ordering J < K processed
             -- by the topological sort.  J and K represent objects in the partial ordering.
                   
	with function get(Item:  out SortElement) return SortElement;  -- Reads J or K.
	with procedure put(Item:  in SortElement);  -- Print the value of J or K.
	with function takesPrecedence(relation : in String; predecessor : in SortElement; successor : in sortElement);

package GenericTopologicalSort is
	procedure TopologicalSort; ( …);
   procedure initialize ( );
	--  additional procedures/functions to export if required
end GenericTopologicalSort;
