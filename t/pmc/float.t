#! ../../parrot
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
    ok($I0, "check inheritance")
    $I0 = isa $P0, 'WmlsFloat'
    ok($I0)
.end

.sub 'check_interface'
    $P0 = new 'WmlsFloat'
    $I0 = does $P0, 'scalar'
    ok($I0, "check interface")
    $I0 = does $P0, 'float'
    ok($I0)
    $I0 = does $P0, 'no_interface'
    nok($I0)
.end

.sub 'check_name'
    $P0 = new 'WmlsFloat'
    $S0 = typeof $P0
    is($S0, 'WmlsFloat', "check name")
.end

.sub 'check_clone'
    $P0 = new 'WmlsFloat'
    set $P0, 3.14
    $P1 = clone $P0
    set $P0, 1.57
    isa_ok($P1, 'WmlsFloat', "check clone")
    $N0 = $P1
    is($N0, 3.14)
    $N0 = $P0
    is($N0, 1.57)
.end

.sub 'check_get_bool'
    $P0 = new 'WmlsFloat'
    set $P0, 3.14
    $I0 = istrue $P0
    is($I0, 1, "check get_bool")
    set $P0, 0.0
    $I0 = istrue $P0
    is($I0, 0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

