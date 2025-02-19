Clear-Host
if (-not (Get-Module -Name Pester)) {
    Import-Module -Name Pester -Force
}
Import-Module .\src\<%= $PLASTER_PARAM_ModuleName %>.psm1 -Force

Describe '<%= $PLASTER_PARAM_ModuleName %>.Tests' {
    Context "C1" {

        It "given A=<A>, it returns: '<Expected>'" -TestCases @(
            @{ A = "true"; Expected = $true }
            @{ A = "false"; Expected = $false }
        ) {
            param ($A, $Expected)
            [bool]::Parse($A)  | Should -BeExactly $Expected
        }

        It "shouldn't accept" {
            $true | Should -BeTrue
        }
    }
}