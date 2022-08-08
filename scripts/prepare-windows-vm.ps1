# Setup logging
Start-Transcript -path "C:\MachinePrep\logs\log.txt"

# Create directory to store installation files
New-Item -ItemType directory -Path C:\MachinePrep\files

try {
    # Install RSAT Tools
    Write-Host "Installing RSAT Tools..."
    Install-WindowsFeature -IncludeAllSubFeature RSAT
}
catch {
    Write-Host "Unable to install RSAT Tools"
}

try {

    # Install nuget package manager
    Write-Host "Installing nuget..."
    Install-PackageProvider -Name Nuget -Force 

    # Install Azure CLI
    Write-Host "Downloading Azure CLI..."
    $uri = "https://aka.ms/installazurecliwindows"
    Invoke-WebRequest -Uri $uri -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

    # Install Azure PowerShell
    Write-Host "Installing Azure CLI..."
    Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
}

catch {
    Write-Host "Unable to install Azure CLI"
}

Stop-Transcript 