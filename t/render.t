use strict;
use warnings;

use Test::More tests => 3;

use Text::AsciiTeX;

{
  my $text = render('\frac{1}{e}');
  is_deeply($text, [qw/ 1 - e /], "Renders 1/e");
}

{
  my $warn = 0;
  local $SIG{__WARN__} = sub{ $warn++ };
  render('\frac{1}{e');
  ok( $warn, "Warnings issued on incomplete LaTeX formula");
}

{
  my $text = render('\exp');
  is( $text->[0], 'exp', "escaping function works as desired");
}
