#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript integer & conversion

=head2 Synopsis

    % parrot t/number.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(44)

    test_not_1()
    test_not_2()
    test_tilde()
    test_uminus()
    test_inc()
    test_dec()
    test_shift_1()
    test_shift_2()
    test_shift_3()
    test_shift_4()
    test_shift_5()
    test_shift_6()
    test_bitwise_1()
    test_bitwise_2()
    test_bitwise_3()
    test_bitwise_4()
    test_bitwise_5()
    test_idiv()
    test_idiv_by_zero()
    test_mod()
    test_mod_by_zero()
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
    var a = ! 0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! 0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_not_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = ! 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! 1", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_tilde'
     $S0 = <<'CODE'
extern function main()
{
    var a = ~ 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "~ 1", 'flags'=>"-On")
-2
0
OUT
.end

.sub 'test_uminus'
     $S0 = <<'CODE'
extern function main()
{
    var a = - 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "-1", 'flags'=>"-On")
-1
0
OUT
.end

.sub 'test_inc'
     $S0 = <<'CODE'
extern function main()
{
    var a = 12;
    a ++;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "++", 'flags'=>"-On")
13
0
OUT
.end

.sub 'test_dec'
     $S0 = <<'CODE'
extern function main()
{
    var a = 12;
    a --;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "--", 'flags'=>"-On")
11
0
OUT
.end

.sub 'test_shift_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 2 << 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "2 << 2", 'flags'=>"-On")
8
0
OUT
.end

.sub 'test_shift_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 5 << true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "5 << true", 'flags'=>"-On")
10
0
OUT
.end

.sub 'test_shift_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 >> 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 >> 1", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_shift_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 >> "text";
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 >> 'text'", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_5'
     $S0 = <<'CODE'
extern function main()
{
    var a =  12 >>> 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "12 >>> 2", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_shift_6'
     $S0 = <<'CODE'
extern function main()
{
    var a =  15 >>> "2";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "15 >>> '2'", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_bitwise_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 & 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 & 2", 'flags'=>"-On")
2
0
OUT
.end

.sub 'test_bitwise_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 & 2.0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 & 2.0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 ^ 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 ^ 2", 'flags'=>"-On")
4
0
OUT
.end

.sub 'test_bitwise_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 ^ invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 ^ invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 6 | 5;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "6 | 5", 'flags'=>"-On")
7
0
OUT
.end

.sub 'test_idiv'
     $S0 = <<'CODE'
extern function main()
{
    var a = 7 div 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "7 div 2", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_idiv_by_zero'
     $S0 = <<'CODE'
extern function main()
{
    var a = 7 div 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "7 div 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mod'
     $S0 = <<'CODE'
extern function main()
{
    var a =  7 % 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "7 % 2", 'flags'=>"-On")
1
0
OUT
.end

.sub 'test_mod_by_zero'
     $S0 = <<'CODE'
extern function main()
{
    var a = 7 % 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "7 % 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mul_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 * 4;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 * 4", 'flags'=>"-On")
12
0
OUT
.end

.sub 'test_mul_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 2 * 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "2 * 3.14", 'flags'=>"-On")
6.28
1
OUT
.end

.sub 'test_mul_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 * true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 * true", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_mul_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 * "text";
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 * 'text'", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 / 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 / 2", 'flags'=>"-On")
1.5
1
OUT
.end

.sub 'test_div_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 / 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 / 2.0", 'flags'=>"-On")
1.5
1
OUT
.end

.sub 'test_div_by_zero_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 / 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 / 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div_by_zero_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 / 0.0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 / 0.0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_sub_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 - 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 - 1", 'flags'=>"-On")
2
0
OUT
.end

.sub 'test_sub_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 - 1.4;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 - 1.4", 'flags'=>"-On")
1.6
1
OUT
.end

.sub 'test_sub_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 - invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 - invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_add_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 + 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 + 1", 'flags'=>"-On")
4
0
OUT
.end

.sub 'test_add_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 + "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 + 'text'", 'flags'=>"-On")
3text
2
OUT
.end

.sub 'test_eq_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 == 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 == 3", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 == 3.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 == 3.0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 != true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 != true", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 == "3";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 == '3'", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 != invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 != invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 <= 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 <= 2", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 < 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 < 2.0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 10 >= "2";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "10 >= '2'", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 > false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 > false", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_cmp_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 < invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 < invalid", 'flags'=>"-On")
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
