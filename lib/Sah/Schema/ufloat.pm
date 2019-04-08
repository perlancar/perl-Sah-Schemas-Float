package Sah::Schema::ufloat;

# DATE
# VERSION

our $schema = [float => {
    summary   => 'Non-negative float',
    min       => 0,
   description => <<'_',

See also `posfloat` for floats that are larger than 0.

_
 }, {}];

1;
# ABSTRACT:
