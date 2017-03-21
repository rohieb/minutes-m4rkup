include(json-confidential.m4)dnl
dnl still leave is_public=false to retain the "censored" notion in public docs
define(«CONFIDENTIAL»,    «define(«is_public»,«false»)define(«omitted»,1)»)dnl
define(«REPLACE_WITH»,    «define(«omitted»,«»)»)dnl
dnl note: CONFIDENTIAL blocks can leave out the REPLACE_WITH
define(«END_CONFIDENTIAL»,«define(«omitted»,«»)define(«is_public»,«true»)»)dnl
