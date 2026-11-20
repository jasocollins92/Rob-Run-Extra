package DynamicAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 88 }, $class;
}

sub handle_session {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 88) % 997;
    }
    return $acc;
}

print DynamicAdapter->new->handle_session(88), "\n";
1;
