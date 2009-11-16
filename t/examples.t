#! /usr/local/bin/parrot
# Copyright (C) 2009, Parrot Foundation.

=head1 some WMLScript code examples

=head2 Synopsis

    % parrot t/examples.t

=head2 Description

First tests in order to check infrastructure.

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(5)

    test_hello()
    test_another_main()
    test_with_params()
    test_no_optim()
    test_sieve()
.end

.sub 'test_hello'
     $S0 = <<'CODE'
extern function main()
{
    Console.println("Hello World!");
}
CODE
    wmls_is($S0, <<'OUT', "hello world")
Hello World!
OUT
.end

.sub 'test_another_main'
    $S0 = <<'CODE'
extern function hello()
{
    Console.println("Hello World!");
}
CODE
    wmls_is($S0, <<'OUT', "another main", 'entry'=>'hello')
Hello World!
OUT
.end

.sub 'test_with_params'
    $S0 = <<'CODE'
extern function main(arg1, arg2)
{
    Console.println(arg1);
    Console.println(arg2);
}
CODE
    wmls_is($S0, <<'OUT', "with params", 'params'=>"abc def")
abc
def
OUT
.end

.sub 'test_no_optim'
    $S0 = <<'CODE'
extern function main()
{
    Console.println(1 + 2);
}
CODE
    wmls_is($S0, <<'OUT', "no optim", 'flags'=>"-On")
3
OUT
.end

.sub 'test_sieve'
    $S0 = <<'CODE'
/*
 *  Eratosthenes Sieve prime number calculation
 */
extern function sieve ()
{
    var MAX_PRIME = 17;
    var i;
    var count = 0;
    var flag = 0;
    for (i = 0; i < MAX_PRIME; i++) {
        flag |= (1 << i);   // set
    }
    for (i = 0; i < MAX_PRIME; i++) {
        if (flag & (1 << i)) {  // test
            var prime = i + i + 3;
            var k = i + prime;
            while (k < MAX_PRIME) {
                flag &= ~(1 << k);  // clear
                k += prime;
            }
            count++;
            Console.println(" prime " + count + " = " + prime);
        }
    }
    Console.println("");
    Console.println(count + " primes.");
}
CODE
    wmls_is($S0, <<'OUT', "sieve", 'entry'=>'sieve')
 prime 1 = 3
 prime 2 = 5
 prime 3 = 7
 prime 4 = 11
 prime 5 = 13
 prime 6 = 17
 prime 7 = 19
 prime 8 = 23
 prime 9 = 29
 prime 10 = 31

10 primes.
OUT
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
