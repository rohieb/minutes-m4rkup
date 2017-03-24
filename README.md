            o           _|_  _  ,              /|  ,_  |)          _
    /|/|/|  | /|/| |  |  |  |/ / \_____/|/|/| /_|_/  | |/) |  |  |/ \
     | | |_/|/ | |_/\/|_/|_/|_/ \/      | | |___|    |/| \_/\/|_/|__/
                                                                /|
                                                                \|
A semantic markup framework for meeting minutes

## A Word of Caution

Please note that this software is in early alpha phase, and there will most
probably be breaking changes to the markup. If updating your documents doesn't
bother you, go ahead. In any case, I would love to get feedback on the ideas :-)

## Idea

* Write your meeting minutes in your favourite (text-based) markup language, using semantic markup for certain things
* Use `minutes-m4rkup` to convert your markup to:
    * human-readable formats like Markdown, PDF, HTML, …, resulting in consistent formatting
    * machine-readable formats like JSON, CSV, XML, …
        * for a comprehensive list, see [Input and Output Formats](#input-and-output-formats)

See the `tests/` folder for some examples.

## Input and Output Formats

Currently supported input formats are:

* Markdown with M4 macros

Currently supported output formats are:

* Markdown
* JSON


## Macro Reference

The default quoting characters for M4 are already used otherwise in the input
formats.  To prevent weirdness and make writing meeting minutes easier,
`minutes-m4rkup` redefines the M4 quoting characters as `«` (opening quote) and
`»` (closing quote).  If you should need these characters in any case, you can
always get a literal `«` or `»` by using the macros `LITERAL_QUOTE_OPEN` and
`LITERAL_QUOTE_CLOSE` instead.

### `MEETING_MINUTES()`
Gives general information about a meeting, also does initialisation and set-up.
Must be the first macro call in a document.

Parameters:

1. Type of the meeting (e.g., board meeting, general meeting, etc.)
2. Date of the meeting
3. Starting time,
4. Place of the meeting
5. (List of) attending people
6. (List of) absent people, if any
7. Name of minute taker


### `END()`
Signals the end of the meeting. Must be the last macro call in the document.

Parameters:

1. Closing time of the meeting


### `CONFIDENTIAL()`, `REPLACE_WITH()`, `END_CONFIDENTIAL()`
Specify a text block that should only be rendered in confidential versions of
the document, and, optionally, its replacement text in public versions.

Takes no parameters.

Example:

``` m4
CONFIDENTIAL()dnl
* TODO(T1, Eve, Make Plans for World Domination)
REPLACE_WITH()dnl
* TODO(T1, Eve, Buy some more cookies)
END_CONFIDENTIAL()dnl
```

Or, without a replacement, the block is simply stripped in public versions:
``` m4
CONFIDENTIAL()dnl
* TODO(T1, Eve, Make Plans for World Domination)
END_CONFIDENTIAL()dnl
```


### `CONSENSUS_ADOPTED()`, `CONSENSUS_REJECTED()`
Record a motion that was not voted for, but there was consensus nevertheless.
Use `CONSENSUS_ADOPTED` if the overall result was positive and the motion was
adopted, and `CONSENSUS_REJECTED` if it was rejected.

No Parameters.


### `VOTE_ADOPTED()`, `VOTE_REJECTED()`
Vote information. Use `VOTE_ADOPTED` if the overall result was positive and the
motion being voted for was adopted, and `VOTE_REJECTED` if it was rejected.

Parameters:

1. Number of votes for the cause
2. Number of votes against the cause
3. Number of abstentions


### `RESOLUTION()`
A resolution.

Parameters:

1. Reference number,
2. Vote information, use any of `VOTE_ADOPTED`, `VOTE_REJECTED`,
	`CONSENSUS_ADOPTED`, `CONSENSUS_REJECTED`
3. Short text of the resolution,
4. Allocated money, if any (optional)
5. Further text (optional)


### `TODO()`, `DONE()`
To Do List items. Use `TODO` to signal that an item needs action, and `DONE` to
signal that an item was done or is no longer valid.

Parameters:

1. Reference number/string etc.
2. Assigned person
3. Descriptive text
4. Additional notes (optional)


## Enhancing m4rkup

Before reading your input, `minutes-m4rkup` will look for additional files in
the following locations, and will include them in order:

  * `$HOME/.minutes-m4rkup.m4`
  * `./.minutes-m4rkup.m4` (relative to the input file)

You can drop your own M4 macros into those files. For example, for one project I
define a `WIKI` macro in `./.minutes-m4rkup.m4` as following:

``` m4
dnl WIKI(pagename[, optional link title]): link to wiki pages
define(«MEDIAWIKI_C_WIKI», «ifelse($2,,«[[$1]]»,«[[$1|$2]]»)»)dnl
define(«MEDIAWIKI_P_WIKI», «MEDIAWIKI_C_WIKI($1)»)dnl
define(«MARKDOWN_C_WIKI», «ifelse($2,,«[$1]»,«[$2]»)(https://stratum0.org/wiki/$1)»)dnl
define(«MARKDOWN_P_WIKI», «MARKDOWN_C_WIKI($1)»)dnl
define(«JSON_P_WIKI», «»)dnl M4 will complain if this is not defined
define(«JSON_C_WIKI», «»)dnl
define(«WIKI», F_CODE«_»V_CODE«_WIKI($@)»)dnl
```

`F_CODE` contains the respective output format to be rendered, in uppercase, and
`V_CODE` contains a `P` for the public version, or `C` for the confidential
version.
