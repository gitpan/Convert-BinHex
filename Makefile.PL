
use strict;
use warnings;

use 5.006000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "extract data from Macintosh BinHex files",
  "AUTHOR" => "Eriq <eryq\@zeegee.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Convert-BinHex",
  "EXE_FILES" => [
    "bin/binhex.pl",
    "bin/debinhex.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "Convert::BinHex",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "Fcntl" => 0,
    "File::Basename" => 0,
    "FileHandle" => 0,
    "Getopt::Std" => 0,
    "POSIX" => 0,
    "integer" => 0,
    "lib" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Compare" => 0,
    "File::Slurp" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "autodie" => 0
  },
  "VERSION" => "1.122",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



