# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 WMLScript bytecode to Parrot PIR Translator

=head2 Synopsis

 parrot wmls2pir.pir file.wmlsc

=head2 Description

B<wmls2pir> translates a WMLScript bytecode file to Parrot PIR.

=head2 See Also

wmlsd, wmls2pbc, wmlsi

=cut

.HLL 'wmlscript'

.sub 'main' :main
    .param pmc argv
    load_language 'wmlscript'
    .local int argc
    .local string progname
    .local string filename
    .local string content
    argc = elements argv
    if argc != 2 goto USAGE
    progname = shift argv
    filename = shift argv
    content = load_script(filename)
    unless content goto L1
    .local pmc loader
    .local pmc script
    new loader, 'WmlsBytecode'
    push_eh _handler
    script = loader.'load'(content)
    script['filename'] = filename
    .local string gen_pir
    gen_pir = script.'translate'()
    save_pir(gen_pir, filename)
    pop_eh
  L1:
    end
  USAGE:
    .local pmc stderr
    stderr = getstderr
    print stderr, "Usage: parrot wmls2pir.pir filename\n"
    exit -1
  _handler:
    .local pmc e
    .local string msg
    .get_results (e)
    msg = e
    say msg
    end
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
