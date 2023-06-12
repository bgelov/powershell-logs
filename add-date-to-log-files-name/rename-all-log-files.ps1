# Rename all log files
Get-ChildItem -Path D:\logs -Filter "*.log*" -Recurse |`
Rename-Item -NewName {$_.Name -Replace "\.log$", "-$(Get-Date -Format {yyyy-MM-dd}).log"}
