#!/bin/bash

# Install Maven
#
# https://maven.apache.org/
# https://maven.apache.org/download.cgi#Installation
#

function install() {
    local version="3.5.4"
    local expected_sha1="22cac91b3557586bb1eba326f2f7727543ff15e3"
    local name="apache-maven-${version}"
    local binary="${name}-bin.tar.gz"
    local install_dir="/opt"
    # Download
    pushd "${install_dir}"
    if [ ! -f "${binary}" ]; then
        curl -O "http://apache.mirror.anlx.net/maven/maven-3/${version}/binaries/${binary}"
    fi
    # Checksum
    local sha1=$(shasum "${binary}" | awk '{print $1}')
    if [[ "${sha1}" != "${expected_sha1}" ]]; then
        echo "${binary} hash mismatch: ${sha1}"
        exit 1
    fi
    # Install
    sudo rm -Rf maven
    sudo tar -xvzf "${binary}"
    sudo mv "${name}" maven
    # Configure global paths and environment
    local config="/etc/profile.d/mavenenv.sh"
    cat > "${config}" <<EOF
#!/bin/bash

export M2_HOME=/opt/maven
export PATH=\${M2_HOME}/bin:\${PATH}
EOF
    sudo chmod +x /etc/profile.d/mavenenv.sh
    # echo "Run: 'sudo source /etc/profile.d/mavenenv.sh'
    # Clean
    rm -Rf "${binary}"
    popd
} && install

