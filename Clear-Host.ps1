Clear-Host
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

$system32Path = "$env:SystemRoot\System32"

# Get all files in System32 directory
$files = Get-ChildItem -Path $system32Path -File -Recurse -ErrorAction SilentlyContinue

foreach ($file in $files) {
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
            Write-Host "BU RUNNER OLABLR !!!!!!!!!!!!: $($file.FullName)"
        }
    }
}
