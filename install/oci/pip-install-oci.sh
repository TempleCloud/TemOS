#!/bin/bash

# https://github.com/oracle/oci-cli
# https://docs.us-phoenix-1.oraclecloud.com/Content/API/SDKDocs/cliinstall.htm
# https://pypi.org/project/oci-cli/
# https://github.com/oracle/oci-cli/releases

function py27-install() {
    # Python 2.7
    
    # local version="2.4.33"
    local version="2.4.34"

    pip install virtualenv
    virtualenv --version
    virtualenv -p /usr/bin/python2.7 venv
    source venv/bin/activate
    
    curl -LO https://github.com/oracle/oci-cli/releases/download/v${version}/oci-cli-${version}.zip
    unzip oci-cli-${version}.zip
    
    cd oci-cli
    pip install oci_cli-*-py2.py3-none-any.whl
    cd ..

    cp venv/bin/oci ${TEMOS_BIN}/oci


    rm -Rf oci-cli
    rm oci-cli-${version}.zip
    deactivate
    rm -R venv
}

$@
