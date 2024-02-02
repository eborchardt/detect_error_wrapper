# Define the path to the executable
$exePath = ".\produce_error.exe"

# Run the executable and capture its output
$output = & $exePath

# Define the specific text to detect in the output
$textToDetect = "Process completed with error(s)."

# Check if the specific text is present in the output
if ($output -match [regex]::Escape($textToDetect)) {
    Write-Host "Text detected: $textToDetect"
    
    # Set a non-zero exit code (you can customize the exit code as needed)
    $exitCode = 1
} else {
    Write-Host "Text not detected: $textToDetect"
    
    # Set the exit code to zero (success)
    $exitCode = 0
}

# Exit with the specified exit code
exit $exitCode