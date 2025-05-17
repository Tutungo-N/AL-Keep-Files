page 50100 "Armstrong Card Page"
{
    PageType = Card;

    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Armstrong Card';


    layout
    {
        area(content)
        {
        }
    }
    trigger OnOpenPage()
    var
        TryMethodExecution: Codeunit "Try Method Execution";
        Counter1: Integer;
        CounterText: Text[10];
        Counter2: Integer;
        PowerNumber: Integer;
        Number: Integer;
        Result: Integer;
        ResultList: List of [Integer];
        ArmstrongNumbers: Text[100];
        ch10, ch13 : Char;
        NewLine: Text[10];
    begin
        TryMethodExecution.TryMethod(); // Call the TryMethod from the codeunit

        ch10 := 10;
        ch13 := 13;

        NewLine := Format(ch10) + Format(ch13);
        for Counter1 := 0 to 10000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result += Power(Number, PowerNumber);
            end;

            if Result = Counter1 then
                //ResultList.Add(Counter1); // Add the Armstrong number to the list
                ResultList.Add(Result);
            //Result := 0; // Reset the result for the next number    
            Clear(Result); // Reset the result for the next number
        end;

        foreach Counter1 in ResultList do
            ArmstrongNumbers += NewLine + Format(Counter1); // Concatenate the Armstrong numbers with a newline

        Message(ArmstrongNumbers);
    end;
}
