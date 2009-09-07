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
    is($S0, 'invalid', "check HLL")
    $I0 = isa $P0, 'WmlsInvalid'
    ok($I0)
.end

.sub 'check_istrue'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check istrue")
    $P0 = istrue $P0
    $S0 = $P0
    is($S0, 'invalid')
    $S0 = typeof $P0
    is($S0, 'WmlsInvalid')
.end

.sub 'check_typeof'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check typeof")
    $P1 = typeof $P0
    $I0 = $P1
    is($I0, 4)
    $S0 = typeof $P1
    is($S0, 'WmlsInteger')
.end

.sub 'check_defined'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check defined")
    $P1 = defined $P0
    $S0 = $P1
    is($S0, 'false')
    $S0 = typeof $P1
    is($S0, 'WmlsBoolean')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

