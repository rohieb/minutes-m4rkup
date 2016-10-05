            o           _|_  _  ,             /|  ,_  |)   _|   _
    /|/|/|  | /|/| |  |  |  |/ / \_____/|/|/|/_|_/  | |/) / |  / \_|  |  |_/|/|
     | | |_/|/ | |_/\/|_/|_/|_/ \/      | | |__|    |/| \/\/|_/\_/  \/ \/   | |_/

A semantic markup framework for meeting minutes

## Idea

* Write your meeting minutes in Markdown, using semantic markup for certain things
* Use `minutes-m4rkdown` to convert your minutes to:
    * human-readable formats like Markdown, PDF, HTML, …, resulting in consistent formatting
    * machine-readable formats like JSON, CSV, XML, …

See the `tests/` folder for some examples.


## Macro Reference

### `MEETING_MINUTES()`
Gives general information about a meeting, also does initialisation and set-up.
Must be the first macro call in a document.

Parameters:

1. Type of the meeting (e.g., board meeting, general meeting, etc.)
2. Date of the meeting
3. Starting time,
4. (List of) attending people
5. (List of) absent people, if any
6. Name of minute taker


### `END()`
Signals the end of the meeting. Must be the last macro call in the document.

Parameters:

1. Closing time of the meeting


### `VOTE_ADOPTED()`, `VOTE_REJECTED()`
Vote information. Use `VOTE_ADOPTED` if the overall result was positive and the
motion being voted for was adopted, and `VOTE_REJECTED` if it was rejected.

Parameters:

1. Number of votes for the cause
2. Number of votes against the cause
3. Number of abstentions


### `RESOLUTION()`, `RESOLUTION_NONPUBLIC()`
A resolution. The non-public variant gets redacted in public material.

Parameters:

1. Reference number,
2. Vote information, use `VOTE_ADOPTED()`/`VOTE/AGAINST`
3. Short text of the resolution,
4. Allocated money, if any (optional)
5. Further text (optional)


### `TODO()`, `DONE()`, `TODO_NONPUBLIC()`, `DONE_NONPUBLIC()`
To Do List items. Use `TODO` to signal that an item needs action, and `DONE` to
signal that an item was done or is not longer valid.  Non-public variants get
redacted in public documents.

Parameters:

1. Reference number/string etc.
2. Assigned person
3. Descriptive text
4. Additional notes (optional)
