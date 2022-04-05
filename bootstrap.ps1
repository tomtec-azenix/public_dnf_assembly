mkdir C:\tomtec
# download Program.cs
cd C:\tomtec

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
curl -UseBasicParsing "https://download.sysinternals.com/files/SysinternalsSuite.zip" -OutFile "SysinternalsSuite.zip"
curl -UseBasicParsing "https://1.as.dl.wireshark.org/win64/Wireshark-win64-3.6.3.exe" -OutFile "Wireshark.exe"
curl -UseBasicParsing "https://raw.githubusercontent.com/tomtec-azenix/public_dnf_assembly/main/45.cs" -OutFile "45.cs"
curl -UseBasicParsing "https://raw.githubusercontent.com/tomtec-azenix/public_dnf_assembly/main/48.cs" -OutFile "48.cs"

Expand-Archive "SysinternalsSuite.zip"

# start -wait .\wireshark.exe /S OEM issue
# curl -UseBasicParsing "https://nmap.org/dist/nmap-7.92-win32.zip" -OutFile "nmap.zip" OEM issue sigh.
# Expand-Archive "nmap.zip"
# cd nmap/nmap-7.92
# cd ..\..\

# curl "https://go.microsoft.com/fwlink/?linkid=2088517" -UseBasicParsing -OutFile "dnf_installer.exe" # Download dnf sdk4.8
# .\dnf_installer /q /norestart

$env:Path += "C:\Windows\Microsoft.NET\Framework64\v4.0.30319;"
csc -out:".\45.exe" ".\45.cs" -r:"C:\Windows\assembly\NativeImages_v4.0.30319_32\System.Net.Http\1f5683ca41b9cd1c0e120dac11c6364e\System.Net.Http.ni.dll"
csc -out:".\48.exe" ".\48.cs" -r:"C:\Windows\assembly\NativeImages_v4.0.30319_32\System.Net.Http\1f5683ca41b9cd1c0e120dac11c6364e\System.Net.Http.ni.dll"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force # has to be run by hand to solve nuget

start -wait .\wireshark.exe # has to be run by hand to solve oem issue

