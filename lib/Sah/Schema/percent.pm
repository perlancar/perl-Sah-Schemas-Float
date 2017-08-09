package Sah::Schema::percent;

# DATE
# VERSION

our $schema = ['float', {
    summary => 'A float',
    description => <<'_',

This type is basically `float`, with `str_as_percent` coerce rule. So the
percent sign is optional, but the number is always interpreted as percent, e.g.
"1" is interpreted as 1% (0.01).

_
    'x.perl.coerce_rules' => [
        'str_allow_percent',
    ],
}, {}];

1;
# ABSTRACT:
