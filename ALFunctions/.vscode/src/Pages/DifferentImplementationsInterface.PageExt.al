/*pageextension 50105 "My Customer List Extension" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        ifoo: Interface IFoo;
        ee: enum Enum1;
    begin
        ee := Enum1::Yes;
        ifoo := ee;
        ifoo.Foo(); // => YesFooImpl specified in Implementation on Yes value

        ee := Enum1::No;
        ifoo := ee;
        ifoo.Foo(); // => DefaultFooImpl specified in DefaultImplementation

        ee := Enum1.FromInteger(3); // No enum value matches this
        ifoo := ee;
        ifoo.Foo();  // => UnknownFooImpl specified in UnknownImplementation
    end;
}

interface IFoo
{
    procedure Foo();
}

codeunit 50140 DefaultFooImpl implements IFoo
{
    trigger OnRun()
    begin
    end;

    procedure Foo()
    begin
        Message('Default FOO');
    end;
}

codeunit 50141 ErrorFooImpl implements IFoo
{
    trigger OnRun()
    begin
    end;

    procedure Foo()
    begin
        Error('Error FOO');
    end;
}
codeunit 50142 YesFooImpl implements IFoo
{
    trigger OnRun()
    begin
    end;

    procedure Foo()
    begin
        Message('YES FOO');
    end;
}

enum 50101 Enum1 implements IFoo
{
    Extensible = true;
    UnknownValueImplementation = IFoo = ErrorFooImpl;
    DefaultImplementation = IFoo = DefaultFooImpl;
    Value(0; Yes)
    {

        Implementation = IFoo = YesFooImpl;
    }
    Value(1; No)
    {


    }

}*/