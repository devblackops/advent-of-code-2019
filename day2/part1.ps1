[cmdletbinding()]
param(
    [string]$Path
)

[int[]]$intCode = (Get-Content $Path) -split ','

$intCode[1] = 12
$intCode[2] = 2

$x = 0

for ($x = 0; $x -lt $intCode.Count) {
    $operator = $intCode[$x]
    if ($operator -eq 99) {
        break
    } elseIf ($operator -eq 1) {
        $leftHand    = $intCode[$intCode[$x + 1]]
        $rightHand   = $intCode[$intCode[$x + 2]]
        $resultIndex = $intCode[$x + 3]
        $intCode[$resultIndex] = ($leftHand + $rightHand)
    } elseIf ($operator -eq 2) {
        $leftHand    = $intCode[$intCode[$x + 1]]
        $rightHand   = $intCode[$intCode[$x + 2]]
        $resultIndex = $intCode[$x + 3]
        $intCode[$resultIndex] = ($leftHand * $rightHand)
    } else {
        break
    }
    $x += 4
}

$intCode -join ','
