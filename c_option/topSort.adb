with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
package body topSort is

   procedure initialize (size : integer) is
   begin
      declare
         F, R, K : integer := 0;
         tempTop : NodePtr;
         pred, succ : integer;
         NA, KN : integer := 0;
         struct : SortStructure(0..size);                    --holds structure elements
         myQ : myQueue(0..size) := (others => 0); 
      begin
         Put("Enter the number of relations: "); Get(NA);
         for i in 1..NA loop
            Put("Enter the predeccessor: "); Get(pred); 
            Put("Enter the successor: "); Get(succ);
            tempTop := struct(pred).Top;
            struct(pred).Top := new Node'(succ, tempTop);
            struct(succ).Count := struct(succ).Count + 1;
         end loop;
         
         KN := NA;
         
         for k in 1..size loop            --initial population
            if struct(k).Count = 0 then
               myQ(R) := k;
               R := K;
            end if;
         end loop;
         F := myQ(0);
         --R points to rear of Queue, F front
         
         while F /= 0 loop    --while F links to a real node and doesn't exceed size
            tempTop := struct(F).Top;  --pull stack off of node
            while tempTop /= null loop
               KN := KN - 1;
               struct(tempTop.Suc).Count := struct(tempTop.Suc).Count - 1;
               if struct(tempTop.Suc).Count = 0 then
                  myQ(R) := tempTop.Suc;
                  R := tempTop.Suc;
               end if;
               tempTop := tempTop.Next;
            end loop;
            F := myQ(F);          --advance to next item in queue
         end loop;
         New_Line;
         
         if KN = 0 then
            Put("One solution: ");
            while myQ(F) /= 0 loop
               put(myQ(F), Width => 2);
               F := myQ(F);
            end loop;
         else  --print a loop
            Put("The following nodes are in a loop: ");
            for k in 1..size loop
               myQ(k) := 0;
            end loop;
            
            --I had to modify this statement in order to find a loop
            --otherwise, the while structure at the bottom that follows the loop would stop at index 0
            --moving Qlink(2) = 1, Qlink(1) = 0, Qlink(0) = 0
            --the unmodified resulting data structure was:
            -- 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | qlink/index
            ------------------------------------------------------
            -- 0 | 0 | 1 | 1 | 6 | 0 | 0 | 2 | 3 | 7 | 
            --which does not show a loop. Thus the algorithm only marks indices 0, 1, & 2
            --I also had to not clear the stack for struct(k) until the final while loop.
            for k in 1..size loop
               tempTop := struct(k).Top;
               while tempTop /= null and then myQ(k) = 0 loop
                  myQ(k) := tempTop.Suc;
                  if tempTop /= null then
                     tempTop := tempTop.Next;
                  end if;
               end loop;
            end loop;
            
            K := 1;
            while myQ(K) = 0 loop
               K := K + 1;
            end loop;
            
            loop
               struct(K).Top := toPTR(1);
               K := myQ(K);
            exit when struct(K).Top /= null;
            end loop;
            
            while struct(k).Top /= null loop
               put(struct(k).Top.Suc, width => 2);
               struct(k).Top := null;
               K := myQ(k);
            end loop;

         end if;
       end;
   end initialize;
         
end topSort;