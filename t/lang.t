#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript Lang library

=head2 Synopsis

    % parrot t/lang.t

=head2 Description

Tests WMLScript Lang Library
(implemented in F<wmlscript/library/wmlslang.pir>).

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(25)

    test_abs_1()
    test_abs_2()
    test_min_1()
    test_min_2()
    test_max_1()
    test_max_2()
    test_parseInt_1()
    test_parseInt_2()
    test_parseFloat_1()
    test_parseFloat_2()
    test_isInt_1()
    test_isInt_2()
    test_isFloat_1()
    test_isFloat_2()
    test_maxInt()
    test_minInt()
    test_float()
    test_exit_1()
    test_exit_2()
    test_exit_3()
    test_abort()
    test_random_1()
    test_random_2()
    test_seed()
    test_characterSet()
.end

.sub 'test_abs_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = -3;
    var b = Lang.abs(a);

    Console.println(b);
    Console.println(typeof b);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.abs")
3
0
OUT
.end

.sub 'test_abs_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.abs(-3.14);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.abs("text");
    Console.println(typeof a);

    a = Lang.abs(true);
    Console.println(typeof a);

    a = Lang.abs(invalid);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.abs")
3.14
1
4
4
4
OUT
.end

.sub 'test_min_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = -3;
    var b = Lang.abs(a);

    var c = Lang.min(a,b); // c = -3
    Console.println(c);
    Console.println(typeof c);

    var d = Lang.min(45, 76.3); // d = 45 (integer)
    Console.println(d);
    Console.println(typeof d);

    var e = Lang.min(45, 45.0); // e = 45 (integer)
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.min")
-3
0
45
0
45
0
OUT
.end

.sub 'test_min_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.min(3, invalid);
    Console.println(typeof a);

    var b = Lang.min(true, 12);
    Console.println(b);
    Console.println(typeof b);

    var c = Lang.min(1, "12");
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.min")
4
true
3
1
0
OUT
.end

.sub 'test_max_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = -3;
    var b = Lang.abs(a);

    var c = Lang.max(a,b); // c = 3
    Console.println(c);
    Console.println(typeof c);

    var d = Lang.max(45.5, 76); // d = 76 (integer)
    Console.println(d);
    Console.println(typeof d);

    var e = Lang.max(45.0, 45); // e = 45.0 (float)
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.max")
3
0
76
0
45
1
OUT
.end

.sub 'test_max_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.max(3, invalid);
    Console.println(typeof a);

    var b = Lang.max(true, 12);
    Console.println(b);
    Console.println(typeof b);

    var c = Lang.max(1, "12");
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.max")
4
12
0
12
2
OUT
.end

.sub 'test_parseInt_1'
     $S0 = <<'CODE'
extern function main()
{
    var i = Lang.parseInt("1234");
    Console.println(i);
    Console.println(typeof i);

    var j = Lang.parseInt(" 100 m/s");
    Console.println(j);
    Console.println(typeof j);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.parseInt")
1234
0
100
0
OUT
.end

.sub 'test_parseInt_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.parseInt(12);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseInt(3.14);
    Console.println(typeof a);

    a = Lang.parseInt(true);
    Console.println(typeof a);

    a = Lang.parseInt(invalid);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.parseInt")
12
0
4
4
4
OUT
.end

.sub 'test_parseFloat_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.parseFloat("123.7");
    Console.println(a);
    Console.println(typeof a);

    var b = Lang.parseFloat("  +7.34e2 Hz");
    Console.println(b);
    Console.println(typeof b);

    var c = Lang.parseFloat(" 70e-2 F");
    Console.println(c);
    Console.println(typeof c);

    var d = Lang.parseFloat("-.1 C");
    Console.println(d);
    Console.println(typeof d);

    var e = Lang.parseFloat(" 100 ");
    Console.println(e);
    Console.println(typeof e);

    var f = Lang.parseFloat("Number: 5.5");
    Console.println(typeof f);

    var g = Lang.parseFloat("7.3e meters");
    Console.println(typeof g);

    var h = Lang.parseFloat("7.3e- ms");
    Console.println(typeof h);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.parseFloat")
123.7
1
734
1
0.7
1
-0.1
1
100
1
4
4
4
OUT
.end

.sub 'test_parseFloat_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.parseFloat(12);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseFloat(3.14);
    Console.println(a);
    Console.println(typeof a);

    a = Lang.parseFloat(true);
    Console.println(typeof a);

    a = Lang.parseFloat(invalid);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.parseFloat")
12
1
3.14
1
4
4
OUT
.end

.sub 'test_isInt_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.isInt(" -123");
    Console.println(a);

    var b = Lang.isInt(" 123.33");  // true ???
    Console.println(b);

    var c = Lang.isInt("string");
    Console.println(c);

    var d = Lang.isInt("#123");
    Console.println(d);

    var e = Lang.isInt(invalid);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.isInt")
true
false
false
false
4
OUT
.end

.sub 'test_isInt_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.isInt(12);
    Console.println(a);

    a = Lang.isInt(3.14);
    Console.println(a);

    a = Lang.isInt(true);
    Console.println(a);

    a = Lang.isInt(invalid);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.isInt")
true
false
false
4
OUT
.end

.sub 'test_isFloat_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.isFloat(" -123");
    Console.println(a);

    var b = Lang.isFloat(" 123.33");
    Console.println(b);

    var c = Lang.isFloat("string");
    Console.println(c);

    var d = Lang.isFloat("#123.33");
    Console.println(d);

    var e = Lang.isInt(invalid);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.isFloat")
true
true
false
false
4
OUT
.end

.sub 'test_isFloat_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.isFloat(12);
    Console.println(a);

    a = Lang.isFloat(3.14);
    Console.println(a);

    a = Lang.isFloat(true);
    Console.println(a);

    a = Lang.isFloat(invalid);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.isFloat")
true
true
false
4
OUT
.end

.sub 'test_maxInt'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.maxInt();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.maxInt")
2147483647
0
OUT
.end

.sub 'test_minInt'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.minInt();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.minInt")
-2147483648
0
OUT
.end

.sub 'test_float'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.float();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.float")
true
3
OUT
.end

.sub 'test_exit_1'
     $S0 = <<'CODE'
extern function main()
{
    Console.println("exit");
    Lang.exit(0);
    Console.println("ko");
}
CODE
    wmls_is($S0, <<'OUT', "Lang.exit(0)")
exit

OUT
.end

.sub 'test_exit_2'
     $S0 = <<'CODE'
extern function main()
{
    Console.println("exit");
    Lang.exit("1");
    Console.println("ko");
}
CODE
    wmls_is($S0, <<'OUT', "Lang.exit('1')")
exit

OUT
.end

.sub 'test_exit_3'
     $S0 = <<'CODE'
extern function main()
{
    Console.println("exit");
    Lang.exit(invalid);
    Console.println("ko");
}
CODE
    wmls_is($S0, <<'OUT', "Lang.exit(invalid)")
exit

OUT
.end

.sub 'test_abort'
     $S0 = <<'CODE'
extern function main()
{
    Lang.abort("abort");
    Console.println("ko");
}
CODE
    wmls_is($S0, <<'OUT', "Lang.abort")
abort
OUT
.end

.sub 'test_random_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.random(10);
    Console.println(a);
}
CODE
    wmls_like($S0, "^\\d\\n$", "Lang.random")
.end

.sub 'test_random_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.random("invalid");
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.random")
4
OUT
.end

.sub 'test_seed'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.seed(3.14);
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.seed")

2
OUT
.end

.sub 'test_characterSet'
     $S0 = <<'CODE'
extern function main()
{
    var a = Lang.characterSet();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Lang.characterSet")
4
0
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
