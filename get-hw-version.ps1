# Get-VM HW Version
$listvms = @('',
             '',
             '' ) 

ForEach ($vm in $listvms) {
   Get-Vm  | Select-Object Name,@{N='HW Version';E={$_.ExtensionData.Config.Version}} | FT
}
