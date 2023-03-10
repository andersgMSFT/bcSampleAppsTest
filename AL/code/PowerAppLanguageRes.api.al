page 50104 PowerAppLanguageResources
{
    PageType = API;
    Caption = 'PowerApp Language Resources';
    EntityName = 'PowerAppLanguageResource';
    EntitySetName = 'PowerappLanguageResources';
    APIPublisher = 'microsoft';
    APIGroup = 'powerApps';
    APIVersion = 'beta';

    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "Power Apps Labels";
    SourceTableTemporary = true;
    Extensible = false;
    ODataKeyFields = "Label ID";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(labelId; Rec."Label ID")
                {
                    Caption = 'Label Id';
                }
                field(displayName; Rec."Text Value")
                {
                    Caption = 'Text Value';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        PowerAppsLabelMgt: Codeunit "Power Apps Label Management";
        LanguageFilter: Text;
    begin
        LanguageFilter := Rec.GetFilter("Language Code");

        PowerAppsLabelMgt.GetLabelsForUserLanguage(Rec, UserSecurityId());
    end;
}