page 50103 CustomersWithImage
{
    PageType = API;
    Caption = 'Customers with image';
    EntityName = 'CustomerWithImage';
    EntitySetName = 'CustomersWithImage';

    APIPublisher = 'microsoft';
    APIGroup = 'powerApps';
    APIVersion = 'beta';

    SourceTable = Customer;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'System ID';
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'DisplayName';
                }

                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(mail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(phone; Rec."Phone No.")
                {
                    Caption = 'Phone';
                }
                field(picture; NameValueBufferBlob."Value BLOB")
                {
                    Caption = 'Picture';
                }
                field(itemImageText; Rec.Image)
                {
                    Caption = 'Picture reference';
                }
            }
        }
    }

    var
        NameValueBufferBlob: Record "Name/Value Buffer" temporary; // This can be any table with a field of type Blob
        ConfigMediaBuffer: Record "Config. Media Buffer" temporary; // This can be any table with a field of type Media

    trigger OnAfterGetRecord()
    var
        TenantMedia: Record "Tenant Media";
        OutStr: OutStream;
        InStr: InStream;
        MediaId: Guid;
        RecordR: RecordRef;
        FieldR: FieldRef;
    begin
        NameValueBufferBlob.DeleteAll();
        NameValueBufferBlob.Init();
        NameValueBufferBlob."Value BLOB".CreateOutStream(OutStr);

        // **BEGIN**
        Rec.Image.ExportStream(OutStr);
        NameValueBufferBlob.Insert();
    end;
}