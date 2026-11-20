package SimpleCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 39 }, $class;
}

sub encode_processor {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 39) % 997;
    }
    return $acc;
}

print SimpleCache->new->encode_processor(39), "\n";
1;
