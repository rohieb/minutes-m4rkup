dnl Markdown Output Format, Confidential visibility
dnl ===============================================
dnl
dnl This file is loaded by `bootstrap.m4`, do not include it directly.
dnl
define(«PARAM», «LITERAL_QUOTE_OPEN()$«»$1«»LITERAL_QUOTE_CLOSE()»)dnl
include(strings.m4)dnl
dnl
define(«MARKDOWN_C_MEETING_MINUTES», «dnl
$1 $2
===========================

* MARKDOWN_TEXT_STARTING_TIME«»: $3
* MARKDOWN_TEXT_PLACE«»: $4
* MARKDOWN_TEXT_ATTENDING«»: $5
* MARKDOWN_TEXT_ABSENT«»: $6
* MARKDOWN_TEXT_MINUTE_TAKER«»: $7»)dnl
dnl
define(«MARKDOWN_C_CONSENSUS_ADOPTED»,  «MARKDOWN_TEXT_ADOPTED (MARKDOWN_TEXT_CONSENSUS)»)dnl
define(«MARKDOWN_C_CONSENSUS_REJECTED», «MARKDOWN_TEXT_REJECTED (MARKDOWN_TEXT_CONSENSUS)»)dnl
dnl
define(«MARKDOWN_C_VOTE_ADOPTED»,  «MARKDOWN_TEXT_ADOPTED ($1|$2|$3)»)dnl
define(«MARKDOWN_C_VOTE_REJECTED», «MARKDOWN_TEXT_REJECTED ($1|$2|$3)»)dnl
dnl
define(«MARKDOWN_C_RESOLUTION»,        «__$1 $2:__ ifelse(«$4», «», «$3», «$3 ($4)»)«»dnl
ifelse(«$5», «», «», ««,» $5»)»)dnl
dnl
define(«_markdown_notes_template», ««ifelse(»»«PARAM(«$1»)»««,«»,«»,«. »»»dnl
«PARAM($1)»««)»»)dnl
define(«_markdown_todo_template»,  ««ifelse(»»«PARAM(2)»dnl
««,«»,««__»$1«:__»»,««__»$1« »»»»«PARAM(2)»««««:__»») »»«PARAM(3)»)dnl
define(«MARKDOWN_C_TODO», _markdown_todo_template(«MARKDOWN_TEXT_TODO»)_markdown_notes_template(4))dnl
define(«MARKDOWN_C_DONE», ««~~»»_markdown_todo_template(«MARKDOWN_TEXT_DONE»)««~~»»_markdown_notes_template(4))dnl
dnl
define(«MARKDOWN_C_CONFIDENTIAL», «divert(0)»)dnl
define(«MARKDOWN_C_REPLACE_WITH», «divert(-1)»)dnl
define(«MARKDOWN_C_END_CONFIDENTIAL», «divert(0)»)dnl
dnl
define(«MARKDOWN_C_END», «MARKDOWN_TEXT_END $1»)dnl
dnl
dnl vim: set ft=m4rkup tw=80 et sw=1 ts=1 sts=1:
