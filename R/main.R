##  This library depends on: 'box'
##
##  box will NOT be installed as a dependency.  You need to do it manually.
##
##  A bit of fun: The 'box' library gets installed as normal, using
##  install.packages("box"), but attempting to load the box library using
##  library(box) throws a fatal error.  That's fun all by itself, but if you put
##  'box' in the Depends line of the DESCRIPTION file the system will attempt to
##  load 'box' when you load this module, which will cause an error.  Wheeee!


#library(box)  This is here as documentation. Actually using this causes a fatal error.


##  'box::file()' returns the path to the enclosing file
##  '...' in the args list allows passing a variable number of arguments
##
##  The reason to use '...' and pass items separately is to ensure that the
##  platform-appropriate directory separators are used.
##
##  The reason to use this function at all is so that the code doesn't rely on
##  the current working direcory and break if you call it from somewhere other
##  than the same directory as the file.  Or, worse, so your script doesn't
##  accidentally load the wrong file if you do:
##
##     source("./util_functions.R")
##
##  when you aren't in the same directory as the script you're running.

path_relative_to_current_file = function(...) {
  do.call(file.path, list(box::file(), ...))
}

source_relative = function(...) {
  path = path_relative_to_current_file(...)
  if ( file.exists(path) ) {
    source(path)
  } else {
    cat("File not found: ", paste(path, "\n"), sep = "")
    quit()
  }
}
