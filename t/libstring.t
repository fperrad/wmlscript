#! /usr/local/bin/parrot
# Copyright (C) 2006-2009, Parrot Foundation.

=head1 WMLScript String library

=head2 Synopsis

    % parrot t/libstring.t

=head2 Description

Tests WMLScript String Library
(implemented in F<wmlscript/library/wmlsstring.pir>).

=cut

.sub 'main' :main
    load_bytecode 't/helpers.pir'

    .include 'test_more.pir'

    plan(24)

    test_length_1()
    test_length_2()
    test_isEmpty_1()
    test_isEmpty_2()
    test_charAt_1()
    test_charAt_2()
    test_charAt_3()
    test_subString_1()
    test_subString_2()
    test_find()
    test_replace_1()
    test_replace_2()
    test_elements_1()
    test_elements_2()
    test_elementAt()
    test_removeAt()
    test_replaceAt()
    test_insertAt()
    test_squeeze()
    test_trim()
    test_compare()
    test_toString_1()
    test_toString_2()
    test_format()
.end

.sub 'test_length_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "ABC";
    var b = String.length(a);
    Console.println(b);
    Console.println(typeof b);

    var c = String.length("");
    Console.println(c);
    Console.println(typeof c);

    var d = String.length(342);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.length")
3
0
0
0
3
0
OUT
.end

.sub 'test_length_2'
     $S0 = <<'CODE'
