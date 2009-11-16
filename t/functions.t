#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript functions

=head2 Synopsis

    % parrot t/functions.t

=head2 Description


=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(8)

    test_function_call()
    test_1_arg()
    test_3_args()
    test_no_return()
    test_return()
    test_return_value()
    test_passing_by_value()
    test_recursive_call()
.end

.sub 'test_function_call'
     $S0 = <<'CODE'
function f()
{
    Console.println("in");
}

extern function main()
{
    Console.println("out");
    f();
    Console.println("end");
}
CODE
    wmls_is($S0, <<'OUT', "function call")
out
in
end
OUT
.end

.sub 'test_1_arg'
     $S0 = <<'CODE'
function f(a)
{
    Console.println(a);
}

extern function main()
{
    f(20);
}
CODE
    wmls_is($S0, <<'OUT', "1 arg")
20
OUT
.end

.sub 'test_3_args'
     $S0 = <<'CODE'
function f(a, b, c)
{
    Console.println(a);
    Console.println(b);
    Console.println(c);
}

extern function main()
{
    f(10, 20, 30);
}
CODE
    wmls_is($S0, <<'OUT', "3 args")
10
20
30
OUT
.end

.sub 'test_no_return'
     $S0 = <<'CODE'
function f(a)
{
    Console.println(a);
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret == "");
}
CODE
    wmls_is($S0, <<'OUT', "no return")
text
true
OUT
.end

.sub 'test_return'
     $S0 = <<'CODE'
function f(a)
{
    Console.println(a);
    return;
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret == "");
}
CODE
    wmls_is($S0, <<'OUT', "return")
text
true
OUT
.end

.sub 'test_return_value'
     $S0 = <<'CODE'
function f(a)
{
    Console.println(a);
    return "ok";
}

extern function main()
{
    var ret;
    ret = f("text");
    Console.println(ret);
}
CODE
    wmls_is($S0, <<'OUT', "return value")
text
ok
OUT
.end

.sub 'test_passing_by_value'
     $S0 = <<'CODE'
function f(val)
{
    val += 20;
    Console.println(val);
}

extern function main()
{
    var a = 10;
    Console.println(a);
    f(a);
    Console.println(a);
}
CODE
    wmls_is($S0, <<'OUT', "passing by value")
10
30
10
OUT
.end

.sub 'test_recursive_call'
     $S0 = <<'CODE'
function fact(n)
{
    if (n == 0) {
        return 1;
    }
    else {
        return n * fact(n - 1);
    }
}

extern function main()
{
    Console.println(fact(7));
}
CODE
    wmls_is($S0, <<'OUT', "recursive call")
5040
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
