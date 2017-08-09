package Data::Sah::Coerce::perl::float::str_share;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 2,
        enable_by_default => 0,
        might_die => 1,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = join(
        " && ",
        "$dt =~ /\\A([0-9]*\\.[0-9]+|[0-9]+(?:\\.[0-9]*)?)(%?)\\z/",
    );

    $res->{expr_coerce} = join(
        '',
        '$2 ? ($1 >= 0 && $1 <= 100 ? $1/100 : die "Percentage must be between 0%-100%") :',
        '$1 >= 0 && $1 <= 1 ? $1 :',
        '$1 > 1 && $1 <= 100 ? $1/100 : ',
        'die "Number must be 0 <= x <= 1, or 1 < x <= 100 (as percent)"',
    );
    $res;
}

1;
# ABSTRACT: Coerce float from share string

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

This coerce rule is to be used by L<Sah::Schema::share> which accepts float in
one of three forms:

 0.4      # a number between 0 and 1
 10       # a number between 1 (exclusive) and 100, interpreted as percent
 10%      # a percentage string, between 0% and 100%
