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

syn region hiveFunction         start="\<create_union(" end=")" contains=ALL
syn region hiveFunction         start="\<transform(" end=")" contains=ALL
syn region hiveFunction         start="\<round(" end=")" contains=ALL
syn region hiveFunction         start="\<floor(" end=")" contains=ALL
syn region hiveFunction         start="\<ceil(" end=")" contains=ALL
syn region hiveFunction         start="\<ceiling(" end=")" contains=ALL
syn region hiveFunction         start="\<rand(" end=")" contains=ALL
syn region hiveFunction         start="\<exp(" end=")" contains=ALL
syn region hiveFunction         start="\<ln(" end=")" contains=ALL
syn region hiveFunction         start="\<log10(" end=")" contains=ALL
syn region hiveFunction         start="\<log2(" end=")" contains=ALL
syn region hiveFunction         start="\<log(" end=")" contains=ALL
syn region hiveFunction         start="\<pow(" end=")" contains=ALL
syn region hiveFunction         start="\<power(" end=")" contains=ALL
syn region hiveFunction         start="\<sqrt(" end=")" contains=ALL
syn region hiveFunction         start="\<bin(" end=")" contains=ALL
syn region hiveFunction         start="\<hex(" end=")" contains=ALL
syn region hiveFunction         start="\<unhex(" end=")" contains=ALL
syn region hiveFunction         start="\<conv(" end=")" contains=ALL
syn region hiveFunction         start="\<abs(" end=")" contains=ALL
syn region hiveFunction         start="\<pmod(" end=")" contains=ALL
syn region hiveFunction         start="\<sin(" end=")" contains=ALL
syn region hiveFunction         start="\<asin(" end=")" contains=ALL
syn region hiveFunction         start="\<cos(" end=")" contains=ALL
syn region hiveFunction         start="\<tan(" end=")" contains=ALL
syn region hiveFunction         start="\<atan(" end=")" contains=ALL
syn region hiveFunction         start="\<degrees(" end=")" contains=ALL
syn region hiveFunction         start="\<radians(" end=")" contains=ALL
syn region hiveFunction         start="\<positive(" end=")" contains=ALL
syn region hiveFunction         start="\<negative(" end=")" contains=ALL
syn region hiveFunction         start="\<sign(" end=")" contains=ALL
syn region hiveFunction         start="\<e(" end=")" contains=ALL
syn region hiveFunction         start="\<p(" end=")" contains=ALL
syn region hiveFunction         start="\<size(" end=")" contains=ALL
syn region hiveFunction         start="\<map_keys(" end=")" contains=ALL
syn region hiveFunction         start="\<map_values(" end=")" contains=ALL
syn region hiveFunction         start="\<array_contains(" end=")" contains=ALL
syn region hiveFunction         start="\<sort_array(" end=")" contains=ALL
syn region hiveFunction         start="\<cast(" end=")" contains=ALL
syn region hiveFunction         start="\<binary(" end=")" contains=ALL
syn region hiveFunction         start="\<from_unixtime(" end=")" contains=ALL
syn region hiveFunction         start="\<unix_timestamp(" end=")" contains=ALL
syn region hiveFunction         start="\<to_date(" end=")" contains=ALL
syn region hiveFunction         start="\<year(" end=")" contains=ALL
syn region hiveFunction         start="\<month(" end=")" contains=ALL
syn region hiveFunction         start="\<day(" end=")" contains=ALL
syn region hiveFunction         start="\<dayofmonth(" end=")" contains=ALL
syn region hiveFunction         start="\<hour(" end=")" contains=ALL
syn region hiveFunction         start="\<minute(" end=")" contains=ALL
syn region hiveFunction         start="\<second(" end=")" contains=ALL
syn region hiveFunction         start="\<weekofyear(" end=")" contains=ALL
syn region hiveFunction         start="\<datediff(" end=")" contains=ALL
syn region hiveFunction         start="\<date_add(" end=")" contains=ALL
syn region hiveFunction         start="\<date_sub(" end=")" contains=ALL
syn region hiveFunction         start="\<from_utc_timestamp(" end=")" contains=ALL
syn region hiveFunction         start="\<to_utc_timestamp(" end=")" contains=ALL
syn region hiveFunction         start="\<ascii(" end=")" contains=ALL
syn region hiveFunction         start="\<concat(" end=")" contains=ALL
syn region hiveFunction         start="\<context_ngrams(" end=")" contains=ALL
syn region hiveFunction         start="\<concat_ws(" end=")" contains=ALL
syn region hiveFunction         start="\<find_in_set(" end=")" contains=ALL
syn region hiveFunction         start="\<format_number(" end=")" contains=ALL
syn region hiveFunction         start="\<get_json_object(" end=")" contains=ALL
syn region hiveFunction         start="\<in_file(" end=")" contains=ALL
syn region hiveFunction         start="\<instr(" end=")" contains=ALL
syn region hiveFunction         start="\<length(" end=")" contains=ALL
syn region hiveFunction         start="\<locate(" end=")" contains=ALL
syn region hiveFunction         start="\<lower(" end=")" contains=ALL
syn region hiveFunction         start="\<lcase(" end=")" contains=ALL
syn region hiveFunction         start="\<ltrim(" end=")" contains=ALL
syn region hiveFunction         start="\<lpad(" end=")" contains=ALL
syn region hiveFunction         start="\<parse_url(" end=")" contains=ALL
syn region hiveFunction         start="\<ngrams(" end=")" contains=ALL
syn region hiveFunction         start="\<printf(" end=")" contains=ALL
syn region hiveFunction         start="\<regexp_extract(" end=")" contains=ALL
syn region hiveFunction         start="\<regexp_replace(" end=")" contains=ALL
syn region hiveFunction         start="\<repeat(" end=")" contains=ALL
syn region hiveFunction         start="\<reverse(" end=")" contains=ALL
syn region hiveFunction         start="\<rpad(" end=")" contains=ALL
syn region hiveFunction         start="\<sentences(" end=")" contains=ALL
syn region hiveFunction         start="\<space(" end=")" contains=ALL
syn region hiveFunction         start="\<split(" end=")" contains=ALL
syn region hiveFunction         start="\<str_to_map(" end=")" contains=ALL
syn region hiveFunction         start="\<substr(" end=")" contains=ALL
syn region hiveFunction         start="\<substring(" end=")" contains=ALL
syn region hiveFunction         start="\<translate(" end=")" contains=ALL
syn region hiveFunction         start="\<trim(" end=")" contains=ALL
syn region hiveFunction         start="\<upper(" end=")" contains=ALL
syn region hiveFunction         start="\<ucase(" end=")" contains=ALL
syn region hiveFunction         start="\<java_method(" end=")" contains=ALL
syn region hiveFunction         start="\<reflect(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_short(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_int(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_long(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_float(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_double(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_number(" end=")" contains=ALL
syn region hiveFunction         start="\<xpath_string(" end=")" contains=ALL
syn region hiveFunction         start="\<count(" end=")" contains=ALL
syn region hiveFunction         start="\<sum(" end=")" contains=ALL
syn region hiveFunction         start="\<avg(" end=")" contains=ALL
syn region hiveFunction         start="\<min(" end=")" contains=ALL
syn region hiveFunction         start="\<max" end=")" contains=ALL
syn region hiveFunction         start="\<variance(" end=")" contains=ALL
syn region hiveFunction         start="\<var_pop(" end=")" contains=ALL
syn region hiveFunction         start="\<stddev_pop(" end=")" contains=ALL
syn region hiveFunction         start="\<stddev_samp(" end=")" contains=ALL
syn region hiveFunction         start="\<covar_pop(" end=")" contains=ALL
syn region hiveFunction         start="\<covar_samp(" end=")" contains=ALL
syn region hiveFunction         start="\<corr(" end=")" contains=ALL
syn region hiveFunction         start="\<percentile(" end=")" contains=ALL
syn region hiveFunction         start="\<percentile_approx(" end=")" contains=ALL
syn region hiveFunction         start="\<histogram_numeric(" end=")" contains=ALL
syn region hiveFunction         start="\<collect_set(" end=")" contains=ALL
syn region hiveFunction         start="\<inline(" end=")" contains=ALL
syn region hiveFunction         start="\<explode(" end=")" contains=ALL
syn region hiveFunction         start="\<stack(" end=")" contains=ALL
syn region hiveFunction         start="\<parse_url_tuple(" end=")" contains=ALL
syn region hiveFunction         start="\<json_tuple(" end=")" contains=ALL

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
  HiLink hiveFunction           Function

  delcommand HiLink
endif

let b:current_syntax = "hive"

