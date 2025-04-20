codeunit 50115 "Ternary Operator"
{
    Subtype = Normal;
    Access = Internal;

    procedure TestTernaryOperator(a: Boolean; b: Text)
    var
        c: Code[20];
    begin
        // Using IF-THEN ELSE
        if a then
            b := 'True'
        else
            b := 'False';
        // Using Ternary Operator
        // b := a ? 'True' : 'False';
    end;

    trigger OnRun()
    var
        a: Boolean;
        b: Text[20];
    begin


    end;
}