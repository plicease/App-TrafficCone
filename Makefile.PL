
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Web server that just returns 503 Service unavailable",
  "AUTHOR" => "Graham Ollis <plicease\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-TrafficCone",
  "EXE_FILES" => [
    "bin/traffic_cone"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::TrafficCone",
  "PREREQ_PM" => {
    "File::HomeDir" => 0,
    "File::Spec" => 0,
    "Mojo::Base" => 0,
    "Mojo::URL" => 0,
    "Mojolicious::Commands" => 0,
    "YAML" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::Mojo" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "File::HomeDir" => 0,
  "File::Spec" => 0,
  "Mojo::Base" => 0,
  "Mojo::URL" => 0,
  "Mojolicious::Commands" => 0,
  "Test::Mojo" => 0,
  "Test::More" => 0,
  "YAML" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



