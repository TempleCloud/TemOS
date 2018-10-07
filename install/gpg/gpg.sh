#!/bin/bash

function gen-key() {
    gpg --gen-key
}

function list-keys() {
    gpg --list-keys
}
