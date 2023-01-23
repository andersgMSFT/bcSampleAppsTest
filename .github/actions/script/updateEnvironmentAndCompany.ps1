[CmdletBinding()]
param(
    [Parameter(Position = 0, mandatory = $true)] [string] $companyId,
    [Parameter(Position = 1, mandatory = $true)] [string] $environmentName
)

function getCurrentSettings {
    $connectionFiles = Get-ChildItem -Recurse -File -Include "Connections.json";    
    foreach ($connectionFile in $connectionFiles) {
        $connectionsFilePath = $connectionFile.FullName;
        $connectionsfile = (Get-ChildItem $connectionsFilePath);
        
        if ($connectionsfile.Exists) {
            try {
                $jsonFile = Get-Content $connectionsfile.FullName | ConvertFrom-Json;
                $ConnectorNodeNames = ($jsonFile | Get-Member -MemberType NoteProperty).Name;

                # We don't know the name of the connector node, so we need to loop through all of them
                foreach($connectorNodeName in $ConnectorNodeNames){
                    $connectorNode = $jsonFile.$connectorNodeName;
                    if($connectorNode.connectionRef.displayName -eq "Dynamics 365 Business Central"){
                        $currentEnvironmentAndCompany = ($connectorNode.datasets | Get-Member -MemberType NoteProperty).Name;
                        return $currentEnvironmentAndCompany;     
                    }
                }

            }
            catch {
                Write-Error "Could not find connector node in file: " + $connectorId;
                return "";
            }
            
        }
        else {
            Write-Error "Could not find file: " + $connectionsfile;
            return "";
        }
    }
    Write-Error "No connection files in the current folder: ";
    return "";
}


function replaceOldSettings {
    param(
        [Parameter(Position = 0, mandatory = $true)] [string] $rootFolder,
        [Parameter(Position = 0, mandatory = $true)] [string] $oldSetting,
        [Parameter(Position = 0, mandatory = $true)] [string] $newSetting
    )

    $powerAppFiles = Get-ChildItem -Recurse -File $rootFolder
    foreach ($file in $powerAppFiles) {
        $fileContent = Get-Content $file.FullName;
        if (Select-String -Pattern $oldSetting -InputObject $fileContent) {
            Set-Content -Path $file.FullName -Value $fileContent.Replace($oldSetting, $newSetting);
            Write-Host $file.FullName" --> updated ";
        }
    }

}

$currentSettings = getCurrentSettings;
if ([string]::IsNullOrEmpty($currentSettings)) {
    Write-Error "Could not find connections file";
    return 2;
}

if ([string]::IsNullOrEmpty($companyId) -or [string]::IsNullOrEmpty($environmentName)) {
    Write-Error "Missing environment or company"
    return 2;
}

$newSettings = "$environmentName,$companyId";
Write-Host "Current settings: "$currentSettings;
Write-Host "New settings: "$newSettings;

replaceOldSettings -oldSetting $currentSettings -newSetting $newSettings -rootFolder .;