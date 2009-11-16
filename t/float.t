#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript floating-point & conversion

=head2 Synopsis

    % parrot t/float.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(41)

    test_not_1()
    test_not_2()
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
    test_mod()
    test_idiv()
    test_mul_1()
    test_mul_2()
    test_mul_3()
    test_mul_4()
    test_div_1()
    test_div_2()
    test_div_by_zero_1()
    test_div_by_zero_2()
    test_sub_1()
    test_sub_2()
    test_sub_3()
    test_add_1()
    test_add_2()
    test_eq_1()
    test_eq_2()
    test_eq_3()
    test_eq_4()
    test_eq_5()
    test_eq_6()
    test_eq_7()
    test_eq_8()
    test_eq_9()
    test_cmp_1()
    test_cmp_2()
    test_cmp_3()
    test_cmp_4()
    test_cmp_5()
.end

.sub 'test_not_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = ! 0.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! 0.0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_not_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = ! 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! 3.14", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_tilde'
     $S0 = <<'CODE'
extern function main()
{
    var a = ~ 1.0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "~ 1.0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_uminus'
     $S0 = <<'CODE'
extern function main()
{
    var a = - 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "- 3.14", 'flags'=>"-On")
-3.14
1
OUT
.end

.sub 'test_inc'
     $S0 = <<'CODE'
extern function main()
{
    var a = 12.34;
    a ++;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "++", 'flags'=>"-On")
13.34
1
OUT
.end

.sub 'test_dec'
     $S0 = <<'CODE'
extern function main()
{
    var a = 12.34;
    a --;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "--", 'flags'=>"-On")
11.34
1
OUT
.end

.sub 'test_shift_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 << 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 << 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 >> 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 >> 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 >>> 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 >>> 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 & 2;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 & 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 ^ 3;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 ^ 3", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 | 4;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 | 4", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mod'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 % 5;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 % 5", 'flags'=>"-On")
4
OUT
.end

.sub 'test_idiv'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 div 6;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 div 6", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mul_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 * 1.5;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 * 1.5", 'flags'=>"-On")
4.71
1
OUT
.end

.sub 'test_mul_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 * 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 * 2", 'flags'=>"-On")
6.28
1
OUT
.end

.sub 'test_mul_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 * true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 * true", 'flags'=>"-On")
3.14
1
OUT
.end

.sub 'test_mul_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 * "text";
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 * 'text'", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 / 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 / 2.0", 'flags'=>"-On")
1.57
1
OUT
.end

.sub 'test_div_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 / 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 / 2", 'flags'=>"-On")
1.57
1
OUT
.end

.sub 'test_div_by_zero_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 / 0.0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 / 0.0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div_by_zero_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 / 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 / 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_sub_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 - 1.5;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 - 1.5", 'flags'=>"-On")
1.64
1
OUT
.end

.sub 'test_sub_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 - 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 - 1", 'flags'=>"-On")
2.14
1
OUT
.end

.sub 'test_sub_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 - invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 - invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_add_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 + 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 + 1", 'flags'=>"-On")
4.14
1
OUT
.end

.sub 'test_add_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 + "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 + 'text'", 'flags'=>"-On")
3.14text
2
OUT
.end

.sub 'test_eq_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 == 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 == 3.14", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 == 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 == 2.0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_eq_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 != 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 != 2.0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.0 == 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.0 == 3", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.0 != true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.0 != true", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_6'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 == "3.14";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 == '3.14'", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_7'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 != "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 != 'text'", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_8'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 == invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 == invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_eq_9'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 != invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 != invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 <= 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 <= 2.0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 <= 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 < 2", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 >= true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 >= true", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_cmp_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 > "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 > 'text'", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14 < invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3.14 < invalid", 'flags'=>"-On")
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
