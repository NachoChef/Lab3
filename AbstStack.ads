package AbstStck is
  type AbstractStack is limited private;

  type AbstractStackElement is tagged private;
  type AbstractStackElementPtr is 
          access all AbstractStackElement'Class;

  procedure Push(Stack: access AbstractStack; Y: in AbstractStackElementPtr);
  function Pop(Stack: access AbstractStack) return AbstractStackElementPtr;
  function StackSize(Stack: AbstractStack) return integer;

private
  type AbstractStackElement is tagged 
    record
       Next: AbstractStackElementPtr;
    end record;

  type AbstractStack is limited 
    record
      Count: integer := 0;
      Top: AbstractStackElementPtr := null;
    end record;
end AbstStck;