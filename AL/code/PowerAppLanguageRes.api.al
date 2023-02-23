page 50104 PowerAppLanguageResources
{
    PageType = API;
    Caption = 'PowerApp Language Resources';
    EntityName = 'PowerAppLanguageResource';
    EntitySetName = 'PowerappLanguageResources';
    APIPublisher = 'microsoft';
    APIGroup = 'powerApps';
    APIVersion = 'beta';

    SourceTable = PowerAppLanguageResources;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                }
                field(LanguageCode; Rec.LanguageCode)
                {
                    ApplicationArea = All;
                    Caption = 'Language Code';
                }
                field(LocalValue; Rec.LocalValue)
                {
                    ApplicationArea = All;
                    Caption = 'Local Value';
                }
            }
        }
    }
}