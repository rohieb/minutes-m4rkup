dnl Markdown Output Format, Public visibility
dnl =========================================
dnl
dnl This file is loaded by `bootstrap.m4`, do not include it directly.
dnl
include(markdown-confidential.m4)dnl
dnl these can simply be inherited:
define(«MARKDOWN_P_MEETING_MINUTES»,    «MARKDOWN_C_MEETING_MINUTES($@)»)dnl
define(«MARKDOWN_P_CONSENSUS_ADOPTED»,  «MARKDOWN_C_CONSENSUS_ADOPTED($@)»)dnl
define(«MARKDOWN_P_CONSENSUS_REJECTED», «MARKDOWN_C_CONSENSUS_REJECTED($@)»)dnl
define(«MARKDOWN_P_VOTE_ADOPTED»,       «MARKDOWN_C_VOTE_ADOPTED($@)»)dnl
define(«MARKDOWN_P_VOTE_REJECTED»,      «MARKDOWN_C_VOTE_REJECTED($@)»)dnl
define(«MARKDOWN_P_RESOLUTION»,         «MARKDOWN_C_RESOLUTION($@)»)dnl
define(«MARKDOWN_P_TODO»,               «MARKDOWN_C_TODO($@)»)dnl
define(«MARKDOWN_P_DONE»,               «MARKDOWN_C_DONE($@)»)dnl
define(«MARKDOWN_P_END»,                «MARKDOWN_C_END($@)»)dnl
dnl
dnl confidentiality needs to be redefined
define(«MARKDOWN_P_CONFIDENTIAL», «divert(-1)»)dnl
define(«MARKDOWN_P_REPLACE_WITH», «divert(0)»)dnl
define(«MARKDOWN_P_END_CONFIDENTIAL», «divert(0)»)dnl
dnl vim: set ft=m4rkup tw=80 et sw=1 ts=1 sts=1:
