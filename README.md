JOE Syntax Highlighting
=======================

*[self](https://github.com/cmur2/joe-syntax)*

For JOE see [here](http://joe-editor.sourceforge.net/).  
For JOE project see [here](http://sourceforge.net/projects/joe-editor/).  
For original JOE syntax files see [here](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax).  

For a description about how JOEs jsf parser works, see the header of
[c.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/c.jsf.in).
Another good resource might be
[jsf.jsf](http://joe-editor.hg.sourceforge.net/hgweb/joe-editor/joe-editor/file/tip/syntax/jsf.jsf.in).

### How JOE syntax highlighting works

See [HowItWorks.md](https://github.com/cmur2/joe-syntax/blob/master/HowItWorks.md).

Using
-----

### ftyperc

To enable the enhanced *ftyperc* without overwriting '/etc/joe/ftyperc', you
may place the modified one in '~/.joe/' as '~/.joe/ftyperc'.

### *.jsf

To enable the .jsf files in this repository they need to appear in JOEs
*syntax* directory.  This is likely to be '/usr/share/joe/syntax' when using
Debian and APT.  A good way to achieve this is to clone this repository
somewhere onto your hard disk and establish symlinks to all jsf files in the
*syntax* directory

Other Syntax Files
------------------

* [d.jsf](https://gist.github.com/1032393)

