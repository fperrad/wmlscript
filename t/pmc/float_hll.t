#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsFloat

=head2 Synopsis

    % perl t/harness t/pmc/float_hll.t

=head2 Description

Tests C<WmlsFloat> PMC
(implemented in F<languages/WMLScript/pmc/wmlsfloat.pmc>).

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'

.sub 'main' :main
    .include 'test_more.pir'

    plan(15)

    check_HLL()
    check_HLL_const()
    check_istrue()
    check_typeof()
    check_defined()
    check_box()
.end

.sub 'check_HLL'
    $P0 = new 'WmlsFloat'
    set $P0, 3.14
    $N0 = $P0
    is($N0, 3.14, "check HLL")
    isa_ok($P0, 'WmlsFloat')
.end

.sub 'check_HLL_const'
    .const 'WmlsFloat' K = '3.14'
    $N0 = K
    is($N0, 3.14, "check HLL & .const")
    isa_ok(K, 'WmlsFloat')
.end

.sub 'check_istrue'
    .const 'WmlsFloat' K = '3.14'
    $N0 = K
    is($N0, 3.14, "check istrue")
    $P0 = istrue K
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    .const 'WmlsFloat' K = '3.14'
    $N0 = K
    is($N0, 3.14, "check typeof")
    $P0 = typeof K
    $I0 = $P0
    is($I0, 1)
    isa_ok($P0, 'WmlsInteger')
.end

.sub 'check_defined'
    .const 'WmlsFloat' K = '3.14'
    $N0 = K
    is($N0, 3.14, "check defined")
    $P0 = defined K
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_box'
    $P0 = box 3.14
    $N0 = $P0
    is($N0, 3.14, "check box")
    isa_ok($P0, 'WmlsFloat')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
