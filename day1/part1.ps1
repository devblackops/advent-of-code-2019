[cmdletbinding()]
param(
    [string]$Path
)

$modules = Get-Content $Path
$totalFuel = 0
foreach ($module in $modules) {
    $totalFuel += [math]::Floor($module / 3) - 2
}

$totalFuel
