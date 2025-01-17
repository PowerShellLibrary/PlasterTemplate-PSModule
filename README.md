# PlasterTemplate-PSModule

This is a Plaster template for a PowerShell module.

## How to use

### Install Plaster

Module is available on [Powershell Gallery][gallery]

``` powerShell
Install-Module -Name Plaster
```

### Import Plaster

```powershell
Import-Module Plaster
```

## Clone the template

``` powerShell
git clone https://github.com/PowerShellLibrary/PlasterTemplate-PSModule
```

## Creating a new module

There are two methods of creating a new module.

* Create a hash table containing the required parameters and invoke ```Invoke-Plaster```

    ``` powerShell
    $parameters = @{
        DestinationPath   = "C:\repo\PS.Modules"
        TemplatePath      = "C:\repo\PlasterTemplate-PSModule"
        Author            = 'Alan'
        ModuleVersion     = '1.0.0'
        ModuleName        = '_ModuleName_'
        ModuleDescription = '_Description_'
    }
    Invoke-Plaster @parameters
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


* Call ```Invoke-Plaster``` and fill parameters manually (template)

    ``` powerShell
    Invoke-Plaster -DestinationPath "C:\repo\PS.Modules" -TemplatePath "C:\repo\PlasterTemplate-PSModule"
    ```

    output:

    ```cmd
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

## Plaster Manifest

Other settings available [here](https://github.com/PowerShellOrg/Plaster/blob/master/docs/en-US/about_Plaster_CreatingAManifest.help.md)

Extended template example:

```xml
<?xml version="1.0" encoding="utf-8"?>
<plasterManifest schemaVersion="1.0"
    xmlns="http://www.microsoft.com/schemas/PowerShell/Plaster/v1">
    <metadata>
        <name>StandardModuleTemplate</name>
        <id>a9c355a8-0228-4f58-8df9-3291dd997c1e</id>
        <version>1.0.0</version>
        <title>Standard Module Template</title>
        <description></description>
        <author>Chuck Norris</author>
        <tags></tags>
    </metadata>
    <parameters>
        <parameter name='AuthorName' type="user-fullname" prompt="Module author's name" />
        <parameter name='AuthorEmail' type="user-email" prompt="Contributer/Owner email" />
        <parameter name='ModuleName' type="text" prompt="Name of your module" />
        <parameter name='ModuleDescription' type="text" prompt="Brief description on this module" />
        <parameter name='ModuleVersion' type="text" prompt="Initial module version" default='0.0.1' />
        <parameter name='ModuleFolders' type = 'multichoice' prompt='Please select folders to include' default='0,1'>
            <choice label='&amp;functions' value='functions' help='Folder containing public functions'/>
            <choice label='&amp;internal' value='internal' help='Folder containing internal functions that are not exposed to users'/>
            <choice label='&amp;classes' value='classes' help='Folder containing classes'/>
            <choice label='&amp;resources' value='resources' help='Folder containing any resources required by the module'/>
        </parameter>
        <parameter name='GitHub' type = 'choice' prompt='Include GitHub Support? (Issue/PR Templates, Code of Conduct and Contribution guide)' default='0'>
            <choice label='&amp;Yes' value='Yes' help='Include files'/>
            <choice label='&amp;No' value='No' help='Do not include files'/>
        </parameter>
        <parameter name='License' type = 'choice' prompt='Add an MIT License?' default='0'>
            <choice label='&amp;Yes' value='Yes' help='Adds LICENSE.md'/>
            <choice label='&amp;No' value='No' help='Does not adds LICENSE.md'/>
        </parameter>
    </parameters>
    <content>
        <message>Creating test folder and files</message>
        <file source='' destination='tests'/>
        <templateFile source='tests\Feature.Tests.ps1' destination=''/>
        <templateFile source='tests\Help.Exceptions.txt' destination=''/>
        <templateFile source='tests\Help.Tests.ps1' destination=''/>
        <templateFile source='tests\Project.Exceptions.txt' destination=''/>
        <templateFile source='tests\Project.Tests.ps1' destination=''/>
        <file source='tests\README_TESTS.md' destination=''/>
        <templateFile source='tests\Unit.Tests.ps1' destination=''/>
        <message>Creating VSCode folder and files</message>
        <file source='' destination='.vscode'/>
        <file source='.vscode\settings.json' destination=''/>
        <file source='.vscode\tasks.json' destination=''/>
        <message>Creating code folders</message>
        <file source='' destination='functions' condition='$PLASTER_PARAM_ModuleFolders -contains "functions"'/>
        <file source='' destination='internal' condition='$PLASTER_PARAM_ModuleFolders -contains "internal"'/>
        <file source='' destination='resources' condition='$PLASTER_PARAM_ModuleFolders -contains "resources"'/>
        <file source='' destination='classes' condition='$PLASTER_PARAM_ModuleFolders -contains "classes"'/>
        <message condition='$PLASTER_PARAM_GitHub -like "Yes"'>Creating GitHub folder and files</message>
        <file source='' destination='.github' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <file source='.github\ISSUE_TEMPLATE\Bug_report.md' destination='' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <file source='.github\ISSUE_TEMPLATE\Feature_request.md' destination='' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <file source='.github\PULL_REQUEST_TEMPLATE.md' destination='' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <templateFile source='code-of-conduct.md' destination='' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <templateFile source='contributing.md' destination='' condition='$PLASTER_PARAM_GitHub -eq "Yes"'/>
        <message condition='$PLASTER_PARAM_License -like "Yes"'>Creating license file</message>
        <templateFile source='LICENSE.md' destination='' condition='$PLASTER_PARAM_License -like "Yes"'/>
        <message>Deploying root directory files</message>
        <templateFile source='CHANGELOG.md' destination=''/>
        <file source='module.psm1' destination='${PLASTER_PARAM_ModuleName}.psm1'/>
        <templateFile source='MODULE_README.md' destination='README.MD'/>
        <message>Creating module manifest</message>
        <newModuleManifest destination='${PLASTER_PARAM_ModuleName}.psd1' moduleVersion='$PLASTER_PARAM_ModuleVersion' rootModule='${PLASTER_PARAM_ModuleName}.psm1' author='$PLASTER_PARAM_AuthorName' companyName='${PLASTER_PARAM_AuthorName}' description='$PLASTER_PARAM_ModuleDescription' encoding='UTF8-NoBOM'/>
    </content>
</plasterManifest>
```

[gallery]: https://powershellgallery.com/packages/Plaster/