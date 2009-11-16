#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript Statements

=head2 Synopsis

    % parrot t/statements.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(3)

    test_for()
    test_for_break()
    test_while()
.end

.sub 'test_for'
     $S0 = <<'CODE'
extern function main()
{
    var sum = 0;
    for (var i = 1; i < 5; i++) {
        Console.println(i);
        sum += i;
    }
    Console.println("Sum: " + sum);
}
CODE
    wmls_is($S0, <<'OUT', "for")
1
2
3
4
Sum: 10
OUT
.end

.sub 'test_for_break'
     $S0 = <<'CODE'
extern function main()
{
    var sum = 0;
    for (var i = 1; i < 10; i++) {
        Console.println(i);
        sum += i;
        if (sum >= 10) break;
    }
    Console.println("Sum: " + sum);
}
CODE
    wmls_is($S0, <<'OUT', "for break")
1
2
3
4
Sum: 10
OUT
.end

.sub 'test_while'
     $S0 = <<'CODE'
extern function main()
{
    var sum = 0;
    var i = 5;
    while (--i) {
        Console.println(i);
        sum += i;
    }
    Console.println("Sum: " + sum);
}
CODE
    wmls_is($S0, <<'OUT', "while", 'flags'=>"-On")
4
3
2
1
Sum: 10
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
