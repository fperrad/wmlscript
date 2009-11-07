#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsBoolean

=head2 Synopsis

    % perl t/harness t/pmc/boolean_hll.t

=head2 Description

Tests C<WmlsBoolean> PMC
(implemented in F<languages/WMLScript/pmc/wmlsboolean.pmc>).

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'

.sub 'main' :main
    .include 'test_more.pir'

    plan(11)

    check_HLL()
    check_istrue()
    check_typeof()
    check_defined()
.end

.sub 'check_HLL'
    $P0 = new 'WmlsBoolean'
    set $P0, 1
    $S0 = $P0
    is($S0, 'true', "check HLL")
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_istrue'
    $P1 = new 'WmlsBoolean'
    set $P1, 1
    $S0 = $P1
    is($S0, 'true', "check istrue")
    $P0 = istrue $P1
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    $P1 = new 'WmlsBoolean'
    set $P1, 1
    $S0 = $P1
    is($S0, 'true', "check typeof")
    $P0 = typeof $P1
    $I0 = $P0
    is($I0, 3)
    isa_ok($P0, 'WmlsInteger')
.end

.sub 'check_defined'
    $P1 = new 'WmlsBoolean'
    set $P1, 1
    $S0 = $P1
    is($S0, 'true', "check defined")
    $P0 = defined $P1
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

