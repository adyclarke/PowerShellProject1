param (
    [string]$rootUri = "http://SharePoint2016"

 )

$webServiceUri = "$rootUri/_vti_bin/SiteData.asmx?wsdl"

$objectType = "VirtualServer"
$objectId = $null
$folderUrl = $null
$itemId = $null
$retrieveChildItems = $true
$securityOnly = $false
$lastItemIdOnPage = $null

$webServiceProxy = New-WebServiceProxy -uri $webServiceUri -UseDefaultCredential
[Xml]$VirtualServerData = $webServiceProxy.GetContent($objectType, $objectId, $folderUrl, $itemId, $retrieveChildItems, $securityOnly, [REF]$lastItemIdOnPage)

foreach($contentDatabase in $VirtualServerData.VirtualServer.ContentDatabases.ContentDatabase)
{
$ContentDatabaseID = $contentDatabase.ID
$objectType = "ContentDatabase"
$objectId = $ContentDatabaseID
$folderUrl = $null
$itemId = $null
$retrieveChildItems = $true
$securityOnly = $false
$lastItemIdOnPage = $null
[Xml]$SiteCollectionData = $webServiceProxy.GetContent($objectType, $ContentDatabaseID, $folderUrl, $itemId, $retrieveChildItems, $securityOnly, [REF]$lastItemIdOnPage)

foreach($site in $SiteCollectionData.ContentDatabase.Sites.ChildNodes)
{
    write-host $site.URL
}
	}