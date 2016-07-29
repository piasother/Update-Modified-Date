#
# Script.ps1
#
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")
if((Get-PSSnapin | Where {$_.Name -eq "Microsoft.SharePoint.PowerShell"}) -eq $null) {
     Add-PSSnapin Microsoft.SharePoint.PowerShell;
 }

$web = get-spweb "http://spfarm-sp" 
$list = $web.Lists["Test List"]

$spSourceItems = $list.Items

#$dateToStore = Get-Date "4/6/2013 10:00:00"

foreach($item in $spSourceItems)
{
    Write-Host ("...... ORIG ... last modified by {0} on {1}" -f $item["Editor"].tostring(), $item["Modified"]) -foregroundcolor "blue"  
    $item["Modified"] = "2014-04-02 10:00:00"
    $item.Update() 
    $item.UpdateOverwriteVersion() 
}

