codeunit 50102 "Error Method"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        ErrorMethod: Codeunit "Error Method";
    begin
        ErrorMethod.Test();
    end;

    procedure Test()
    var
        ErrorMethod: Codeunit "Error Method";
    begin
        ErrorMethod.Test();
        Message('Test method called successfully!');
        Message('1');
        Message('2');
        Message('3');
        Error('OOPS! Something went wrong.');
        Message('4');
    end;
}
// CalcFields, CalcSums, FieldError, FieldName, Init, TestField, and Validate Methods.