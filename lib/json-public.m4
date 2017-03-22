dnl JSON Output Format, Public visibility
dnl =====================================
dnl
dnl This file is loaded by `bootstrap.m4`, do not include it directly.
dnl
include(json-confidential.m4)dnl
define(«JSON_P_MEETING_MINUTES»,    «JSON_C_MEETING_MINUTES($@)»)dnl
define(«JSON_P_CONSENSUS_ADOPTED»,  «JSON_C_CONSENSUS_ADOPTED($@)»)dnl
define(«JSON_P_CONSENSUS_REJECTED», «JSON_C_CONSENSUS_REJECTED($@)»)dnl
define(«JSON_P_VOTE_ADOPTED»,       «JSON_C_VOTE_ADOPTED($@)»)dnl
define(«JSON_P_VOTE_REJECTED»,      «JSON_C_VOTE_REJECTED($@)»)dnl
define(«JSON_P_RESOLUTION»,         «JSON_C_RESOLUTION($@)»)dnl
define(«JSON_P_TODO»,               «JSON_C_TODO($@)»)dnl
define(«JSON_P_DONE»,               «JSON_C_DONE($@)»)dnl
define(«JSON_P_END»,                «JSON_C_END($@)»)dnl
dnl still leave is_public=false to retain the "censored" notion in public docs
define(«JSON_P_CONFIDENTIAL»,     «define(«_json_is_public»,«false»)define(«_json_omitted»,1)»)dnl
define(«JSON_P_REPLACE_WITH»,     «define(«_json_omitted»,«»)»)dnl
dnl note: CONFIDENTIAL blocks can leave out the REPLACE_WITH
define(«JSON_P_END_CONFIDENTIAL», «define(«_json_omitted»,«»)define(«_json_is_public»,«true»)»)dnl
dnl vim: set ft=m4rkup tw=80 et sw=1 ts=1 sts=1:
