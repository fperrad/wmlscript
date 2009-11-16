#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript Pragmas

=head2 Synopsis

    % parrot t/pragmas.t

=head2 Description

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(5)

    test_hello()
    test_use_url()
    test_unable_to_load()
    test_verification_failed()
    test_external_function_not_found()
.end

.sub 'test_hello'
     $S0 = <<'CODE'
extern function hello()
{
    Console.println("Hello World!");
}

extern function main()
{
    hello();
}
CODE
    wmls_is($S0, <<'OUT', "hello")
Hello World!
OUT
.end

.sub 'test_use_url'
     $S0 = <<'CODE'
use url OtherScript "test_1.wmlsc";

extern function main()
{
    OtherScript#hello();
}
CODE
    wmls_is($S0, <<'OUT', "use url")
Hello World!
OUT
.end

.sub 'test_unable_to_load'
     $S0 = <<'CODE'
use url OtherScript "test_x.wmlsc";

extern function main()
{
    OtherScript#hello();
}
CODE
    wmls_like($S0, "unable to load", "unable to load")
.end

.sub 'test_verification_failed'
     $S0 = <<'CODE'
use url OtherScript "test_1.wmls";

extern function main()
{
    OtherScript#hello();
}
CODE
    wmls_like($S0, "verification failed", "verification failed")
.end

.sub 'test_external_function_not_found'
     $S0 = <<'CODE'
use url OtherScript "test_1.wmlsc";

extern function main()
{
    OtherScript#hello2();
}
CODE
    wmls_like($S0, "external function '\\w+' not found", "external function not found")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
