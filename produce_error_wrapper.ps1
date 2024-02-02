# Define the path to the executable
$exePath = ".\produce_error.exe"

# Initialize StringBuilder
$outputBuilder = [System.Text.StringBuilder]::new()

# Start the process
$process = New-Object System.Diagnostics.Process
$process.StartInfo.FileName = $exePath
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.UseShellExecute = $false
$process.StartInfo.CreateNoWindow = $true
$process.Start()

# Read the output and append it to the StringBuilder
$outputBuilder.Append($process.StandardOutput.ReadToEnd())

# Wait for the process to complete
$process.WaitForExit()

# Convert the StringBuilder to a string when needed
$output = $outputBuilder.ToString()

# Define the specific text to detect in the output
$textToDetect = "Process completed with error(s)."

# Check if the specific text is present in the output
if ($output -match [regex]::Escape($textToDetect)) {
    Write-Host "Text detected: $textToDetect"
    
    # Set a non-zero exit code (you can customize the exit code as needed)
    $exitCode = 1
} else {
    Write-Host "Text not detected: $textToDetect"
        Write-Host "Detected Output: $output"
    
    # Set the exit code to zero (success)
    $exitCode = 0
}

# Exit with the specified exit code
exit $exitCode
