# Session Date
# Define the start and end dates
$endDate = Get-Date
$startDate = $endDate.AddYears(-3)

# Calculate the total number of seconds between the start and end dates
$totalSeconds = [math]::Round(($endDate - $startDate).TotalSeconds)

# Generate a random number of seconds to add to the start date
$randomSeconds = Get-Random -Minimum 0 -Maximum $totalSeconds

# Calculate the random date
$randomDate = $startDate.AddSeconds($randomSeconds)

# Format the random date as yyyy-MM-ddTHH:mm:ss.000Z
$SessionDate  = $randomDate.ToString("yyyy-MM-ddTHH:mm:ss.fffZ")