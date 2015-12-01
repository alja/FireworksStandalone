
* Location
It is in Fireworks/Core package. Would make sense to move it to a diffrent repository, or just to a gist:
https://github.com/cms-sw/cmssw/blob/CMSSW_7_5_X/Fireworks/Core/standalone_build/make_tarball.sh

* Command line options
-- dir=<dest>     destination
-- force  , create standalone version in -non-empty directory
-- fwlite=<path>, location to a file with list of packages>

Note: often standalone packaging has to be rerun because the list of externals and cms libs is expanding. Maybe it would make sense to add options for this.

* Run way dependencies
Example of list of packages (option --fwlite): http://uaf-2.t2.ucsd.edu/~alja/another-reference-buildeset
They can be followed by nightly builds for example ( it outdated since it does not have CondFormats/EgammaObjects): https://cmssdt.cern.ch/SDT/html//rc//slc6_amd64_gcc491/www/mon/7.5-mon-23/CMSSW_7_5_X_2015-11-30-2300/BuildSet/fwlite/ 


============================================================
 Testing


If things get wrong usually environment is exported with function printEnv:
https://github.com/cms-sw/cmssw/blob/CMSSW_7_5_X/Fireworks/Core/scripts/cmsShow

and then run
libexec/cmsShow.exe <options>

* Notes
It would be good to add printEnv option in cmsShow scrips.
The cmsShow script has the same problem as make_tarbals.sh script. It is outdated in cmsRepo. Current version is here:
http://uaf-2.t2.ucsd.edu/~alja/cmsShow

