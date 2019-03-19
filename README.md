# PlasterTemplate-PSModule

This is a Plaster template for a PowerShell module.

# How to use

## Install Plaster

Module is available on [Powershell Gallery][gallery]

``` powerShell
PS> Install-Module -Name Plaster
```

### Import Plaster
```powershell
PS> Import-Module Plaster
```

## Clone the template

``` powerShell
PS> git clone https://github.com/PowerShellLibrary/PlasterTemplate-PSModule
```

## Creating a new module

There are two methods of creating a new module.

1. Create a hash table containing the required parameters and invoke ```Invoke-Plaster```
    ``` powerShell
    PS> $parameters = @{
        DestinationPath   = "C:\repo\PS.Modules"
        TemplatePath      = "C:\repo\PlasterTemplate-PSModule"
        Author            = 'Alan'
        ModuleVersion     = '1.0.0'
        ModuleName        = '_ModuleName_'
        ModuleDescription = '_Description_'
    }
    PS> Invoke-Plaster @parameters
    ```
    output:
    ```
     ____  _           _
    |  _ \| | __ _ ___| |_ ___ _ __
    | |_) | |/ _` / __| __/ _ \ '__|
    |  __/| | (_| \__ \ ||  __/ |
    |_|   |_|\__,_|___/\__\___|_|
                                                v1.1.3
    ==================================================
    Destination path: C:\repo\PS.Modules
    Creating test folder and files
    Create _ModuleName_\
    Create _ModuleName_\Public\
    Create _ModuleName_\Private\
    Create _ModuleName_\_ModuleName_.psd1
    Create _ModuleName_\_ModuleName_.psm1
    ```
2. Call ```Invoke-Plaster``` and fill parameters manually
    ``` powerShell
    PS> Invoke-Plaster -DestinationPath "C:\repo\PS.Modules" -TemplatePath "C:\repo\PlasterTemplate-PSModule"
    ```
    output:
    ```
     ____  _           _
    |  _ \| | __ _ ___| |_ ___ _ __
    | |_) | |/ _` / __| __/ _ \ '__|
    |  __/| | (_| \__ \ ||  __/ |
    |_|   |_|\__,_|___/\__\___|_|
                                                v1.1.3
    ==================================================
    Module author's name (Alan Płócieniak):
    Module name: _ModuleName_
    Module version (1.0.0):
    Module description: _Description_
    Destination path: C:\repo\PS.Modules
    Creating test folder and files
    Create _ModuleName_\
    Create _ModuleName_\Public\
    Create _ModuleName_\Private\
    Create _ModuleName_\_ModuleName_.psd1
    Create _ModuleName_\_ModuleName_.psm1
    ```

[gallery]: https://powershellgallery.com/packages/Plaster/