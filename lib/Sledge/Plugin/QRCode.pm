package Sledge::Plugin::QRCode;

use strict;
use vars qw($VERSION);
$VERSION = '0.01';

use GD::Barcode::QRcode;

sub import {
    my $self = shift;
    my $pkg  = caller;

    no strict 'refs';
    *{"$pkg\::show_qrcode"} = \&_show_qrcode;
}

sub _show_qrcode {
    my $self = shift;
    my $str  = shift;
    my $opts = shift;

    my $qrcode = GD::Barcode::QRcode->new($str, $opts)->plot->png;

    $self->r->content_type('image/png');
    $self->set_content_length(length $qrcode);
    $self->send_http_header;
    $self->r->print($qrcode);
    $self->invoke_hook('AFTER_OUTPUT');
    $self->finished(1);
}

1;
__END__

=head1 NAME

Sledge::Plugin::QRCode - QRCode Plugin for Sledge

=head1 SYNOPSIS

  package Your::Pages;
  use Sledge::Plugin::QRCode;

  sub dispatch_qrcode {
    my $self = shift;
    $self->show_qrcode('http://example.com/');
  }

=head1 DESCRIPTION

Sledge::Plugin::QRCode is QRCode Plugin for Sledge.
You can easy to generate the QRCode.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<GD::Barcode::QRCode>

=cut
