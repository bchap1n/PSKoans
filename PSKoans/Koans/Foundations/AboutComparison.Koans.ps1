using module PSKoans
[Koan(Position = 107)]
param()
<#
    Comparison Operators

    Comparison operators are often used to compare two values. If the values
    satisfy the condition set by the operator, the expression returns $true;
    otherwise, it returns $false.

    Mathematical comparison operators are two letters preceded by a hyphen:
    -eq, -ne, -gt, -lt, -le, -ge

    Logical comparison operators include:
    -and, -or, -xor, -not

    For more information, see: 'Get-Help about_Operators'
#>
Describe 'Comparison Operators' {

    Context '-eq and -ne' {

        It 'is a simple test' {
<<<<<<< HEAD
            $true -eq $false | Should -Be $false
            1 -eq 1 | Should -Be __
        }

        It 'will attempt to convert types' {
            # Boolean values are considered the same as 0 or 1 in integer terms, and vice versa
            $true -eq 1 | Should -Be $true
            $false -ne 0 | Should -Be $false
            $true -eq 10 | Should -Be __ # What about higher numbers?
            -10 -eq $false | Should -Be __ # What about negative numbers?

            10 -ne 1 | Should -Be __

            # Strings and numbers will also be converted if possible
            '1' -eq 1 | Should -Be $true
            10 -ne '10' | Should -Be __
=======
            $true -eq $false | Should -BeFalse
            $____ | Should -Be (1 -eq 1)
        }

        It 'will attempt to convert types' {
            <#
                Boolean values are considered the same as 0 or 1 in integer terms;
                similarly, numbers of most types will smoothly cast to boolean
                according to their values.
            #>
            $____ | Should -Be ($true -eq 1)
            $____ | Should -Be ($false -eq 0)

            # What about higher numbers?
            $____ | Should -Be ($true -eq 10)

            # And negative numbers?
            $____ | Should -Be (-10 -eq $false)

            # Numbers of different types can typically be implicitly converted as well.
            $____ | Should -Be (10.0 -ne 1)

            <#
                Strings and numbers will also be converted to whichever type is on the left hand
                side, if possible.
            #>
            '1' -eq 1 | Should -BeTrue
            __ | Should -Be (10 -ne '10')
>>>>>>> upstream/master
        }

        It 'has a strict behaviour with most strings' {
            # Strings containing text behave a little differently in some cases
            'string' -eq 1 | Should -BeFalse

            # How should strings cast to boolean?
<<<<<<< HEAD
            $true -eq 'Hello!' | Should -Be __

            # What about an empty string?
            $true -eq '' | Should -Be __

            # What about a string containing a number?
            $false -ne '0' | Should -Be __

            # In short: strings don't care about their contents when cast to boolean
            $true -eq 'False' | Should -Be __
            $false -eq [string]$false | Should -Be __
            [string]$false | Should -Be '__'
=======
            $____ | Should -Be ($true -eq 'Hello!')

            # What about an empty string?
            $____ | Should -Be ($true -eq '')

            # What about a string containing a number?
            $____ | Should -Be ($false -ne '0')

            # When cast to boolean, strings only care about whether or not they have any content.
            $____ | Should -Be ($true -eq 'False')
            $____ | Should -Be ($false -eq [string]$false)
            '____' | Should -Be ([string]$false)
>>>>>>> upstream/master
        }

        It 'changes behaviour with arrays' {
            <#
                When applying comparison operators to arrays, note:
                    1. The array must always be on the LEFT hand side of the comparison,
                    2. The comparison FILTERS the array, and
                    3. The comparison will always return either:
                        - One or more items for which the comparison would evaluate to $true, OR
                        - Nothing whatsoever (neither $true, nor $false).

                A comparison framed like this will essentially always result in a $false result:
                    $value -eq $array
            #>
            $Array = '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'

            __ | Should -Be ($Array -eq 2)
            ($Array -eq 11) | Should -BeNullOrEmpty
            @( '__', '2', '__', '4', '__', '__', '8', '__', '__' ) | Should -Be ($Array -ne 5)
        }
    }

    Context '-gt and -lt' {

        It 'will compare values' {
            11 -gt 6 | Should -BeTrue
            __ -gt 14 | Should -BeTrue

            10 -lt 20 | Should -BeTrue
            __ -lt 0 | Should -BeTrue
        }

        It 'will often return more than one item from arrays' {
            $Array = '1', '5', '10', '15', '20', '25', '30'

            __ | Should -Be ($Array -gt 25)
            @('__', '__') | Should -Be ($Array -lt 10)

        }
    }

    Context '-ge and -le' {

        It 'is a combination of the above two operators' {
            $Array = 1, 2, 3, 4, 5

            $Array -ge 3 | Should -Be @(3, 4, 5)
            $Array -le 2 | Should -Be @(1, 2, 3, 4)
            $Array -ge 5 | Should -Be __
        }
    }

    Context '-contains and -notcontains' {

        It 'returns $true if the right hand value occurs in the left hand array' {
            $Array = 1, 2, 3, 4, 5
            $SearchValue = __

            $Array -contains $SearchValue | Should -BeTrue
        }

        It 'will always return $false with an array on the right hand side' {
            $Value = '1'
            $Array = 1, 2, 3, 4, 5

<<<<<<< HEAD
            $Value -contains $Array | Should -Be __

            $Array -contains @(1, 2) | Should -Be __
=======
            $____ | Should -Be ($Value -contains $Array)

            <#
                Even though it's possible for an array to contain an array, this can never return true.
                Arrays compare by reference and not their contents, so unless you're literally searching
                for the exact same instance of the array in another array, you won't find anything.
            #>
            $____ | Should -Be ($Array -contains @(1, 2))
>>>>>>> upstream/master
        }

        It 'has a logical opposite' {
            $Array = 1, 2, 3, 4, 5
            $Value = __

            $Array -notcontains $Value | Should -BeFalse
        }
    }

    Context '-in and -notin' {

        It 'is the inverse of -contains' {
            $Array = 1, 2, 3, 4, 5
            $SearchValue = __

<<<<<<< HEAD
=======
            # The syntax is exactly reversed from the syntax for -contains.
>>>>>>> upstream/master
            $SearchValue -in $Array | Should -BeTrue
        }

        It 'also has a logical opposite' {
            $Array = 4, 3, 1, 5, 2
            $SearchValue = __

            $SearchValue -notin $Array | Should -BeFalse
        }
    }
}

