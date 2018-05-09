called=$_
if [ $called == $0 ]; then 
    echo "Usage: "
    echo "    source $0"
    exit 0
fi 

WGOSRC="${HOME}/.wgosrc"
if [ -f ${WGOSRC} ]; then
    echo "Already installed"
    return
fi
BASHRCFILE=~/.bashrc
echo "if [ -z \"\$1\" ]; then alias; else alias \$1=\"cd \`pwd\`\"; fi" > ${WGOSRC}
grep "wgo" ${BASHRCFILE}
if [ "$?" != "0" ];then
    alias wgo="source ${WGOSRC}" > /dev/null
    echo "alias wgo=\"source ${WGOSRC}\"" >> ${BASHRCFILE}
fi

echo "Install Success"
