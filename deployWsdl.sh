
FILE_PATH_WSC=
FILE_PATH_ST=
FILE_PATH_ANTLR=
FILE_PATH_WSDL=
FILE_PATH_FINAL_JAR=

GROUP_ID=
ARTIFACT_ID=
ARTIFACT_VERSION=
PACKAGING_FORMAT=
REPOSITORY_ID=
ARTIFACT_URL=

# Script usage description
usage() {
    cat <<-EOF
usage: deployWsdl.sh
    -fwsc filepath_wsc
    -fst filepath_st
    -fantlr filepath_antlr
    -fwsdl filepath_wsdl
    -fjar filepath_jar
    -gid group_id
    -aid artifact_id
    -av artifact_verson
    -pf packaging_format
    -rid repo_id
    -aurl artifact_url
EOF
}

while [ "$1" != "" ]; do
    case $1 in
        -fwsc | --filepath_wsc )            shift
                                            FILE_PATH_WSC=$1
                                            ;;
        -fst | --filepath_st )              shift
                                            FILE_PATH_ST=$1
                                            ;;
        -fantlr | --filepath_antlr )        shift
                                            FILE_PATH_ANTLR=$1
                                            ;;
        -fwsdl | --filepath_wsdl )          shift
                                            FILE_PATH_WSDL=$1
                                            ;;
        -fjar | --filepath_jar )            shift
                                            FILE_PATH_FINAL_JAR=$1
                                            ;;
        -fwsc | --filepath_wsc )            shift
                                            FILE_PATH_WSC=$1
                                            ;; 

    esac
    shift
done 

echo "***********WSDL to JAR to Azure Artifactory************"
echo "Step 1: Generate jar file from wsdl file"
java -classpath $FILE_PATH_WSC:$FILE_PATH_ST:$FILE_PATH_ANTLR com.sforce.ws.tools.wsdlc $FILE_PATH_WSDL $FILE_PATH_FINAL_JAR

