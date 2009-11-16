#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 Logical operators

=head2 Synopsis

    % parrot t/logical.t

=head2 Description

Test opcodes C<SCAND> and C<SCOR>.

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(18)

    test_and_1()
    test_and_2()
    test_and_3()
    test_and_4()
    test_and_5()
    test_and_6()
    test_and_7()
    test_and_8()
    test_and_9()
    test_or_1()
    test_or_2()
    test_or_3()
    test_or_4()
    test_or_5()
    test_or_6()
    test_or_7()
    test_or_8()
    test_or_9()
.end

.sub 'test_and_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 && 2;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 && 2", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_and_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 1 && 0;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "1 && 0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_and_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 1 && invalid;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "1 && invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_and_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 && 2;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 && 2", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_and_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 && 0;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 && 0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_and_6'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 && invalid;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 && invalid", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_and_7'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid && 2;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid && 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_and_8'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid && 0;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid && 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_and_9'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid && invalid;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid && invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_or_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = 3 || 2;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "3 || 2", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_or_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = 1 || 0;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "1 || 0", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_or_3'
     $S0 = <<'CODE'
extern function main()
{
    var a = 1 || invalid;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "1 || invalid", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_or_4'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 || 2;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 || 2", 'flags'=>"-On")
true
3
OUT
.end

.sub 'test_or_5'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 || 0;

    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 || 0", 'flags'=>"-On")
false
3
OUT
.end

.sub 'test_or_6'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0 || invalid;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "0 || invalid", 'flags'=>"-On")
4
OUT
.end

.sub 'test_or_7'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid || 2;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid || 2", 'flags'=>"-On")
4
OUT
.end

.sub 'test_or_8'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid || 0;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid || 0", 'flags'=>"-On")
4
OUT
.end

.sub 'test_or_9'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid || invalid;

    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid || invalid", 'flags'=>"-On")
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
