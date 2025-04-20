page 50112 "Statements Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Card';


    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Caption = 'Suggestion';
                    ToolTip = 'The suggestion for the statement.';
                    Editable = false;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Caption = 'Level';
                    ToolTip = 'The level of the statement.';
                    Editable = false;
                }
            }
        }
    }



    var
        Difficulty: Integer;
        Level: Text[50];
        Suggestion: Text[80];

    local procedure GetSuggestion()
    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-learning or remote training.';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Take a classroom training.';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Take a classroom training with a mentor.';
                end;
            else begin
                Level := 'Unknown';
                Suggestion := 'No suggestion available.';
            end;

        end;
    end;
}