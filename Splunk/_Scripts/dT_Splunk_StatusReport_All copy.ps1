$Counter = 1

do {

$json = @"
{
    "host": "$DeviceName",
    "index": "deviceTRUST",
    "sourcetype": "statusreport",
    "event": "Status Report Log Entry created for $DeviceName",
    "fields": {
        "Session Date": "$SessionDate",
        "Device Name": "$DeviceName",
        "Access Mode": "$AccessMode",
        "Anti-Virus Name": "$AntiVirusName",
        "Anti-Virus Status": "$AntiVirusStatus",
        "Anti-Virus Timestamp": "$AntiVirusTimestamp",
        "Country": "$Country",
        "Country Provider": "$CountryProvider",
        "Device Identifier": "$DeviceIdentifier",
        "Device Type": "$DeviceType",
        "deviceTRUST Client": "$DeviceTrustClient",
        "Economic Region": "$EconomicRegion",
        "Firewall Name": "$FirewallName",
        "Firewall Status": "$FirewallStatus",
        "Hardware BIOS Release Date": "$HardwareBiosReleaseDate",
        "Hardware Model": "$HardwareModel",
        "Hardware Role": "$HardwareRole",
        "Hardware Secure Boot": "$HardwareSecureBoot",
        "Hardware Vendor": "$HardwareVendor",
        "Network Address Assignment": "$NetworkAddressAssignment",
        "Network DHCP Server": "$NetworkDHCPServer",
        "Network DNS Server": "$NetworkDNSServer",
        "Network DNS Suffix": "$NetworkDNSSuffix",
        "Network Gateway": "$NetworkGateway",
        "Network Gateway Mac": "$NetworkGatewayMac",
        "Network IP Address": "$NetworkIPAddress",
        "Network Mac Address": "$NetworkMacAddress",
        "Network Subnet": "$NetworkSubnet",
        "OS Description": "$OSDescription",
        "OS Disk Encryption": "$OSDiskEncryption",
        "OS Name": "$OSName",
        "OS Platform": "$OSPlatform",
        "OS Release": "$OSRelease",
        "OS Type": "$OSType",
        "OS Updates": "$OSUpdates",
        "OS Version": "$OSVersion",
        "Region Keyboard Locale": "$RegionKeyboardLocale",
        "Region Locale": "$RegionLocale",
        "Region Timezone Offset": "$RegionTimezoneOffset",
        "Remote Controlled": "$RemoteControlled",
        "Remoting Client Protocol": "$RemoteClientProtocol",
        "Remoting Client Version": "$RemoteClientVersion",
        "Secure Screen Saver": "$SecureScreenSave",
        "Security State": "$SecurityState",
        "Session User Domain": "$SessionUserDomain",
        "Session User Name": "$SessionUserName",
        "User Authentication": "$UserAuthentication",
        "User Privileges": "$UserPrivileges",
        "Virtualized": "$Virtualized",
        "VPN Connected": "$VPNConnected",
        "Wi-Fi Security Mode": "$WiFiSecurityMode"
    }
}
"@
    
    $Headers = @{
        Authorization = "Splunk aacc1532-7ff3-4705-831f-70c7f77c39c2"
        ContentType = "application/json"
    }

    
    Invoke-WebRequest -Uri "http://10.10.10.39:8088/services/collector" -Method "POST" -Body $json -Headers $Headers  | Out-Null

    $counter = $counter + 1
    
}

until ($counter -gt 1)