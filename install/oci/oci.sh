#!/bin/bash

export OCI_HOME="${HOME}/.oci"
export OCI_CONFIG="${OCI_HOME}/config"

# Generate PEM format RSA key-pair and create config file.
#
# https://docs.us-phoenix-1.oraclecloud.com/Content/API/Concepts/apisigningkey.htm
# https://docs.cloud.oracle.com/iaas/Content/API/Concepts/sdkconfig.htm


function setup() {
    oci setup
}


function setup-repair() {
    oci setup repair-file-permissions --file ${OCI_CONFIG}
}


function gen-config-template() {
    cat > oci-config-template <<EOF
[DEFAULT]
user=ocid1.user.oc1.longguid
key_file=/Users/YOU/.oci/oci_api_key.pem
fingerprint=some:cool:hex:code
tenancy=ocid1.tenancy.oc1..your.tenancy
region=us-ashburn-1
EOF
}


