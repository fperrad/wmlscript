#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript expressions

=head2 Synopsis

    % parrot t/expr.t

=head2 Description


=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(2)

    test_assign()
    test_incr()
.end

.sub 'test_assign'
     $S0 = <<'CODE'
extern function main()
{
    var a = "abc";
    var b = a;
    b = "def";
    Console.println(a);
    Console.println(b);
}
CODE
    wmls_is($S0, <<'OUT', "assign", 'flags'=>"-On")
abc
def
OUT
.end

.sub 'test_incr'
     $S0 = <<'CODE'
extern function main()
{
    var a = 10;
    var b = a;
    b ++;
    Console.println(a);
    Console.println(b);
}
CODE
    wmls_is($S0, <<'OUT', "incr", 'flags'=>"-On")
10
11
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
