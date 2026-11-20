package FastRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 79 }, $class;
}

sub fetch_registry {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 79) % 997;
    }
    return $total;
}

print FastRegistry->new->fetch_registry(79), "\n";
1;
