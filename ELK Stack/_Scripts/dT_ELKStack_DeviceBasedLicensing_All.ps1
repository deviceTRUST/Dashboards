$Applications = "Adobe Acrobat DC","Microsoft Office","Microsoft Project","Microsoft Visio"

$Applications | foreach-object{

    $Counter = 1

    do {

        $Application = $_

        $UserArray = @(

            "UseCase",
            "User",
            "ID"

        )

        $UserPosition = Get-Random -Minimum 0 -Maximum 2
        $User = $UserArray[$UserPosition]
        $UserSuffix = (Get-Random -Minimum 1 -Maximum 10000).ToString("00000")
        $User = $User + $UserSuffix

        $DomainArray = @(

            "CORPORATE",
            "company.local",
            "uk.corporate.local",
            "us.corporate.local",
            "de.corporate.local"

        )

        $DomainPosition = Get-Random -Minimum 0 -Maximum 5
        $Domain = $DomainArray[$DomainPosition]

        $DeviceArray = @(

            "DTLDTW",
            "ITC",
            "DE-DT",
            "UK-DT",
            "US-DT",
            "TCDT"
            
            )

        $DevicePosition = Get-Random -Minimum 0 -Maximum 6
        $Device = $DeviceArray[$DevicePosition]
        $DeviceSuffix = (Get-Random -Minimum 1 -Maximum 10000).ToString("00000")
        $Device = $Device + $DeviceSuffix

        $LicensedStatusArray = @(

            "Licensed by BIOS Serial",
            "Not licensed",
            "Not licensed",
            "Licensed by Device Name",
            "Not licensed",
            "Not licensed",
            "Not licensed",
            "Licensed by Device Name",
            "Not licensed",
            "Licensed by Override",
            "Not licensed",
            "Not licensed",
            "Licensed by OS ID",
            "Not licensed",
            "Licensed by BIOS Serial",
            "Not licensed",
            "Not licensed",
            "Not licensed",
            "Licensed by BIOS Serial",
            "Not licensed",
            "Not licensed",
            "Not licensed",
            "Licensed by Device Name"

        )

        $LicensedStatusPosition = Get-Random -Minimum 0 -Maximum 23
        $LicensedStatus = $LicensedStatusArray[$LicensedStatusPosition]

        $DEVICE_HARDWARE_BIOS_SERIAL = New-Guid
        $DEVICE_OS_ID = New-Guid

        $ApplicationUserState = "False"
        $ApplicationUserStateRandom = Get-Random -Minimum 0 -Maximum 100
        if ($ApplicationUserStateRandom -lt "25") {$ApplicationUserState = "True"}

        $Years = "2019","2020","2021"
        $Year = Get-Random -InputObject $Years
        if ($Year -ne "2021") {$Month = (Get-Random -Minimum 1 -Maximum 13).ToString("00")}
        if ($Year -eq "2021") {$Month = (Get-Random -Minimum 1 -Maximum ((Get-Date).Month + 1)).ToString("00")}
        if ($Year -ne "2021") {$Day = (Get-Random -Minimum 1 -Maximum 29).ToString("00")}
        if ($Year -eq "2021") {
            if(((Get-Date).Day).ToString("00") -ne "01"){
                $Day = (Get-Random -Minimum 1 -Maximum (Get-Date).Day).ToString("00")
            } else {
                $Day = "01"
            }
                    
        }
        $Hour = (Get-Random -Minimum 1 -Maximum 24).ToString("00")
        $Minute = (Get-Random -Minimum 1 -Maximum 60).ToString("00")
        $Seconds = (Get-Random -Minimum 1 -Maximum 60).ToString("00")
        $MilliSeconds = (Get-Random -Minimum 1 -Maximum 1000).ToString("000")
        $Date = $Year + "-" + $Month + "-" + $Day + "T" + $Hour + ":" + $Minute + ":" + $Seconds + "." + $MilliSeconds + "Z"

$json = @"
{
    "doc": {
        "Application": "$Application",
        "SessionDate": "$Date",
        "LicensedStatus": "$LicensedStatus",
        "DeviceName": "$Device",
        "DeviceBIOSSerialNumber": "$DEVICE_HARDWARE_BIOS_SERIAL",
        "DeviceOSID": "$DEVICE_OS_ID",
        "ApplicationUser": "$ApplicationUserState",
        "SessionUserDomain": "$Domain",
        "SessionUserName": "$User"
    },
    "doc_as_upsert": true
}
"@
        $uri = "http://YOUR_ELKSTACK_SERVER:9200/dt_devicebasedlicensing_" + $Application.replace(" ","").tolower() + "/_update/$Device"

        Invoke-WebRequest -Uri $uri -Method "POST" -ContentType "application/json" -Body $json | Out-Null
    
        $counter = $Counter + 1    
    
        Start-Sleep -Milliseconds 10
    }

    until ($counter -gt 15)

}