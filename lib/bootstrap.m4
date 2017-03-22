dnl Bootstrapping process
dnl =====================
dnl
dnl This is the main entry point of the minutes-m4rkup M4 library. It defines
dnl all necessary macros of the public interface according to the selected
dnl format and visibility.
dnl
dnl When loading this file, define the macros `FORMAT` (one of the available
dnl formats, in lowercase), and `VISIBILITY` ("confidential" or "public")
dnl accordingly.
dnl
dnl After loading this file, you can use all macros of the public m4rkup
dnl interface.
dnl
dnl
dnl Set up M4
dnl ---------
dnl
dnl First, set up M4 to fit our needs:
dnl
dnl Literal opening and closing quote characters:
define(LITERAL_QUOTE_OPEN,  `changequote()«changequote(«,»)')dnl
define(LITERAL_QUOTE_CLOSE, `changequote()»changequote(«,»)')dnl
dnl
dnl ` and the next-to-default [ and ] are heavily used in Markdown, MediaWiki
dnl and JSON, so better use something a little less intrusive for quoting
changequote(`«',`»')dnl
dnl
dnl
dnl Load our helper functions:
include(«common.m4»)dnl
dnl
dnl
dnl Parameter Checking
dnl ------------------
dnl
ifdef(«FORMAT»,     «», «fatal_error(«FORMAT is undefined!»)»)dnl
ifdef(«VISIBILITY», «», «fatal_error(«VISIBILITY is undefined!»)»)dnl
ifelse(
  FORMAT, «markdown», «define(«F_CODE»,«MARKDOWN»)»,
  FORMAT, «json»,     «define(«F_CODE»,«JSON»)»,
  «fatal_error(«Don't know how to handle format 'FORMAT'»)»
)dnl
ifelse(
  VISIBILITY, «public»,       «define(«V_CODE»,«P»)»,
  VISIBILITY, «confidential», «define(«V_CODE»,«C»)»,
  «fatal_error(«Don't know how to handle visibility 'VISIBILITY'»)»
)dnl
dnl
dnl
dnl Definition of our Main Public Interface
dnl ---------------------------------------
dnl
include(FORMAT«-»VISIBILITY«.m4»)dnl
define(«MEETING_MINUTES»,    F_CODE«_»V_CODE«_MEETING_MINUTES($@)»)dnl
define(«CONFIDENTIAL»,       F_CODE«_»V_CODE«_CONFIDENTIAL($@)»)dnl
define(«REPLACE_WITH»,       F_CODE«_»V_CODE«_REPLACE_WITH($@)»)dnl
define(«END_CONFIDENTIAL»,   F_CODE«_»V_CODE«_END_CONFIDENTIAL($@)»)dnl
define(«CONSENSUS_ADOPTED»,  F_CODE«_»V_CODE«_CONSENSUS_ADOPTED($@)»)dnl
define(«CONSENSUS_REJECTED», F_CODE«_»V_CODE«_CONSENSUS_REJECTED($@)»)dnl
define(«VOTE_ADOPTED»,       F_CODE«_»V_CODE«_VOTE_ADOPTED($@)»)dnl
define(«VOTE_REJECTED»,      F_CODE«_»V_CODE«_VOTE_REJECTED($@)»)dnl
define(«RESOLUTION»,         F_CODE«_»V_CODE«_RESOLUTION($@)»)dnl
define(«TODO»,               F_CODE«_»V_CODE«_TODO($@)»)dnl
define(«DONE»,               F_CODE«_»V_CODE«_DONE($@)»)dnl
define(«END»,                F_CODE«_»V_CODE«_END($@)»)dnl
dnl
dnl vim: set ft=m4rkup tw=80 et sw=2 ts=2 sts=2:
