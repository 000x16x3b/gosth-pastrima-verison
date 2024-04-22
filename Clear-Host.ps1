Clear-Host

Write-Host @"
[38;2;160;32;240;48;2m
██╗  ██╗███████╗███╗   ██╗███╗   ██╗███████╗██████╗ ██╗   ██╗
██║ ██╔╝██╔════╝████╗  ██║████╗  ██║██╔════╝██╔══██╗╚██╗ ██╔╝
█████╔╝ █████╗  ██╔██╗ ██║██╔██╗ ██║█████╗  ██║  ██║ ╚████╔╝ 
██╔═██╗ ██╔══╝  ██║╚██╗██║██║╚██╗██║██╔══╝  ██║  ██║  ╚██╔╝  
██║  ██╗███████╗██║ ╚████║██║ ╚████║███████╗██████╔╝   ██║   
╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═════╝    ╚═╝   
                                                             [0m
"@ -ForegroundColor Magenta

Write-Host "Made by MinikAyicuhV5 / Kennedy for MDRP`n"

# Define paths for Desktop and Downloads directories
$desktopPath = [Environment]::GetFolderPath("Desktop")
$downloadsPath = [Environment]::GetFolderPath("Downloads")

# Get all files in Desktop and Downloads directories
$desktopFiles = Get-ChildItem -Path $desktopPath -File -Recurse -ErrorAction SilentlyContinue
$downloadsFiles = Get-ChildItem -Path $downloadsPath -File -Recurse -ErrorAction SilentlyContinue

# Check files in Desktop directory
foreach ($file in $desktopFiles) {
    # Check if the file is an executable
    if ($file.Extension -eq ".exe") {
        # Check if the file has a digital signature
        $signature = $null
        try {
            $signature = (Get-AuthenticodeSignature $file.FullName).Status
        } catch {
            # Ignore errors caused by unsigned files
        }

        if ($signature -ne "Valid") {
            Write-Host "UNSIGNED FILE DETECTED ON DESKTOP: $($file.FullName)"
        }
    }
}

# Check files in Downloads directory
foreach ($file in $downloadsFiles) {
    # Check if the file is an executable
    if ($file.Extension -eq ".exe") {
        # Check if the file has a digital signature
        $signature = $null
        try {
            $signature = (Get-AuthenticodeSignature $file.FullName).Status
        } catch {
            # Ignore errors caused by unsigned files
        }

        if ($signature -ne "Valid") {
            Write-Host "UNSIGNED FILE DETECTED IN DOWNLOADS: $($file.FullName)"
        }
    }
}
