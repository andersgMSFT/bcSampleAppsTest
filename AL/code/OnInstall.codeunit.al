codeunit 50101 OnInstall
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        customerRecord: Record Customer;
        itemRecord: Record Item;
    begin
        customerRecord.Init();
        customerRecord.Validate(Name, 'TEST');
        customerRecord.Insert(true);
    end;


    procedure AddCustomer(customerName: Text)
    var
        customerRecord: Record Customer;
    begin
        customerRecord.Init();
        customerRecord.Validate(Name, customerName);
        customerRecord.Insert(true);
    end;
}