#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsInvalid

=head2 Synopsis

    % perl t/harness t/pmc/invalid.t

=head2 Description

Tests C<WmlsInvalid> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinvalid.pmc>).

=cut

.sub 'main' :main
    loadlib $P0, 'wmls_group'

    .include 'test_more.pir'

    plan(8)

    check_inheritance()
    check_interface()
    check_name()
    check_get_string()
    check_clone()
.end

.sub 'check_inheritance'
    $P0 = new 'WmlsInvalid'
    $I0 = isa $P0, 'Undef'
    ok($I0, "check inheritance")
    $I0 = isa $P0, 'WmlsInvalid'
    ok($I0)
.end

.sub 'check_interface'
    $P0 = new 'WmlsInvalid'
    $I0 = does $P0, 'scalar'
    ok($I0, "check interface")
    $I0 = does $P0, 'no_interface'
    nok($I0)
.end

.sub 'check_name'
    $P0 = new 'WmlsInvalid'
    $S0 = typeof $P0
    is($S0, 'WmlsInvalid', "check name")
.end

.sub 'check_get_string'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check get_string")
.end

.sub 'check_clone'
    $P0 = new 'WmlsInvalid'
    $P1 = clone $P0
    $S0 = typeof $P1
    is($S0, 'WmlsInvalid', "check clone")
    $S0 = $P1
    is($S0, 'invalid')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

