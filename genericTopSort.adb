--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***
with Ada.Text_IO; use Ada.Text_IO;
package body GenericTopSort is
   
   procedure push (NewNode : in NodePointer; NodeStack : in out NodePointer) is
      nodeTemp : NodePointer := NewNode;
   begin
      nodeTemp.Next := NodeStack;
      NodeStack.Next := nodeTemp;
   end push;
   
   procedure pop (outNode : out NodePointer; NodeStack : in out NodePointer) is
   begin
      if NodeStack /= null then
         outNode := NodeStack;
         NodeStack := outNode.Next;
      end if;
   end pop;
   
   --retrieves position of an object label
   function map (names : in myNames; obj : in SortElement) return integer is
   begin
      for loc in names'Range loop
         if obj.equals(names(loc)) then      --fix this
            return loc;
         end if;
      end loop;
      return -1;      --if item not found, will cause index check error
   end map;
   
   procedure TopologicalSort(struct : SortStructure; NA : integer; names : myNames) is 
      myStruct : SortStructure := struct;
      F, R : integer := 1;
      myQ : QLink(1..struct'Last); --will hold object indices in order for processing
      temp : SortElement;
      KN : integer := NA;
   begin 
      for pos in struct'Range loop
         if struct(pos).Count = 0 then
            myQ(R) := pos;     --retrieve index of object
            R := R + 1;
         end if;
      end loop;
      
      while F <= R loop
         KN := KN - 1;
         while struct(F).Top /= null loop
            pop(temp, struct(F).Top);
            mystruct(map(names, temp)).Count := mystruct(map(names, temp)).Count - 1;
            if mystruct(map(names, temp)).Count = 0 then
               myQ(R) := map(mystruct(map(names, temp.Next)).Suc);
               R := R + 1;
            end if;
            F := F + 1;
            Free(temp); --declare unchecked deallocation
         end loop;
      end loop;
      
      if KN = 0 then --successful, print nodes
         for loc in myQ'Range loop
            put(mystruct(myQ(loc)));
         end loop;
      else
         for k in myQ'Range loop
            myQ(k) := 0;
         end loop;
      
      
      --probably seperate method
      
         for k in 1..mystruct'Last loop
            pop(mystruct(k).top, temp);
            struct(k).top := null; --pulling succ pointers off of object
            while (temp /= null) and (myQ(temp.suc) = null) loop
               myQ(map(temp.Suc)) := k;
               if temp /= null then
                  pop(temp, temp);
               end if;
            end loop;
         end loop;
      end if;
      
   end TopologicalSort;

   procedure initialize (inputfile : in string; outputfile : string) is
      inFile : File_Type;
      size : integer;
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