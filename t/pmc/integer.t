#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsInteger

=head2 Synopsis

    % perl t/harness t/pmc/integer.t

=head2 Description

Tests C<WmlsInteger> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinteger.pmc>).

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
    $P0 = new 'WmlsInteger'
    $I0 = isa $P0, 'Integer'
    ok($I0, "check inheritance")
    $I0 = isa $P0, 'WmlsInteger'
    ok($I0)
.end

.sub 'check_interface'
    $P0 = new 'WmlsInteger'
    $I0 = does $P0, 'scalar'
    ok($I0, "check interface")
    $I0 = does $P0, 'integer'
    ok($I0)
    $I0 = does $P0, 'no_interface'
    nok($I0)
.end

.sub 'check_name'
    $P0 = new 'WmlsInteger'
    $S0 = typeof $P0
    is($S0, 'WmlsInteger', "check name")
.end

.sub 'check_clone'
    $P0 = new 'WmlsInteger'
    set $P0, 10
    $P1 = clone $P0
    set $P0, -5
    isa_ok($P1, 'WmlsInteger', "check clone")
    $I0 = $P1
    is($I0, 10)
    $I0 = $P0
    is($I0, -5)
.end

.sub 'check_get_bool'
    $P0 = new 'WmlsInteger'
    set $P0, 42
    $I0 = istrue $P0
    is($I0, 1, "check get_bool")
    set $P0, 0
    $I0 = istrue $P0
    is($I0, 0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

