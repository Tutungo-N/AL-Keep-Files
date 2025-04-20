page 70000 "Expressions Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions Card';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter a value for Value One';
                    Caption = 'Value One';
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter a value for Value Two';
                    Caption = 'Value Two';
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    ToolTip = 'The result of the operation.';
                    Caption = 'Result';
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                ToolTip = 'Click to calculate the result';
                Image = ExecuteBatch;

                trigger OnAction()
                begin
                    Result := Value1 > Value2;
                end;
            }
        }
    }

    var
        Value1, Value2 : Integer;
        //MyCodeunit: Codeunit 50120;
        Result: Boolean;
}