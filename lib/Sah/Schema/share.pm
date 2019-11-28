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

Due to different interpretations, particularly "1" (some people might expect it
to mean "0.01" or "1%") use of this type is discouraged. Use
<pm:Sah::Schema::percent> instead.

_
    'x.perl.coerce_rules' => [
        'From_str::share',
    ],
}, {}];

1;
# ABSTRACT:
