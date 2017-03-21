package body GenericTopologicalSort is
   type Node;
   type NodePointer is access Node;
   type Node is tagged record
   	Suc:	SortElement;
   	Next:	NodePointer;
   end record;

   type Element is record
   	Count:  Integer := 0; --count/queue link
   	Top:	NodePointer := null;
   end record;

   SortStructure:  Array(SortElement) of Element; 
   -- other declarations
   
   procedure TopologicalSort( … ) is 
   begin -- Program to obtain the relations in the partial ordering,
             -- sort the jobs, and print results; 
   
   end TopologicalSort;

   procedure initialize (file : string; struct : out SortStructure; NA : out integer) is
      inFile : File_Type;
   begin
      Open(file, inFile);
      Get(inFile, NA);
      declare
         struct : SortStructure (0..size);
         KN : integer := NA;
      begin
         Get(temp1, temp2);
         while not End_Of_File(inFile) loop
            SortStructure(temp2).Count := SortStructure(temp2).Count + 1;
            --get node from memory, set Suc to temp2
            --push node
            Get(temp1, temp2);
         end loop;
         
         
   
end GenericTopologicalSort;
