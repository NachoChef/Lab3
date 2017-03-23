with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
package body topSort is

   --searches queue for specified value, returns true if value found
   function check (myQ : myQueue; node : integer) return boolean is
      ret : boolean := false;
   begin
      for loc in myQ'Range loop
         if myQ(loc) = node then
            ret := true;
         end if;
      end loop;
      return ret;
   end check;

   procedure initialize (size : integer) is
   begin
      declare
         F, R : integer := 1;
         tempTop : NodePtr;
         pred, succ : integer;
         NA, KN : integer := 0;
         struct : SortStructure(0..size);                    --holds structure elements
         myQ : myQueue(1..size) := (others => 0);            --tracks array indices
         Top : myQueue(1..size) := (others => 0);
      begin
         Put("Enter the number of relations: "); Get(NA);
         for i in 1..NA loop
            Put("Enter the predeccessor: "); Get(pred); 
            Put("Enter the successor: "); Get(succ);
            tempTop := struct(pred).Top;
            struct(pred).Top := new Node'(succ, tempTop);
            struct(succ).Count := struct(succ).Count + 1;
         end loop;
         KN := NA+1;
         
         for k in 1..size loop            --initial population
            if struct(k).Count = 0 then
               myQ(R) := k;
               R := R + 1;
            end if;
         end loop;
         
         while F <= size and then myQ(F) /= 0 loop    --while F links to a real node
            KN := KN - 1;
            tempTop := struct(F).Top;  --pull stack off of node
            struct(F).Top := null;
            while tempTop /= null loop
               struct(tempTop.Suc).Count := struct(tempTop.Suc).Count - 1;
               if struct(tempTop.Suc).Count = 0 then
                  myQ(R) := tempTop.Suc;
                  R := R + 1;
               end if;
               tempTop := tempTop.Next;
            end loop;
            F := F + 1;          --advance to next item in queue
         end loop;
         
         if KN = 0 then
            Put("One solution: ");
            for loc in 1..size loop
               put(myQ(loc), width => 2);
            end loop;
         else 
            Put("The following nodes are in a loop: ");
            for loc in 1..size loop       --clear queue
               myQ(loc) := 0;
            end loop;
            F := 1;                       --reset front/rear 
            R := 1;
            
            for loc in 1..size loop
               tempTop := struct(loc).Top;
               struct(loc).Top := null;   --pulls stack off of element
               while tempTop /= null and then myQ(tempTop.Suc) = 0 loop    --while stack not empty & node not already in list
                  myQ(tempTop.Suc) := loc;
                  tempTop := tempTop.Next;
               end loop;
            end loop;
            
            --find F with myQ(F) /= 0;
            while myQ(F) = 0 loop
               F := F + 1;
            end loop;
            
            while Top(F) = 0 loop
               Top(F) := 1;
               F := myQ(F);
            end loop;
            
            while Top(F) /= 0 loop
               put(F, width => 2);
               Top(F) := 0;
               F := mYQ(F);
            end loop;
            
         end if;
       end;
   end initialize;
         
end topSort;