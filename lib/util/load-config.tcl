# Load configuration matching supplied script path
proc load_config {script_path} {
    # Resolve script's absolute path
    set script_path [file normalize $script_path]

    set lib_root [file join $::env(HOME) bin lib]
    set config_root [file join $::env(HOME) bin .config]

    # Replace $lib_root with $config_root in $script_path
    set config_path "[string map [list $lib_root $config_root] $script_path].tcl"

    # Load configuration into calling script's scope
    uplevel 1 [list source $config_path]
}