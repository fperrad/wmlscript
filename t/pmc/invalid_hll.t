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

    plan(10)

    check_HLL()
    check_istrue()
    check_typeof()
    check_defined()
.end

.sub 'check_HLL'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check HLL")
    isa_ok($P0, 'WmlsInvalid')
.end

.sub 'check_istrue'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check istrue")
    $P0 = istrue $P0
    isa_ok($P0, 'WmlsInvalid')
.end

.sub 'check_typeof'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check typeof")
    $P1 = typeof $P0
    $I0 = $P1
    is($I0, 4)
    isa_ok($P1, 'WmlsInteger')
.end

.sub 'check_defined'
    $P0 = new 'WmlsInvalid'
    $S0 = $P0
    is($S0, 'invalid', "check defined")
    $P1 = defined $P0
    $S0 = $P1
    is($S0, 'false')
    isa_ok($P1, 'WmlsBoolean')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

