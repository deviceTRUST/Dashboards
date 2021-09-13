﻿$Applications = "Adobe Acrobat DC","Microsoft Office","Microsoft Project","Microsoft Visio"

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

        $Years = "2019","2020","2021"
        $Year = Get-Random -InputObject $Years
        if ($Year -ne "2021") {$Month = (Get-Random -Minimum 1 -Maximum 13).ToString("00")}
        if ($Year -eq "2021") {$Month = (Get-Random -Minimum 1 -Maximum ((Get-Date).Month + 1)).ToString("00")}
        if ($Year -ne "2021") {$Day = (Get-Random -Minimum 1 -Maximum 29).ToString("00")}
        if ($Year -eq "2021") {$Day = (Get-Random -Minimum 1 -Maximum (Get-Date).Day).ToString("00")}
        $Hour = (Get-Random -Minimum 1 -Maximum 24).ToString("00")
        $Minute = (Get-Random -Minimum 1 -Maximum 60).ToString("00")
        $Seconds = (Get-Random -Minimum 1 -Maximum 60).ToString("00")
        $MilliSeconds = (Get-Random -Minimum 1 -Maximum 1000).ToString("000")
        $Date = $Year + "-" + $Month + "-" + $Day + "T" + $Hour + ":" + $Minute + ":" + $Seconds + "." + $MilliSeconds + "Z"

$json = @"
{
"host": "$DeviceName",
"index": "deviceTRUST",
"sourcetype": "devicebasedlicensing",
"event": "Device based licensing Log Entry created for Application: $Application on Device: $DeviceName",
"fields": {
    "Application": "$Application",
    "Session Date": "$Date",
    "LicensedStatus": "$LicensedStatus",
    "Device Name": "$Device",
    "Device BIOS Serial Number": "$DEVICE_HARDWARE_BIOS_SERIAL",
    "Device OS ID": "$DEVICE_OS_ID",
    "Application User": "$ApplicationUserState",
    "User Domain": "$Domain",
    "User Name": "$User"
}
}

"@

    $Headers = @{
        Authorization = "Splunk 500a67d4-df18-40ab-b1db-c4d47cc0e872"
        ContentType = "application/json"
    }

    Invoke-WebRequest -Uri "http://10.10.10.181:8088/services/collector" -Method "POST" -Body $json -Headers $Headers  | Out-Null

    $counter = $counter + 1

    }

    until ($counter -gt 60)

}