codeunit 50127 "Parameters Value"
{
    Subtype = Normal;
    Access = Internal;

    trigger OnRun()
    var
        myInteger: Integer;
        myResult: Integer;
    begin
        myInteger := 45;
        myResult := MyParamValueFunction(myInteger); // Call the function with myInteger as a parameter
        Message('The result is: %1', myInteger); // Returns 45
        Message('The result is: %1', myResult); // Returns 33

    end;

    procedure MyParamValueFunction(paramAB: Integer): Integer
    begin
        paramAB := 33; // This will not affect the original myInteger variable in OnRun
        exit(paramAB); // Return the modified value of paramAB  
    end; // Function that takes an integer parameter by value
}