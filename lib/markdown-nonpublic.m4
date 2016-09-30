changequote([,])dnl
include(strings.m4)dnl
dnl
define([MEETING_MINUTES], [dnl
$1 $2
===========================

* MARKDOWN_TEXT_STARTING_TIME[]: $3
* MARKDOWN_TEXT_ATTENDING[]: $4
* MARKDOWN_TEXT_ABSENT[]: $5
* MARKDOWN_TEXT_MINUTE_TAKER[]: $6])dnl
dnl
define([VOTE_ADOPTED],  [MARKDOWN_TEXT_ADOPTED ($1|$2|$3)])dnl
define([VOTE_REJECTED], [MARKDOWN_TEXT_REJECTED ($1|$2|$3)])dnl
dnl
define([RESOLUTION],           [__$1 $2:__ ifelse([$4], [], [$3], [$3 ($4)])])dnl
define([RESOLUTION_NONPUBLIC], [__$1 $2:__ ifelse([$4], [], [$3], [$3 ($4)])])dnl
dnl
define([END], [* MARKDOWN_TEXT_END $1])dnl
dnl
dnl vim: set ft=m4 tw=80 et sw=1 ts=1 sts=1:
