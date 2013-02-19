
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::Mojo" => 0,
    "Test::More" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Web server that just returns 503 Service unavailable",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "App-TrafficCone",
  "dist_version" => "0.01",
  "license" => "perl",
  "module_name" => "App::TrafficCone",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "File::HomeDir" => 0,
    "File::Spec" => 0,
    "Mojo::Base" => 0,
    "Mojolicious::Commands" => 0,
    "YAML" => 0,
    "perl" => "v5.10.0",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/traffic_cone"
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
