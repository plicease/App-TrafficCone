package App::TrafficCone;

use strict;
use warnings;
use 5.010;
use Mojo::Base qw( Mojolicious );

# ABSTRACT: Web server that just returns 503 Service unavailable
# VERSION

sub startup
{
  my($self) = @_;
  
  if($self->can('secrets'))
  {
    $self->secrets([rand]);
  }
  else
  {
    $self->secret(rand);
  }

  $ENV{TRAFFIC_CONE} //= '503 Site down for maintenance';

  $self->routes->any('/*x' => { x => 'y' } => sub {
    my $self = shift;
    $self->render(
      text   => $ENV{TRAFFIC_CONE},
      status => 503,
    );
  });
  
  return;
}

1;
