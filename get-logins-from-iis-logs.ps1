# Parsing IIS logs
# Get logins from IIS log

# IIS log path
$destinationPath = '\\computer\d$\logs'

# Result path
$resultPath = '\\computer\d$\result'

# Microsoft logparser path
# Download Microsoft LogParser 2.2: https://www.microsoft.com/en-us/download/confirmation.aspx?id=24659
$logParserPath = 'C:\Program Files (x86)\Log Parser 2.2'

$lDate = Get-Date $lastDate -format "dd-MM-yyyy"

$inFile = "$destinationPath\*"
$outFile = "$resultPath\result_$lDate.csv"

$query = @"
SELECT date, time, cs-username, sc-status
FROM $infile
TO $outFile
WHERE (sc-status = 200)
GROUP BY date, time, cs-username, sc-status
"@

& "$logParserPath\logparser.exe" $query -i:w3c
