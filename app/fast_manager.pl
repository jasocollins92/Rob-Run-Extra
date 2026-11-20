package StreamFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 9 }, $class;
}

sub render_monitor {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 9) % 997;
    }
    return $result;
}

print StreamFactory->new->render_monitor(9), "\n";
1;
