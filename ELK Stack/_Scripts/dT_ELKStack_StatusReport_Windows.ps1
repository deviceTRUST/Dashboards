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
    # "$Counter,$SessionDate,$DeviceName,$AccessMode,$AntiVirusName,$AntiVirusStatus,$AntiVirusTimestamp,$Country,$CountryProvider,$DeviceIdentifier,$DeviceType,$DeviceTrustClient,$EconomicRegion,$FirewallName,$FirewallStatus,$HardwareBiosReleaseDate,$HardwareModel,$HardwareRole,$HardwareSecureBoot,$HardwareVendor,$NetworkAddressAssignment,$NetworkDHCPServer,$NetworkDNSServer,$NetworkDNSSuffix,$NetworkGateway,$NetworkGatewayMac,$NetworkIPAddress,$NetworkMacAddress,$NetworkSubnet,$OSDescription,$OSDiskEncryption,$OSName,$OSPlatform,$OSRelease,$OSType,$OSUpdates,$OSVersion,$RegionKeyboardLocale,$RegionLocale,$RegionTimezoneOffset,$RemoteControlled,$RemoteClientProtocol,$RemoteClientVersion,$SecureScreenSaver,$SecurityState,$SessionUserDomain,$SessionUserName,$UserAuthentication,$UserPrivileges,$Virtualized,$VPNConnected,$WiFiSecurityMode" | Out-File -FilePath "C:\Transfer\dT_StatusReport_Windows.csv" -Append
    
    Invoke-WebRequest -Uri "http://dtldlt02.demo.devicetrust.local:9200/dt_statusreport/_doc" -Method "POST" -ContentType "application/json" -Body $json | Out-Null

    $counter = $counter + 1

 }

until ($counter -gt 3000)