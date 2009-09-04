#! ../../parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 WmlsString

=head2 Synopsis

    % perl t/harness t/pmc/string.t

=head2 Description

Tests C<WmlsString> PMC
(implemented in F<languages/WMLScript/pmc/wmlsstring.pmc>).

=cut

.sub 'main' :main
    loadlib $P0, 'wmls_group'

    .include 'test_more.pir'

    plan(12)

    check_inheritance()
    check_interface()
    check_name()
    check_clone()
    check_get_bool()
    check_embedded_zero()
.end

.sub 'check_inheritance'
    $P0 = new 'WmlsString'
    $I0 = isa $P0, 'String'
    is($I0, 1)
    $I0 = isa $P0, 'WmlsString'
    is($I0, 1)
.end

.sub 'check_interface'
    $P0 = new 'WmlsString'
    $I0 = does $P0, 'scalar'
    is($I0, 1)
    $I0 = does $P0, 'string'
    is($I0, 1)
    $I0 = does $P0, 'no_interface'
    is($I0, 0)
.end

.sub 'check_name'
    $P0 = new 'WmlsString'
    $S0 = typeof $P0
    is($S0, 'WmlsString')
.end

.sub 'check_clone'
    $P0 = new 'WmlsString'
    set $P0, 'str'
    $P1 = clone $P0
    set $P0, 'STR'
    $S0 = typeof $P1
    is($S0, 'WmlsString')
    $S0 = $P1
    is($S0, 'str')
    $S0 = $P0
    is($S0, 'STR')
.end

.sub 'check_get_bool'
    $P0 = new 'WmlsString'
    set $P0, 'str'
    $I0 = istrue $P0
    is($I0, 1)
    set $P0, ''
    $I0 = istrue $P0
    is($I0, 0)
.end

.sub 'check_embedded_zero'
    $P0 = new 'WmlsString'
    set $P0, "embe\0_dd\0_ed\0"
    $I0 = elements $P0
    is($I0, 13)
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

