page 50100 PowerAppLanguageResList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = PowerAppsLanguageResources;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                }
                field(LanguageCode; Rec.LanguageCode)
                {
                    ApplicationArea = All;
                }
                field(ResourceKey; Rec.ResourceKey)
                {
                    ApplicationArea = All;
                }
                field(LocalValue; Rec.LocalValue)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}