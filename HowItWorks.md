# How JOE syntax highlighting works
*from [c.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/c.jsf.in)*

A (deterministic) state machine which performs lexical analysis of C.
(This is the "assembly language" of syntax highlighting.  A separate
program could be used to convert a regular expression NFA syntax into this
format).

Each state begins with
    ':<name> <color-name>'
\<color-name\> is the color used for characters eaten by the state
(really a symbol for a user definable color).

The first state defined is the initial state.

Within a state, define transitions (jumps) to other states.  Each
jump has the form: <character-list> <target-state> [<option>s]

There are three ways to specify <character-list>s, either * for any
character not otherwise specified, & to match the character in the
delimiter match buffer or a literal list of characters within quotes
(ranges and escape sequences allowed).  When the next character matches
any in the list, a jump to the target-state is taken and the character is
eaten (we advance to the next character of the file to be colored).

The * transition should be the first transition specified in the state.

There are several options:
   noeat       do not eat the character, instead feed it to the next state
               (this tends to make the states smaller, but be careful: you
               can make infinite loops).  'noeat' implies 'recolor=-1'.

   recolor=-N  Recolor the past N characters with the color of the
               target-state.  For example once /* is recognized as the
               start of C comment, you want to color the /* with the C
               comment color with recolor=-2.

   mark        Mark beginning of a region with current position.

   markend     Mark end of region.

   recolormark Recolor all of the characters in the marked region with
               the color of the target-state.  If markend is not given,
               all of the characters up to the current position are recolored.
               Note that the marked region can not cross line boundaries and
               must be on the same line as recolormark.

   buffer      start copying characters to a string buffer, beginning with this
               one (it's ok to not terminate buffering with a matching
               'strings' option- the buffer is limited to leading 23
               characters).

   save_c      Save character in delimiter match buffer.

   save_s      Copy string buffer to delimiter match buffer.

   strings     A list of strings follows.  If the buffer matches any of the
               given strings, a jump to the target-state in the string list
               is taken instead of the normal jump.

   istrings    Same as strings, but case is ignored.

               Note: strings and istrings should be the last option on the
               line.  They cause any options which follow them to be ignored.

   hold        Stop buffering string- a future 'strings' or 'istrings' will
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
sometimes have to make dummy states with '* next-state noeat' just to get
a color specification.

Delimiter match buffer is for perl and shell: a regex in perl can be s<..>(...)
and in shell you can say: <<EOS ....... EOS

New feature: subroutines

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
      "\""    whatever  return

If we're in a subroutine, the return is made.  Otherwise the jump
to 'whatever' is made.

There are several ways of delimiting subroutines which show up in how it
is called.  Here are the options:

call=string()           A file called string.jsf is the subroutine.
                        The entire file is the subroutine.  The starting
                        point is the first state in the file.

call=library.string()   A file called library.jsf has the subroutine.
                        The subroutine within the file is called string.

call=.string()          There is a subroutine called string in the current file.

When a subroutine is within a file, but is not the whole file, it is delimited
as follows:

 .subr string

 . . . states for string subroutine . . .

 .end

Option flags can be passed to subroutines which control preprocessor-like
directives.  For example:

.ifdef dquote
   "\""       idle    return
.endif
.ifdef squote
   "'"        idle    return
.endif

.else if also available.  .ifdefs can be nested.
