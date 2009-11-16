#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 WMLScript invalid & conversion

=head2 Synopsis

    % parrot t/invalid.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(23)

    test_not()
    test_tilde()
    test_uminus()
    test_inc()
    test_dec()
    test_shift_1()
    test_shift_2()
    test_shift_3()
    test_bitwise_1()
    test_bitwise_2()
    test_bitwise_3()
    test_idiv()
    test_mod()
    test_mul()
    test_div()
    test_sub()
    test_add()
    test_eq_1()
    test_eq_2()
    test_cmp_1()
    test_cmp_2()
    test_cmp_3()
    test_cmp_4()
.end

.sub 'test_not'
     $S0 = <<'CODE'
extern function main()
{
    var a = ! invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_tilde'
     $S0 = <<'CODE'
extern function main()
{
    var a = ~ invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "~ invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_uminus'
     $S0 = <<'CODE'
extern function main()
{
    var a = - invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "- invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_inc'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid;
    a ++;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "++", 'flags'=>"-On")
4
OUT
.end

.sub 'test_dec'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid;
    a --;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "--", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid << 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid << 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid >> 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid >> 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid >>> 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid >>> 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid & 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid & 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid ^ 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid ^ 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid | 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid | 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mod'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid % 5;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid % 5", 'flags'=>"-On")
4
OUT
.end

.sub 'test_idiv'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid div 6;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid div 6", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mul'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid * 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid * 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid / 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid / 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_sub'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid - 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid - 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_add'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid + 5;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid + 5", 'flags'=>"-On")
4
OUT
.end

.sub 'test_eq_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid == 1;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid == 1", 'flags'=>"-On")
4
OUT
.end

.sub 'test_eq_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid != 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid != 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid <= 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid <= 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid < 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid < 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid >= 5;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid >= 5", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid > 6;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid > 6", 'flags'=>"-On")
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
