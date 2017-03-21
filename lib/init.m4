dnl Initialization sequence for every format library
dnl ------------------------------------------------
dnl
dnl Literal opening and closing quote characters
define(LITERAL_QUOTE_OPEN,  `changequote()«changequote(«,»)')dnl
define(LITERAL_QUOTE_CLOSE, `changequote()»changequote(«,»)')dnl
dnl
dnl ` and the next-to-default [ and ] are heavily used in Markdown, MediaWiki
dnl and JSON, so better use something a little less intrusive for quoting
changequote(`«',`»')dnl
