pageextension 50100 "Error Collection Extension" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            // This action doesn't collect errors. Any procedure will stop on the first error that occurs.
            // and return the error.
            action(Post)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    i: Record Integer;
                begin
                    i.Number := -9;
                    Codeunit.Run(Codeunit::"My Post Error", i);

                end;
            }
            // This action collects errors. It will collect all errors and return them at once
            // The PostWithErrorCollect procedure continues on errors and displays the errors in a dialog at the end.
            action(PostWithErrorCollect)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollect();
                end;
            }
            // This action collects errors. The PostWithErrorCollectCustomUI procedure continues on errors,
            // and displays error details in a list page when done.
            // This implementation illustrates how you could design your own UI for displaying and
            // troubleshooting errors.
            action(PostWithErrorCollectCustomUI)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollectCustomUI();
                end;
            }
        }
    }

    var
        cc: Record Customer;

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollect()
    var
        i: Record Integer;
    //ErrorList: List of [Text[250]];
    begin
        i.Number := -9;
        Codeunit.Run(Codeunit::"My Post Error", i);
        // After executing the codeunit, there will be collected errors,
        // and an error dialog will display the errors as you exit this procedure.


    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollectCustomUI()
    var
        errors: Record "Error Message" temporary;
        error: ErrorInfo;
        i: Record Integer;
    begin
        i.Number := -9;
        // Use Codeunit.Run to rollback any changes to the database within Codeunit::DoPost 
        // in case of errors
        if not Codeunit.Run(Codeunit::"My Post Error", i) then begin
            // If Codeunit.Run fails, then you encountered a non-collectable error.
            // Add this to the list of errors
            error.TableId := errors.ID + 1;
            errors.Message := GetLastErrorText();
            errors.Insert();
        end;

        // If there are collected errors, iterate through each of them and add them to the 'Error Message' record.
        if HasCollectedErrors then
            foreach error in System.GetCollectedErrors() do begin
                errors.ID := errors.ID + 1;
                errors.Message := error.Message;
                errors.Validate("Record ID", error.RecordID);
                errors.Insert();
            end;

        // Clear the collected erros to avoid displaying the built-in error dialog.
        // Then show our own custom "Error Messagges" page instead.
        ClearCollectedErrors();

        page.RunModal(page::"Error Messages", errors);
    end;


}