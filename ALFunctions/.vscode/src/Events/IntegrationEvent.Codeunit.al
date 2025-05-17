codeunit 50133 "Integration Event"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    begin
        if TryMethod() then
            Message('Success')
        else
            Message('An issue came up. Do not fret! It is not your fault!');

    end;

    [TryFunction]
    procedure TryMethod()
    begin
        Error('An error occurred during the operation.');
    end;

    procedure Post(DocumentNo: Code[20]; LineNo: Integer)
    var
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";

    begin
        if (SalesLine.Get(SalesLine."Document Type"::Order, DocumentNo, LineNo)) then begin
            SalesHeader.Get(SalesHeader."Document Type"::Order, DocumentNo);

            OnBeforePostSalesLine(SalesLine, SalesHeader);
            DoPost(SalesLine);
            OnAfterPostSalesLine(SalesLine);

        end;
    end;

    local procedure DoPost(var SalesLine: Record "Sales Line")
    begin

    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforePostSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterPostSalesLine(var SalesLine: Record "Sales Line")
    begin
        // Do something after posting the sales line
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeAction()
    begin
    end;
}




