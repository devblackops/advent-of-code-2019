[cmdletbinding()]
param(
    [string]$Path
)

[int[]]$intCode = (Get-Content $Path) -split ','

function PerformInstruction {
    param(
        [int]$Noun,
        [int]$Verb,
        [int[]]$Instructions
    )

    $Instructions[1] = $Noun
    $Instructions[2] = $Verb

    for ($x = 0; $x -lt $Instructions.Count) {
        $operator = $Instructions[$x]

        if ($operator -eq 99) {
            break
        }

        $leftHand    = $Instructions[$Instructions[$x + 1]]
        $rightHand   = $Instructions[$Instructions[$x + 2]]
        $resultIndex = $Instructions[$x + 3]

        If ($operator -eq 1) {
            $Instructions[$resultIndex] = ($leftHand + $rightHand)
        } elseIf ($operator -eq 2) {
            $Instructions[$resultIndex] = ($leftHand * $rightHand)
        } else {
            break
        }

        $x += 4
    }

    $Instructions[0]
}

foreach ($noun in (0..99)) {
    foreach ($verb in (0..99)) {
        $input = $intCode.Clone()
        $output = PerformInstruction -Noun $noun -Verb $verb -Instructions $input
        if ($output -eq 19690720) {
            Write-Host "Noun: $noun"
            Write-Host "Verb: $verb"
            Write-Host "Answer: $(100 * $noun + $verb)"
            break
        }
    }
}
