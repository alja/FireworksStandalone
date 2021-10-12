## copy FWLITE scram_arch area to tarball location
## dump fwlite env to file
```
for i in `cat ~/standalone/env.list `; do echo export $i=`eval echo \\$$i`; done 

cat log | perl -p -e 's/cmsswpath/relativep[ath/og;'

for i in ls -d $SHELLDIR/$SCRAM_ARCH/external/*/*/lib; do LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$i; done
```
## remove CUDA package
## make link to geomtery files
``` 
mkdir -p $SCRAM_ARCH/cms/fwlite/$CMSSW_VERSION/external/$SCRAM_ARCH/data/Fireworks
cd $SCRAM_ARCH/cms/fwlite/$CMSSW_VERSION/external/$SCRAM_ARCH/data/Fireworks
ln -s  ../../../../../../../../slc7_amd64_gcc900/cms/data-Fireworks-Geometry/*/Fireworks/Geometry .

add search path to CMSSW_SEARCH_PATH in env script
CMSSW_SEARCH_PATH=$CMSSW_SEARCH_PATH:$CMSSW_RELEASE_BASE/external/$SCRAM_ARCH/data
```
