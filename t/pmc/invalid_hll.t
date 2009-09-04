#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsInvalid

=head2 Synopsis

    % perl t/harness t/pmc/invalid_hll.t

=head2 Description

Tests C<WmlsInvalid> PMC
(implemented in F<languages/WMLScript/pmc/wmlsinvalid.pmc>).

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
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid')
    $I0 = isa $P0, 'WmlsInvalid'
    is($I0, 1)
.end

.sub 'check_istrue'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid')
    $P0 = istrue $P0
    $S0 = $P0
    is($S0, 'invalid')
    $S0 = typeof $P0
    is($S0, 'WmlsInvalid')
.end

.sub 'check_typeof'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid')
    $P1 = typeof $P0
    $S0 = $P1
    is($S0, 4)
    $S0 = typeof $P1
    is($S0, 'WmlsInteger')
.end

.sub 'check_defined'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid')
    $P1 = defined $P0
    $S0 = $P1
    is($S0, 'false')
    $S0 = typeof $P1
    is($S0, 'WmlsBoolean')
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

