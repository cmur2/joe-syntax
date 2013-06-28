# JOE Syntax Highlighting

This directory mainly contains *improved and completely new* JOE syntax files
fixing bugs in the original files and adding support for new languages.

## Using

### *.jsf

To enable the .jsf files in this repository they need to appear in JOEs
*syntax* directory.  This is likely to be */usr/share/joe/syntax* when using
Debian and APT or */usr/local/Cellar/joe/3.7/share/joe/syntax* when using brew
on Mac OS X.  You may download the
[latest jsf-bundle](https://github.com/downloads/cmur2/joe-syntax/jsf-bundle_2.tar)
and place it's contents into the *syntax* directory (Note: this bundle might
be outdated compared to the repository's state).

A maybe better way to achieve this is to clone this repository somewhere
onto your hard disk and establish symlinks to all jsf files in the *syntax*
directory.

### ftyperc (only needed to enable new languages)

To enable the enhanced *ftyperc* from this repository to gain syntax
highlighting support for new languages without overwriting
*/etc/joe/ftyperc*, you may place the modified one in *~/.joe/* as
*~/.joe/ftyperc*.

## How JOE syntax highlighting works

See [HowItWorks.md](https://github.com/cmur2/joe-syntax/blob/master/HowItWorks.md)
which is a reworked version of the header of
[c.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/c.jsf.in).
Another good resource might be
[jsf.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/jsf.jsf.in).

## Other Syntax Files

* [d.jsf](https://gist.github.com/1032393)

## Licensing

Every file from the original repository is under GPL2 as [JOE](http://sourceforge.net/projects/joe-editor/).
Every file created by [me](https://github.com/cmur2) is under GPL2 as [JOE](http://sourceforge.net/projects/joe-editor/).

Files with unknown license info:

* [go.jsf](https://github.com/cmur2/joe-syntax/blob/master/go.jsf) which is entirely contributed by [Daniel Vargas](https://github.com/danielvargas)

## Links

For JOE see [here](http://joe-editor.sourceforge.net/).  
For JOE project see [here](http://sourceforge.net/projects/joe-editor/).  
For original JOE syntax files see [here](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax).  

*You can find this repository [here](https://github.com/cmur2/joe-syntax).*
