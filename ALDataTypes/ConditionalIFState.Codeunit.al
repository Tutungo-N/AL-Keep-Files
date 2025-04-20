codeunit 50120 "ConditionalIFState"
{
    Subtype = Normal;
    Access = Internal;
    //ApplicationArea = All;

    trigger OnRun()
    var
        a, b, c : Integer;
        Amount: Decimal;
        Sales: Decimal;
        Reason: Option Return,Recharge;
        ReasonForReturn: Option Defective,Unsatisfied,OtherBetterOptions;
    begin
        a := 1;
        b := 2;
        c := 3;

        a := 10;
        b := 5;
        if a > b then begin
            c := a - b;
            Message('%1', c);
        end
        else begin
            c := a + b;
            Message('%1', c);
        end;

        if Amount <> 0 then
            if Amount > 0 then
                Sales := Sales + Amount * 1.5
            else
                if Reason = Reason::Return then
                    if ReasonForReturn = ReasonForReturn::Defective then
                        Sales := Sales + Amount * 0.5
                    else if ReasonForReturn = ReasonForReturn::Unsatisfied then
                        Sales := Sales + Amount * 0.75
                    else if ReasonForReturn = ReasonForReturn::OtherBetterOptions then
                        Sales := Sales + Amount * 0.9;
        if Reason = Reason::Recharge then
            Sales := Sales + Amount * 0.5;



    end;

    procedure TestIF(m: Integer; n: Integer): Integer
    begin
        if m > n then begin
            exit(m - n);
        end else begin
            exit(m + n);
        end;
    end;
}
