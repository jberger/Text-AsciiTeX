package Text::AsciiTeX;

use strict;
use warnings;

use parent 'Exporter';

our $VERSION = '0.01';
$VERSION = eval $VERSION;

require XSLoader;
XSLoader::load('Text::AsciiTeX', $VERSION);

our @EXPORT = ( qw/ render / );

1;

__END__

__POD__

=head1 NAME

Text::AsciiTeX - Convert (La)TeX formulas to ASCII art

=head1 SYNOPSIS

 use Text::AsciiArt;
 my $text_array = render('\frac{1}{e}');
 print "$_\n" for @$text_array;

=head1 DESCRIPTION

This module provides a mechanism to render (La)TeX formulae to ASCII art. It is based solely on F<AsciiTeX> written by Bart Pieters (See L</"UNDERLYING TECHNOLOGIES">).

=head1 EXPORTED FUNCTION

This module exports the C<render> function.

=head2 render

The function C<render> accepts a string containing a formula in (La)TeX formatting. The return value is an array reference. Each element of the array is a string for each row of the art. Printing each line, terminated by a newline will probably do what you expect.

=head1 UNDERLYING TECHNOLOGIES

This module is basically just a C-level Perl wrapper of F<AsciiTeX> written by Bart Pieters. That project is hosted at L<http://asciitex.sourceforge.net/>. AsciiTeX in turn was a fork of F<eqascii> which was written by Przemek Borys. This module owes a debt of thanks to both authors.

=head1 SOURCE REPOSITORY

L<http://github.com/jberger/Text::AsciiTeX>

=head1 AUTHOR

Joel Berger, E<lt>joel.a.berger@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Joel Berger

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
