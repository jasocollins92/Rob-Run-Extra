package SharedSession;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 3 }, $class;
}

sub collect_client {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 3) % 997;
    }
    return $total;
}

print SharedSession->new->collect_client(3), "\n";
1;
