include(init.m4)dnl
dnl
define(«omitted»,         )dnl determines whether we want to trash this block
define(«is_public», «true»)dnl this gets written to the JSON
define(«CONFIDENTIAL»,     «define(«is_public»,«false»)»)dnl
define(«REPLACE_WITH»,     «define(«omitted»,1)»)dnl
define(«END_CONFIDENTIAL», «define(«omitted»,«»)define(«is_public»,«true»)»)dnl
dnl
dnl Some helpers to get our diversions in order:
dnl stream 0:  everything that is written to the JSON file
dnl stream -1: trash – everything outside of our markup.
define(«divnum_json», 0)dnl
define(«divert_to_json»,  «ifelse(omitted,«»,«divert(divnum_json)»)»)dnl
define(«divert_to_trash», «divert(-1)»)dnl
dnl
define(«MEETING_MINUTES», «divert_to_json()dnl
 { "metadata": { "type": "$1", "date": "$2", "start_time": "$3", "place":dnl
 "$4", "attendants": "$5", "absentees": "$6", "keeper_of_minutes": "$7" },
 divert_to_trash()»)dnl
dnl
define(«CONSENSUS_ADOPTED», «divert_to_json()dnl
 { "approved": true«,» "type":"consensus" }dnl
 divert_to_trash()»)dnl
dnl
define(«CONSENSUS_REJECTED», «divert_to_json()dnl
 { "approved": false«,» "type":"consensus" }dnl
 divert_to_trash()»)dnl
dnl
define(«VOTE_ADOPTED», «divert_to_json()dnl
 { "approved": true«,» "type":"vote"«,» "pro": $1«,» "contra": $2«,» "abstain": $3 }dnl
 divert_to_trash()»)dnl
dnl
define(«VOTE_REJECTED», «divert_to_json()dnl
 { "approved": false«,» "type":"vote"«,» "pro": $1«,» "contra": $2«,» "abstain": $3 }dnl
 divert_to_trash()»)dnl
dnl
dnl These get redefined later, we only need them once
define(«_CONTENT_array_start»,     «"content": [»)dnl
define(«_CONTENT_array_delimiter», «,»)dnl
define(«_RESOLUTION_template», «{ "type": "resolution"«,» "public": $1«,»dnl
 "ref": "«$»1"«,» "reason": «$»2«,» "text": "«$»3"«,» "allocated_money":dnl
 ifelse(««$»4», «», «"0€"», «"«$»4"»)«,» "notes": "«$»5" }»)
dnl
define(«RESOLUTION», «divert_to_json()dnl
 _CONTENT_array_start(define(«_CONTENT_array_start»,«,»))» dnl
 _RESOLUTION_template(««is_public»»)
 «divert_to_trash()»)dnl
dnl
define(«_TODO_template», «{ "type": "todo"«,» "public": $1«,» "done": $2«,» dnl
"ref": "$«1»"«,» "assigned": "$«2»"«,» "text": "$«3»"«,» "notes": "$«4»" }»)dnl
define(«TODO», «divert_to_json()dnl
 _CONTENT_array_start(define(«_CONTENT_array_start»,«,»))» dnl
 _TODO_template(««is_public»», «false»)dnl
«divert_to_trash()»)dnl
define(«DONE», «divert_to_json()dnl
 _CONTENT_array_start(define(«_CONTENT_array_start»,«,»))» dnl
 _TODO_template(««is_public»», «true»)dnl
«divert_to_trash()»)dnl
dnl
dnl Must be last call in the document!
define(«END», «divert_to_json()
 ], "end_time": "$1" }
divert_to_trash()undivert»)dnl
dnl
dnl Don't output anything except we say so:
divert_to_trash()dnl
dnl vim: set ft=m4rkup tw=80 et sw=1 ts=1 sts=1:
