#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript Float library

=head2 Synopsis

    % parrot t/libfloat.t

=head2 Description

Tests WMLScript Float Library
(implemented in F<wmlscript/library/wmlsfloat.pir>).

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(8)

    test_int()
    test_floor()
    test_ceil()
    test_pow()
    test_round()
    test_sqrt()
    test_maxFloat()
    test_minFloat()
.end

.sub 'test_int'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14;
    var b = Float.int(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.int(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "Float.int")
3
0
-2
0
OUT
.end

.sub 'test_floor'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14;
    var b = Float.floor(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.floor(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "Float.floor")
3
0
-3
0
OUT
.end

.sub 'test_ceil'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3.14;
    var b = Float.ceil(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.ceil(-2.8);
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "Float.ceil")
4
0
-2
0
OUT
.end

.sub 'test_pow'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3;
    var b = Float.pow(a,2);
    Console.println(b);
    Console.println(typeof b);
}
CODE
    wmls_is($S0, <<'OUT', "Float.pow")
9
1
OUT
.end

.sub 'test_round'
     $S0 = <<'CODE'
extern function main()
{
    var a = Float.round(3.5);
    Console.println(a);
    Console.println(typeof a);

    var b = Float.round(-3.5);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.round(0.5);
    Console.println(c);
    Console.println(typeof c);

    var d = Float.round(-0.5);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "Float.round")
4
0
-3
0
1
0
0
0
OUT
.end

.sub 'test_sqrt'
     $S0 = <<'CODE'
extern function main()
{
    var a = 4;
    var b = Float.sqrt(a);
    Console.println(b);
    Console.println(typeof b);

    var c = Float.sqrt(5);
    Console.println(c);
    Console.println(typeof c);

    var d = Float.sqrt(-1);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "Float.sqrt")
2
1
2.23607
1
4
OUT
.end

.sub 'test_maxFloat'
     $S0 = <<'CODE'
extern function main()
{
    var a = Float.maxFloat();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Float.maxFloat")
3.40282e+38
1
OUT
.end

.sub 'test_minFloat'
     $S0 = <<'CODE'
extern function main()
{
    var a = Float.minFloat();
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "Float.minFloat")
1.17549e-38
1
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
