package AtomicMonitor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 72 }, $class;
}

sub render_session {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 72) % 997;
    }
    return $value;
}

print AtomicMonitor->new->render_session(72), "\n";
1;
