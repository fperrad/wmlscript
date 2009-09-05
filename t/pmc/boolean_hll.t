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
    $I0 = isa $P0, 'WmlsBoolean'
    is($I0, 1)
.end

.sub 'check_istrue'
    .const 'WmlsBoolean' K = '1'
    $S0 = K
    is($S0, 'true', "check istrue")
    $P0 = istrue K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    .const 'WmlsBoolean' K = '1'
    $S0 = K
    is($S0, 'true', "check typeof")
    $P0 = typeof K
    $S0 = $P0
    is($S0, 3)
    $S0 = typeof $P0
    is($S0, 'WmlsInteger')
.end

.sub 'check_defined'
    .const 'WmlsBoolean' K = '1'
    $S0 = K
    is($S0, 'true', "check defined")
    $P0 = defined K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

