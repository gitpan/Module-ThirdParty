use strict;
use Test::More;
BEGIN { plan tests => 25 }
use Module::ThirdParty;

# checking with a few known 3rd party module
for my $module (qw(SVN::Core CAIDA::NetGeoClient Text::ChaSen SWISH::API)) {
    ok( is_3rd_party($module) , "$module is a known third-party module" );
}

# checking with a few core modules
for my $module (qw(strict Exporter Symbol IPC::Open3)) {
    ok( ! is_3rd_party($module) , "$module isn't a known third-party module (core)" );
}

# checking with a few CPAN modules
for my $module (qw(DBI Net::Pcap PDF::API2 Spreadsheet::WriteExcel XML::LibXML)) {
    ok( ! is_3rd_party($module) , "$module isn't a known third-party module (CPAN)" );
}

# checking with non-existant modules
for my $module (qw(No::Such::Module Realistic::Name::ButNo::Luck)) {
    ok( ! is_3rd_party($module) , "$module isn't a known third-party module (non-existant)" );
}

# getting module information for a known 3rd party module
my $info = undef;
is( $info, undef                                                , "getting module info for Text::ChaSen");
$info = module_information('Text::ChaSen');
ok( defined $info                                               , " - \$info is defined" );
is( ref $info, 'HASH'                                           , " - \$info is a HASH ref" );
is( $info->{name}, 'ChaSen'                                     , " - checking name" );
is( $info->{url}, 'http://chasen.naist.jp/hiki/ChaSen/'         , " - checking url" );
is( $info->{author}, 'Nara Institute of Science and Technology' , " - checking author" );
is( $info->{author_url}, 'http://www.naist.jp/'                 , " - checking author_url" );
is_deeply( $info->{modules}, [qw(Text::ChaSen)]                 , " - checking modules" );

# getting module information for a core module
$info = undef;
is( $info, undef                                                , "getting module info for Text::ParseWords");
$info = module_information('Text::ParseWords');
is( $info, undef                                                , " - \$info is undefined" );

