$Counter = 1

do {

    # Session Date
    $SessionDate = Get-Date -Format yyyy-MM-ddTHH:mm:ss.000Z ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 19)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))

    # Device Name
    $DeviceNameArray = @(
        "ITCDE08",
        "ITCUK08",
        "ITCUS08",
        "DE-DT71",
        "UK-DT77",
        "US-34TD",
        "TCDE123",
        "ITC0221",
        "TESTGL9",
        "ITC0DE8"
    )
    $DeviceName = $DeviceNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 1000 –Maximum 100000)
 
    # Access Mode
    $AccessModeArray = @(
        "Internal",
        "External",
        "Internal",
        "External",
        "External",
        "External",
        "Internal",
        "External",
        "Internal",
        "External"
    )
    $AccessMode = $AccessModeArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Anti-Virus Name
    $AntiVirusName = "Unsupported OS"

    # Anti-Virus Status
    $AntiVirusStatus = "Unsupported OS"
    
    # Anti-Virus Timestamp
    $AntiVirusTimestamp = "Unsupported OS"

    # Country
    $CountryArray = @(
        "DE",
        "UK",
        "NL",
        "Unknown",
        "UK",
        "NL",
        "US",
        "CN",
        "DE",
        "DE",
        "US",
        "CA",
        "Unknown",
        "CA",
        "US",
        "CA",
        "Unknown",
        "DE",
        "CN",
        "RU"
    )
    $Country = $CountryArray[(Get-Random –Minimum 0 –Maximum 20)]

    #Country Provider
    $CountryProviderArray = @(
        "Whois",
        "Whois",
        "ThirdParty WiFi"
        "Whois",
        "ThirdParty WiFi"
        "Whois",
        "ThirdParty WiFi"
        "Whois",
        "ThirdParty WiFi",
        "ThirdParty WiFi"
    )
    if ($Country -ne "Unknown") {$CountryProvider = $CountryProviderArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$CountryProvider = "Unknown"}

    # Device Type
    $DeviceTypeArray = @(
        "IGEL (Managed)",
        "IGEL (Unmanaged)",
        "IGEL (Managed)",
        "IGEL (Managed)",
        "IGEL (Managed)",
        "IGEL (Unmanaged)",
        "IGEL (Managed)",
        "IGEL (Managed)",
        "IGEL (Unmanaged)",
        "IGEL (Managed)"
    )
    $DeviceType = $DeviceTypeArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Device Identifier
    $DeviceIdentifierManagedArray = @(
        "192.168.171.124:30001",
        "192.168.84.41:30001",
        "192.168.171.124:30001",
        "192.168.84.41:30001",
        "192.168.171.124:30001",
        "192.168.84.41:30001",
        "192.168.171.124:30001",
        "192.168.84.41:30001",
        "192.168.171.124:30001",
        "192.168.84.41:30001"
    )
    if ($DeviceType -eq "IGEL (Managed)") {$DeviceIdentifier = $DeviceIdentifierManagedArray[(Get-Random –Minimum 0 –Maximum 10)]}

    $DeviceIdentifierUnmanagedArray = @(
        "192.168.178.111:30001",
        "192.100.1.11:30001",
        "172.168.178.111:30999",
        "192.168.178.111:30001",
        "192.100.1.11:30001",
        "172.168.178.111:30999",
        "192.168.178.111:30001",
        "192.100.1.11:30001",
        "172.168.178.111:30999",
        "192.168.178.111:30001"
    )
    if ($DeviceType -eq "IGEL (Unmanaged)") {$DeviceIdentifier = $DeviceIdentifierUnmanagedArray[(Get-Random –Minimum 0 –Maximum 10)]}

    # deviceTRUST Client
    $DeviceTrustClient = "Available"
    
    # Economic Region
    if ($Country -eq "DE" -or $Country -eq "NL" -or $Country -eq "UK") {$EconomicRegion = "EMEA"}
    if ($Country -eq "US" -or $Country -eq "CA") {$EconomicRegion = "AMER"}
    if ($Country -eq "CN" -or $Country -eq "RU") {$EconomicRegion = "APAC"}
    if ($Country -eq "Unknown") {$EconomicRegion = "Unknown"}
    
    # Firewall Name
    $FirewallName = "Unsupported OS"

    # Firewall Status 
    $FirewallStatus = "Unsupported OS"

    # Hardware BIOS Release Date
    $HardwareBiosReleaseDate = ((((Get-Date -Date $SessionDate).AddMonths(-(Get-Random -Minimum 1 -Maximum 19)).AddHours(-(Get-Random -Minimum 1 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 1 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 1 -Maximum 61))).ToString("yyyy-MM-ddTHH:mm:ss.000Z")

    # Hardware Secure Boot
    $HardwareSecureBootArray = @(
        "true",
        "false",
        "false",
        "false",
        "true",
        "false",
        "true",
        "false",
        "false",
        "false"
    )
    $HardwareSecureBoot = $HardwareSecureBootArray[(Get-Random –Minimum 0 –Maximum 10)]   

    # Hardware Vendor
    $HardwareVendorArray = @(
        "IGEL Inc.",
        "IGEL inc.",
        "VMware Inc.",
        "VMware Inc.",
        "IGEL Inc.",
        "IGEL inc.",
        "HP Ltd.",
        "Fujitsu GmbH",
        "IGEL Inc.",
        "IGEL inc."
    )
    $HardwareVendor = $HardwareVendorArray[(Get-Random –Minimum 0 –Maximum 10)]  

    # Hardware Model
    $HardwareModelArray = @(
        "UD2",
        "UD5",
        "UD7",
        "UD Pocket",
        "UD Pocket2",
        "UD2",
        "UD5",
        "UD7",
        "UD Pocket",
        "UD Pocket2"
    )
    if ($HardwareVendor -eq "IGEL Inc.") {$HardwareModel = $HardwareModelArray[(Get-Random –Minimum 0 –Maximum 10)]}   
    if ($HardwareVendor -eq "HP Ltd." -or $HardwareVendor -eq "Fujitsu GmbH") {$HardwareModel = "Mobile345c"}
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareModel = "VMware7,1"}

    # Hardware Role
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"}
    else {$HardwareRole = "Desktop"}

    # Network Address Assignment
    $NetworkAddressAssignmentArray = @(
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static",
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static"
    )
    $NetworkAddressAssignment = $NetworkAddressAssignmentArray[(Get-Random –Minimum 0 –Maximum 10)]  
    
    # Network IP Address
    $NetworkIPAddressPrefixArray = @(
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123.",
        "10.199.12.",
        "17.123.77.",
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123."
    )
    $NetworkIPPrefixAddress = $NetworkIPAddressPrefixArray[(Get-Random –Minimum 0 –Maximum 10)]
    $NetworkIPAddress = $NetworkIPPrefixAddress + (Get-Random –Minimum 10 –Maximum 255)
    
    # Network Mac Address
    $NetworkMacAddress = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
    
    # Network Subnet
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkSubnet = "192.168.0.0/24"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkSubnet = "192.168.17.0/24"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkSubnet = "192.168.122.0/23"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkSubnet = "10.100.123.0/20"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkSubnet = "10.199.12.0/23"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkSubnet = "17.123.77.0/21"}
     
    # Network Gateway
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGateway = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGateway = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGateway = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGateway = "10.100.123.244"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGateway = "10.199.12.114"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGateway = "17.123.77.1"}
    
    # Network Gateway Mac
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGatewayMac = "0A-51-52-E2-49-41"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGatewayMac = "0B-67-34-E1-8B-22"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGatewayMac = "0C-78-21-F0-A9-10"}

    # Network DHCP Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDHCPServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDHCPServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDHCPServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDHCPServer = "10.100.123.254"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDHCPServer = "10.199.12.111"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDHCPServer = "17.123.77.2"}   
    
    # Network DNS Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSServer = "10.100.123.253"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSServer = "10.199.12.110"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSServer = "17.123.77.3"}

    # Network DNS Suffix
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSSuffix = "fritz.box"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSSuffix = "myhome.local"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSSuffix = "corporate.net"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSSuffix = "de.corporate.local"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSSuffix = "uk.corporate.local"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSSuffix = "us.corporate.local"}

    # OS Disk Encryption
    $OSDiskEncryption = "Unsupported OS"
    
    # OS Name
    $OSName = "IGEL"
    
    # OS Platform
    $OSPlatform = "x64"
    
    # OS Release
    $OSRelease = "Unsupported OS"
    
    # OS Type
    $OSType = "Client"
    
    # OS Updates
    $OSUpdates = "Unsupported OS"
    
    # OS Version
    $OSVersionArray = @(
        "10.06.110.01",
        "10.05.090.01",
        "11.04.270.01",
        "11.03.240.01",
        "11.02.110.01",
        "11.04.270.01",
        "10.06.110.01",
        "11.04.270.01",
        "10.06.110.01",
        "11.04.270.01"
    )
    $OSVersion = $OSVersionArray[(Get-Random –Minimum 0 –Maximum 10)]   

    # OS Description
    if ($OSVersion -like "10.*") {$OSDescription = "IGEL Universal Desktop OS 3 (UC1-LX ac)"}
    else {$OSDescription = "IGEL OS 11 (UC1-LX X)"}

    # Region Keyboard Locale
    $RegionKeyboardLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionKeyboardLocale = $RegionKeyboardLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Locale
    $RegionLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionLocale =  $RegionLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Timezone Offset
    $RegionTimezoneOffsetArray = @(
        "-480",
        "-360",
        "-240",
        "-120",
        "-60",
        "0",
        "60",
        "120",
        "240",
        "360"
    )
    $RegionTimezoneOffset =   $RegionTimezoneOffsetArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # Remote Controlled
    $RemoteControlledArray = @(
        "True",
        "False",
        "False",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $RemoteControlled = $RemoteControlledArray[(Get-Random –Minimum 0 –Maximum 10)]     
    
    # Remoting Client Protocol
    $RemoteClientProtocolArray = @(
        "ICA",
        "RDP",
        "PCoIP",
        "Blast",
        "ICA",
        "RDP",
        "Blast",
        "ICA",
        "RDP",
        "RDP"
    )
    $RemoteClientProtocol = $RemoteClientProtocolArray[(Get-Random –Minimum 0 –Maximum 10)]    
  
    # Remoting Client Version
    $RemoteClientVersionArray = @(
        "19.3.0.5",
        "20.12.0.12",
        "20.9.0.3",
        "21.02.0.25",
        "20.1.23.21",
        "20.1.45.11",
        "20.1.23.21",
        "18.3.07.10",
        "17.06.01.01",
        "16.9.01.01"
    )
    if ($RemoteClientProtocol -eq "ICA" -or $RemoteClientProtocol -eq "Blast") {$RemoteClientVersion =  $RemoteClientVersionArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$RemoteClientVersion = "Unavailable"}
    
    # Security State
    if ($DeviceType -eq "IGEL (Managed)") {$SecurityState = "Protected"}
    else {$SecurityState = "Unprotected"}

    # Session User Domain
    $SessionUserDomainArray = @(
        "CORPORATE",
        "company.local",
        "uk.corporate.local",
        "us.corporate.local",
        "de.corporate.local",
        "UK.local",
        "US.local",
        "DE.local",
        "Germany",
        "GLOBAL"
    )
    $SessionUserDomain = $SessionUserDomainArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Session User Name
    $SessionUserNameArray = @(
        "UsEA",
        "IDBE",
        "DEBB",
        "UKDA",
        "USWC",
        "UID2",
        "PUID",
        "GLUK",
        "DEV",
        "Test"
    )
    $SessionUserName = $SessionUserNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 100 –Maximum 10000)

    # User Authentication
    $UserAuthentication = "Unsupported OS"

    # User Privileges
    $UserPrivilegesArray = @(
        "Limited",
        "Limited",
        "Limited",
        "Privileged",
        "Limited",
        "Limited",
        "Limited",
        "Limited",
        "Limited",
        "Privileged"
    )
    if ($DeviceType -eq "IGEL (Managed)") {$UserPrivileges = $UserPrivilegesArray[(Get-Random –Minimum 0 –Maximum 10)]}
    if ($DeviceType -eq "IGEL (Unmanaged)") {$UserPrivileges = "Privileged"}

    # Virtualized
    if ($HardwareVendor -eq "VMware Inc.") {$Virtualized = "True"}
    else {$Virtualized = "False"}

    # VPN Connected
    $VPNConnected = "Unsupported OS"

    # Wi-Fi Security Mode
    $WiFiSecurityModeArray = @(
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure"
    )
    $WiFiSecurityMode = $WiFiSecurityModeArray[(Get-Random –Minimum 0 –Maximum 10)]

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
        Authorization = "Splunk 500a67d4-df18-40ab-b1db-c4d47cc0e872"
        ContentType = "application/json"
    }

    
    Invoke-WebRequest -Uri "http://10.10.10.60:12201/gelf" -Method "POST" -Body $json -Headers $Headers  | Out-Null

    $counter = $counter + 1
    
 }

