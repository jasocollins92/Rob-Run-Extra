package CoreLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 69 }, $class;
}

sub resolve_controller {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 69) % 997;
    }
    return $acc;
}

print CoreLoader->new->resolve_controller(69), "\n";
1;
