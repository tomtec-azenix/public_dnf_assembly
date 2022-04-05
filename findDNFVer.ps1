
cmd /r "cd C:\ && dir /s /b *.dll" > dlllist.txt
rm output.csv

foreach ($dll in  Get-Content dlllist.txt) {
    try { $val = [Reflection.Assembly]::ReflectionOnlyLoadFrom($dll).ImageRuntimeVersion
        echo "`"$dll`",`"$val`"" >> output.csv
 } catch {}
}
