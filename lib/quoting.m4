dnl Quoting
dnl =======
dnl
dnl This file should be the first input file on the M4 command line.
dnl
dnl The default quoting characters for M4 ` and ' are already used otherwise in
dnl most of the input formats. To prevent weirdness and make writing of meeting
dnl minutes easier, we redefine the M4 quoting characters as « (opening quote)
dnl and » (closing quote).
dnl
dnl Literal opening and closing quote characters, in case they are needed:
define(LITERAL_QUOTE_OPEN,  `changequote()«changequote(«,»)')dnl
define(LITERAL_QUOTE_CLOSE, `changequote()»changequote(«,»)')dnl
dnl
changequote(`«',`»')dnl
