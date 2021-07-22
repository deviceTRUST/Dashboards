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
"@

    Write-Host "$Counter,$SessionDate,$DeviceName,$AccessMode,$AntiVirusName,$AntiVirusStatus,$AntiVirusTimestamp,$Country,$CountryProvider,$DeviceIdentifier,$DeviceType,$DeviceTrustClient,$EconomicRegion,$FirewallName,$FirewallStatus,$HardwareBiosReleaseDate,$HardwareModel,$HardwareRole,$HardwareSecureBoot,$HardwareVendor,$NetworkAddressAssignment,$NetworkDHCPServer,$NetworkDNSServer,$NetworkDNSSuffix,$NetworkGateway,$NetworkGatewayMac,$NetworkIPAddress,$NetworkMacAddress,$NetworkSubnet,$OSDescription,$OSDiskEncryption,$OSName,$OSPlatform,$OSRelease,$OSType,$OSUpdates,$OSVersion,$RegionKeyboardLocale,$RegionLocale,$RegionTimezoneOffset,$RemoteControlled,$RemoteClientProtocol,$RemoteClientVersion,$SecureScreenSaver,$SecurityState,$SessionUserDomain,$SessionUserName,$UserAuthentication,$UserPrivileges,$Virtualized,$VPNConnected,$WiFiSecurityMode"
    # "$Counter,$SessionDate,$DeviceName,$AccessMode,$AntiVirusName,$AntiVirusStatus,$AntiVirusTimestamp,$Country,$CountryProvider,$DeviceIdentifier,$DeviceType,$DeviceTrustClient,$EconomicRegion,$FirewallName,$FirewallStatus,$HardwareBiosReleaseDate,$HardwareModel,$HardwareRole,$HardwareSecureBoot,$HardwareVendor,$NetworkAddressAssignment,$NetworkDHCPServer,$NetworkDNSServer,$NetworkDNSSuffix,$NetworkGateway,$NetworkGatewayMac,$NetworkIPAddress,$NetworkMacAddress,$NetworkSubnet,$OSDescription,$OSDiskEncryption,$OSName,$OSPlatform,$OSRelease,$OSType,$OSUpdates,$OSVersion,$RegionKeyboardLocale,$RegionLocale,$RegionTimezoneOffset,$RemoteControlled,$RemoteClientProtocol,$RemoteClientVersion,$SecureScreenSaver,$SecurityState,$SessionUserDomain,$SessionUserName,$UserAuthentication,$UserPrivileges,$Virtualized,$VPNConnected,$WiFiSecurityMode" | Out-File -FilePath "C:\Transfer\dT_StatusReport_macOS.csv" -Append

    Invoke-WebRequest -Uri "http://dtldlt02.demo.devicetrust.local:9200/dt_statusreport/_doc" -Method "POST" -ContentType "application/json" -Body $json | Out-Null

    $counter = $counter + 1
    
 }

until ($counter -gt 100)