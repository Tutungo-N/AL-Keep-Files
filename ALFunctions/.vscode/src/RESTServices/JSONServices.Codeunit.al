codeunit 50153 "Work With Json"
{
    trigger OnRun()
    begin

    end;

    procedure GetSalary(CompanyData: JsonToken; Employee: Text) Salary: Decimal;
    var
        JPathExpr: Text;
        SalaryToken: JsonToken;
    begin
        JPathExpr := '$.company.employees[?(@.id==''' + Employee + ''')].salary';
        CompanyData.SelectToken(JPathExpr, SalaryToken);

        Salary := SalaryToken.AsValue().AsDecimal();

    end;
}