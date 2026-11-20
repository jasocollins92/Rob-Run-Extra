package HybridMonitor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 94 }, $class;
}

sub parse_processor {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 94) % 997;
    }
    return $acc;
}

print HybridMonitor->new->parse_processor(94), "\n";
1;
