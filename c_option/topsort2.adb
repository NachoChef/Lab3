with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
package body topSort2 is

   procedure initialize (size : integer) is
   NA : integer;
   begin     
      Put("Enter the number of relations: "); Get(NA); 
      declare
         F, R : integer;
         tempTop : NodePtr;
         pred, succ : integer;
         KN : integer := NA;
         Top : SortStructure(1..NA); 
         Qlink : array(0..NA) of integer;  
         Count : array(1..NA) of integer := (others => 0);
         K : integer;
      begin
         
         for i in 1..NA loop
            Put("Enter the predeccessor: "); Get(pred); 
            Put("Enter the successor: "); Get(succ);
            tempTop := new Node;
            tempTop.Suc := succ;
            tempTop.Next := Top(pred);
            Top(pred) := tempTop;
            Count(succ) := Count(succ) + 1;
         end loop;
                 
         R := 0;
         Qlink(0) := 0;
         for k in 1..NA loop  
            if Count(K) = 0 then
               Qlink(R) := k;
               R := k;
            end if;
         end loop;
         F := Qlink(0);
         
         while F /= 0 loop   
            KN := KN - 1;
            tempTop := Top(F);
            Top(F) := null;
            while tempTop /= null loop
               Count(tempTop.Suc) := Count(tempTop.Suc) - 1;
               if Count(tempTop.Suc) = 0 then
                  Qlink(R) := tempTop.Suc;
                  R := tempTop.Suc;
               end if;
               tempTop := tempTop.Next;
            end loop;
            F := Qlink(F);       
         end loop;
         
         if KN = 0 then
            Put("A solution: ");
            for loc in 0..size loop
               if Qlink(loc) /= 0 then
                  put(Qlink(loc), width => 2);
               end if;
            end loop;
         else 
            Put("The following nodes are in a loop: ");
            for loc in 1..NA loop      
               Qlink(loc) := 0;
            end loop;
            
            for k in 1..NA loop
               tempTop := Top(k);
               Top(k) := null;  
               while tempTop /= null and then Qlink(tempTop.Suc) = 0 loop   
                  Qlink(tempTop.Suc) := k;
                  tempTop := tempTop.Next;
               end loop;
            end loop;
            
            K := 0;
            while Qlink(K) = 0 loop
               K := K + 1;
            end loop;
            
            while Top(K) = null loop
               Top(K) := new Node'(1, Top(K));
               K := Qlink(K);
            end loop;
            
            while Top(K) /= null loop
               put(K, width => 2);
               Top(K) := null;
               K := Qlink(K);
            end loop;
            
         end if;
       end;
   end initialize;
         
end topSort2;