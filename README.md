Variable Named To Component
===
A linter for scss-lint (https://github.com/brigade/scss-lint). Warns if a Sass variable is not named after the component file it is declared in (partial name equals component name). For example, given the file foo.scss
    
    $bar: 10;       // bad
    $foo-bar: 10;   //good 

Config
---

linters:

    VariableNamedToComponent:
        # set to true to enable
        enabled: true
        # Optional divider token for variable. Default is "-".
        divider: "_"
        # Optional list of partials(components) to ignore - any variables in these will not be linted
        # Do not add leading "_" to these if you use them.
        whitelistedPartials : ['bar', 'baz']

Use
---
This linter is currently not available as a Gem. To use it, place /lib/VariableNamedToComponent.rb in a folder on your system, then add that folder to your .scss-lint.yml file as follows

    plugin_directories: ['/foo/bar']