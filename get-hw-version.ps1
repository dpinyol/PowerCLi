# Get-VM HW Version
$listvms = @('',
             '',
             '' ) 

ForEach ($vm in $listvms) {
   Get-Vm -Name $vm  | Select-Object Name,@{N='HW Version';E={$_.ExtensionData.Config.Version}} | FT
}
