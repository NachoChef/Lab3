with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
package body topSort is
   procedure initialize (size : integer) is
   begin
      declare
         F, R : integer := 1;
         tempTop : NodePtr;
         pred, succ : integer;
         NA, KN : integer := 0;
         struct : SortStructure(0..size);                    --holds structure elements
         myQ : myQueue(1..size) := (others => 0);            --tracks array indices
      begin
         Put("Enter the number of relations: "); Get(NA);
         for i in 1..NA loop
            Put("Enter the predeccessor: "); Get(pred); 
            Put("Enter the successor: "); Get(succ);
            struct(pred).Top := new Node'(succ, struct(pred).Top);
            struct(succ).Count := struct(succ).Count + 1;
         end loop;
         KN := NA;
         
         for k in 1..size loop            --initial population
            if struct(k).Count = 0 then
               myQ(R) := k;
               R := R + 1;
               New_Line;
            end if;
         end loop;
         
         while F < size loop                 
            KN := KN - 1;
            tempTop := struct(F).Top;
            struct(F).Top := null;
            while tempTop /= null loop
               struct(tempTop.Suc).Count := struct(tempTop.Suc).Count - 1;
               if struct(tempTop.Suc).Count = 0 then
                  myQ(R) := tempTop.Suc;
                  R := R + 1;
               end if;
               tempTop := tempTop.Next;
            end loop;
            F := F + 1;
         end loop;
         
         if KN = 0 then
            for loc in 1..size loop
               put(myQ(loc));
            end loop;
         else                             --loop exists
            for loc in 1..size loop       --clear loop
               myQ(loc) := 0;
            end loop;
            F := 1;
            R := 1;
            
            for loc in 1..size loop
               tempTop := struct(loc).Top;
               struct(loc).Top := null;   --pulls stack off of element
               while (tempTop /= null) and then (struct(tempTop.suc).Count /= 0) loop
                  myQ(R) := tempTop.Suc;
                  if tempTop = null then
                     tempTop := tempTop.Next;
                  end if;
               end loop;
            end loop;
            for loc in 1..size loop
               put(mYQ(loc));
            end loop;
         end if;
       end;
   end initialize;
         
end topSort;