Describe 'Logical Operators' {
    <#
        Logical operators have lower precedence in PowerShell than comparison operators,
        which just means that they will evaluate after all comparison operators have resolved
        when parentheses are not used.

        They compare against boolean values, and convert all other inputs to boolean before comparing.
    #>
    Context '-and' {

        It 'returns $true only if both inputs are $true' {
            $true -and $true | Should -BeTrue
            $____ -and $true | Should -BeFalse
        }

        It 'may coerce values to boolean' {
            $String = ''
            $Number = 1

<<<<<<< HEAD
            $String -and $Number | Should -Be __
=======
            $____ | Should -Be ($String -and $Number)
>>>>>>> upstream/master
        }
    }

    Context '-or' {

        It 'returns $true if either input is $true' {
            $true -or $false | Should -Be $true
<<<<<<< HEAD
            $false -or $true | Should -Be __
            $true -or $true | Should -Be __
=======
            $____ | Should -Be ($false -or $true)
            $____ | Should -Be ($true -or $true)
>>>>>>> upstream/master
        }

        It 'may coerce values to boolean' {
            # Remember, empty strings convert to boolean as $false.
            $String = ''
            $Number = __

            $String -or $Number | Should -BeTrue
        }
    }

    Context '-xor' {

        It 'returns $true if only one input is $true' {
<<<<<<< HEAD
            $true -xor $false | Should -Be $true
            $true -xor $true | Should -Be __
            $false -xor $false | Should -Be __
=======
            $true -xor $false | Should -BeTrue
            $____ | Should -Be ($true -xor $true)
            $____ | Should -Be ($false -xor $false)
>>>>>>> upstream/master
        }
    }

    Context '-not' {

        It 'negates a boolean value' {
            -not $true | Should -Be $false
<<<<<<< HEAD
            -not $false | Should -Be __
=======
            $____ | Should -Be (-not $false)
>>>>>>> upstream/master
        }

        It 'can be shortened to !' {
            !$true | Should -Be __
        }

        It 'converts any non-boolean inputs to boolean before evaluating' {
            # Consider what boolean value this would become when cast.
            $Value = 100

            $____ | Should -Be (-not $Value)
        }
    }
}