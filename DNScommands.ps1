#Remove A Records
Import-Csv C:\users\jphillips\Desktop\resolutedns.csv | foreach{Remove-DnsServerResourceRecord -Name $_.hostname -ZoneName saprfp.com -RRType A -ComputerName WIN-A3S43O689DF -Confirm:$false -Force}

#Add A Records
Import-Csv C:\users\jphillips\Desktop\resolutedns.csv | foreach{Add-DnsServerResourceRecordA -Name $_.hostname -ZoneName saprfp.com -IPv4Address $_.ip -TimeToLive 01:00:00 -ComputerName WIN-A3S43O689DF}

#Remove PTR Records from CSV
Import-Csv C:\users\jphillips\Desktop\resolutedns.csv | foreach{Remove-DnsServerResourceRecord -Name $_.ptrdrip -ZoneName $_.zone81 -RRType PTR -ComputerName WIN-A3S43O689DF -Confirm:$false -Force}

#Add PTR Records from CSV
Import-Csv C:\users\jphillips\Desktop\resolutedns.csv | foreach{Add-DnsServerResourceRecordPTR -PTRDomainName $_.ptrname -ZoneName $_.zone80 -Name $_.ptrip -TimeToLive 01:00:00 -ComputerName WIN-A3S43O689DF}

#Change Cname Records from CSV
Import-CSV C:\users\admin\Desktop\resolutecname.csv | foreach{Add-DNSServerResourceRecordCName -Name $_.hostname -ZoneName saprfp.com -HostNameAlias $_.alias -TimeToLive 01:00:00 -ComputerName WIN-A3S43O689DF}
