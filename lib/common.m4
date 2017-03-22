dnl Common Functions
dnl ================
dnl
dnl This file defines helper macros that are useful in every output library.
dnl
dnl Print an error message and exit M4
define(«fatal_error», «errprint(__file__:__line__: fatal error: $*
)m4exit(1)»)dnl
dnl
dnl vim: set ft=m4rkup et tw=80 :
