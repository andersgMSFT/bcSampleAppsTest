table 50101 PowerAppsLanguageResources
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; LanguageCode; Text[6])
        {
            DataClassification = ToBeClassified;
        }
        field(3; ResourceKey; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; LocalValue; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }
}