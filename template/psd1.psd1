
@{
    RootModule        = '<%= $PLASTER_PARAM_ModuleName %>.psm1'
    ModuleVersion     = '<%= $PLASTER_PARAM_ModuleVersion %>'
    GUID              = '<%= $PLASTER_Guid1 %>'
    Author            = '<%= $PLASTER_PARAM_Author %>'
    CompanyName       = '<%= $PLASTER_PARAM_Author %>'
    Copyright         = '(c) <%= $PLASTER_Year %> <%= $PLASTER_PARAM_Author %>. All rights reserved.'
    Description       = '<%= $PLASTER_PARAM_ModuleDescription %>'
    PowerShellVersion = '5.0'
    FunctionsToExport = '*'
    PrivateData       = @{
        PSData = @{
        }
    }
}