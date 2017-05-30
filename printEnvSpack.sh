#!/bin/bash

# export from environment
for i in   CMSSW_VERSION CMSSW_BASE LOCALRT  ROOFITSYS GENREFLEX ROOTSYS ROOT_TTREECACHE_SIZE ROOT_TTREECACHE_PREFILL CLHEP_PARAM_PATH CMSSW_DATA_PATH RIVET_ANALYSIS_PATH PATH ROOT_INCLUDE_PATH PYTHONPATH CMSSW_SEARCH_PATH CMSSW_FWLITE_INCLUDE_PATH DYLD_FALLBACK_LIBRARY_PATH ;
do
    echo $i `eval echo \\$$i` |  xargs perl -e '$x=shift @ARGV; $vx=shift @ARGV;  $vx =~ s!$ENV{'CMSSW_RELEASE_BASE'}!\$SHELLDIR!og; print "export $x=$vx\n"';
done

# instead of cmssw symlinks
for i in `ls -d */lib`; do echo DYLD_LIBRARY_PATH=\$LD_LBRARY_PATH:\$SHELLDIR/$i; done
