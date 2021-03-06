# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 WMLScript Float library

=head2 Description

This library contains a set of typical arithmetic floating-point functions that
are frequently used by applications.

See "WMLScript Standard Libraries Specification", section 8 "Float".

=head2 Functions

=cut

.HLL 'wmlscript'
.loadlib 'wmls_group'
.loadlib 'wmls_ops'
.loadlib 'trans_ops'


.sub 'getFloat'
    new $P0, 'Hash'

    .const 'Sub' _float_int = '_float_int'
    $P0[0]  = _float_int
    .const 'Sub' _float_floor = '_float_floor'
    $P0[1]  = _float_floor
    .const 'Sub' _float_ceil = '_float_ceil'
    $P0[2]  = _float_ceil
    .const 'Sub' _float_pow = '_float_pow'
    $P0[3]  = _float_pow
    .const 'Sub' _float_round = '_float_round'
    $P0[4]  = _float_round
    .const 'Sub' _float_sqrt = '_float_sqrt'
    $P0[5]  = _float_sqrt
    .const 'Sub' _float_maxFloat = '_float_maxFloat'
    $P0[6]  = _float_maxFloat
    .const 'Sub' _float_minFloat = '_float_minFloat'
    $P0[7]  = _float_minFloat

    .return ($P0)
.end


=head3 C<int(value)>

=head4 DESCRIPTION

Returns the integer part of the given value. If the value is already an integer,
the result is the value itself.

=head4 PARAMETERS

value = Number

=head4 RETURN VALUE

Integer or invalid.

=cut

.sub '_float_int' :anon
    .param pmc value
    .local pmc res
    $P0 = value
    $I0 = isa value, 'WmlsString'
    unless $I0 goto L1
    $P0 = value.'parseNumber'()
  L1:
    $I0 = isa $P0, 'WmlsInvalid'
    if $I0 goto L2
    $I0 = $P0
    box res, $I0
    goto L3
  L2:
    new res, 'WmlsInvalid'
  L3:
    .return (res)
.end


=head3 C<floor(value)>

=head4 DESCRIPTION

Returns the greatest integer value that is not greater than the given value. If
the value is already an integer, the result is the value itself.

=head4 PARAMETERS

value = Number

=head4 RETURN VALUE

Integer or invalid.

=cut

.sub '_float_floor' :anon
    .param pmc value
    .local pmc res
    $P0 = value
    $I0 = isa value, 'WmlsString'
    unless $I0 goto L1
    $P0 = value.'parseNumber'()
  L1:
    $I0 = isa $P0, 'WmlsInvalid'
    if $I0 goto L2
    $N0 = $P0
    $I0 = floor $N0
    box res, $I0
    goto L3
  L2:
    new res, 'WmlsInvalid'
  L3:
    .return (res)
.end


=head3 C<ceil(value)>

=head4 DESCRIPTION

Returns the smallest integer value that is not less than the given value. If
the value is already an integer, the result is the value itself.

=head4 PARAMETERS

value = Number

=head4 RETURN VALUE

Integer or invalid.

=cut

.sub '_float_ceil' :anon
    .param pmc value
    .local pmc res
    $P0 = value
    $I0 = isa value, 'WmlsString'
    unless $I0 goto L1
    $P0 = value.'parseNumber'()
  L1:
    $I0 = isa $P0, 'WmlsInvalid'
    if $I0 goto L2
    $N0 = $P0
    $I0 = ceil $N0
    box res, $I0
    goto L3
  L2:
    new res, 'WmlsInvalid'
  L3:
    .return (res)
.end


=head3 C<pow(value1, value2)>

=head4 DESCRIPTION

Returns an implementation-dependent approximation to the result of raising
value1 to the power of value2. If value1 is a negative number then value2
must be an integer.

=head4 PARAMETERS

value1 = Number

value2 = Number

=head4 RETURN VALUE

Floating-point or invalid.

=head4 EXCEPTIONS

If value1 == 0 and value2 < 0 then C<invalid> is returned.

If value1 < 0 and value2 is not an integer then C<invalid> is returned.

=cut

.sub '_float_pow' :anon
    .param pmc value1
    .param pmc value2
    .local pmc res
    $P1 = value1
    $I0 = isa value1, 'WmlsString'
    unless $I0 goto L1
    $P1 = value1.'parseNumber'()
  L1:
    $I0 = isa $P1, 'WmlsInvalid'
    if $I0 goto L2
    $N1 = $P1
    $P2 = value2
    $I0 = isa value2, 'WmlsString'
    unless $I0 goto L3
    $P2 = value2.'parseNumber'()
  L3:
    $I0 = isa $P2, 'WmlsInvalid'
    if $I0 goto L2
    $N2 = $P2
    unless $N1 == 0.0 goto L4
    if $N2 < 0.0 goto L2
    box res, 0.0
    goto L5
  L4:
    unless $N1 < 0.0 goto L6
    $I0 = isa $P2, 'WmlsFloat'
    if $I0 goto L2
  L6:
    $N0 = pow $N1, $N2
    box res, $N0
    goto L5
  L2:
    new res, 'WmlsInvalid'
  L5:
    .return (res)
.end


=head3 C<round(value)>

=head4 DESCRIPTION

Returns the number value that is closest to the given value and is equal to a
mathematical integer. If two integer number values are equally close to the
value, the result is the larger number value. If the value is already an
integer, the result is the value itself.

=head4 PARAMETERS

value = Number

=head4 RETURN VALUE

Integer or invalid.

=cut

.sub '_float_round' :anon
    .param pmc value
    .local pmc res
    $P0 = value
    $I0 = isa value, 'WmlsString'
    unless $I0 goto L1
    $P0 = value.'parseNumber'()
  L1:
    $I0 = isa $P0, 'WmlsInvalid'
    if $I0 goto L2
    $N0 = $P0
    $N0 += 0.5
    $I0 = floor $N0
    box res, $I0
    goto L3
  L2:
    new res, 'WmlsInvalid'
  L3:
    .return (res)
.end


=head3 C<sqrt(value)>

=head4 DESCRIPTION

Returns an implementation-dependent approximation to the square root of
the given value.

=head4 PARAMETERS

value = Floating-point

=head4 RETURN VALUE

Floating-point or invalid.

=head4 EXCEPTIONS

If value is a negative number then invalid is returned.

=cut

.sub '_float_sqrt' :anon
    .param pmc value
    .local pmc res
    $P0 = value
    $I0 = isa value, 'WmlsString'
    unless $I0 goto L1
    $P0 = value.'parseNumber'()
  L1:
    $I0 = isa $P0, 'WmlsInvalid'
    if $I0 goto L2
    $N0 = $P0
    if $N0 < 0.0 goto L2
    $N1 = sqrt $N0
    box res, $N1
    goto L3
  L2:
    new res, 'WmlsInvalid'
  L3:
    .return (res)
.end


=head3 C<maxFloat()>

=head4 DESCRIPTION

Returns the maximum floating-point value supported by [IEEE754] single
precision floating-point format.

=head4 RETURN VALUE

Floating-point 3.40282347e+38.

=cut

.sub '_float_maxFloat' :anon
    .local pmc res
    box res, 3.40282347e+38
    .return (res)
.end


=head3 C<minFloat()>

=head4 DESCRIPTION

Returns the smallest nonzero floating-point value supported by [IEEE754]
single precision floating-point format.

=head4 RETURN VALUE

Floating-point. Smaller than or equal to the normalised minimum single
precision floating-point value: 1.17549435e-38.

=cut

.sub '_float_minFloat' :anon
    .local pmc res
    box res, 1.17549435e-38
    .return (res)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
