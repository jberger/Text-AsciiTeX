use strict;
use warnings;

use Test::More tests => 1;

use Text::AsciiTeX;

my $text = render('\frac{1}{e}');

is_deeply($text, [qw/ 1 - e /], "Renders 1/e");

