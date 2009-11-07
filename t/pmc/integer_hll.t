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

    plan(13)

    check_HLL()
    check_istrue()
    check_typeof()
    check_defined()
    check_box()
.end

.sub 'check_HLL'
    $P0 = new 'WmlsInteger'
    set $P0, 42
    $I0 = $P0
    is($I0, 42, "check HLL")
    isa_ok($P0, 'WmlsInteger')
.end

.sub 'check_istrue'
    $P1 = new 'WmlsInteger'
    set $P1, 42
    $I0 = $P1
    is($I0, 42, "check istrue")
    $P0 = istrue $P1
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    $P1 = new 'WmlsInteger'
    set $P1, 42
    $I0 = $P1
    is($I0, 42, "check typeof")
    $P0 = typeof $P1
    $I0 = $P0
    is($I0, 0)
    isa_ok($P0, 'WmlsInteger')
.end

.sub 'check_defined'
    $P1 = new 'WmlsInteger'
    set $P1, 42
    $I0 = $P1
    is($I0, 42, "check defined")
    $P0 = defined $P1
    $S0 = $P0
    is($S0, 'true')
    isa_ok($P0, 'WmlsBoolean')
.end

.sub 'check_box'
    $P0 = box 42
    $I0 = $P0
    is($I0, 42, "check box")
    isa_ok($P0, 'WmlsInteger')
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

