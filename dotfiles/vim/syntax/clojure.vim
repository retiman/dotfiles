" Vim syntax file
" Language:	   Clojure
" Last Change: 2007-12-9
" Author:      Toralf Wittner <toralf.wittner@gmail.com>

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

set iskeyword+=?,-,*,!,+,/,=,<,>

syn match clojureComment ";.*$"
syn match clojureKeyword ":\a[a-zA-Z0-9?!\-+*\./]*"
syn region clojureString start=/"/ end=/"/ skip=/\\"/
syn match clojureCharacter "\\."
syn match clojureCharacter "\\space"
syn match clojureCharacter "\\tab"
syn match clojureCharacter "\\newline"

syn match clojureNumber "\<[0-9]\+\>"
syn match clojureRational "\<[0-9]\+/[0-9]\+\>"
syn match clojureFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

syn keyword clojureSyntax fn if cond def defn let new defmacro recur loop thisfn do quote the-var class instance? throw try-finally set! monitor-enter monitor-exit
syn match clojureSyntax "(\s*\.[^\.]"hs=s+1

syn region clojureDef matchgroup=clojureSyntax start="(\s*\(defmacro\|defn\|def\)"hs=s+1 end="\ze\(\[\|(\)" contains=clojureDefName
syn match clojureDefName "\s*[a-zA-Z0-9?!\-+*\./<>=]*" contained

syn region clojureVector matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,clojureDefName
syn region clojureMap matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALLBUT,clojureDefName

syn match clojureNil "\<nil\>"
syn match clojureQuote "\('\|`\)"
syn match clojureUnquote "\(\~@\|\~\)"
syn region clojureDispatch start="#^" end=/[ \t\n;("]/
syn region clojureDispatch start="#^{" end=/}/
syn region clojureVarQuote start="#'" end=/[ \t\n;("]/
syn match clojureVarArg "&" containedin=clojureVector

highlight link clojureComment Comment
highlight link clojureString String
highlight link clojureCharacter Character
highlight link clojureNumber Number
highlight link clojureFloat Number
highlight link clojureRational Number
highlight link clojureKeyword PreProc
highlight link clojureSyntax Statement
highlight link clojureDefName Function
highlight link clojureNil Constant
highlight link clojureQuote Delimiter
highlight link clojureVarQuote Delimiter
highlight link clojureUnquote Delimiter
highlight link clojureDispatch Constant
highlight link clojureVarArg Number

if exists("g:clj_highlight_builtins")
    "Highlight Clojure's predefined functions"
    syn keyword clojureFunc load-file eql-ref? list cons conj 
    syn keyword clojureFunc vector hash-map sorted-map sorted-map-by
    syn keyword clojureFunc meta with-meta when when-not
    syn keyword clojureFunc nil? not first rest second
    syn keyword clojureFunc ffirst frest rfirst rrest
    syn keyword clojureFunc eql? str strcat gensym 
    syn keyword clojureFunc apply list* delay lazy-cons fnseq concat
    syn keyword clojureFunc inc dec pos? neg? zero? quot rem
    syn keyword clojureFunc complement constantly identity seq count
    syn keyword clojureFunc assoc dissoc find keys vals merge
    syn keyword clojureFunc rseq sym name namespace locking .. ->
    syn keyword clojureFunc defmulti defmethod remove-method
    syn keyword clojureFunc binding find-var
    syn keyword clojureFunc ref deref commute alter set ensure sync !
    syn keyword clojureFunc agent agent-of agent-errors clear-agent-errors
    syn keyword clojureFunc reduce reverse comp appl
    syn keyword clojureFunc every not-every any not-any
    syn keyword clojureFunc map pmap mapcat filter take take-while drop drop-while
    syn keyword clojureFunc zipmap
    syn keyword clojureFunc cycle split-at split-with repeat replicate iterate range
    syn keyword clojureFunc doseq  dotimes into
    syn keyword clojureFunc eval import unimport refer unrefer in-namespace unintern
    syn keyword clojureFunc into-array array
    syn keyword clojureFunc make-proxy implement
    syn keyword clojureFunc prn print newline *out* *current-namespace*  *print-meta*
    syn keyword clojureFunc doto  memfn
    syn keyword clojureFunc read *in*
    syn keyword clojureFunc time key val
    syn keyword clojureFunc int long float double short byte boolean char
    syn keyword clojureFunc aget aset aset-boolean aset-int aset-long aset-float aset-double aset-short aset-byte
    syn keyword clojureFunc make-array
    syn keyword clojureFunc peek pop nth get
    syn keyword clojureFunc and or + * / - == < <= > >=
    highlight link clojureFunc Special
endif

let b:current_syntax = "clojure"

