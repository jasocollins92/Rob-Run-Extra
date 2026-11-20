package SecureCache;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 93 }, $class;
}

sub compute_provider {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 93) % 997;
    }
    return $count;
}

print SecureCache->new->compute_provider(93), "\n";
1;
