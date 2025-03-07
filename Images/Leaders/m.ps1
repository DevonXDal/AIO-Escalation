# Define the output directory
$outputDir = "C:\Users\devon\Documents\My Games\ICBM-Escalation\MODS\AIO-Escalation\Images\Leaders\"

# Define the range of slots
$unusedSlots = 121..254

# Define colors
$unusedColor = "000000/AAAAAA"  # Black background with light gray text
$reservedColor = "3A4F50/D8E6E7"  # Teal-gray background with lighter text

foreach ($slot in $unusedSlots) {
    # Determine if the slot is reserved
    if ($slot -ge 121 -and $slot -le 170) {
        $text = "Reserved Slot #$slot"
        $color = $reservedColor
    } else {
        $text = "Unused Slot Id #$slot"
        $color = $unusedColor
    }

    # Construct the URL
    $url = "https://placehold.co/368x512/$color/png?text=$([uri]::EscapeDataString($text))"

    # Define the output file path
    $outputFile = "$outputDir" + "LEADER_" + "$slot.png"

    # Download the image
    Invoke-WebRequest -Uri $url -OutFile $outputFile
    Write-Host "Downloaded: $outputFile from $url"
}

Write-Host "All images have been downloaded successfully."