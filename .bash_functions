# vim: set ft=bash

###############################################################################
### DPI
###############################################################################
markdownlint_dpi ()
{
    if [[ -z $1 ]]; then
        echo "No markdown file provided"
    else
        markdownlint --config /proj/dpi/scripts/markdownlint.yaml "$1"
    fi
}

#dpi_envconfig ()
#{
    #if [[ -z $DPI_ROOT_NETWORK_PATH ]]; then
        #export DPI_ROOT_NETWORK_PATH="/proj/dpi"
    #if [[ -z $DPI_ROOT_FOLDER_PATH ]]; then
        #export DPI_ROOT_FOLDER_PATH="cdpi_environment"
    #if [[ -z $DPI_ROOT_SETUP_SCRIPTS_PATH ]]; then
        #export DPI_ROOT_SETUP_SCRIPTS_PATH="${DPI_ROOT_NETWORK_PATH}/${DPI_ROOT_FOLDER_PATH}"
    #if [[ -z $DPI_ROOT_NODE_DATA_PATH ]]; then
        #export DPI_ROOT_NODE_DATA_PATH="$DPI_ROOT_SETUP_SCRIPTS_PATH/data/node"
    #if [[ ":$PATH:" != *":$DPI_ROOT_SETUP_SCRIPTS_PATH:"* ]]; then
        #export PATH="$DPI_ROOT_SETUP_SCRIPTS_PATH:${PATH}"

    #alias dpigit='(export GERRIT_PORT="29418"; export GERRIT_PROTOCOL="ssh"; export GERRIT_SERVER1="gerrit.ericsson.se"; export GERRIT_SERVER2="selngerrit.mo.sw.ericsson.se"; export GERRIT_SERVER3="selngerrit-mirror.mo.sw.ericsson.se"; "$DPI_ROOT_NETWORK_PATH/scripts/getdpigit.sh" \!*)'
    #alias alfred='(export GERRIT_PORT="29418"; export GERRIT_PROTOCOL="ssh"; export GERRIT_SERVER1="gerrit.ericsson.se"; export GERRIT_SERVER2="selngerrit.mo.sw.ericsson.se"; export GERRIT_SERVER3="selngerrit-mirror.mo.sw.ericsson.se"; export PYTHONPATH=/proj/dpi/python-modules; export PATH=/app/vbuild/RHEL7-x86_64/cmake/3.18.2/bin:${PATH}; export LD_LIBRARY_PATH="/proj/epg-tools/gcc/9.2.0.rhel7/lib64/":"/proj/epg-tools/gcc/8.1.0.rhel6/lib64/":"/app/vbuild/RHEL6-x86_64/gcc/4.9.2/lib64":"$DPI_ROOT_NETWORK_PATH/building-deps/boost/boost_1_68_0_cxx11_ABI/lib":"$DPI_ROOT_NETWORK_PATH/building-deps/boost/boost_1_59_0/lib":"$DPI_ROOT_NETWORK_PATH/building-deps/boost/boost_1_54_0/lib":"/app/gcc/4.3.4/lib64":"$DPI_ROOT_NETWORK_PATH/building-deps/openssl/0.9.8e/lib64":".":"${DPI_ROOT_NETWORK_PATH}/building-deps/thrift-0.12.0_cxx11_ABI/lib/cpp/.libs/":"${DPI_ROOT_NETWORK_PATH}/building-deps/thrift-0.11/lib/cpp/.libs/":"${DPI_ROOT_NETWORK_PATH}/building-deps/thrift/lib":"${DPI_ROOT_NETWORK_PATH}/building-deps/yaml-cpp-0.6.0_cxx11_ABI/lib":"${DPI_ROOT_NETWORK_PATH}/building-deps/yaml-cpp/lib"; module add ninja/1.7.2; module add doxygen/1.8.16; module add mscgen/0.20; module add dia/0.97.1; module add python/2.7.3-1; ./BuildAndTools/alfred/scripts/alfred \!*)'
#}

###############################################################################
### K8s
###############################################################################
# Setup the channel to use
kubeconfig ()
{
    DB_PATH="/lab/epg_ft/users/einfrlab/kubernetes_clusters/"
    if [[ -z $1 ]]; then
        echo "No channel provided"
        return
    else
        cluster=$(find ${DB_PATH} -iname "*${1}*.conf")
        if [[ -z ${cluster} ]]; then
            echo ${cluster}" not found";
        else
            export KUBECONFIG=${cluster};
            echo "KUBECONFIG: "${KUBECONFIG};
        fi
    fi
}

k8_cluster ()
{
    if [[ -z $1 ]]; then
        echo "No chassis provided"
        CHASSIS=`evrtd list -f | awk '/^ Chassis/{print $NF}'`
        echo "Your chassis is / are: ${CHASSIS}"
    else
        CHASSIS=$1
    fi
    if [[ -z ${CHASSIS} ]]; then
        echo "No chassis available"
        return
    fi
    cluster_file="*"${CHASSIS}".conf"
    cluster=`find /lab/epg_ft/users/einfrlab/kubernetes_clusters/ -iname ${cluster_file}`
    if [[ -z ${cluster} ]]; then
        echo ${cluster_file}" not found";
    else
        echo "Cluster found: "${cluster};
        export KUBECONFIG=${cluster};
        echo "KUBECONFIG: "${KUBECONFIG};

        export APISERVER=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}');
        echo "APISERVER: "${APISERVER};

        export TOKEN=$(kubectl get secret $(kubectl get serviceaccount default -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode );
        echo "TOKEN: "${TOKEN};

        export K8_CLUSTER=${CHASSIS};
        echo "K8_CLUSTER: "${K8_CLUSTER};

        if [[ -z ${evrtd_data} ]]; then
            # No MESOS
            DALLAS_NAME="pccc-tool-${CHASSIS}-1"
            K8_TESTCHANNEL="pccc-tc-$CHASSIS"
        else
            export K8_CLUSTER_TYPE=`evrtd list -n ${CHASSIS} -j | jq '.[0].variant' | tr -d '"'`;
            DALLAS_NAME=$(evrtd list -n ${CHASSIS} -j | jq -r '.[0].external_tools[0]');
            K8_TESTCHANNEL=$(evrtd list -n ${CHASSIS} -j | jq -r '.[0].testchannel_name')
        fi
        echo "K8_DALLAS: ${DALLAS_NAME}";
        export K8_DALLAS=${DALLAS_NAME};
        echo "K8_TESTCHANNEL: ${K8_TESTCHANNEL}"
        export K8_TESTCHANNEL=${K8_TESTCHANNEL}
    fi
}

# Clean timestamps from kubectl logs
pcg_log_no_timestamp() {
    sed -e 's/^[0-9].*Z //' -e 's/,\"timestamp\":\"[^\"]*\"//' $1
}

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
