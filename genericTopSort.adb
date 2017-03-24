--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***
with Ada.Text_IO; use Ada.Text_IO;
package body GenericTopSort is
   
   procedure TopologicalSort (struct : SortStructure; NA : integer; objList : PPoint) is 
      myStruct : SortStructure := struct;
      F, R : integer := 1;
      myQ : array(1..struct'Last) of integer := (others => 0); --will hold object indices in order for processing
      temp : PPoint;
      KN : integer := NA;
   begin 
      for pos in struct'Range loop
         if struct(pos).Count = 0 then
            myQ(R) := pos;     --retrieve index of object
            R := R + 1;
         end if;
      end loop;
      
      while F < struct'Last loop
         KN := KN - 1;
         while struct(F).Top.Count /= 0 loop
            temp := AbstStack.pop(struct(F))
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
   
   function map (struct : SortStructure; obj : PPoint) return integer is
      loc : integer := 1;
   begin
   loop
      if struct(loc).obj = obj then
         return loc;
      else
         loc := loc + 1;
      end if;
   end loop;
   end map;

   procedure initialize (inputfile : in string; outputfile : in string; objects : PPoint) is
      inFile : File_Type;
      size : integer;
      objList : PPoint := objects;
   begin
      Open(inFile, in_file, file);
      Get(inFile, size);
      declare
         struct : SortStructure (1..size);
         NA : integer;
      begin
         for i in 1..size loop
            struct(i).obj := objList;
            objList := objList.Next;
            struct(i).Top := new AbstStack(PPoint);
         end loop;
         
         Get(inFile, NA);           --get number of relations
         for i in 1..NA loop
            declare
               pred : PPoint;
               succ : PPoint;
            begin
               Get(inFile, pred, succ, objects);  --will construct 2 new objects of Parent subtype, parse types
               struct(map(struct, objects)).Count := SortStructure(map(struct, objects)).Count + 1;
               push(struct(map(struct, objects)).Suc, succ); --adds succ object to pred stack
            end;
         end loop;
      end;
      Close(inFile);
   end initialize;
   
end GenericTopSort;