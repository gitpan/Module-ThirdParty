use strict;
use Test::More;
BEGIN { plan tests => 2 }
use Module::ThirdParty;

ok( exists &Module::ThirdParty::is_3rd_party       );
ok( exists &Module::ThirdParty::module_information );

