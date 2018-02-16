# set variables
$url = "";

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint") > $null

$localSPFarm = [Microsoft.SharePoint.Administration.SPFarm]::Local
$webServices = $LocalSPFarm.Services | where -FilterScript {$_.GetType() -eq [Microsoft.SharePoint.Administration.SPWebService]}
$webApplications = @()

foreach ($webService in $webServices) {
           write-host "Web Applications"
           write-host ""
    foreach ($webApplication in $webService.WebApplications) {
        write-host "Webapp Name -->"$webApplication.Name
           write-host ""
           write-host "Site Collections"
           write-host ""
    foreach ($site in $webApplication.Sites) {
        write-host "Site URL --> -->" $site.URL
           write-host ""
           write-host "Websites"
           write-host ""
    foreach ($web in $site.AllWebs) {
        write-host "Web URL --> --> -->" $web.URL
           write-host ""
           write-host ""
    }
          }
			}