called=$_
if [ $called == $0 ]; then 
    echo "Usage: "
    echo "    source $0"
    exit 0
fi 

WGOSRC="${HOME}/.wgosrc"
WGOLIST="${HOME}/.wgolist"
if [ -f ${WGOSRC} ]; then
    echo "Already installed"
    return
fi
BASHRCFILE=~/.profile
echo "if [ -z \"\$1\" ]; then cat ${WGOLIST}  | sed 's/alias //g' | sed 's/cd //g'; else alias \$1=\"cd \`pwd\`\"; echo "alias \$1=\\\"cd \`pwd\`\\\"" >> ${WGOLIST}; fi" > ${WGOSRC}
grep "wgo" ${BASHRCFILE} | grep -v grep
if [ "$?" != "0" ];then
    touch ${WGOLIST}
    alias wgo="source ${WGOSRC}" > /dev/null
    echo "alias wgo=\"source ${WGOSRC}\"" >> ${BASHRCFILE}
    echo "source ${WGOLIST}" >> ${BASHRCFILE}
fi

echo "Install Success"
