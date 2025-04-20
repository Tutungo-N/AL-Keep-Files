codeunit 50114 "Case Statement"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        a: Integer;

    /*begin
        case "Document Type" of
            "Document Type"::Order:
                a := 1;
            "Document Type"::Invoice:
                a := 2;
            "Document Type"::CreditMemo:
                a := 3;
            "Document Type"::Quote:
                a := 4;
        
            else
                a := 0;

        end;
    end;*/
    begin
        a := 1;
        case a of
            1:
                Message('a is 1');
            2:
                Message('a is 2');
            3:
                Message('a is 3');
            else
                Message('a is something else');
        end;
    end;
}