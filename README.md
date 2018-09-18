# web service

http://cmsshow-rels.web.cern.ch/cmsShow-rels/

make_tarball.sh

* Command line options
-- dir=<dest>     destination
-- force  , create standalone version in -non-empty directory
-- fwlite=<path>, location to a file with list of packages>


* Run way dependencies
Example of list of packages (option --fwlite): http://uaf-2.t2.ucsd.edu/~alja/another-reference-buildeset
They can be followed by nightly builds for example ( it outdated since it does not have CondFormats/EgammaObjects): https://cmssdt.cern.ch/SDT/html//rc//slc6_amd64_gcc491/www/mon/7.5-mon-23/CMSSW_7_5_X_2015-11-30-2300/BuildSet/fwlite/ 


============================================================
 Testing

libexec/cmsShow.exe <options>


