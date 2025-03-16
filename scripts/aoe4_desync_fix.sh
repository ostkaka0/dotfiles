#!/bin/bash

set -ex

STEAM_DIR=/home/$USER/.steam/steam/steamapps
AOE4_DIR=$STEAM_DIR/compatdata/1466860
AOE4_WIN_DIR=$AOE4_DIR/pfx/drive_c/windows
AOE4_WIN_SYS32_DIR=$AOE4_WIN_DIR/system32
AOE4_WIN_SYS64_DIR=$AOE4_WIN_DIR/syswow64

function check_deps() {
  which wget || (echo "wget is required (on Ubuntu you can install it with 'sudo apt-get install wget')" && exit 1)
  which cabextract || (echo "cabextract is required (on Ubuntu you can install it with 'sudo apt-get install cabextract')" && exit 1)
}

function cleanup() {
  local arch=$1

  rm -f vc_redist.$arch.exe
  rm -rf 0 a{0..11} u{0..31}
}

function backup() {
  local timestamp=$(date +%s)

  mv ucrtbase.dll ucrtbase.dll.bak-$timestamp
  mv concrt140.dll concrt140.dll.bak-$timestamp
  mv msvcp140.dll msvcp140.dll.bak-$timestamp
  mv vcamp140.dll vcamp140.dll.bak-$timestamp
  mv vccorlib140.dll vccorlib140.dll.bak-$timestamp
  mv vcomp140.dll vcomp140.dll.bak-$timestamp
  mv vcruntime140.dll vcruntime140.dll.bak-$timestamp
}

function download_and_replace() {
  local arch=$1

  wget https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.$arch.exe
  cabextract vc_redist.$arch.exe
  cabextract a10
}

function replace_dlls() {
  local dir=$1
  local arch=$2

  cd $dir

  backup
  cleanup $arch
  download_and_replace $arch
  cleanup $arch
}

check_deps
replace_dlls $AOE4_WIN_SYS32_DIR x64
replace_dlls $AOE4_WIN_SYS64_DIR x86