define(OPENING_BRACKET, `changequote()[changequote([,])')dnl
define(CLOSING_BRACKET, `changequote()]changequote([,])')dnl
changequote([,])dnl
dnl
define(MEETING_MINUTES, [divert(0)dnl
 { "metadata": { "type": "$1", "date": "$2", "start_time": "$3",dnl
 "attendants": "$4", "absentees": "$5", "keeper_of_minutes": "$6" },
 divert(1)])dnl
dnl
define(VOTE_ADOPTED, [divert(0)dnl
 { "approved": true[,]  "pro": $1[,] "contra": $2[,] "abstain": $3 }dnl
 divert(1)])dnl
dnl
define(VOTE_REJECTED, [divert(0)dnl
 { "approved": false[,] "pro": $1[,] "contra": $2[,] "abstain": $3 }dnl
 divert(1)])dnl
dnl
dnl These get redefined later, we only need them once
define([_CONTENT_array_start],     ["content": OPENING_BRACKET])dnl
define([_CONTENT_array_delimiter], [,])dnl
define([_RESOLUTION_template], [{ "type": "resolution"[,] "public": $1[,]dnl
 "ref": "[$]1"[,] "vote": [$]2[,] "text": "[$]3"[,] "allocated_money":dnl
 ifelse([[$]4], [], ["0€"], ["[$]4"])[,] "notes": "[$]5" }])
dnl
define([RESOLUTION], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _RESOLUTION_template([false])
 [divert(1)])dnl
define([RESOLUTION_PUBLIC], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _RESOLUTION_template([true])
 [divert(1)])dnl
dnl
define([_TODO_template], [{ "type": "todo"[,] "public": $1[,] "done": $2[,] dnl
"ref": "$[1]"[,] "assigned": "$[2]"[,] "text": "$[3]"[,] "notes": "$[4]" }])dnl
define([TODO_PUBLIC], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _TODO_template([true], [false])dnl
[divert(1)]])dnl
define([DONE_PUBLIC], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _TODO_template([true], [true])dnl
[divert(1)]])dnl
define([TODO], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _TODO_template([false], [false])dnl
[divert(1)]])dnl
define([DONE], [divert(0)dnl
 _CONTENT_array_start(define([_CONTENT_array_start],[,]))] dnl
 _TODO_template([false], [true])dnl
[divert(1)]])dnl
dnl
dnl Must be last call in the document!
define(END, [divert(0)
 CLOSING_BRACKET, "end_time": "$1" }
 divert(-1)undivert])dnl
dnl
dnl Don't output anything except we say so:
divert(1)dnl
dnl vim: set ft=m4 tw=80 et sw=1 ts=1 sts=1:
