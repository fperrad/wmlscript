#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript boolean & conversion

=head2 Synopsis

    % parrot t/boolean.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(40)

    test_not()
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
    test_div_1()
    test_div_2()
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
    test_cmp_1()
    test_cmp_2()
    test_cmp_3()
    test_cmp_4()
.end

.sub 'test_not'
     $S0 = <<'CODE'
extern function main()
{
    var a = ! false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "! false", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_tilde'
     $S0 = <<'CODE'
extern function main()
{
    var a = ~ false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "~ false", 'flags'=>"-On")
-1
0
OUT
.end

.sub 'test_uminus'
     $S0 = <<'CODE'
extern function main()
{
    var a = - true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "- true", 'flags'=>"-On")
-1
0
OUT
.end

.sub 'test_inc'
     $S0 = <<'CODE'
extern function main()
{
    var a = true;
    a ++;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "++", 'flags'=>"-On")
2
0
OUT
.end

.sub 'test_dec'
     $S0 = <<'CODE'
extern function main()
{
    var a = false;
    a --;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "--", 'flags'=>"-On")
-1
0
OUT
.end

.sub 'test_shift_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true << 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true << 2", 'flags'=>"-On")
4
0
OUT
.end

.sub 'test_shift_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true << true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true << true", 'flags'=>"-On")
2
0
OUT
.end

.sub 'test_shift_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = true >> 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true >> 1", 'flags'=>"-On")
0
0
OUT
.end

.sub 'test_shift_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = true >> "text";
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true >> 'text'", 'flags'=>"-On")
4
OUT
.end

.sub 'test_shift_5'
     $S0 = <<'CODE'
extern function main()
{
    var a =  true >>> 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true >>> 2", 'flags'=>"-On")
0
0
OUT
.end

.sub 'test_shift_6'
     $S0 = <<'CODE'
extern function main()
{
    var a =  true >>> "2";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true >>> '2'", 'flags'=>"-On")
0
0
OUT
.end

.sub 'test_bitwise_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true & 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true & 1", 'flags'=>"-On")
1
0
OUT
.end

.sub 'test_bitwise_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true & 2.0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true & 2.0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = true ^ 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true ^ 2", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_bitwise_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = true ^ invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true ^ invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_bitwise_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = true | 6;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true | 6", 'flags'=>"-On")
7
0
OUT
.end

.sub 'test_idiv'
     $S0 = <<'CODE'
extern function main()
{
    var a = true div 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true div 2", 'flags'=>"-On")
0
0
OUT
.end

.sub 'test_idiv_by_zero'
     $S0 = <<'CODE'
extern function main()
{
    var a = true div 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true div 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mod'
     $S0 = <<'CODE'
extern function main()
{
    var a =  true % 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true % 2", 'flags'=>"-On")
1
0
OUT
.end

.sub 'test_mod_by_zero'
     $S0 = <<'CODE'
extern function main()
{
    var a = true % 0;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true % 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_mul_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true * 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true * 3", 'flags'=>"-On")
3
0
OUT
.end

.sub 'test_mul_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true * 3.14;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true * 3.14", 'flags'=>"-On")
3.14
1
OUT
.end

.sub 'test_mul_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = true * "text";
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true * 'text'", 'flags'=>"-On")
4
OUT
.end

.sub 'test_div_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true / 2;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true / 2", 'flags'=>"-On")
0.5
1
OUT
.end

.sub 'test_div_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true / 2.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true / 2.0", 'flags'=>"-On")
0.5
1
OUT
.end

.sub 'test_sub_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true - 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true - 3", 'flags'=>"-On")
-2
0
OUT
.end

.sub 'test_sub_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true - 1.5;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true - 1.5", 'flags'=>"-On")
-0.5
1
OUT
.end

.sub 'test_sub_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = false - invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "false - invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_add_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true + 3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true + 3", 'flags'=>"-On")
4
0
OUT
.end

.sub 'test_add_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true + "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true + 'text'", 'flags'=>"-On")
truetext
2
OUT
.end

.sub 'test_eq_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true == true;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true == true", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true != false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true != false", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = true == 1;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true == 1", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = false == 0.0;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "false == 0.0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = true == "true";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true == 'true'", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_eq_6'
     $S0 = <<'CODE'
extern function main()
{
    var a = true != invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true != invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_cmp_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = true <= false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true <= false", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = true <= -3;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true < -3", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_cmp_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = true >= "text";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true >= 'text'", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_cmp_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = true <= invalid;
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "true < invalid", 'flags'=>"-On")
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

