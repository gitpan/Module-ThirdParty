use strict;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Module::ThirdParty',
    license             => 'perl',
    dist_author         => 'Sébastien Aperghis-Tramoni <sebastien@aperghis.net>',
    dist_version_from   => 'lib/Module/ThirdParty.pm',
    requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Module-ThirdParty-*' ],
);

$builder->create_build_script();
