package BatchManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 80 }, $class;
}

sub handle_engine {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 80) % 997;
    }
    return $total;
}

print BatchManager->new->handle_engine(80), "\n";
1;
