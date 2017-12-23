#!/usr/bin/perl -w
# Would prefer /opt/local/bin/perl -w

# for f in /Users/alja/fwlite/test/fwlite-9_2_15-ylshniz3j6yxy6dsm57m5fuqynhc35uy/CMSSW_9_2_15/lib/osx10_amd64_clang/*.so; do ./relib.pl $f; done
# for f in /Users/alja/fwlite/test/fwlite-9_2_15-ylshniz3j6yxy6dsm57m5fuqynhc35uy/CMSSW_9_2_15/external/osx10_amd64_clang/lib/*.so; do ./relib.pl $f; done
# for f in /Users/alja/fwlite/test/fwlite-9_2_15-ylshniz3j6yxy6dsm57m5fuqynhc35uy/CMSSW_9_2_15/external/osx10_amd64_clang/lib/*.dylib; do ./relib.pl $f; done

%pathswaps =
(
 "^/Volumes/Fireworks/spack/opt/spack/darwin-highsierra-x86_64/clang-9.0.0-apple/fwlite-9_2_15" => '@rpath/',
 "^/Volumes/Fireworks/" => '@rpath/'
);

$pathwarn = "^/Volumes/";

$libid_prefix = '@rpath/';

################################################################################
################################################################################

sub fixlib
{
    my ($rlib, $rpath, $newpath) = @_;

    print "Fix  for $in_fqn_lib - $rlib should use $newpath\n";

    print "install_name_tool -change \"${rpath}${rlib}\" \"${newpath}${rlib}\" \"$in_fqn_lib\"\n";

    `install_name_tool -change \"${rpath}${rlib}\" \"${newpath}${rlib}\" \"$in_fqn_lib\"`;
}

################################################################################
################################################################################

$in_fqn_lib = shift;

unless ($in_fqn_lib =~ m!(^.*/)([^/]+\.(?:so|dylib))!o)
{
    print "Error parsing input file name $in_fqn_lib\n";
    exit 1;
}

($in_path, $in_lib) = ($1, $2);

print "$in_lib - $in_path\n";

# Fix lib itself to have correct id

print "install_name_tool -id \"${libid_prefix}${in_lib}\" \"$in_fqn_lib\"\n";

`install_name_tool -id \"${libid_prefix}${in_lib}\" \"$in_fqn_lib\"`;

# Fix where the libraries are expected to be

open OO, "otool -L $in_fqn_lib|";

line_loop: while (my $l = <OO>)
{
    chomp $l;
    $l =~ s/^\s+//o;

    for my $k (keys %pathswaps)
    {
	if ($l =~ m!(${k}.*/)([^/]+\.(?:so|dylib))!)
	{
	    print "Relocation candidate $2\n";
	    fixlib($2, $1, $pathswaps{$k});

	    next line_loop;
	}
    }

    if ($l =~ m!(^${pathwarn}.*/)([^/]+.(?:so|dylib))!)
    {
        print "Warning ... unhandled relocation candidate $2\n        with prefix $1\n";
    }
}

close OO;