until ($counter -gt 100)

$Counter = 1

do {

    # Session Date
    $SessionDate = Get-Date -Format yyyy-MM-ddTHH:mm:ss.000Z ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 19)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))

    # Device Name
    $DeviceNameArray = @(
        "DTDTMAC",
        "DTTTMAC",
        "DTMAC01",
        "DTMACUK",
        "DTMACUS",
        "US-34DT",
        "DTMACDE",
        "TESTDE1",
        "TESTGL9",
        "DTMAC02"
    )
    $DeviceName = $DeviceNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 1000 –Maximum 100000)
 
    # Access Mode
    $AccessModeArray = @(
        "Internal",
        "External",
        "Internal",
        "External",
        "External",
        "External",
        "Internal",
        "External",
        "Internal",
        "External"
    )
    $AccessMode = $AccessModeArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Anti-Virus Name
    $AntiVirusName = "Unsupported OS"

    # Anti-Virus Status
    $AntiVirusStatus = "Unsupported OS"
    
    # Anti-Virus Timestamp
    $AntiVirusTimestamp = "Unsupported OS"

    # Country
    $CountryArray = @(
        "DE",
        "UK",
        "NL",
        "Unknown",
        "UK",
        "NL",
        "US",
        "CN",
        "DE",
        "DE",
        "US",
        "CA",
        "Unknown",
        "CA",
        "US",
        "CA",
        "Unknown",
        "DE",
        "CN",
        "RU"
    )
    $Country = $CountryArray[(Get-Random –Minimum 0 –Maximum 20)]

    #Country Provider
    $CountryProviderArray = @(
        "Whois",
        "OperatingSystem WiFi",
        "ThirdParty WiFi"
        "OperatingSystem WiFi",
        "ThirdParty WiFi"
        "OperatingSystem WiFi",
        "ThirdParty WiFi"
        "Whois",
        "OperatingSystem WiFi",
        "ThirdParty WiFi"
    )
    if ($Country -ne "Unknown") {$CountryProvider = $CountryProviderArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$CountryProvider = "Unknown"}

    # Device Type
    $DeviceType = "macOS"

    # Device Identifier
    $DeviceIdentifier = New-Guid

    # deviceTRUST Client
    $DeviceTrustClient = "Available"
    
    # Economic Region
    if ($Country -eq "DE" -or $Country -eq "NL" -or $Country -eq "UK") {$EconomicRegion = "EMEA"}
    if ($Country -eq "US" -or $Country -eq "CA") {$EconomicRegion = "AMER"}
    if ($Country -eq "CN" -or $Country -eq "RU") {$EconomicRegion = "APAC"}
    if ($Country -eq "Unknown") {$EconomicRegion = "Unknown"}
    
    # Firewall Name
    $FirewallName = "macOS Application Firewall"

    # Firewall Status
    $FirewallStatusArray = @(
        "Active",
        "Active",
        "Inactive",
        "Active",
        "Active",
        "Inactive",
        "Active",
        "Inactive",
        "Active",
        "Inactive"
    )
    $FirewallStatus = $FirewallStatusArray[(Get-Random –Minimum 0 –Maximum 10)]  

    # Hardware BIOS Release Date
    $HardwareBiosReleaseDate = "Unsupported OS"

    # Hardware Secure Boot
    $HardwareSecureBoot = "Unsupported OS"

    # Hardware Vendor
    $HardwareVendorArray = @(
        "Apple Inc.",
        "Apple Inc.",
        "Apple Inc.",
        "Apple Inc.",
        "VMware Inc.",
        "VMware Inc.",
        "Apple Inc.",
        "Apple Inc.",
        "Apple Inc.",
        "Apple Inc."
    )
    $HardwareVendor = $HardwareVendorArray[(Get-Random –Minimum 0 –Maximum 10)]  

    # Hardware Model
    $HardwareModelArray = @(
        "MacBook5.2",
        "MacBook9.1",
        "MacBook10.1",
        "MacBook8.1",
        "MacBook5.2",
        "MacBook9.1",
        "MacBook10.1",
        "MacBook8.1",
        "iMac20.2",
        "iMac19.1"
    )
    if ($HardwareVendor -eq "Apple Inc.") {$HardwareModel = $HardwareModelArray[(Get-Random –Minimum 0 –Maximum 10)]}   
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareModel = "VMware7.1"}

    # Hardware Role
    if ($HardwareVendor -eq "Apple Inc." -and $HardwareModel -like "MacBook*") {$HardwareRole = "Laptop"}
    if ($HardwareVendor -eq "Apple Inc." -and $HardwareModel -like "iMac*") {$HardwareRole = "Desktop"}
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"}

    # Network Address Assignment
    $NetworkAddressAssignmentArray = @(
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static",
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static"
    )
    $NetworkAddressAssignment = $NetworkAddressAssignmentArray[(Get-Random –Minimum 0 –Maximum 10)]  
    
    # Network IP Address
    $NetworkIPAddressPrefixArray = @(
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123.",
        "10.199.12.",
        "17.123.77.",
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123."
    )
    $NetworkIPPrefixAddress = $NetworkIPAddressPrefixArray[(Get-Random –Minimum 0 –Maximum 10)]
    $NetworkIPAddress = $NetworkIPPrefixAddress + (Get-Random –Minimum 5 –Maximum 255)
    
    # Network Mac Address
    $NetworkMacAddress = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
    
    # Network Subnet
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkSubnet = "192.168.0.0/24"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkSubnet = "192.168.17.0/24"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkSubnet = "192.168.122.0/23"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkSubnet = "10.100.123.0/20"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkSubnet = "10.199.12.0/23"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkSubnet = "17.123.77.0/21"}
     
    # Network Gateway
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGateway = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGateway = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGateway = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGateway = "10.100.123.244"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGateway = "10.199.12.114"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGateway = "17.123.77.1"}
    
    # Network Gateway Mac
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGatewayMac = "0A-51-52-E2-49-41"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGatewayMac = "0B-67-34-E1-8B-22"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGatewayMac = "0C-78-21-F0-A9-10"}

    # Network DHCP Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDHCPServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDHCPServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDHCPServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDHCPServer = "10.100.123.254"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDHCPServer = "10.199.12.111"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDHCPServer = "17.123.77.2"}   
    
    # Network DNS Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSServer = "10.100.123.253"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSServer = "10.199.12.110"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSServer = "17.123.77.3"}

    # Network DNS Suffix
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSSuffix = "fritz.box"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSSuffix = "myhome.local"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSSuffix = "corporate.net"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSSuffix = "de.corporate.local"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSSuffix = "uk.corporate.local"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSSuffix = "us.corporate.local"}

    # OS Description
    $OSDescription = "Unsupported OS"

    # OS Disk Encryption
    $OSDiskEncryption = "Unsupported OS"
     
    # OS Name
    $OSName = "macOS"

    # OS Platform
    $OSPlatform = "x64"
    
    # OS Release
    $OSRelease = "Unsupported OS"
    
    # OS Type
    $OSType = "Unsupported OS"
    
    # OS Updates
    $OSUpdatesArray = @(
        "Up To Date",
        "Up To Date",
        "Pending Updates",
        "Check Required",
        "Up To Date",
        "Up To Date",
        "Pending Updates",
        "Check Required",
        "Pending Updates",
        "Check Required"
    )
    $OSUpdates = $OSUpdatesArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # OS Version
    $OSVersionArray = @(
        "11.2.2",
        "10.15.7",
        "10.14.6",
        "10.13.6",
        "10.12.6",
        "11.2.2",
        "10.15.7",
        "10.13.6",
        "10.16.1",
        "11.2.2"
    )
    $OSVersion = $OSVersionArray[(Get-Random –Minimum 0 –Maximum 10)]   

    # Region Keyboard Locale
    $RegionKeyboardLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionKeyboardLocale = $RegionKeyboardLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Locale
    $RegionLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionLocale =  $RegionLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Timezone Offset
    $RegionTimezoneOffsetArray = @(
        "-720",
        "-660",
        "-600",
        "-480",
        "-60",
        "0",
        "60",
        "60",
        "360",
        "360"
    )
    $RegionTimezoneOffset =   $RegionTimezoneOffsetArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # Remote Controlled
    $RemoteControlled = "Unsupported OS"   
    
    # Remoting Client Protocol
    $RemoteClientProtocolArray = @(
        "ICA",
        "RDP",
        "PCoIP",
        "Blast",
        "ICA",
        "ICA",
        "Blast",
        "ICA",
        "PCoIP",
        "RDP"
    )
    $RemoteClientProtocol = $RemoteClientProtocolArray[(Get-Random –Minimum 0 –Maximum 10)]    
  
    # Remoting Client Version
    $RemoteClientVersionArray = @(
        "19.3.0.5",
        "20.12.0.12",
        "20.9.0.3",
        "21.02.0.25",
        "20.1.23.21",
        "20.1.45.11",
        "20.1.23.21",
        "18.3.07.10",
        "17.06.01.01",
        "16.9.01.01"
    )
    if ($RemoteClientProtocol -eq "ICA" -or $RemoteClientProtocol -eq "Blast") {$RemoteClientVersion =  $RemoteClientVersionArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$RemoteClientVersion = "Unavailable"}
    
    # Security State
    if ($FirewallStatus -eq "Active") {$SecurityState = "Protected"}
    else {$SecurityState = "Unprotected"}

    # Session User Domain
    $SessionUserDomainArray = @(
        "CORPORATE",
        "company.local",
        "uk.corporate.local",
        "us.corporate.local",
        "de.corporate.local",
        "UK.local",
        "US.local",
        "DE.local",
        "Germany",
        "GLOBAL"
    )
    $SessionUserDomain = $SessionUserDomainArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Session User Name
    $SessionUserNameArray = @(
        "USDE",
        "ID12",
        "DEDT",
        "UKDW",
        "USWW",
        "UIDG",
        "PUIC",
        "GLUG",
        "DEVA",
        "Test"
    )
    $SessionUserName = $SessionUserNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 100 –Maximum 10000)

    # User Authentication
    $UserAuthentication = "ShadowHash"

    # User Privileges
    $UserPrivilegesArray = @(
        "Limited",
        "Privileged",
        "Limited",
        "Privileged",
        "Privileged",
        "Limited",
        "Privileged",
        "Limited",
        "Limited",
        "Privileged"
    )
    $UserPrivileges = $UserPrivilegesArray[(Get-Random –Minimum 0 –Maximum 10)]
    
    # Virtualized
    if ($HardwareVendor -eq "VMware Inc.") {$Virtualized = "True"}
    else {$Virtualized = "False"}

    # VPN Connected
    $VPNConnectedArray = @(
        "True",
        "False",
        "False",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $VPNConnected = $VPNConnectedArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Wi-Fi Security Mode
    $WiFiSecurityModeArray = @(
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure"
    )
    $WiFiSecurityMode = $WiFiSecurityModeArray[(Get-Random –Minimum 0 –Maximum 10)]

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
        Authorization = "Splunk 500a67d4-df18-40ab-b1db-c4d47cc0e872"
        ContentType = "application/json"
    }

    
    Invoke-WebRequest -Uri "http://10.10.10.60:12201/gelf" -Method "POST" -Body $json -Headers $Headers  | Out-Null

    $counter = $counter + 1
    
 }

