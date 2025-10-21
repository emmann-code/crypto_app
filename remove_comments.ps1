# PowerShell script to remove comments from Dart files

# Function to remove comments from a single file
function Remove-CommentsFromFile {
    param (
        [string]$filePath
    )
    
    # Read the file content
    $content = Get-Content -Path $filePath -Raw
    
    # Remove single-line comments (// ...) but not URLs (http:// or https://)
    $content = [regex]::Replace($content, '(?<!https?:)//.*?$', '', [System.Text.RegularExpressions.RegexOptions]::Multiline)
    
    # Remove multi-line comments (/* ... */)
    $content = [regex]::Replace($content, '/\*.*?\*/', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # Remove empty lines
    $lines = $content -split [Environment]::NewLine | Where-Object { $_.Trim() -ne '' }
    
    # Save the modified content
    $lines | Set-Content -Path $filePath -NoNewline:$false
}

# Get all .dart files in the lib directory
$dartFiles = Get-ChildItem -Path "c:\Users\USER\Desktop\EMMANUEL WORK\Roqqu\roquu_app\lib" -Recurse -Filter "*.dart" -File

# Process each file
foreach ($file in $dartFiles) {
    Write-Host "Processing $($file.FullName)"
    
    # Create a backup of the original file
    $backupPath = "$($file.FullName).bak"
    if (-not (Test-Path $backupPath)) {
        Copy-Item -Path $file.FullName -Destination $backupPath -Force
    }
    
    # Remove comments from the file
    Remove-CommentsFromFile -filePath $file.FullName
}

Write-Host "Comment removal complete. Original files have been backed up with .bak extension."
