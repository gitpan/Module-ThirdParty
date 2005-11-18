use strict;
use Test::More;
BEGIN { plan tests => 2 }
use Module::ThirdParty;

can_ok( 'Module::ThirdParty', 'is_3rd_party'       );
can_ok( 'Module::ThirdParty', 'module_information' );
