page 50120 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                // ApplicationArea = All;
                //Caption = 'ActionName';
                Image = Action;
                //ToolTip = 'Click to run MyCodeunit';
                //RunObject = Codeunit "MyCodeunit";

                trigger OnAction()
                var
                    CodeunitAA: Codeunit "MyCodeunit";
                    Result: Text[50];
                begin
                    Result := CodeunitAA.MyFunction('Hello', '42');
                    Message('This is the output %1', Result);
                    // Handle the result if needed
                end;

            }
        }
    }


}