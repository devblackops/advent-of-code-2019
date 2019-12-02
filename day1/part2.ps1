[cmdletbinding()]
param(
    [string]$Path
)

$modules   = Get-Content $Path
$totalFuel = 0

foreach ($module in $modules) {
    $moduleFuel = [Math]::Floor($module / 3) - 2
    $totalFuel += $moduleFuel

    $moduleFuelFuel = 0
    $continueCalculations = $true
    while ($continueCalculations) {
        $moduleFuel = [Math]::Floor($moduleFuel / 3) - 2
        if ($moduleFuel -lt 0) {
            $continueCalculations = $false
        } else {
            $moduleFuelFuel += $moduleFuel
        }
    }
    $totalFuel += $moduleFuelFuel
}

$totalFuel
