#! perl
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript literals

=head2 Synopsis

    % parrot t/literals.t

=head2 Description

See "WMLScript Specification", section 6.1.5 "Literals".

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(9)

    test_decimal_integer()
    test_hexadecimal_integer()
    test_octal_integer()
    test_floating_point()
    test_string()
    test_string_with_escape_sequence()
    test_unicode_string()
    test_boolean()
    test_invalid()
.end

.sub 'test_decimal_integer'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0;
    Console.println(a);
    Console.println(typeof a);
    a = -123;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "decimal integer", 'flags'=>"-On")
0
0
-123
0
OUT
.end

.sub 'test_hexadecimal_integer'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0xFE;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "hexadecimal integer", 'flags'=>"-On")
254
0
OUT
.end

.sub 'test_octal_integer'
     $S0 = <<'CODE'
extern function main()
{
    var a = 033;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "octal integer", 'flags'=>"-On")
27
0
OUT
.end

.sub 'test_floating_point'
     $S0 = <<'CODE'
extern function main()
{
    var a = 0.0;
    Console.println(a);
    Console.println(typeof a);
    a = 2.0;
    Console.println(a);
    Console.println(typeof a);
    a = -1.23;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "floating-point", 'flags'=>"-On")
0
1
2
1
-1.23
1
OUT
.end

.sub 'test_string'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Example";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "string", 'flags'=>"-On")
Example
2
OUT
.end

.sub 'test_string_with_escape_sequence'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Quote: \"";
    Console.println(a);
    Console.println(typeof a);
    a = 'Apos: \'';
    Console.println(a);
    Console.println(typeof a);
    a = "\tTab";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "string with escape sequence", 'flags'=>"-On")
Quote: "
2
Apos: '
2
	Tab
2
OUT
.end

.sub 'test_unicode_string'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Fran\u00e7ois";
    Console.println(a);
    Console.println(typeof a);
    a = "20 \u20AC";
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "unicode string", 'flags'=>"-On")
François
2
20 €
2
OUT
.end

.sub 'test_boolean'
     $S0 = <<'CODE'
extern function main()
{
    var a = true;
    Console.println(a);
    Console.println(typeof a);
    a = false;
    Console.println(a);
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "boolean", 'flags'=>"-On")
true
3
false
3
OUT
.end

.sub 'test_invalid'
     $S0 = <<'CODE'
extern function main()
{
    var a = invalid;
    Console.println(String.toString(a));
    Console.println(typeof a);
}
CODE
    wmls_is($S0, <<'OUT', "invalid", 'flags'=>"-On")
invalid
4
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
