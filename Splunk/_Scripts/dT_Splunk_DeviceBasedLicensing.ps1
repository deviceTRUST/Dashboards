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

        $UserPosition = Get-Random –Minimum 0 –Maximum 2
        $User = $UserArray[$UserPosition]
        $UserSuffix = (Get-Random –Minimum 1 –Maximum 10000).ToString("00000")
        $User = $User + $UserSuffix

        $DomainArray = @(

            "CORPORATE",
            "company.local",
            "uk.corporate.local",
            "us.corporate.local",
            "de.corporate.local"

        )

        $DomainPosition = Get-Random –Minimum 0 –Maximum 5
        $Domain = $DomainArray[$DomainPosition]

        $DeviceArray = @(

            "DTLDTW",
            "ITC",
            "DE-DT",
            "UK-DT",
            "US-DT",
            "TCDT"
            
            )

        $DevicePosition = Get-Random –Minimum 0 –Maximum 6
        $Device = $DeviceArray[$DevicePosition]
        $DeviceSuffix = (Get-Random –Minimum 1 –Maximum 10000).ToString("00000")
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

        $LicensedStatusPosition = Get-Random –Minimum 0 –Maximum 23
        $LicensedStatus = $LicensedStatusArray[$LicensedStatusPosition]

        $DEVICE_HARDWARE_BIOS_SERIAL = New-Guid
        $DEVICE_OS_ID = New-Guid

        $ApplicationUserState = "False"
        $ApplicationUserStateRandom = Get-Random –Minimum 0 –Maximum 100
        if ($ApplicationUserStateRandom -lt "25") {$ApplicationUserState = "True"}

        $SessionDate = Get-Date -Format yyyy-MM-ddTHH:mm:ss.000Z ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 60)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))
    
        formattedDate=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")
        echo $formattedDate

$json = @"
{
"host": "$DeviceName",
"index": "devicetrust",
"sourcetype": "devicebasedlicensing",
"event": "Device based licensing Log Entry created for Application: $Application on Device: $DeviceName",
"fields": {
    "Application": "$Application",
    "SessionDate": "$SessionDate",
    "LicensedStatus": "$LicensedStatus",
    "DeviceName": "$Device",
    "DeviceBIOSSerialNumber": "$DEVICE_HARDWARE_BIOS_SERIAL",
    "DeviceOSID": "$DEVICE_OS_ID",
    "ApplicationUser": "$ApplicationUserState",
    "SessionUserDomain": "$Domain",
    "SessionUserName": "$User"
}
}

"@

    $Headers = @{
        Authorization = "Splunk YOUR_AUTH_TOKEN"
        ContentType = "application/json"
    }

    Invoke-WebRequest -Uri "http://YOUR_SPLUNK_SERVER:8088/services/collector" -Method "POST" -Body $json -Headers $Headers  -UseBasicParsing | Out-Null

    $counter = $counter + 1

    }

    until ($counter -gt 15)

}