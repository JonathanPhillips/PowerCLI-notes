10 biggest files:
gci -r|sort -descending -property length | select -first 10 name, @{Name="Gigabytes";Expression={[Math]::round($_.length / 1GB, 2)}}
