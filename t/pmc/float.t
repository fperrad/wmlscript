#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsFloat

=head2 Synopsis

    % perl t/harness t/pmc/float.t

=head2 Description

Tests C<WmlsFloat> PMC
(implemented in F<languages/WMLScript/pmc/wmlsfloat.pmc>).

=cut

.sub 'main' :main
    loadlib $P0, 'wmls_group'

    .include 'test_more.pir'

    plan(11)

    check_inheritance()
    check_interface()
    check_name()
    check_clone()
    check_get_bool()
.end

.sub 'check_inheritance'
    $P0 = new 'WmlsFloat'
    $I0 = isa $P0, 'Float'
    is($I0, 1)
    $I0 = isa $P0, 'WmlsFloat'
    is($I0, 1)
.end

.sub 'check_interface'
    $P0 = new 'WmlsFloat'
    $I0 = does $P0, 'scalar'
    is($I0, 1)
    $I0 = does $P0, 'float'
    is($I0, 1)
    $I0 = does $P0, 'no_interface'
    is($I0, 0)
.end

.sub 'check_name'
    $P0 = new 'WmlsFloat'
    $S0 = typeof $P0
    is($S0, 'WmlsFloat')
.end

.sub 'check_clone'
    $P0 = new 'WmlsFloat'
    set $P0, 3.14
    $P1 = clone $P0
    set $P0, 1.57
    $S0 = typeof $P1
    is($S0, 'WmlsFloat')
    $S0 = $P1
    is($S0, 3.14)
    $S0 = $P0
    is($S0, 1.57)
.end

.sub 'check_get_bool'
    $P0 = new 'WmlsFloat'
    set $P0, 3.14
    $I0 = istrue $P0
    is($I0, 1)
    set $P0, 0.0
    $I0 = istrue $P0
    is($I0, 0)
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

