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
    is($I0, 1)
    $I0 = isa $P0, 'WmlsInteger'
    is($I0, 1)
.end

.sub 'check_interface'
    $P0 = new 'WmlsInteger'
    $I0 = does $P0, 'scalar'
    is($I0, 1)
    $I0 = does $P0, 'integer'
    is($I0, 1)
    $I0 = does $P0, 'no_interface'
    is($I0, 0)
.end

.sub 'check_name'
    $P0 = new 'WmlsInteger'
    $S0 = typeof $P0
    is($S0, 'WmlsInteger')
.end

.sub 'check_clone'
    $P0 = new 'WmlsInteger'
    set $P0, 10
    $P1 = clone $P0
    set $P0, -5
    $S0 = typeof $P1
    is($S0, 'WmlsInteger')
    $S0 = $P1
    is($S0, 10)
    $S0 = $P0
    is($S0, -5)
.end

.sub 'check_get_bool'
    $P0 = new 'WmlsInteger'
    set $P0, 42
    $I0 = istrue $P0
    is($I0, 1)
    set $P0, 0
    $I0 = istrue $P0
    is($I0, 0)
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

