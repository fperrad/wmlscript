#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsBoolean

=head2 Synopsis

    % perl t/harness t/pmc/boolean.t

=head2 Description

Tests C<WmlsBoolean> PMC
(implemented in F<languages/WMLScript/pmc/wmlsboolean.pmc>).

=cut


.sub 'main' :main
    loadlib $P0, 'wmls_group'

    .include 'test_more.pir'

    plan(12)

    check_inheritance()
    check_interface()
    check_name()
    check_get_string()
    check_clone()
.end

.sub 'check_inheritance'
    $P0 = new 'WmlsBoolean'
    $I0 = isa $P0, 'Boolean'
    is($I0, 1)
    $I0 = isa $P0, 'WmlsBoolean'
    is($I0, 1)
.end

.sub 'check_interface'
    $P0 = new 'WmlsBoolean'
    $I0 = does $P0, 'scalar'
    is($I0, 1)
    $I0 = does $P0, 'boolean'
    is($I0, 1)
    $I0 = does $P0, 'integer'
    is($I0, 1)
    $I0 = does $P0, 'no_interface'
    is($I0, 0)
.end

.sub 'check_name'
    $P0 = new 'WmlsBoolean'
    $S0 = typeof $P0
    is($S0, 'WmlsBoolean')
.end

.sub 'check_get_string'
    $P0 = new 'WmlsBoolean'
    set $P0, 0
    $S0 = $P0
    is($S0, 'false')
    set $P0, 1
    $S0 = $P0
    is($S0, 'true')
.end

.sub 'check_clone'
    $P0 = new 'WmlsBoolean'
    set $P0, 1
    $P1 = clone $P0
    set $P0, 0
    $S0 = typeof $P1
    is($S0, 'WmlsBoolean')
    $S0 = $P1
    is($S0, 'true')
    $S0 = $P0
    is($S0, 'false')
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
