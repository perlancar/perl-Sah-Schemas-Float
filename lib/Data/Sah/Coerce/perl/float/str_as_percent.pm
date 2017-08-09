package Data::Sah::Coerce::perl::float::str_as_percent;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 2,
        enable_by_default => 0,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = join(
        " && ",
        "$dt =~ /\\A([+-]?(?:[0-9]*\\.[0-9]+|[0-9]+(?:\\.[0-9]*)?))(?:\\s*%)?\\z/",
    );

    $res->{expr_coerce} = join(
        '',
        '$1/100',
    );
    $res;
}

1;
# ABSTRACT: Interpret number as percent, percent sign optional

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION
