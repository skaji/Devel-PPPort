################################################################################
#
#            !!!!!   Do NOT edit this file directly!   !!!!!
#
#            Edit mktests.PL and/or parts/inc/gv instead.
#
#  This file was automatically generated from the definition files in the
#  parts/inc/ subdirectory by mktests.PL. To learn more about how all this
#  works, please read the F<HACKERS> file that came with this distribution.
#
################################################################################

BEGIN {
  if ($ENV{'PERL_CORE'}) {
    chdir 't' if -d 't';
    @INC = ('../lib', '../ext/Devel-PPPort/t') if -d '../lib' && -d '../ext';
    require Config; import Config;
    use vars '%Config';
    if (" $Config{'extensions'} " !~ m[ Devel/PPPort ]) {
      print "1..0 # Skip -- Perl configured without Devel::PPPort module\n";
      exit 0;
    }
  }
  else {
    unshift @INC, 't';
  }

  sub load {
    eval "use Test";
    require 'testutil.pl' if $@;
  }

  if (7) {
    load();
    plan(tests => 7);
  }
}

use Devel::PPPort;
use strict;
BEGIN { $^W = 1; }

package Devel::PPPort;
use vars '@ISA';
require DynaLoader;
@ISA = qw(DynaLoader);
bootstrap Devel::PPPort;

package main;

ok(Devel::PPPort::GvSVn(), 1);

ok(Devel::PPPort::isGV_with_GP(), 2);

ok(Devel::PPPort::get_cvn_flags(), 3);

ok(Devel::PPPort::gv_fetchpvn_flags(), \*Devel::PPPort::VERSION);

ok(Devel::PPPort::gv_fetchsv("Devel::PPPort::VERSION"), \*Devel::PPPort::VERSION);

ok(Devel::PPPort::gv_init_type("sanity_check", 0, 0), "*main::sanity_check");
ok($::{sanity_check});

