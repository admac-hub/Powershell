#############################################################
#            Run unistaller in silent mode                  #
#############################################################





$path = "\\server\softwares\"
$softwares = import-csv "\\server\softwares\pkgs.csv" -Delimiter "," -Header 'Installer','Switch' | Select-Object Installer,Switch

foreach($software in $softwares){
 
    $softexec = $software.Installer
    $softexec = $softexec.ToString()

    $pkgs = Get-ChildItem $path$softexec | Where-Object {$_.Name -eq $softexec}


    foreach($pkg in $pkgs){
   
        $ext = [System.IO.Path]::GetExtension($pkg)
        $ext = $ext.ToLower()

        $switch = $software.Switch
        $switch = $switch.Tostring()

        if($ext -eq ".msi"){
        mkdir c:\Temp\Softwares -Force
        Copy-Item "$path$softexec" -Recurse c:\Temp\Softwares -Force
        Write-host "Installing $softexec silently, please wait...." -foregroundColor Yellow
        Start-Process "c:\Temp\Softwares\$softexec" -ArgumentList "$switch" -wait

        Remove-item "c:\temp\softwares\$softexec" -Recurse -Force
        Write-host "Installation of $softexec completed" -foregroundColor Green
       
        }
        else{
       
        mkdir c:\Temp\Softwares -Force
        Copy-Item "$path$softexec" -Recurse c:\Temp\Softwares -Force
        Write-host "Installing $softexec silently, please wait...." -foregroundColor Yellow
        Start-Process "c:\Temp\Softwares\$softexec" -ArgumentList "$switch" -wait -NoNewWindow

        Remove-item "c:\temp\softwares\$softexec" -Recurse -Force
        Write-host "Installation of $softexec completed" -foregroundColor Green
       
        }     
   
   
    }
}