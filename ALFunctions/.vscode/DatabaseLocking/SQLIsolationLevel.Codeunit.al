codeunit 50150 "SQL Isolation Level"
{
    trigger OnRun()
    begin

    end;

    // The below example shows AL code with SQL isolation level hints annotated on database reads, 
    // which solely relies on transaction determined locking.
    local procedure CurrentBehavior()
    var
        customer: Record Customer;
        OtherCustomer: Record Customer;
        Curr: Record Currency;
    begin
        customer.FindFirst(); // READUNCOMMITTED

        // Heighten isolation level for customer table
        customer.LockTable();
        customer.FindLast(); // UPDLOCK

        // Also impacts other instances of same table
        OtherCustomer.FindSet(); // UPDLOCK

        // The following example shows AL code with SQL isolation level hints annotated on database reads, 
        // with record instance isolation level used to override the transaction's isolation level.
        OtherCustomer.ReadIsolation := IsolationLevel::ReadUncommitted; // Explicitly select another 
        // isolation level than the transaction's 
        OtherCustomer.FindSet(); // READUNCOMMITTED

        // But does not impact other tables
        Curr.Find(); // READUNCOMMITTED


    end;

}