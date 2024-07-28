#!/bin/zsh
export DATASETTE_LOAD_PLUGINS="datasette-darkmode,datasette-audio-waveform"
datasette ${0:a:h} $@
