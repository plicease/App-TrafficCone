package App::TrafficCone;

use strict;
use warnings;
use v5.10;
use Mojo::Base qw( Mojolicious );

# ABSTRACT: Web server that just returns 503 Service unavailable
our $VERSION = '0.01'; # VERSION

sub startup
{
  my($self, $config) = @_;
  
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

__END__

=pod

=head1 NAME

App::TrafficCone - Web server that just returns 503 Service unavailable

=head1 VERSION

version 0.01

=head1 AUTHOR

Graham Ollis <plicease@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
