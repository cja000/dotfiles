# vim: set ft=bash
###############################################################################
### Bash utils
###############################################################################
# Goes up a specified number of directories  (i.e. up 4)
up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}
# Remove duplicates from variables
remove_dup_from_var ()
{
    export $1=`tr ':' '\n' <<< ${!1} | sort -u | sed '/^$/d' | tr '\n' ':' | sed 's/:$/\n/'`
}

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}
remove_duplicates_from_path() {
    local OLD_IFS="$IFS"
    IFS=:
    local NEWPATH=""
    declare -A EXISTS
    for p in $PATH; do
        [[ -z "${EXISTS[$p]}" ]] && { NEWPATH="${NEWPATH:+$NEWPATH:}$p"; EXISTS[$p]=yes; }
    done
    IFS="$OLD_IFS"
    PATH="$NEWPATH"
}
