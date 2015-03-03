# JOE Syntax Highlighting

This directory mainly contains *improved and completely new* JOE syntax files fixing bugs in the original files and adding support for new languages.

## Using

### *.jsf

To enable the .jsf files in this repository they need to appear in JOEs *syntax* directory, either locally (*~/.joe/syntax*) or globally. The global syntax directory is is likely to be */usr/share/joe/syntax* when using Debian and APT or */usr/local/Cellar/joe/3.7/share/joe/syntax* when using brew on Mac OS X.  You may download the [latest jsf-bundle](https://github.com/downloads/cmur2/joe-syntax/jsf-bundle_2.tar) and place it's contents into the *syntax* directory (Note: this bundle might be outdated compared to the repository's state).

A maybe better way to achieve this is to clone this repository somewhere onto your hard disk and establish symlinks to all jsf files in the *syntax* directory, or to install this repository to *~/.joe/syntax* and symlink *ftyperc* appropriately (see below).

### ftyperc (only needed to enable new languages)

To enable the enhanced *ftyperc* from this repository to gain syntax highlighting support for new languages without overwriting */etc/joe/ftyperc*, you may place the modified one in *~/.joe/* as *~/.joe/ftyperc*.

## How JOE syntax highlighting works

See [HowItWorks.md](https://github.com/cmur2/joe-syntax/blob/master/HowItWorks.md) which is a reworked version of the header of [c.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/c.jsf.in). Another good resource might be [jsf.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/jsf.jsf.in).

## Other Syntax Files

* [d.jsf](https://gist.github.com/1032393)

## Licensing

Every .jsf file from the original repository is under GPL2 as [JOE](http://sourceforge.net/projects/joe-editor/).

Every .jsf file created and modified exclusively by [me](https://github.com/cmur2) is under GPL2 as [JOE](http://sourceforge.net/projects/joe-editor/).

Files with contributions (or unclear license info):

* [elixir.jsf](https://github.com/cmur2/joe-syntax/blob/master/elixir.jsf) which is created by [Andrew Lisin](https://github.com/avli) under GPL v2 ([comment](https://github.com/cmur2/joe-syntax/pull/18#issuecomment-69193456))
* [erlang.jsf](https://github.com/cmur2/joe-syntax/blob/master/erlang.jsf) which is created by [Christian Nicolai](https://github.com/cmur2) and then modified by Jonas Rosling and enhanced with a small tweak from [raev](https://github.com/raev)
* [go.jsf](https://github.com/cmur2/joe-syntax/blob/master/go.jsf) which is entirely contributed by [Daniel Vargas](https://github.com/danielvargas)
* [js.jsf](https://github.com/cmur2/joe-syntax/blob/master/js.jsf) which is created by [Christian Nicolai](https://github.com/cmur2) and then modified by [Rebecca Turner](https://github.com/iarna)
* [json.jsf](https://github.com/cmur2/joe-syntax/blob/master/json.jsf) which is entirely contributed by [Rebecca Turner](https://github.com/iarna)
* [lsl.jsf](https://github.com/cmur2/joe-syntax/blob/master/lsl.jsf) which is from [Zai Lynch](https://wiki.secondlife.com/wiki/User:Zai_Lynch) under GPL v1 (delivered by [Rebecca Turner](https://github.com/iarna))
* [md.jsf](https://github.com/cmur2/joe-syntax/blob/master/md.jsf) which is created by [Christian Nicolai](https://github.com/cmur2) and then modified by Jonas Rosling
* [powershell.jsf](https://github.com/cmur2/joe-syntax/blob/master/powershell.jsf) which is entirely contributed by [Oskar Liljeblad](https://github.com/osklil) under GPL v2 ([comment](https://github.com/cmur2/joe-syntax/pull/5#issuecomment-76935968))
* [puppet.jsf](https://github.com/cmur2/joe-syntax/blob/master/puppet.jsf) which is created by [Christian Nicolai](https://github.com/cmur2) and then modified by [Eric Eisenhart](https://github.com/eeisenhart)
* [sql.jsf](https://github.com/cmur2/joe-syntax/blob/master/sql.jsf) which is from an "unknown source" (delivered by [Rebecca Turner](https://github.com/iarna))

## Links

For JOE see [here](http://joe-editor.sourceforge.net/).  
For JOE project see [here](http://sourceforge.net/projects/joe-editor/).  
For original JOE syntax files see [here](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax).  

*You can find this repository [here](https://github.com/cmur2/joe-syntax).*
