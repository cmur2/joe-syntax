How JOE syntax highlighting works
=================================

*from [c.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/c.jsf.in),
slightly modified*

A (deterministic) state machine which performs lexical analysis of C.
(This is the "assembly language" of syntax highlighting.  A separate
program could be used to convert a regular expression NFA syntax into this
format).

Each state begins with:

    :<name> <color-name>

\<name\> is the state's name.
\<color-name\> is the color used for characters eaten by the state
(really a symbol for a user definable color).

The first state defined is the initial state.

Within a state, define transitions (jumps) to other states.  Each
jump has the form:

        <character-list> <target-state-name> [<option>s]

There are three ways to specify \<character-list\>s, either * for any
character not otherwise specified, & to match the character in the
delimiter match buffer or a literal list of characters within quotes
(ranges and escape sequences allowed).  When the next character matches
any in the list, a jump to the target-state is taken and the character is
eaten (we advance to the next character of the file to be colored).

The * transition should be the first transition specified in the state.

There are several options:

* __noeat__       - Do not eat the character, instead feed it to the next state
                    (this tends to make the states smaller, but be careful: you
                    can make infinite loops).  'noeat' implies 'recolor=-1'.

* __recolor=-N__  - Recolor the past N characters with the color of the
                    target-state.  For example once /* is recognized as the
                    start of C comment, you want to color the /* with the C
                    comment color with recolor=-2.

* __mark__        - Mark beginning of a region with current position.

* __markend__     - Mark end of region.

* __recolormark__ - Recolor all of the characters in the marked region with
                    the color of the target-state.  If markend is not given,
                    all of the characters up to the current position are recolored.
                    Note that the marked region can not cross line boundaries and
                    must be on the same line as recolormark.

* __buffer__      - Start copying characters to a string buffer, beginning with this
                    one (it's ok to not terminate buffering with a matching
                    'strings' option- the buffer is limited to leading 23
                    characters).

* __save_c__      - Save character in delimiter match buffer.

* __save_s__      - Copy string buffer to delimiter match buffer.

* __strings__     - A list of strings follows.  If the buffer matches any of the
                    given strings, a jump to the target-state in the string list
                    is taken instead of the normal jump.

* __istrings__    - Same as strings, but case is ignored.
                    Note: strings and istrings should be the last option on the
                    line.  They cause any options which follow them to be ignored.

* __hold__        - Stop buffering string- a future 'strings' or 'istrings' will
                    look at contents of buffer at this point.  Useful for distinguishing
                    commands and function calls in some languages 'write 7' is a command
                    'write (' is a function call- hold lets us stop at the space and delay
                    the string lookup until the ( or 7.

The format of the string list is:

        "string"   <target-state> [<options>s]
        "string"   <target-state> [<options>s]
        "&"        <target-state> [<options>s]   # matches contents of delimiter match buffer
        done

(all of the options above are allowed except "strings", "istrings" and "noeat".  noeat is
always implied after a matched string).

Weirdness: only states have colors, not transitions.  This means that you
sometimes have to make dummy states with

        *    <next-state>    noeat

just to get a color specification.

Delimiter match buffer is for perl and shell: a regex in perl can be s<..>(...)
and in shell you can say: <<EOS ....... EOS

New feature: subroutines
------------------------

Highlighter state machines can now make subroutine calls.  This works by
template instantiation: the called state machine is included in your
current state machine, but is modified so that the return address points
to the called.  There is still no run-time stack (the state is represented
as a single integer plus the saved delimiter string).

Recursion is allowed, but is self limited to 5 levels.

To call a subroutine, use the 'call' option:

        "\""    fred    call=string(dquote)

The subroutine called 'string' is called and the jump to 'fred' is
ignored.  The 'dquote' option is passed to the subroutine.

The subroutine itself returns to the caller like this:

        "\""    whatever    return

If we're in a subroutine, the return is made.  Otherwise the jump
to 'whatever' is made.

There are several ways of delimiting subroutines which show up in how it
is called.  Here are the options:

* __call=string()__         - A file called string.jsf is the subroutine.
                              The entire file is the subroutine.  The starting
                              point is the first state in the file.

* __call=library.string()__ - A file called library.jsf has the subroutine.
                              The subroutine within the file is called string.

* __call=.string()__        - There is a subroutine called string in the current file.

When a subroutine is within a file, but is not the whole file, it is delimited
as follows:

    .subr string

    . . . states for string subroutine . . .

    .end

Option flags can be passed to subroutines which control preprocessor-like
directives.  For example:

    .ifdef dquote
        "\""    idle    return
    .endif
    .ifdef squote
        "'"     idle    return
    .endif

.else if also available.  .ifdefs can be nested.

Obsolete feature: sync lines
----------------------------

the sync lines specification no longer matter.  We now always parse
from the beginning of the file.  Here is the old description:

Define no. sync lines
You can say:

* '-200' means 200 lines
* '-'    means always start parsing from beginning of file when we lose sync
         if nothing is specified, the default is -50

Colors and attributes
---------------------

Define colors and attributes.  Give a list of attributes, one
background color and one foreground color (default is used if
color is left out).

Attributes:
  bold inverse blink dim underline

Standard colors:

Foreground:
  white cyan magenta blue yellow green red black

Background:
  bg_white bg_cyan bg_magenta bg_blue bg_yellow bg_green bg_red bg_black

For 16 color and 256 color xterms: "export TERM=xterm-16color", these
brighter than normal colors are available:

> Note that you need an xterm which was compiled to support 16 or 256 colors
> and a matching termcap/terminfo entry for it.

Foreground:
  WHITE CYAN MAGENTA BLUE YELLOW GREEN RED BLACK

Background:
  bg_WHITE bg_CYAN bg_MAGENTA bg_BLUE bg_YELLOW bg_GREEN bg_RED bg_BLACK

For 256 color xterm: "export TERM=xterm-256color", these become available:

> Note that you need an xterm which was compiled to support 256 colors and a
> matching termcap/terminfo entry for it.

fg_RGB and bg_RGB, where R, G, and B range from 0 - 5.  So: fg_500 is bright red.

fg_NN and bg_NN give shades of grey, where the intensity, NN, ranges from 0 - 23.
