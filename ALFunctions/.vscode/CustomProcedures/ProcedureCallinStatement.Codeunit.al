codeunit 50123 "Procedure Call Statement"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        TotalCost: Decimal;
        Quantity: Integer;
    begin
        if GuiAllowed then
            Message('GUI is allowed!'); // Test if GUI is available.

        if Quantity > 0 then begin
            MyCustomFunction(); // Procedure call in a statement
        end else begin
            TotalCost := Quantity * CalculatePrice();// Procedure call in an expression
        end;
    end;

    procedure MyCustomFunction()
    begin
        Message('My custom function was called!');
    end;

    procedure CalculatePrice(): Decimal //Performs calculation and returns the result as decimal
    begin
        exit(100.00);
    end;


    procedure GuiAllowed(): Boolean //Checks if GUI is allowed and returns the result as boolean
    begin
        exit(true);
    end;

    procedure MyCustomFunction2()
    var
        n: Integer;
    begin
        n := 10;
        if n > 0 then begin
            Message('n is greater than 0!');
        end else begin
            Message('n is not greater than 0!');
        end;
    end;

    procedure MyCustomFunction3()
    begin
        k := 10;
    end;//Another custom function that does not return a value

    var
        k: Integer; // Variable declaration for k
        l: Integer; // Variable declaration for l
        m: Integer; // Variable declaration for m
        n: Integer; // Variable declaration for n

}