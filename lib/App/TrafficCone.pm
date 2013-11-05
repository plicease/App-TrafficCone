package App::TrafficCone;

use strict;
use warnings;
use v5.10;
use Mojo::Base qw( Mojolicious );

# ABSTRACT: Web server that just returns 503 Service unavailable
# VERSION

sub startup
{
  my($self) = @_;
  
  $self->secret(rand);

  $ENV{TRAFFIC_CONE} //= '503 Site down for maintenance';

  $self->routes->any('/*x' => { x => 'y' } => sub {
    my $self = shift;
    $self->render(
      text => $ENV{TRAFFIC_CONE},
    );
    $self->res->code(503);
  });
  
  return;
}

1;
