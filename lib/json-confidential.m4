dnl JSON Output Format, Confidential visibility
dnl ===========================================
dnl
dnl This file is loaded by `bootstrap.m4`, do not include it directly.
dnl
define(«_json_omitted»,         )dnl determines whether we want to trash this block
define(«_json_is_public», «true»)dnl this gets written to the JSON
define(«JSON_C_CONFIDENTIAL»,     «define(«_json_is_public»,«false»)»)dnl
define(«JSON_C_REPLACE_WITH»,     «define(«_json_omitted»,1)»)dnl
define(«JSON_C_END_CONFIDENTIAL», «define(«_json_omitted»,«»)define(«_json_is_public»,«true»)»)dnl
dnl
dnl Some helpers to get our diversions in order:
dnl stream 0:  everything that is written to the JSON file
dnl stream -1: trash – everything outside of our markup.
define(«_json_divnum_json», 0)dnl
define(«_json_divert_to_json»,  «ifelse(_json_omitted,«»,«divert(_json_divnum_json)»)»)dnl
define(«_json_divert_to_trash», «divert(-1)»)dnl
dnl
define(«JSON_C_MEETING_MINUTES», «_json_divert_to_json()dnl
 { "metadata": { "type": "$1", "date": "$2", "start_time": "$3", "place":dnl
 "$4", "attendants": "$5", "absentees": "$6", "keeper_of_minutes": "$7" },
 _json_divert_to_trash()»)dnl
dnl
define(«JSON_C_CONSENSUS_ADOPTED», «_json_divert_to_json()dnl
 { "approved": true«,» "type":"consensus" }dnl
 _json_divert_to_trash()»)dnl
dnl
define(«JSON_C_CONSENSUS_REJECTED», «_json_divert_to_json()dnl
 { "approved": false«,» "type":"consensus" }dnl
 _json_divert_to_trash()»)dnl
dnl
define(«JSON_C_VOTE_ADOPTED», «_json_divert_to_json()dnl
 { "approved": true«,» "type":"vote"«,» "pro": $1«,» "contra": $2«,» "abstain": $3 }dnl
 _json_divert_to_trash()»)dnl
dnl
define(«JSON_C_VOTE_REJECTED», «_json_divert_to_json()dnl
 { "approved": false«,» "type":"vote"«,» "pro": $1«,» "contra": $2«,» "abstain": $3 }dnl
 _json_divert_to_trash()»)dnl
dnl
dnl These get redefined later, we only need them once
define(«_json_content_array_start»,     «"content": [»)dnl
define(«_json_content_array_delimiter», «,»)dnl
define(«_json_resolution_template», «{ "type": "resolution"«,» "public": $1«,»dnl
 "ref": "«$»1"«,» "reason": «$»2«,» "text": "«$»3"«,» "allocated_money":dnl
 ifelse(««$»4», «», «"0€"», «"«$»4"»)«,» "notes": "«$»5" }»)
dnl
define(«JSON_C_RESOLUTION», «_json_divert_to_json()dnl
 _json_content_array_start(define(«_json_content_array_start»,«,»))» dnl
 _json_resolution_template(««_json_is_public»»)
 «_json_divert_to_trash()»)dnl
dnl
define(«_json_todo_template», «{ "type": "todo"«,» "public": $1«,» "done": $2«,» dnl
"ref": "$«1»"«,» "assigned": "$«2»"«,» "text": "$«3»"«,» "notes": "$«4»" }»)dnl
define(«JSON_C_TODO», «_json_divert_to_json()dnl
 _json_content_array_start(define(«_json_content_array_start»,«,»))» dnl
 _json_todo_template(««_json_is_public»», «false»)dnl
«_json_divert_to_trash()»)dnl
define(«JSON_C_DONE», «_json_divert_to_json()dnl
 _json_content_array_start(define(«_json_content_array_start»,«,»))» dnl
 _json_todo_template(««_json_is_public»», «true»)dnl
«_json_divert_to_trash()»)dnl
dnl
dnl Must be last call in the document!
define(«JSON_C_END», «_json_divert_to_json()
 ], "end_time": "$1" }
_json_divert_to_trash()undivert»)dnl
dnl
dnl Don't output anything except we say so:
_json_divert_to_trash()dnl
dnl vim: set ft=m4rkup tw=80 et sw=1 ts=1 sts=1:
