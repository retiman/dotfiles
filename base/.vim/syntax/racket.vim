" Vim syntax file
" Language:	racket (was PLT scheme)
" Last Change:	2011-09-28
" Author:	Tim Brown <tim.brown@timb.net>
" Revision:      $Revision: 1.1 $
"
" Issues:
" * This needs to find itself back in the scheme.vim source
" * New racket commands -- I'm adding these as and when I find I need them
"   if anyone wants to pass me a block of syn keyword statments, I'll merge
"   them.

" Suggestions and bug reports (and fixes!) are solicited by the author.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This syntax includes scheme.vim (via racket.vim), and therefore I am
" grateful to those that have worked on this.
so $VIMRUNTIME/syntax/scheme.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nicked from chicken section: racket has keyword arguments
syn match schemeExtSyntax "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix up a fascism in scheme.vim:
"   identifier{} was matched as an schemeError (in fact, handling of braces is
"   frowned upon by the scheme.vim syntax. Unfortunately, this is ver common
"   in the context of scribble -- and has to be fixed. The following
"   statements are a rewrite of the scheme.vim versions, and by being invoked
"   here, overwrite the behaviour.
"
"   And things like the schemeComment, below are to get around the loss of
"   ordering caused by my doing this!
syn match	schemeError	,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]{}()";]\+[^ \t\[\](){}";]*, contained
syn region	schemeComment start="#|" end="|#"
syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]{}()";],me=e-1 contained
syn match	schemeConstant	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$, contained
syn match	schemeError	,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]{}()";]\+[^ \t\[\]{}()";]*, contained
syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1 contained
syn match	schemeConstant	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$, contained
syn match	schemeError	,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]{}()";]\+[^ \t\[\]{}()";]*, contained
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New racket commands -- as and when I find them: if anyone wants to pass me a
" block of syn keyword statments, I'll merge them.
syn keyword schemeExtSyntax define/contract λ -> contained

" Who didn't define this!?
syn keyword schemeFunc null
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn sync fromstart
set foldmethod=marker
