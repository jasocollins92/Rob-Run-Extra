package SecureProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 19 }, $class;
}

sub compute_dispatcher {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 19) % 997;
    }
    return $total;
}

print SecureProcessor->new->compute_dispatcher(19), "\n";
1;
