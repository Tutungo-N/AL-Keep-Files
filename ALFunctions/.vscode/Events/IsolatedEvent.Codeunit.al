codeunit 50136 "Isolated Event"
{
    Subtype = Normal;
    Access = Public;

    trigger OnRun()
    var
        Counter: Integer;
        Cust: Record Customer;
    begin
        // Precondition: Customer table isn't empty
        if (Cust.IsEmpty) then
            Error('Customer table is empty.');

        MyIsolatedEvent(Counter);

        //Code only reaches this point because the above event is isolated and error thrown in FaillingEventSubscriber is caught
        if Counter <> 2 then
            Error('Both event subscribers should have incremented the counter.');

        //Precondition: Customer table hasn't been truncated
        if (Cust.IsEmpty) then
            Error('Customer table was truncated, failing event subsciber was not rolled back.');
    end;

    [InternalEvent(false, true)]
    local procedure MyIsolatedEvent(var Counter: Integer)
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Isolated Event", MyIsolatedEvent, '', false, false)]
    local procedure FaillingEventSubscriber(var Counter: Integer)
    var
        Cust: Record Customer;
    begin
        Counter := Counter + 1;// Change will persist after throwing. Only database changes will be rolled back.

        Cust.DeleteAll(); // Database changes will be rolled back upon error.

        Error('This is a failing event subscriber.'); // This will be caught by the isolated event and not propagated to the caller.
        //Counter := Counter + 1; // This line will not be executed because of the error above.
        Counter += 1; // This line will not be executed because of the error above.
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Isolated Event", MyIsolatedEvent, '', false, false)]
    local procedure IncreasingEventSubscriber(var Counter: Integer)
    begin
        Counter := Counter + 1;
    end;


}