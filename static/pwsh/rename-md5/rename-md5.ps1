$algorithm = 'md5';
$sourceFolder = 'C:\~\inbox\wallpapers'
$destinationFolder = 'C:\Wave\project\github.com\fix-ik\pomogator-wave\static\image\neuro'

Get-ChildItem -Path $sourceFolder | ForEach-Object {
    $hash = Get-FileHash -Path $_ -Algorithm $algorithm
    $NewName = '{0}\{1}{2}' -f $destinationFolder,$hash.Hash,$_.Extension
    Write-Host "| src = " $hash.Path -ForegroundColor Yellow 
    Move-Item -Path $hash.Path -Destination $NewName -Force
    Write-Host "|     + Скопировано: $NewName" -ForegroundColor Green
}
