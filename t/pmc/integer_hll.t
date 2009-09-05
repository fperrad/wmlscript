#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsInteger

=head2 Synopsis

    % perl t/harness t/pmc/integer_hll.t

=head2 Description

Tests C<WmlsInteger> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinteger.pmc>).

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
    $P0 = new 'WmlsInteger'
    set $P0, 42
    $S0 = $P0
    is($S0, '42', "check HLL")
    $I0 = isa $P0, 'WmlsInteger'
    is($I0, 1)
.end

.sub 'check_HLL_const'
    .const 'WmlsInteger' K = '42'
    $S0 = K
    is($S0, '42', "check HLL & .const")
    $I0 = isa K, 'WmlsInteger'
    is($I0, 1)
.end

.sub 'check_istrue'
    .const 'WmlsInteger' K = '42'
    $S0 = K
    is($S0, '42', "check istrue")
    $P0 = istrue K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    .const 'WmlsInteger' K = '42'
    $S0 = K
    is($S0, '42', "check typeof")
    $P0 = typeof K
    $S0 = $P0
    is($S0, 0)
    $S0 = typeof $P0
    is($S0, 'WmlsInteger')
.end

.sub 'check_defined'
    .const 'WmlsInteger' K = '42'
    $S0 = K
    is($S0, '42', "check defined")
    $P0 = defined K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_box'
    $P0 = box 42
    $S0 = $P0
    is($S0, '42', "check box")
    $S0 = typeof $P0
    is($S0, 'WmlsInteger')
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

