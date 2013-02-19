use strict;
use warnings;
use Test::More tests => 6;
use Test::Mojo;
use App::TrafficCone;

my $t = Test::Mojo->new('App::TrafficCone');

$t->get_ok('/')
  ->status_is(503)
  ->content_like(qr{Site down for maintenance});

note $t->tx->res->to_string;

$t->post_ok('/foo/bar/baz')
  ->status_is(503)
  ->content_like(qr{Site down for maintenance});

note $t->tx->res->to_string;
