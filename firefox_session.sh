#!/bin/bash

set -e

### CONFIGURATION ###
# The default settings will attempt to start a 'google' session.
# If google.tar.gz does not exist, attempt to start 'template' session.
# If template.tar.gz does not exist, a brand new session will start.
# No session saving and no private browsing.
# ==========
# required: session name
FIREFOX_SESSION='google'
# optional: allows the use of another saved session as template
SESSION_TEMPLATE='google'
# if true, the session will be saved when Firefox is terminated
SAVE_SESSION=false
# if true, use private browsing
PRIVATE=true

if [[ ${PRIVATE} == true ]]; then
    PRIVATE='-private'
else
    PRIVATE=''
fi

CWD=${PWD}

if [[ -z ${FIREFOX_SESSION} ]]; then
    echo "Variable FIREFOX_SESSION is required"
    exit 1
fi
PROFILEDIR='/tmp/firefox'
mkdir -p ${PROFILEDIR}

if [[ -f ${FIREFOX_SESSION}.tar.gz ]]; then
    # previously saved private session exists
    tar xzf ${FIREFOX_SESSION}.tar.gz -C ${PROFILEDIR}
    cd ${PROFILEDIR}
else
    if [[ -f ${SESSION_TEMPLATE}.tar.gz ]]; then
        # use another saved session as template for the new session
        tar xzf ${SESSION_TEMPLATE}.tar.gz -C ${PROFILEDIR}
        cd ${PROFILEDIR}
        cp -r ${SESSION_TEMPLATE} ${FIREFOX_SESSION}
    else
        # no prior session exists, create a new one
        cd ${PROFILEDIR}
        mkdir ${FIREFOX_SESSION}
    fi
fi
firefox -profile ${FIREFOX_SESSION} -no-remote -new-instance ${PRIVATE}

# saving session, and preserve the last session with ext .old
if [[ ${SAVE_SESSION} == true ]]; then
    tar czf ${FIREFOX_SESSION}.tar.gz ${FIREFOX_SESSION}
    cd ${CWD}
    mv ${FIREFOX_SESSION}.tar.gz ${FIREFOX_SESSION}.tar.gz.old || true
    mv ${PROFILEDIR}/${FIREFOX_SESSION}.tar.gz .
fi

# cleaning up
rm -rf ${PROFILEDIR}/${SESSION_TEMPLATE} || true
rm -rf ${PROFILEDIR}/${FIREFOX_SESSION}
