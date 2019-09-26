using module PSKoans
[Koan(Position = 102)]
param()
<#
    Variables

    PowerShell variables are defined with a $Dollar sign and some text or numbers.
    Some special characters are allowed in variable names, like underscores.

    The PoSH Practice and Style guide recommends PascalCase for variable names
    when writing PowerShell code.

    Variables can store any value, object, or collection of objects in PowerShell.
#>
Describe 'Variable Assignment' {

    It 'gives a name to a value or object' {
        # Names give succinct descriptions to pieces of reality.
        $Fifty = 50
        $Value = $Fifty

        Set-Variable -Name 'Greeting' -Value 'Hello!'

        $Value -eq $Fifty | Should -BeTrue
        $Greeting | Should -Be 'Hello!'
    }

    <#
        PowerShell variables will infer the data type where possible, for
        example [int] for whole numbers, [double] for decimals and fractions,
        [string] for text.
    #>
    It 'infers types on its own' {
        $Number = 10

<<<<<<< HEAD
        $Number | Should -BeOfType [Int]
=======
        $Number | Should -BeOfType [____]
>>>>>>> upstream/master
    }

    It 'can directly compare types' {
        # For each task, a different tool.
        $Number = 5
        $Number -is [int] | Should -BeTrue
<<<<<<< HEAD
        $Number | Should -BeOfType [int]
=======
        $Number | Should -BeOfType [____]
>>>>>>> upstream/master

        $Text = 'Every worthwhile step is uphill.'
        $ExpectedType = [string]

        $ExpectedType | Should -Be $Text.GetType()
    }

    It 'allows types to be explicitly set' {
        # A well-defined container decides the shape of its contents.
        [int]$Number = '42'

        # An unrestricted container may hold many different items.
        # Its contents may choose their own kind, or it be chosen for them.
        $String = [string]$true

<<<<<<< HEAD
        $Number | Should -BeOfType [Int]
        $String | Should -BeOfType [string]
=======
        $Number | Should -BeOfType [____]
        $String | Should -BeOfType [____]
>>>>>>> upstream/master
    }

    It 'distinguishes between types of numbers' {
        <#
            There are many kinds of numbers in PowerShell, but the basics are
            [int] and [double] for integers and floating-point numbers
        #>

        $Integer = 100
        $NotInteger = 12.0

        $Integer | Should -BeOfType [int]
<<<<<<< HEAD
        $NotInteger | Should -BeOfType [double]
=======
        $NotInteger | Should -BeOfType [____]
>>>>>>> upstream/master
    }

    It 'allows you to declare constant variables' {
        $RemoveConstant = {
            Set-Variable -Name 'Constant' -Value 25 -Option Constant
            # Constant variables cannot be altered.

<<<<<<< HEAD
             $Constant = 'NewValue'
        } | Should -Throw
        {
            # Contrast Read-Only variables, which can be later removed
=======
            # So what happens if we try to modify $Constant in some way?
            $____ = 'NewValue'
        }
        $RemoveConstant | Should -Throw -ExpectedMessage '____'

        $RemoveReadOnly = {
            # Contrast Read-Only variables, which can be later removed (if you do it right.)
>>>>>>> upstream/master
            Set-Variable -Name 'Constant' -Value 25 -Option ReadOnly
            # While these variables can be Removed, they cannot be directly altered.
            Remove-Variable -Name '____' -Force -ErrorAction Stop
            $Constant = 2
            $Constant++
        }
        $RemoveReadOnly | Should -Not -Throw
    }
}
