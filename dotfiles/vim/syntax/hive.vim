" Vim syntax file
" Language:     hive
" Maintainer:   Min Huang <min.huang@alumni.usc.edu>
" Filenames:    *.q

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword hiveKeyword         set add quit list dfs use
syn keyword hiveKeyword         load data local directory inpath overwrite into table view partition
syn keyword hiveKeyword         rename change first after touch archive unarchive enable disable offline
syn keyword hiveKeyword         create drop alter add external distinct temporary like if not exists
syn keyword hiveKeyword         select insert from
syn keyword hiveKeyword         show database databases schemas partitioned by clustered by sorted by buckets
syn keyword hiveKeyword         extended row format stored as with serdeproperties location tblproperties
syn keyword hiveKeyword         delimited fields terminated collection items map keys lines serde
syn keyword hiveKeyword         sequencefile textfile rcfile fileformat inputformat outputformat
syn keyword hiveKeyword         index indexes formatted describe dot using reduce collection items
syn keyword hiveKeyword         all where group cluster distribute sort limit having desc asc
syn keyword hiveKeyword         escaped recordreader function functions lateral
syn keyword hiveKeyword         between not and or is in like regexp rlike binary exists
syn keyword hiveKeyword         join left right full outer cross semi on
syn keyword hiveKeyword         lateral explain import export to
syn keyword hiveKeyword         role revoke grant privileges option

syn keyword hiveSpecial         false null true

syn region hiveString           start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region hiveString           start=+'+  skip=+\\\\\|\\'+  end=+'+

syn match hiveNumber            "-\=\<[0-9]*\>"
syn match hiveNumber            "-\=\<[0-9]*\.[0-9]*\>"
syn match hiveNumber            "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match hiveNumber            "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match hiveNumber            "\<0x[abcdefABCDEF0-9]*\>"

syn match hiveVariable          "@\a*[A-Za-z0-9]*\([._]*[A-Za-z0-9]\)*"
syn region hiveVariable         start="`" end="`"

syn region hiveComment          start="/\*"  end="\*/"
syn match hiveComment           "#.*"
syn match hiveComment           "--\_s.*"
syn sync ccomment hiveComment

syn keyword hiveType            tinyint smallint int bigint boolean float double string binary timestamp
syn region hiveType             start="array(" end=")" contains=ALL
syn region hiveType             start="map(" end=")" contains=ALL
syn region hiveType             start="struct(" end=")" contains=ALL
syn region hiveType             start="named_struct(" end=")" contains=ALL
syn region hiveType             start="uniontype(" end=")" contains=ALL

syn keyword hiveOperator        between not and or is in like regexp rlike binary exists

syn keyword hiveFlow            case when then else end
syn region hiveFlow             start="\<if(" end=")"  contains=ALL

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_hive_syn_inits")
  if version < 508
    let did_hive_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink hiveKeyword            Statement
  HiLink hiveSpecial            Special
  HiLink hiveString             String
  HiLink hiveNumber             Number
  HiLink hiveVariable           Identifier
  HiLink hiveComment            Comment
  HiLink hiveType               Type
  HiLink hiveOperator           Statement
  HiLink hiveFlow               Statement

  delcommand HiLink
endif

let b:current_syntax = "hive"

