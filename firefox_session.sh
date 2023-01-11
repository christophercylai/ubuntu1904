#!/bin/bash

set -e

# required variable: FIREFOX_SESSION
# optional variable: SESSION_TEMPLATE

CWD=${PWD}

if [[ -z ${FIREFOX_SESSION} ]]; then
    echo "Variable FIREFOX_SESSION is required"
    exit 1
fi
PROFILEDIR='/tmp/firefox'
mkdir -p ${PROFILEDIR}

if [[ -f ${FIREFOX_SESSION}.tar.gz ]]; then
    # previously saved private session exists
    cp ${FIREFOX_SESSION}.tar.gz ${PROFILEDIR}
    cd ${PROFILEDIR}
    tar xzf ${FIREFOX_SESSION}.tar.gz
    rm ${FIREFOX_SESSION}.tar.gz
else
    if [[ -f ${SESSION_TEMPLATE}.tar.gz ]]; then
        # use another saved session as template for the new session
        cp ${SESSION_TEMPLATE}.tar.gz ${PROFILEDIR}
        cd ${PROFILEDIR}
        tar xzf ${SESSION_TEMPLATE}.tar.gz
        rm ${SESSION_TEMPLATE}.tar.gz
        mv ${SESSION_TEMPLATE} ${FIREFOX_SESSION}
    else
        # no prior session exists, create a new one
        cd ${PROFILEDIR}
        mkdir ${FIREFOX_SESSION}
    fi
fi
firefox -profile ${FIREFOX_SESSION} -no-remote -new-instance -private

# saving private session, and preserve the last session with ext .old
tar czf ${FIREFOX_SESSION}.tar.gz ${FIREFOX_SESSION}
cd ${CWD}
mv ${FIREFOX_SESSION}.tar.gz ${FIREFOX_SESSION}.tar.gz.old || true
mv ${PROFILEDIR}/${FIREFOX_SESSION}.tar.gz .
rm -rf ${PROFILEDIR}/${FIREFOX_SESSION}
