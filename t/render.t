use strict;
use warnings;

use Test::More tests => 5;

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

{
  my $text = render('1+1', 3);
  is( $text->[0], "1 +", "Restricted columns");
}

{
  my $text = render('\pi'x80, 0);
  is( $text->[0], 'pi'x80, "Zero column limit for non-breaking");
}

