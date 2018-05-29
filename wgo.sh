called=$_
if [ $called == $0 ]; then 
    echo "Usage: "
    echo "    source $0"
    exit 0
fi 

WGOSRC="${HOME}/.wgosrc"
WGOLIST="${HOME}/.wgolist"

PROFILE_FILE=~/.profile

if [ "`basename $SHELL`" = "zsh" ]; then
    PROFILE_FILE=~/.zshrc
fi

echo "if [ -z \"\$1\" ]; then cat ${WGOLIST}  | sed 's/alias //g' | sed 's/cd //g'; else alias \$1=\"cd \`pwd\`\"; echo "alias \$1=\\\"cd \`pwd\`\\\"" >> ${WGOLIST}; fi" > ${WGOSRC}
grep "wgo" ${PROFILE_FILE} | grep -v grep
if [ "$?" != "0" ];then
    touch ${WGOLIST}
    alias wgo="source ${WGOSRC}" > /dev/null
    echo "alias wgo=\"source ${WGOSRC}\"" >> ${PROFILE_FILE}
    echo "source ${WGOLIST}" >> ${PROFILE_FILE}
fi
source ${WGOLIST}

echo "Install Success"
