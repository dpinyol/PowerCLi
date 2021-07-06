# PowerCli vCenter utils

Import-Module VMware.PowerCLI

$vCenters =  @()


function Credenciales {
    $newCredential = Get-Credential
    ForEach ($vCenter in $vCenters) {
        New-ViCredentialStoreItem -Host $vCenter -User $newCredential.UserName -Password $newCredential.GetNetworkCredential().password
    }
}

function Conecta-vCenters {
    ForEach ($vCenter in $vCenters) {
        Connect-ViServer -Server $vCenter
    }
}

function Desconecta-vCenters {
    Disconnect-ViServer -Server * -Force -Confirm:$false
}
