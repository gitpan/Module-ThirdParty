use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Module::ThirdParty',
    AUTHOR              => 'Sébastien Aperghis-Tramoni <sebastien@aperghis.net>',
    VERSION_FROM        => 'lib/Module/ThirdParty.pm',
    ABSTRACT_FROM       => 'lib/Module/ThirdParty.pm',
    PREREQ_PM => {
        'Test::More' => 0,
    },
    PL_FILES            => {},
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Module-ThirdParty-*' },
);
