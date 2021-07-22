$Counter = 1

do {

    $Application = "Microsoft Office"

    $UserArray = @(

        "UseCase",
        "User",
        "ID"

    )

    $UserPosition = Get-Random –Minimum 0 –Maximum 3
    $User = $UserArray[$UserPosition]
    $UserPrefix = Get-Random –Minimum 100 –Maximum 10000
    $User = $User + $UserPrefix
    #$User

    $DomainArray = @(

        "CORPORATE",
        "company.local",
        "uk.corporate.local",
        "us.corporate.local",
        "de.corporate.local"

    )

    $DomainPosition = Get-Random –Minimum 0 –Maximum 5
    $Domain = $DomainArray[$DomainPosition]
    #$Domain

    $DeviceArray = @(

        "DTLDTW9",
        "DTLDTW8",
        "ITC0008",
        "DE-DT76",
        "UK-DT23",
        "US-34DT",
        "TCDE123"

    )

    $DevicePosition = Get-Random –Minimum 0 –Maximum 7
    $Device = $DeviceArray[$DevicePosition]
    $DevicePrefix = Get-Random –Minimum 1000 –Maximum 100000
    $Device = $Device + $DevicePrefix
    #$Device

    $LicensedStatusArray = @(

        "Licensed by BIOS Serial",
        "Not Licensed",
        "Licensed by Domain ID",
        "Licensed by Domain ID",
        "Licensed by Domain ID",
        "Licensed by Domain ID",
        "Not Licensed",
        "Licensed by Device Name",
        "Not Licensed",
        "Licensed by Override",
        "Not Licensed",
        "Not Licensed",
        "Licensed by OS ID",
        "Licensed by Domain ID",
        "Licensed by Domain ID",
        "Not Licensed",
        "Licensed by Domain ID",
        "Not Licensed",
        "Licensed by Domain ID",
        "Licensed by Domain ID",
        "Not Licensed",
        "Licensed by Domain ID",
        "Not Licensed"

    )

    $LicensedStatusPosition = Get-Random –Minimum 0 –Maximum 23
    $LicensedStatus = $LicensedStatusArray[$LicensedStatusPosition]
    #$LicensedStatus

    $DEVICE_HARDWARE_BIOS_SERIAL = New-Guid
    $DEVICE_OS_ID = New-Guid
    #$DEVICE_HARDWARE_BIOS_SERIAL
    #$DEVICE_OS_ID

    $ApplicationUserState = "False"
    $ApplicationUserStateRandom = Get-Random –Minimum 0 –Maximum 100
    if ($ApplicationUserStateRandom -lt "80") {$ApplicationUserState = "True"}
    #$ApplicationUserState

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
    #$Date

$json = @"
{
   "doc": {
	    "Application": "$Application",
	    "Session Date": "$Date",
	    "LicensedStatus": "$LicensedStatus",
	    "Device Name": "$Device",
        "Device BIOS Serial Number": "$DEVICE_HARDWARE_BIOS_SERIAL",
        "Device OS ID": "$DEVICE_OS_ID",
        "Application User": "$ApplicationUserState",
	    "User Domain": "$Domain",
	    "User Name": "$User"
   },
   "doc_as_upsert": true
}
"@

    Invoke-WebRequest -Uri "http://dtldlt02.demo.devicetrust.local:9200/dt_devicebasedlicensing_microsoft_office/_update/$Device" -Method "POST" -ContentType "application/json" -Body $json | Out-Null

    $counter = $Counter + 1    

    Start-Sleep -Milliseconds 10

}

until ($counter -gt 100)