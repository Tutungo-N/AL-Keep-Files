codeunit 50128 "Parameters Reference"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 45;
        myResult := MyParamReferenceFunction(myInteger); // Call the function with myInteger as a parameter
        Message('The result is: %1', myInteger); // Returns 33
        Message('The result is: %1', myResult); // Returns 33
    end;

    procedure MyParamReferenceFunction(var paramAB: Integer): Integer
    begin
        paramAB := 33; // This will affect the original myInteger variable in OnRun
        exit(paramAB); // Return the modified value of paramAB  
    end; // Function that takes an integer parameter by reference
}