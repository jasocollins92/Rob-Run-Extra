package LocalFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 35 }, $class;
}

sub run_collector {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 35) % 997;
    }
    return $value;
}

print LocalFactory->new->run_collector(35), "\n";
1;
