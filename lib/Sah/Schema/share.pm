package Sah::Schema::share;

# DATE
# VERSION

our $schema = ['float', {
    summary => 'A float between 0 and 1',
    description => <<'_',

Accepted in one of these forms:

    0.5      # a normal float between 0 and 1
    10       # a float between 1 (exclusive) and 100, interpreted as percent
    10%      # a percentage string, between 0% and 100%

_
    'x.perl.coerce_rules' => [
        'str_share',
    ],
}, {}];

1;
# ABSTRACT:
