$source = 'posts';
$destination = 'satisfactory';
$sourceFolder = 'C:\Wave\project\github.com\fix-ik\pomogator-wave\_posts'
$sourceJsonPath = "$sourceFolder\$source.json";
$destinationFolder = "C:\Wave\project\github.com\fix-ik\pomogator-wave\$destination";
$from = 'assets/images/'
$to = "static/image/$destination/"


Get-ChildItem -Path $sourceFolder -Recurse | ForEach-Object {
    if ($_.FullName -eq $sourceJsonPath) {
        $NewName = '{0}\{1}{2}' -f $destinationFolder,$destination,$_.Extension
    } else {
        $NewName = '{0}\{1}\{2}{3}' -f $destinationFolder,$_.BaseName,'index',$_.Extension
    }
    New-Item -Path $NewName -Type file -Force
    (Get-Content $_).Replace($from, $to) | Set-Content -Path $NewName
    
    Write-Host "|~> $NewName" -ForegroundColor Green
}
