package LiteProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 13 }, $class;
}

sub decode_engine {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 13) % 997;
    }
    return $total;
}

print LiteProcessor->new->decode_engine(13), "\n";
1;
