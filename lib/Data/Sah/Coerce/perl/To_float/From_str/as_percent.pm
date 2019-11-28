package Data::Sah::Coerce::perl::To_float::From_str::as_percent;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 4,
        summary => 'Interpret number as percent, percent sign optional',
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
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
