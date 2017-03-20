generic  -- You may modify this as required but observe the spirit.
	type SortElement is private;  -- An element J (or K) of the partial ordering J < K processed
             -- by the topological sort.  J and K represent objects in the partial ordering.
                   
	with function get(Job:  out SortElement) return SortElement;  // Reads J or K.
	with procedure put(Job:  in SortElement);  // Print the value of J or K.
	with function takesPrecedence(…);

package GenericTopologicalSort is
	procedure TopologicalSort; ( …);
	--  additional procedures/functions to export if required
end GenericTopologicalSort;
