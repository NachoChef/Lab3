--
--
--
--
--
--

package body GenericTopSort is
   type QLink is array(Positive range <>) of integer;
   type Node;
   type NodePointer is access Node;
   type Node is tagged record
   	Suc:	SortElement := null; --SortElement is the generic
   	Next:	NodePointer := null;
   end record;

   type Element is record
   	Count:  Integer := 0; --count/queue link
   	Top:	AbstStack(SortElement);
   end record;

   type SortStructure is array(Positive range <>) of Element;
   
   --retrieves position of an object label
   function map (names : in myNames; obj : in SortElement) return integer is
   begin
      for loc in nameArr'Range loop
         if nameArr(loc) = obj then      --overload this
            return loc;
         end if;
      end loop;
      return 0;      --if item not found, will cause index check error
   end map;
   
   procedure TopologicalSort(struct : SortStructure; KN : integer) is 
      F, R : integer := 1;
      myQ : QLink(1..struct'Last); --will hold object indices in order for processing
      temp : SortElement;
   begin 
      for pos in struct'Range loop
         if struct(pos).Count = 0 then
            myQ(R) := map(pos);     --retrieve index of object
            R := R + 1;
         end if;
      end loop;
      
      while F <= R loop
         KN := KN - 1;
         while struct(F).next /= null loop
            pop(struct(F).next, temp);
            struct(map(temp)).Count := struct(map(temp)).Count - 1;
            if struct(map(temp)).Count = 0 then
               myQ(R) := map(struct(map(temp).Suc));
               R := R + 1;
            end if;
            F := F + 1;
            Free(temp); --declare unchecked deallocation
         end loop;
      end loop;
      
      if KN = 0 then --successful, print nodes
         for item in myQ'Range loop
            print(struct(myQ(item)));
         end loop;
      else
         for k in myQ'Range loop
            myQ(k) := 0;
         end loop;
      
      
      --probably seperate method
      
         for k in 1..struct'Last loop
            pop(struct(k).top, temp);
            struct(k).top := null; --pulling succ pointers off of object
            while (temp /= null) and (myQ(temp.suc) = null) loop
               myQ(map(p.Suc)) := k;
               if temp /= null then
                  pop(temp, temp);
               end if;
            end loop;
         end loop;
      end if;
      
   end TopologicalSort;

   procedure initialize (inputfile : in string; outputfile : string) is
      inFile : File_Type;
   begin
      Open(inFile, in_file, file);
      Get(inFile, size);
      declare
         struct : SortStructure (0..size);
         names : myNames(1..size);
         KN : integer := NA;
      begin
         for loc in 1..size loop
            Get(inFile, names(loc)); --reads & saves all node Names for later reference
         end loop;
         while not End_Of_File(inFile) loop
            declare
               pred : SortElement;
               succ : SortElement;
            begin
               Get(pred, succ); --will construct 2 new objects of SortElement type
               struct(map (succ)).Count := SortStructure(map (succ)).Count + 1;
               push(struct(map (pred)).Suc, succ); --adds succ object to pred stack
            end;
         end loop;
      end;
   end initialize;
         
         
   
end GenericTopSort;
