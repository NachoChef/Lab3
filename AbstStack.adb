--Justin Jones
--COSC 3319.01 Spring 2017
--Lab 3
--
--***'B' OPTION***

package body AbstStack is
procedure Push(Stack: access AbstractStack; Y: in AbstractStackElementPtr) is
    Pt: AbstractStackElementPtr;
  begin
    Y.Next := Stack.Top;  Stack.Top := Y;  Stack.Count := Stack.Count + 1;
  end Push;

  function Pop(Stack: access AbstractStack) return AbstractStackElementPtr is
   Pt: AbstractStackElementPtr;
  begin
   if Stack.Top = null then -- Check for underflow.
     return null; 
   end if;
   Stack.Count := Stack.Count - 1;
   Pt := Stack.Top;  Stack.Top := Stack.Top.Next;  -- Pop stack, note hemmoraging.
  return Pt;
  end Pop;

  function StackSize(Stack: AbstractStack) return integer is
  begin  return Stack.Count;  end StackSize;
end AbstStack;
