#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.18;
use strict;
use warnings;
use utf8;
use feature 'unicode_strings';

use Test::More tests => 7;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('en_GB');
my $quoted = $locale->quote('abc');
is($quoted, '“abc”', 'Quote en_GB');
$quoted = $locale->quote("z $quoted z");
is($quoted, '“z ‘abc’ z”', 'Quote en_GB');
$quoted = $locale->quote("dd 'z $quoted z dd");
is($quoted, '“dd \'z ‘z “abc” z’ z dd”', 'Quote en_GB');

$locale = Locale::CLDR->new('fr');
$quoted = $locale->quote('abc');
is($quoted, '«abc»', 'Quote fr');
$quoted = $locale->quote("z $quoted z");
is($quoted, "«z «abc» z»", 'Quote fr');
$quoted = $locale->quote("dd 'z $quoted z dd");
is($quoted, "«dd \'z «z «abc» z» z dd»", 'Quote fr');
