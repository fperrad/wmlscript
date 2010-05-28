# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

=head1 WMLScript Disassembler

=head2 Synopsis

 parrot-wmlsd file.wmlsc

=head2 Description

B<wmlsd> disassembles binary form of WMLScript file.

=head2 See Also

parrot-wmlsi

=cut

.HLL 'wmlscript'
.loadlib 'io_ops'

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
    pop_eh
    script['filename'] = filename
    script.'dump'()
  L1:
    end
  USAGE:
    printerr "Usage: parrot wmlsd.pbc filename\n"
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
