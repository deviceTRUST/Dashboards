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
    # "$Counter,$SessionDate,$DeviceName,$AccessMode,$AntiVirusName,$AntiVirusStatus,$AntiVirusTimestamp,$Country,$CountryProvider,$DeviceIdentifier,$DeviceType,$DeviceTrustClient,$EconomicRegion,$FirewallName,$FirewallStatus,$HardwareBiosReleaseDate,$HardwareModel,$HardwareRole,$HardwareSecureBoot,$HardwareVendor,$NetworkAddressAssignment,$NetworkDHCPServer,$NetworkDNSServer,$NetworkDNSSuffix,$NetworkGateway,$NetworkGatewayMac,$NetworkIPAddress,$NetworkMacAddress,$NetworkSubnet,$OSDescription,$OSDiskEncryption,$OSName,$OSPlatform,$OSRelease,$OSType,$OSUpdates,$OSVersion,$RegionKeyboardLocale,$RegionLocale,$RegionTimezoneOffset,$RemoteControlled,$RemoteClientProtocol,$RemoteClientVersion,$SecureScreenSaver,$SecurityState,$SessionUserDomain,$SessionUserName,$UserAuthentication,$UserPrivileges,$Virtualized,$VPNConnected,$WiFiSecurityMode" | Out-File -FilePath "C:\Transfer\dT_StatusReport_NoClient.csv" -Append
    
    Invoke-WebRequest -Uri "http://dtldlt02.demo.devicetrust.local:9200/dt_statusreport/_doc" -Method "POST" -ContentType "application/json" -Body $json | Out-Null

    $counter = $counter + 1
    
 }

until ($counter -gt 1000)