#! parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsString

=head2 Synopsis

    % perl t/harness t/pmc/string_hll.t

=head2 Description

Tests C<WmlsString> PMC
(implemented in F<languages/WMLScript/pmc/wmlsstring.pmc>).

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'

.sub 'main' :main
    .include 'test_more.pir'

    plan(17)

    check_HLL()
    check_HLL_const()
    check_empty_string()
    check_istrue()
    check_typeof()
    check_defined()
    check_box()
.end

.sub 'check_HLL'
    $P0 = new 'WmlsString'
    set $P0, "simple string"
    $S0 = $P0
    is($S0, "simple string")
    $I0 = isa $P0, 'WmlsString'
    is($I0, 1)
.end

.sub 'check_HLL_const'
    .const 'WmlsString' K = "simple string"
    $S0 = K
    is($S0, "simple string")
    $I0 = isa K, 'WmlsString'
    is($I0, 1)
.end

.sub 'check_empty_string'
    .const 'WmlsString' K = ''
    $S0 = K
    is($S0, '')
    $I0 = isa K, 'WmlsString'
    is($I0, 1)
.end

.sub 'check_istrue'
    .const 'WmlsString' K = "simple string"
    $S0 = K
    is($S0, "simple string")
    $P0 = istrue K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_typeof'
    .const 'WmlsString' K = "simple string"
    $S0 = K
    is($S0, "simple string")
    $P0 = typeof K
    $S0 = $P0
    is($S0, 2)
    $S0 = typeof $P0
    is($S0, 'WmlsInteger')
.end

.sub 'check_defined'
    .const 'WmlsString' K = "simple string"
    $S0 = K
    is($S0, "simple string")
    $P0 = defined K
    $S0 = $P0
    is($S0, 'true')
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_box'
    $P0 = box "simple string"
    $S0 = $P0
    is($S0, "simple string")
    $S0 = typeof $P0
    is($S0, 'WmlsString')
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
