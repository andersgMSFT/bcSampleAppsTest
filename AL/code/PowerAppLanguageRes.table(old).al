table 50100 PowerAppLanguageResources
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
        field(3; LocalValue; Text[100])
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