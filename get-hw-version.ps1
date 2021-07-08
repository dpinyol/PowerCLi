# Importamos funciones
Import-Module "utils/vcenterUtils.psm1"
# Instanciamos Credenciales de Acceso a vcenter
Credenciales
# Iniciamos conexion con vCenter
Conecta-vCenters
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

$vms = @();

# listamos relacion de vms con su HW Virtual

Get-Vm $vms | Select-Object Name,@{N='HW Version';E={$_.ExtensionData.Config.Version}} | Ft -AutoSize