extern function main()
{
    var b = String.length(3.14);
    Console.println(b);
    Console.println(typeof b);

    var c = String.length(false);
    Console.println(c);
    Console.println(typeof c);

    var d = String.length(invalid);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.length")
4
0
5
0
4
OUT
.end

.sub 'test_isEmpty_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello";
    var b = "";
    var c = String.isEmpty(a);
    Console.println(c);
    Console.println(typeof c);

    var d = String.isEmpty(b);
    Console.println(d);
    Console.println(typeof d);

    var e = String.isEmpty(true);
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.isEmpty")
false
3
true
3
false
3
OUT
.end

.sub 'test_isEmpty_2'
     $S0 = <<'CODE'
extern function main()
{
    var b = String.isEmpty(0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.isEmpty(3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.isEmpty(invalid);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.isEmpty")
false
3
false
3
4
OUT
.end

.sub 'test_charAt_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "My name is Joe";
    var b = String.charAt(a, 0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(a, 100);
    Console.println(c);
    Console.println(typeof c);

    var d = String.charAt(34, 0);
    Console.println(d);
    Console.println(typeof d);

    var e = String.charAt(a, "first");
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.charAt")
M
2

2
3
2
4
OUT
.end

.sub 'test_charAt_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = "string";
    var b = String.charAt(a, -2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(a, 3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.charAt(a, true);
    Console.println(typeof d);

    var e = String.charAt(a, invalid);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.charAt")

2
i
2
4
4
OUT
.end

.sub 'test_charAt_3'
     $S0 = <<'CODE'
extern function main()
{
    var b = String.charAt(true, 0);
    Console.println(b);
    Console.println(typeof b);

    var c = String.charAt(3.14, 1);
    Console.println(c);
    Console.println(typeof c);

    var f = String.charAt(invalid, 1);
    Console.println(typeof f);
}
CODE
    wmls_is($S0, <<'OUT', "String.charAt")
t
2
.
2
4
OUT
.end

.sub 'test_subString_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "ABCD";
    var b = String.subString(a, 1, 2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.subString(a, 2, 5);
    Console.println(c);
    Console.println(typeof c);

    var d = String.subString(1234, 0, 2);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.subString")
BC
2
CD
2
12
2
OUT
.end

.sub 'test_subString_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = "ABCD";
    var b = String.subString(a, -1, 2);
    Console.println(b);
    Console.println(typeof b);

    var c = String.subString(a, 10, 2);
    Console.println(c);
    Console.println(typeof c);

    var d = String.subString(a, 0, 0);
    Console.println(d);
    Console.println(typeof d);

    var e = String.subString(a, 0, -2);
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.subString")
AB
2

2

2

2
OUT
.end

.sub 'test_find'
     $S0 = <<'CODE'
extern function main()
{
    var a = "abcde";
    var b = String.find(a, "cd");
    Console.println(b);
    Console.println(typeof b);

    var c = String.find(34.2, "de");
    Console.println(c);
    Console.println(typeof c);

    var d = String.find(a, "qz");
    Console.println(d);
    Console.println(typeof d);

    var e = String.find(34, "3");
    Console.println(e);
    Console.println(typeof e);

    var f = String.find(a, "");
    Console.println(typeof f);
}
CODE
    wmls_is($S0, <<'OUT', "String.find")
2
0
-1
0
-1
0
0
0
4
OUT
.end

.sub 'test_replace_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello Joe. What is up Joe?";
    var newName = "Don";
    var oldName = "Joe";
    var c = String.replace(a, oldName, newName);
    Console.println(c);
    Console.println(typeof c);

    var d = String.replace(a, newName, oldName);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.replace")
Hello Don. What is up Don?
2
Hello Joe. What is up Joe?
2
OUT
.end

.sub 'test_replace_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello Joe. What is up Joe?";
    var newName = "Don";
    var c = String.replace(a, "", newName);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "String.replace")
4
OUT
.end

.sub 'test_elements_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elements(a, " ");
    Console.println(b);
    Console.println(typeof b);

    var c = String.elements(a, ";");
    Console.println(c);
    Console.println(typeof c);

    var d = String.elements("", ";");
    Console.println(d);
    Console.println(typeof d);

    var e = String.elements("a", ";");
    Console.println(e);
    Console.println(typeof e);

    var f = String.elements(";", ";");
    Console.println(f);
    Console.println(typeof f);

    var g = String.elements(";;,;", ";,");
    Console.println(g);
    Console.println(typeof g);
}
CODE
    wmls_is($S0, <<'OUT', "String.elements")
6
0
3
0
1
0
1
0
2
0
4
0
OUT
.end

.sub 'test_elements_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elements(a, "");
    Console.println(typeof b);
}
CODE
    wmls_is($S0, <<'OUT', "String.elements")
4
OUT
.end

.sub 'test_elementAt'
     $S0 = <<'CODE'
extern function main()
{
    var a = "My name is Joe; Age 50;";
    var b = String.elementAt(a, 0, " ");
    Console.println(b);
    Console.println(typeof b);

    var c = String.elementAt(a, 14, ";");
    Console.println(c);
    Console.println(typeof c);

    var d = String.elementAt(a, 1, ";");
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.elementAt")
My
2

2
 Age 50
2
OUT
.end

.sub 'test_removeAt'
     $S0 = <<'CODE'
extern function main()
{
    var a = "A A; B C D";
    var s = " ";
    var b = String.removeAt(a, 1, s);
    Console.println(b);
    Console.println(typeof b);

    var c = String.removeAt(a, 0, ";");
    Console.println(c);
    Console.println(typeof c);

    var d = String.removeAt(a, 14, ";");
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.removeAt")
A B C D
2
 B C D
2
A A
2
OUT
.end

.sub 'test_replaceAt'
     $S0 = <<'CODE'
extern function main()
{
    var a = "B C; E";
    var s = " ";
    var b = String.replaceAt(a, "A", 0, s);
    Console.println(b);
    Console.println(typeof b);

    var c = String.replaceAt(a, "F", 5, ";");
    Console.println(c);
    Console.println(typeof c);
}
CODE
    wmls_is($S0, <<'OUT', "String.replaceAt")
A C; E
2
B C;F
2
OUT
.end

.sub 'test_insertAt'
     $S0 = <<'CODE'
extern function main()
{
    var a = "B C; E";
    var s = " ";
    var b = String.insertAt(a, "A", 0, s);
    Console.println(b);
    Console.println(typeof b);

    var c = String.insertAt(a, "X", 3, s);
    Console.println(c);
    Console.println(typeof c);

    var d = String.insertAt(a, "D", 1, ";");
    Console.println(d);
    Console.println(typeof d);

    var e = String.insertAt(a, "F", 5, ";");
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.insertAt")
A B C; E
2
B C; E X
2
B C;D; E
2
B C; E;F
2
OUT
.end

.sub 'test_squeeze'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello";
    var b = " Bye   Jon . \r\n See you!  ";

    var c = String.squeeze(a);
    Console.println(c);
    Console.println(typeof c);

    var d = String.squeeze(b);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.squeeze")
Hello
2
 Bye Jon . See you! 
2
OUT
.end

.sub 'test_trim'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello";
    var b = " Bye   Jon .  See you!  ";

    var c = String.trim(a);
    Console.println(c);
    Console.println(typeof c);

    var d = String.trim(b);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.trim")
Hello
2
Bye   Jon .  See you!
2
OUT
.end

.sub 'test_compare'
     $S0 = <<'CODE'
extern function main()
{
    var a = "Hello";
    var b = "Hello";
    var c = String.compare(a, b);
    Console.println(c);
    Console.println(typeof c);

    var d = String.compare("Bye", "Jon");
    Console.println(d);
    Console.println(typeof d);

    var e = String.compare("Jon", "Bye");
    Console.println(e);
    Console.println(typeof e);
}
CODE
    wmls_is($S0, <<'OUT', "String.compare")
0
0
-1
0
1
0
OUT
.end

.sub 'test_toString_1'
     $S0 = <<'CODE'
extern function main()
{
    var a = String.toString(12);
    Console.println(a);
    Console.println(typeof a);

    var b = String.toString(true);
    Console.println(b);
    Console.println(typeof b);
}
CODE
    wmls_is($S0, <<'OUT', "String.toString")
12
2
true
2
OUT
.end

.sub 'test_toString_2'
     $S0 = <<'CODE'
extern function main()
{
    var a = String.toString("str");
    Console.println(a);
    Console.println(typeof a);

    var b = String.toString("");
    Console.println(b);
    Console.println(typeof b);

    var c = String.toString(3.14);
    Console.println(c);
    Console.println(typeof c);

    var d = String.toString(invalid);
    Console.println(d);
    Console.println(typeof d);
}
CODE
    wmls_is($S0, <<'OUT', "String.toString")
str
2

2
3.14
2
invalid
2
OUT
.end

.sub 'test_format'
     $S0 = <<'CODE'
extern function main()
{
    var a = 45;
    var b = -45;
    var c = "now";
    var d = 1.2345678;
    var e = String.format("e: %6d", a);
    Console.println(e);
    Console.println(typeof e);

    var f = String.format("%6d", b);
    Console.println(f);
    Console.println(typeof f);

    var g = String.format("%6.4d", a); // g = "  0045"
//    Console.println(g);
//    Console.println(typeof g);

    var h = String.format("%6.4d", b); // h = " -0045"
//    Console.println(h);
//    Console.println(typeof h);

    var i = String.format("Do it %s", c);
    Console.println(i);
    Console.println(typeof i);

    var j = String.format("%3f", d); // j = "1.2345678"
//    Console.println(j);
//    Console.println(typeof j);

    var k = String.format("%10.2f%%", d);
    Console.println(k);
    Console.println(typeof k);

//    var l = String.format("%3f %2f.", d); // l = "1.234568 ."
//    Console.println(l);
//    Console.println(typeof l);

    var m = String.format("%.0d", 0); // m = ""
//    Console.println(m);
//    Console.println(typeof m);

    var n = String.format("%7d", "Int"); // n = invalid
//    Console.println(n);
//    Console.println(typeof n);

    var o = String.format("%s", true); // o = "true"
    Console.println(o);
    Console.println(typeof o);
}
CODE
    wmls_is($S0, <<'OUT', "String.format", 'flags'=>"-On")
e:     45
2
   -45
2
Do it now
2
      1.23%
2
true
2
OUT
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
