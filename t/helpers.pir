# Copyright (C) 2009, Parrot Foundation.

.sub 'wmls_is'
    .param string source
    .param string expected
    .param string desc      :optional
    .param int has_desc     :opt_flag
    .param string flags     :named('flags')  :optional
    .param int has_flags    :opt_flag
    .param string entry     :named('entry')  :optional
    .param int has_entry    :opt_flag
    .param string params    :named('params') :optional
    .param int has_params   :opt_flag
    .local pmc tb
    tb = new [ 'Test'; 'Builder' ]
    .local string basename
    $I0 = tb.'results'()
    inc $I0
    $S0 = $I0
    basename = 'test_' . $S0
    if has_entry goto L1
    entry = 'main'
  L1:
    $S0 = basename . '.wmls'
    spew($S0, source)
    .local string cmd
    cmd = "wmlsc "
    unless has_flags goto L2
    cmd .= flags
  L2:
    cmd .= " "
    cmd .= basename
    cmd .= ".wmls"
    $I0 = spawnw cmd
    cmd = "parrot wmlsi.pbc "
    cmd .= basename
    cmd .= ".wmlsc "
    cmd .= entry
    unless has_params goto L3
    cmd .= " "
    cmd .= params
  L3:
    $P0 = new 'FileHandle'
    $P0.'open'(cmd, 'rp')
    $S0 = $P0.'readall'()
    $P0.'close'()
    is($S0, expected, desc)
.end

.sub 'wmls_like'
    .param string source
    .param string pattern
    .param string desc      :optional
    .param int has_desc     :opt_flag
    .param string flags     :named('flags')  :optional
    .param int has_flags    :opt_flag
    .param string entry     :named('entry')  :optional
    .param int has_entry    :opt_flag
    .param string params    :named('params') :optional
    .param int has_params   :opt_flag
    .local pmc tb
    tb = new [ 'Test'; 'Builder' ]
    .local string basename
    $I0 = tb.'results'()
    inc $I0
    $S0 = $I0
    basename = 'test_' . $S0
    if has_entry goto L1
    entry = 'main'
  L1:
    $S0 = basename . '.wmls'
    spew($S0, source)
    .local string cmd
    cmd = "wmlsc "
    unless has_flags goto L2
    cmd .= flags
  L2:
    cmd .= " "
    cmd .= basename
    cmd .= ".wmls"
    $I0 = spawnw cmd
    cmd = "parrot wmlsi.pbc "
    cmd .= basename
    cmd .= ".wmlsc "
    cmd .= entry
    unless has_params goto L3
    cmd .= " "
    cmd .= params
  L3:
    $P0 = new 'FileHandle'
    $P0.'open'(cmd, 'rp')
    $S0 = $P0.'readall'()
    $P0.'close'()
    like($S0, pattern, desc)
.end

.sub 'spew' :anon
    .param string filename
    .param string content
    $P0 = new 'FileHandle'
    push_eh _handler
    $P0.'open'(filename, 'w')
    pop_eh
    $P0.'puts'(content)
    $P0.'close'()
    .return ()
  _handler:
    .local pmc e
    .get_results (e)
    $S0 = "Can't open '"
    $S0 .= filename
    $S0 .= "' ("
    $S1 = err
    $S0 .= $S1
    $S0 .= ")\n"
    e = $S0
    rethrow e
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