until ($counter -gt 100)

$Counter = 1

do {

    # Session Date
    $SessionDate = Get-Date -Format yyyy-MM-ddTHH:mm:ss.000Z ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 19)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))

    # Device Name
    $DeviceNameArray = @(
        "DTLDTW9",
        "DTLDTW8",
        "ITC0008",
        "DE-TD56",
        "UK-TD13",
        "US-45DT",
        "TCDE334",
        "TESTEE1",
        "TESTDE9",
        "GLVANDV"
    )
    $DeviceName = $DeviceNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 1000 –Maximum 100000)
 
    # Access Mode
    $AccessModeArray = @(
        "Internal",
        "External",
        "Internal",
        "External",
        "External",
        "External",
        "Internal",
        "External",
        "Internal",
        "External"
    )
    $AccessMode = $AccessModeArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Anti-Virus Name
    $AntiVirusName = "No Client"

    # Anti-Virus Status
    $AntiVirusStatus = "No Client"
    
    # Anti-Virus Timestamp
    $AntiVirusTimestamp = "No Client"

    # Country
    $Country = "No Client"

    #Country Provider
    $CountryProvider = "No Client"

    # Device Identifier
    $DeviceIdentifier = "No Client"

    # Device Type
    $DeviceType = "No Client"

    # deviceTRUST Client
    $DeviceTrustClient = "Unavailable"
    
    # Economic Region
    $EconomicRegion = "No Client"
    
    # Firewall Name
    $FirewallName = "No Client"

    # Firewall Status 
    $FirewallStatus = "No Client"

    # Hardware BIOS Release Date
    $HardwareBiosReleaseDate = "No Client"

    # Hardware Model
    $HardwareModel = "No Client"

    # Hardware Role
    $HardwareRole = "No Client"

    # Hardware Secure Boot
    $HardwareSecureBoot = "No Client"

    # Hardware Vendor
    $HardwareVendor = "No Client"

    # Network Address Assignment
    $NetworkAddressAssignment = "No Client"
    
    # Network DHCP Server
    $NetworkDHCPServer = "No Client"
    
    # Network DNS Server
    $NetworkDNSServer = "No Client"
    
    # Network DNS Suffix
    $NetworkDNSSuffix = "No Client"
    
    # Network Gateway
    $NetworkGateway = "No Client"
    
    # Network Gateway Mac
    $NetworkGatewayMac = "No Client"
    
    # Network IP Address
    $NetworkIPAddress = "No Client"
    
    # Network Mac Address
    $NetworkMacAddress = "No Client"
    
    # Network Subnet
    $NetworkSubnet = "No Client"

    # OS Description
    $OSDescription = "No Client"
    
    # OS Disk Encryption
    $OSDiskEncryption = "No Client"
    
    # OS Name
    $OSNameArray = @(
        "Windows",
        "Linux",
        "Windows",
        "macOS",
        "macOS",
        "macOS",
        "Windows",
        "macOS",
        "Windows",
        "Linux"
    )
    $OSName = $OSNameArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # OS Platform
    $OSPlatform = "No Client"
    
    # OS Release
    $OSRelease = "No Client"
    
    # OS Type
    $OSType = "No Client"
    
    # OS Updates
    $OSUpdates = "No Client"
    
    # OS Version
    $OSVersion = "No Client"

    # Region Keyboard Locale
    $RegionKeyboardLocale = "No Client"

    # Region Locale
    $RegionLocale = "No Client"
    
    # Region Timezone Offset
    $RegionTimezoneOffset = "No Client"
    
    # Remote Controlled
    $RemoteControlled = "No Client"
    
    # Remoting Client Protocol
    $RemoteClientProtocolArray = @(
        "ICA",
        "RDP",
        "PCoIP",
        "Blast",
        "ICA",
        "RDP",
        "Blast",
        "ICA",
        "RDP",
        "RDP"
    )
    $RemoteClientProtocol = $RemoteClientProtocolArray[(Get-Random –Minimum 0 –Maximum 10)]    
  
    # Remoting Client Version
    $RemoteClientVersionArray = @(
        "19.3.0.5",
        "20.12.0.12",
        "20.9.0.3",
        "21.02.0.25",
        "20.1.23.21",
        "20.1.45.11",
        "20.1.23.21",
        "18.3.07.10",
        "17.06.01.01",
        "16.9.01.01"
    )
    if ($RemoteClientProtocol -eq "ICA" -or $RemoteClientProtocol -eq "Blast") {$RemoteClientVersion =  $RemoteClientVersionArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$RemoteClientVersion = "Unavailable"}
    
    # Secure Screen Saver
    $SecureScreenSaver = "No Client"

    # Security State
    $SecurityState = "No Client"

    # Session User Domain
    $SessionUserDomainArray = @(
        "CORPORATE",
        "company.local",
        "uk.corporate.local",
        "us.corporate.local",
        "de.corporate.local",
        "UK.local",
        "US.local",
        "DE.local",
        "Germany",
        "GLOBAL"
    )
    $SessionUserDomain = $SessionUserDomainArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Session User Name
    $SessionUserNameArray = @(
        "Use1",
        "ID65",
        "DEDA",
        "UKDA",
        "USWZ",
        "UID2",
        "PUDD",
        "GLDS",
        "DEVA",
        "Test1"
    )
    $SessionUserName = $SessionUserNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 100 –Maximum 10000)

    # User Authentication
    $UserAuthentication = "No Client"

    # User Privileges
    $UserPrivileges = "No Client"

    # Virtualized
    $Virtualized = "No Client"

    # VPN Connected
    $VPNConnected = "No Client"

    # Wi-Fi Security Mode
    $WiFiSecurityMode = "No Client"

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
        Authorization = "Splunk 500a67d4-df18-40ab-b1db-c4d47cc0e872"
        ContentType = "application/json"
    }

    
    Invoke-WebRequest -Uri "http://10.10.10.60:12201/gelf" -Method "POST" -Body $json -Headers $Headers  | Out-Null

    $counter = $counter + 1
    
}

