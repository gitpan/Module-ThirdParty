use strict;
use Test::More;
BEGIN { plan tests => 2 }
use Module::ThirdParty;

ok( defined &Module::ThirdParty::is_3rd_party       );
ok( defined &Module::ThirdParty::module_information );

