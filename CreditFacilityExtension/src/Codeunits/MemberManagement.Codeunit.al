codeunit 50000 "Member Management"
{

    var
    //NoSeriesManagement: Codeunit "No. Series";
    //GeneralSetup: Record "General Setup";
    //isHandled: Boolean;
    //MemberTab: Record "Member Application";
    //RegisteredMember: Record "Registered Members";

    //MemberNo: Code[20];

    trigger OnRun()
    var


    begin


    end;

    procedure RegisterMember(var MemberRec: Record "Member Application")
    var
        RegisteredMember: Record "Registered Members";


    begin

        if RegisteredMember.Get(MemberRec."Member Application No.") then
            Error('This member is already registered.');
        RegisteredMember.Init();
        RegisteredMember.TransferFields(MemberRec);
        RegisteredMember.Insert();

        MemberRec.Delete();

    end;


    /*procedure RegisterMember(MemberAppNo: Code[20])
    begin
        if MemberTab.Get(MemberAppNo) then begin
            MemberNo := '';
            MemberNo := MemberTab."Member Application No.";

            if not RegisteredMember.Get(MemberNo) then begin
                RegisteredMember.Init();
                RegisteredMember."Member Application No." := MemberNo;
                RegisteredMember."Full Name" := MemberTab."Full Name";
                RegisteredMember."Registration Date" := MemberTab."Registration Date";
                RegisteredMember."Email Address" := MemberTab."Email Address";
                RegisteredMember."Member Loan Category" := MemberTab."Member Loan Category";
                RegisteredMember."Member Type" := MemberTab."Member Type";
                RegisteredMember."National ID No." := MemberTab."National ID No.";
                RegisteredMember.Nationality := MemberTab.Nationality;
                RegisteredMember."Official Phone Number" := MemberTab."Official Phone Number";
                RegisteredMember.Gender := MemberTab.Gender;
                RegisteredMember."Marital Status" := MemberTab."Marital Status";
                RegisteredMember."Registration No." := MemberTab."Registration No.";
                RegisteredMember."First Name" := MemberTab."First Name";
                RegisteredMember."Second Name" := MemberTab."Second Name";
                RegisteredMember."Last Name" := MemberTab."Last Name";
                RegisteredMember.Insert();
            end;

            MemberTab."Member Application No." := MemberNo;
            MemberTab.Registered := true;
            MemberTab.Modify();

        end;
    end;*/










}