until ($counter -gt 100)

$Counter = 1

do {

    # Session Date
    $SessionDate = Get-Date -Format yyyy-MM-ddTHH:mm:ss.000Z ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 13)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))

    # Device Name
    $DeviceNameArray = @(
        "DTLDTW9",
        "DTLDTW8",
        "ITC0008",
        "DE-TD76",
        "UK-TD32",
        "US-34TD",
        "CTDE123",
        "TESTDD1",
        "TESTDS9",
        "GLMANSV"
    )
    $DeviceName = $DeviceNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 1000 –Maximum 100000)
 
    # Access Mode
    $AccessModeArray = @(
        "Internal",
        "External",
        "Internal",
        "External",
        "External",
        "External",
        "Internal",
        "External",
        "Internal",
        "External"
    )
    $AccessMode = $AccessModeArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Anti-Virus Name
    $AntiVirusNameArray = @(
        "Microsoft Defender Antivirus",
        "Not installed",
        "Microsoft Defender Antivirus",
        "eset Anti-Virus",
        "McAfee Anti Virus",
        "Microsoft Defender Antivirus",
        "McAfee Anti Virus",
        "eset Anti-Virus",
        "Microsoft Defender Antivirus",
        "eset Anti-Virus",
        "Microsoft Defender Antivirus",
        "McAfee Anti Virus",
        "McAfee Anti Virus",
        "Not installed"
    )
    $AntiVirusName = $AntiVirusNameArray[(Get-Random –Minimum 0 –Maximum 14)]  

    # Anti-Virus Status
    $AntiVirusStatusArray = @(
        "Active",
        "Active",
        "Inactive",
        "Active",
        "Inactive",
        "Inactive",
        "Active",
        "Inactive",
        "Active",
        "Inactive"
    )
    if ($AntiVirusName -ne "Not installed") {$AntiVirusStatus = $AntiVirusStatusArray[(Get-Random –Minimum 0 –Maximum 10)]}
    if ($AntiVirusName -eq "Not installed") {$AntiVirusStatus = "Not applicable"}

    # Anti-Virus Timestamp
    if ($AntiVirusStatus -ne "Not applicable") {$AntiVirusTimestamp = ((Get-Date -Date $SessionDate).AddDays(-(Get-Random -Minimum 0 -Maximum 15))).ToString("yyyy-MM-ddTHH:mm:ss.000Z")}
    if ($AntiVirusStatus -eq "Not applicable") {$AntiVirusTimestamp = ""}

    # Country
    $CountryArray = @(
        "DE",
        "UK",
        "NL",
        "Unknown",
        "UK",
        "NL",
        "US",
        "CN",
        "DE",
        "DE",
        "US",
        "CA",
        "Unknown",
        "CA",
        "US",
        "CA",
        "Unknown",
        "DE",
        "CN",
        "RU"
    )
    $Country = $CountryArray[(Get-Random –Minimum 0 –Maximum 20)]

    # Country Provider
    $CountryProviderArray = @(
        "Whois",
        "OperatingSystem WiFi",
        "ThirdParty WiFi",
        "OperatingSystem WiFi",
        "ThirdParty WiFi",
        "OperatingSystem WiFi",
        "ThirdParty WiFi",
        "Whois",
        "OperatingSystem WiFi",
        "ThirdParty WiFi"
    )
    if ($Country -ne "Unknown") {$CountryProvider = $CountryProviderArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$CountryProvider = "Unknown"}

    # Device Type
    $DeviceTypeArray = @(
        "Windows (Azure AD)",
        "Windows (Domain)",
        "Windows (Workgroup)",
        "Windows (Azure AD)",
        "Windows (Domain)",
        "Windows (Workgroup)",
        "Windows (Azure AD)",
        "Windows (Domain)",
        "Windows (Azure AD)",
        "Windows (Domain)"
    )
    $DeviceType = $DeviceTypeArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Device Identifier
    if ($DeviceType -eq "Windows (Azure AD)") {
        $DeviceIdentifierArray = @("ac2123e7-fe2e-41c9-22bc-f4fg6af6ba08","ba213327-ghee-e1c7-2245-z4fh6af6ba08")
        $DeviceIdentifier = $DeviceIdentifierArray[(Get-Random –Minimum 0 –Maximum 2)]
    }

    if ($DeviceType -eq "Windows (Domain)") {
        $DeviceIdentifierArray = @("S-1-5-21-1397108472-4176295369-1616608269","S-1-5-21-2748017931-9635926714-9628066151","S-1-5-21-2723423931-2342346713-3333332423")
        $DeviceIdentifier = $DeviceIdentifierArray[(Get-Random –Minimum 0 –Maximum 3)]
    }

    if ($DeviceType -eq "Windows (Workgroup)") {$DeviceIdentifier = "Not applicable"}

    # deviceTRUST Client
    $DeviceTrustClient = "Available"
    
    # Economic Region
    if ($Country -eq "DE" -or $Country -eq "NL" -or $Country -eq "UK") {$EconomicRegion = "EMEA"}
    if ($Country -eq "US" -or $Country -eq "CA") {$EconomicRegion = "AMER"}
    if ($Country -eq "CN" -or $Country -eq "RU") {$EconomicRegion = "APAC"}
    if ($Country -eq "Unknown") {$EconomicRegion = "Unknown"}
    
    # Firewall Name
    $FirewallNameArray = @(
        "Microsoft Defender Firewall",
        "Windows Firewall",
        "Microsoft Defender Firewall",
        "Windows Firewall",
        "Not installed",
        "Microsoft Defender Firewall",
        "Microsoft Defender Firewall",
        "Not installed",
        "Microsoft Defender Firewall",
        "Not installed"

    )
    $FirewallName =  $FirewallNameArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Firewall Status
    $FirewallStatusArray = @(
        "Active",
        "Active",
        "Inactive",
        "Active",
        "Active",
        "Inactive",
        "Active",
        "Inactive",
        "Active",
        "Inactive"
    )
    if ($FirewallName -ne "Not installed") {$FirewallStatus = $FirewallStatusArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$FirewallStatus = "Not applicable"}

    # Hardware BIOS Release Date
    $HardwareBiosReleaseDate = ((((Get-Date -Date $SessionDate).AddMonths(-(Get-Random -Minimum 1 -Maximum 19)).AddHours(-(Get-Random -Minimum 1 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 1 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 1 -Maximum 61))).ToString("yyyy-MM-ddTHH:mm:ss.000Z")

    # Hardware Secure Boot
    $HardwareSecureBootArray = @(
        "true",
        "false",
        "false",
        "false",
        "true",
        "false",
        "true",
        "false",
        "false",
        "false"
    )
    $HardwareSecureBoot = $HardwareSecureBootArray[(Get-Random –Minimum 0 –Maximum 10)]   

    # Hardware Vendor
    $HardwareVendorArray = @(
        "HP Ltd.",
        "Thoshiba Inc.",
        "Apple Inc.",
        "LENOVO",
        "DELL Inc.",
        "Fujitsu GmbH",
        "LENOVO",
        "Microsoft Ltd.",
        "VMware Inc.",
        "VMware Inc."
    )
    $HardwareVendor = $HardwareVendorArray[(Get-Random –Minimum 0 –Maximum 10)]  

    # Hardware Model
    $HardwareModelArray = @(
        "ProBook7.1",
        "20M9CTO1WW",
        "ProBook10.1",
        "20M9CTO1WW",
        "PC234ABC",
        "PC2344XY",
        "20M9CTO1WW",
        "ProBook20.2",
        "12M10DO1EE",
        "EliteBook19a"
    )
    if ($HardwareVendor -ne "VMware Inc.") {$HardwareModel = $HardwareModelArray[(Get-Random –Minimum 0 –Maximum 10)]}   
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareModel = "VMware7.1"}

    # Hardware Role
    if ($HardwareVendor -ne "VMware Inc.") {$HardwareRole = "Laptop"}
    if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"}

    # Network Address Assignment
    $NetworkAddressAssignmentArray = @(
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static",
        "Static",
        "DHCP",
        "DHCP",
        "DHCP",
        "Static"
    )
    $NetworkAddressAssignment = $NetworkAddressAssignmentArray[(Get-Random –Minimum 0 –Maximum 10)]  
    
    # Network IP Address
    $NetworkIPAddressPrefixArray = @(
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123.",
        "10.199.12.",
        "17.123.77.",
        "192.168.0.",
        "192.168.17.",
        "192.168.122.",
        "10.100.123."
    )
    $NetworkIPPrefixAddress = $NetworkIPAddressPrefixArray[(Get-Random –Minimum 0 –Maximum 10)]
    $NetworkIPAddress = $NetworkIPPrefixAddress + (Get-Random –Minimum 15 –Maximum 255)
    
    # Network Mac Address
    $NetworkMacAddress = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
    
    # Network Subnet
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkSubnet = "192.168.0.0/24"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkSubnet = "192.168.17.0/24"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkSubnet = "192.168.122.0/23"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkSubnet = "10.100.123.0/20"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkSubnet = "10.199.12.0/23"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkSubnet = "17.123.77.0/21"}
     
    # Network Gateway
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGateway = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGateway = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGateway = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGateway = "10.100.123.244"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGateway = "10.199.12.114"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGateway = "17.123.77.1"}
    
    # Network Gateway Mac
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkGatewayMac = "0A-51-52-E2-49-41"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkGatewayMac = "0B-67-34-E1-8B-22"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkGatewayMac = "0C-78-21-F0-A9-10"}

    # Network DHCP Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDHCPServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDHCPServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDHCPServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDHCPServer = "10.100.123.254"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDHCPServer = "10.199.12.111"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDHCPServer = "17.123.77.2"}   
    
    # Network DNS Server
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSServer = "192.168.0.1"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSServer = "192.168.17.253"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSServer = "192.168.122.1"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSServer = "10.100.123.253"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSServer = "10.199.12.110"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSServer = "17.123.77.3"}

    # Network DNS Suffix
    if ($NetworkIPAddress -like "192.168.0.*") {$NetworkDNSSuffix = "fritz.box"}
    if ($NetworkIPAddress -like "192.168.17.*") {$NetworkDNSSuffix = "myhome.local"}
    if ($NetworkIPAddress -like "192.168.122.*") {$NetworkDNSSuffix = "corporate.net"}
    if ($NetworkIPAddress -like "10.100.123.*") {$NetworkDNSSuffix = "de.corporate.local"}
    if ($NetworkIPAddress -like "10.199.12.*") {$NetworkDNSSuffix = "uk.corporate.local"}
    if ($NetworkIPAddress -like "17.123.77.*") {$NetworkDNSSuffix = "us.corporate.local"}

    # OS Disk Encryption
    $OSDiskEncryptionArray = @(
        "True",
        "False",
        "False",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $OSDiskEncryption = $OSDiskEncryptionArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # OS Name
    $OSName = "Windows"

    # OS Platform
    $OSPlatformArray = @(
        "x64",
        "x64",
        "x64",
        "x86",
        "x86",
        "x64",
        "x64",
        "x64",
        "x86",
        "x86"
    )
    $OSPlatform = $OSPlatformArray[(Get-Random –Minimum 0 –Maximum 10)]   
    
    # OS Type
    $OSType = "Client"
    
    # OS Updates
    $OSUpdatesArray = @(
        "Up To Date",
        "Up To Date",
        "Pending Updates",
        "Check Required",
        "Up To Date",
        "Up To Date",
        "Pending Updates",
        "Check Required",
        "Pending Updates",
        "Check Required"
    )
    $OSUpdates = $OSUpdatesArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # OS Version
    $OSVersionArray = @(
        "10.0.17763", # 1809
        "10.0.19042", # 2009
        "6.1.7601", # Windows 7
        "6.3.1798", # Windows 8.1
        "10.191206", # 20H2
        "10.0.17763", # 1809
        "10.0.19042", # 2009
        "6.1.7601", # Windows 7
        "6.3.1798", # Windows 8.1
        "10.191206" # 20H2
    )
    $OSVersion = $OSVersionArray[(Get-Random –Minimum 0 –Maximum 10)]   

    # OS Description
    if ($OSVersion -eq "10.0.17763") {$OSDescription = "Windows 10 Enterprise LTSC 2019"}
    if ($OSVersion -eq "10.0.19042") {$OSDescription = "Windows 10 Pro"}
    if ($OSVersion -eq "6.1.7601") {$OSDescription = "Windows 7 Ultimate"}
    if ($OSVersion -eq "6.3.1798") {$OSDescription = "Windows 8.1 Pro"}
    if ($OSVersion -eq "10.191206") {$OSDescription = "Windows 10 Enterprise"}

    # OS Release
    if ($OSVersion -eq "10.0.17763") {$OSRelease = "1809"}
    if ($OSVersion -eq "10.0.19042") {$OSRelease = "2009"}
    if ($OSVersion -eq "6.1.7601") {$OSRelease = "Unsupported OS"}
    if ($OSVersion -eq "6.3.1798") {$OSRelease = "Unsupported OS"}
    if ($OSVersion -eq "10.191206") {$OSRelease = "20H2"}

    # Region Keyboard Locale
    $RegionKeyboardLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionKeyboardLocale = $RegionKeyboardLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Locale
    $RegionLocaleArray = @(
        "de-DE",
        "en-UK",
        "en-US",
        "en-CA",
        "nl-NL",
        "zh-CN",
        "ru-RU",
        "de-DE",
        "en-UK",
        "en-US"
    )
    $RegionLocale = $RegionLocaleArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Region Timezone Offset
    $RegionTimezoneOffsetArray = @(
        "-720",
        "-660",
        "-600",
        "-480",
        "-60",
        "0",
        "60",
        "60",
        "360",
        "480"
    )
    $RegionTimezoneOffset = $RegionTimezoneOffsetArray[(Get-Random –Minimum 0 –Maximum 10)] 
    
    # Remote Controlled
    $RemoteControlledArray = @(
        "True",
        "False",
        "True",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $RemoteControlled = $RemoteControlledArray[(Get-Random –Minimum 0 –Maximum 10)]  
    
    # Remoting Client Protocol
    $RemoteClientProtocolArray = @(
        "ICA",
        "RDP",
        "PCoIP",
        "Blast",
        "ICA",
        "ICA",
        "Blast",
        "ICA",
        "PCoIP",
        "RDP"
    )
    $RemoteClientProtocol = $RemoteClientProtocolArray[(Get-Random –Minimum 0 –Maximum 10)]    
  
    # Remoting Client Version
    $RemoteClientVersionArray = @(
        "19.3.0.5",
        "20.12.0.12",
        "20.9.0.3",
        "21.02.0.25",
        "20.1.23.21",
        "20.1.45.11",
        "20.1.23.21",
        "18.3.07.10",
        "17.06.01.01",
        "16.9.01.01"
    )
    if ($RemoteClientProtocol -eq "ICA" -or $RemoteClientProtocol -eq "Blast") {$RemoteClientVersion =  $RemoteClientVersionArray[(Get-Random –Minimum 0 –Maximum 10)]}
    else {$RemoteClientVersion = "Unavailable"}
    
    # Secure Screen Saver
    $SecureScreenSaverArray = @(
        "True",
        "False",
        "False",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $SecureScreenSaver = $SecureScreenSaverArray[(Get-Random –Minimum 0 –Maximum 10)] 

    # Security State
    if ($AntiVirusStatus -eq "Active" -and $FirewallStatus -eq "Active") {$SecurityState = "Protected"}
    else {$SecurityState = "Unprotected"}

    # Session User Domain
    $SessionUserDomainArray = @(
        "CORPORATE",
        "company.local",
        "uk.corporate.local",
        "us.corporate.local",
        "de.corporate.local",
        "UK.local",
        "US.local",
        "DE.local",
        "Germany",
        "GLOBAL"
    )
    $SessionUserDomain = $SessionUserDomainArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Session User Name
    $SessionUserNameArray = @(
        "UserA",
        "IDA",
        "DEDD",
        "UKDC",
        "USWS",
        "UIDA",
        "PUID",
        "GLUF",
        "DEVE",
        "TestA"
    )
    $SessionUserName = $SessionUserNameArray[(Get-Random –Minimum 0 –Maximum 10)] + (Get-Random –Minimum 100 –Maximum 10000)

    # User Authentication
    $UserAuthenticationArray = @(
        "Kerberos",
        "Negotiate",
        "CloudAP",
        "Kerberos",
        "CloudAP",
        "Kerberos",
        "Kerberos",
        "CloudAP",
        "Kerberos",
        "CloudAP"
    )
    $UserAuthentication = $UserAuthenticationArray[(Get-Random –Minimum 0 –Maximum 10)]

    # User Privileges
    $UserPrivilegesArray = @(
        "Limited",
        "Privileged with UAC",
        "Privileged without UAC",
        "Limited",
        "Privileged with UAC",
        "Privileged without UAC",
        "Limited",
        "Privileged with UAC",
        "Privileged without UAC",
        "Privileged without UAC"
    )
    $UserPrivileges = $UserPrivilegesArray[(Get-Random –Minimum 0 –Maximum 10)]
    
    # Virtualized
    if ($HardwareVendor -eq "VMware Inc.") {$Virtualized = "True"}
    else {$Virtualized = "False"}

    # VPN Connected
    $VPNConnectedArray = @(
        "True",
        "False",
        "False",
        "False",
        "True",
        "False",
        "True",
        "False",
        "False",
        "False"
    )
    $VPNConnected = $VPNConnectedArray[(Get-Random –Minimum 0 –Maximum 10)]

    # Wi-Fi Security Mode
    $WiFiSecurityModeArray = @(
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure",
        "Secure",
        "No Wi-Fi",
        "Insecure"
    )
    $WiFiSecurityMode = $WiFiSecurityModeArray[(Get-Random –Minimum 0 –Maximum 10)]


    $HardwareBiosReleaseDate = "2021-05-03T05:42:38.000Z"

$json = @"
{
    "event": "Status Report Log Entry created for $DeviceName",
    "short_message":"Status Report log entry created", 
    "host":"$DeviceName",
    "facility":"dt_statusreport",
    "Session Date": "$SessionDate",
    "Device Name": "$DeviceName",
    "Access Mode": "$AccessMode", //string
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
"@

$json = @"
{
    "event": "Status Report Log Entry created for $DeviceName",
    "short_message":"Status Report log entry created", 
    "host":"$DeviceName",
    "facility":"dt_statusreport"
}
"@
        
    Invoke-WebRequest -Uri "http://10.10.10.60:12201/gelf" -Method "POST" -Body $json | Out-Null

    $counter = $counter + 1
    
}

until ($counter -gt 10)