export PROMPT="%n@%m:%d%# "

##
## LOCATE AWK
##
AWK=
[ -f /usr/local/bin/awk ]       && AWK=/usr/local/bin/awk
[ -f /usr/bin/awk ]             && AWK=/usr/bin/awk
[ -f /bin/awk ]                 && AWK=/bin/awk
[ -f /usr/local/bin/nawk ]      && AWK=/usr/local/bin/nawk
[ -f /usr/bin/nawk ]            && AWK=/usr/bin/nawk
[ -f /bin/nawk ]                && AWK=/bin/nawk
[ -f /usr/local/bin/gawk ]      && AWK=/usr/local/bin/gawk
[ -f /usr/bin/gawk ]            && AWK=/usr/bin/gawk
[ -f /bin/gawk ]                && AWK=/bin/gawk
export AWK

## Find Awk (or Nawk or Gawk)
##
findawk() {
  AWK=
  [ -f /usr/local/bin/awk ]       && AWK=/usr/local/bin/awk && ls -il ${AWK}
  [ -f /usr/bin/awk ]             && AWK=/usr/bin/awk && ls -il ${AWK}
  [ -f /bin/awk ]                 && AWK=/bin/awk && ls -il ${AWK}
  [ -f /usr/local/bin/nawk ]      && AWK=/usr/local/bin/nawk && ls -il ${AWK}
  [ -f /usr/bin/nawk ]            && AWK=/usr/bin/nawk && ls -il ${AWK}
  [ -f /bin/nawk ]                && AWK=/bin/nawk && ls -il ${AWK}
  [ -f /usr/local/bin/gawk ]      && AWK=/usr/local/bin/gawk && ls -il ${AWK}
  [ -f /usr/bin/gawk ]            && AWK=/usr/bin/gawk && ls -il ${AWK}
  [ -f /bin/gawk ]                && AWK=/bin/gawk && ls -il ${AWK}
  export AWK
  echo "AWK=${AWK}"
}

## Find a Binary or Script in PATH
##
findbin() {
  echo ${PATH} | ${AWK} -F: -v TARGET=$1 '
  {
    for (i=1; i<=NF; i++) {
      cmd=sprintf("if [ -f %s/%s ]; then echo %s/%s; fi",$i,TARGET,$i,TARGET)
      system(cmd)
    }
  }'
}

## Return the length of the longest line in a file/stream
len() { ${AWK} 'length()>max{max=length()}END{print max}' $1; }

