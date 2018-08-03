# Basic yoda template
### Overview
The goal of this template is to create a simple example to show some basic functionality of yoda.
In this setup, we have two projects: 

**TemplateProject** creates a Library, PrintLib, that exposes minimal functionality.
TemplateProject itself uses this library in it's drivercode.
Since the functionality of the library depends on boost though (because we're using `boost::program_options::`), we need to properly propagate this.
This is done by the `yoda_create_library` function.

**DependentProject** depends on PrintLib created in TemplateProject. Therefore, TemplateProject needs to properly
export the library and can then be found with a `find_package` in the DependentProject.
