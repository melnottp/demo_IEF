#!/bin/bash -x

# Test the existence of file other wise copy
FILE1='/data/settings.js'

if test -f "$FILE1" ; then 
    echo "$FILE1 exists"
    echo "Update settings.js to $FILE1"
    cp -u settings.js $FILE1

else 
    echo "Copy settings.js to $FILE1"
    cp settings.js $FILE1
fi  

# Test the existence of file other wise copy
FILE2='/data/flows_lo2fe.json'

if test -f "$FILE2" ; then 
    echo "$FILE2 exists"
    echo "Update flows_lo2fe.json to $FILE2"
    cp -u flows_lo2fe.json $FILE2

else 
    echo "Copy flows_lo2fe.json to $FILE2"
    cp flows_lo2fe.json $FILE2
fi  

# Test the existence of file other wise copy
FILE3='/data/flows_lo2fe_cred.json'

if test -f "$FILE3" ; then 
    echo "$FILE3 exists"
    echo "Update flows_lo2fe_cred.json to $FILE3"
    cp -u flows_lo2fe_cred.json $FILE3
else 
    echo "Copy flows_lo2fe_cred.json to $FILE3"
    cp flows_lo2fe_cred.json $FILE3
fi  

# Execute Argument in Dockerfile CMD commande line 
exec "$@"