package Module::ThirdParty;
use strict;
require Exporter;

{ no strict;
  $VERSION = '0.01';
  @ISA = (Exporter);
  @EXPORT = qw(is_3rd_party module_information);
}

=head1 NAME

Module::ThirdParty - information for 3rd party modules (outside CPAN)

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

    use Module::ThirdParty;

    if(is_3rd_party($module)) {
        my $info = module_information($module);
        print "$module is a known third-party Perl module\n", 
              " -> included in $info->{name} ($info->{url})\n"
              " -> made by $info->{author} ($info->{author_url})\n"
    }

=head1 DESCRIPTION

Perl modules can be roughly classified in three categories: 

=over 4

=item *

core modules, included with the standard Perl distribution; 

=item *

CPAN modules, available from any CPAN mirror; 

=item *

third-party modules, including modules publicly available on the 
internet (outside CPAN) and "closed" modules available only through 
commercial licenses. 

=back

The list of core modules is provided by C<Module::CoreList> and the 
list of CPAN modules is in the file 
L<http://www.cpan.org/modules/02packages.details.txt.gz> and provided 
by modules like C<CPANPLUS>, but there was no module that listed 
third-party modules. This module tries to answer this need by providing 
such a list. Why bother in the first place? Because some CPAN modules 
specify such third-party softwares. Therefore installing them may not 
be as easy as other CPAN modules because one must first find and 
manually install the prerequisites. The aim of C<Module::ThirdParty> 
is to provide basic information to installer shells like C<CPANPLUS> 
and to give hints to the user. 

=cut 

# third party modules information
my %softwares = (
    'mod_perl1' => {
        name => 'mod_perl 1.0', 
        url => 'http://perl.apache.org/', 
        author => 'Apache Foundation', 
        author_url => 'http://www.apache.org/', 
        modules => [qw(
            Apache::AuthCookie
            Apache::Constants
            Apache::Debug
            Apache::FakeRequest
            Apache::File
            Apache::httpd_conf
            Apache::Include
            Apache::Leak
            Apache::Log
            Apache::Options
            Apache::PerlRun
            Apache::PerlSections
            Apache::Registry
            Apache::RegistryLoader
            Apache::Resource
            Apache::SIG
            Apache::SizeLimit
            Apache::src
            Apache::StatINC
            Apache::Status
            Apache::SubRequest
            Apache::Symdump
            Apache::Table
            Apache::test
            Apache::URI
            Apache::Util
        )]
    }, 

    'Subversion' => {
        name => 'Subversion', 
        url => 'http://subversion.tigris.org/', 
        author => 'Subversion', 
        author_url => 'http://subversion.tigris.org/', 
        modules => [qw(
            SVN::Base
            SVN::Client
            SVN::Core
            SVN::Delta
            SVN::Fs
            SVN::Ra
            SVN::Repos
            SVN::Wc
        )]
    }, 

    'VCP' => {
        name => 'VCP', 
        url => 'http://search.cpan.org/dist/VCP-autrijus-snapshot/', 
        author => 'Autrijus Tang', 
        author_url => 'http://www.autrijus.org/', 
        modules => [qw(
            RevML::Doctype
            RevML::Writer
            VCP
            VCP::DB
            VCP::Logger
            VCP::Plugin
            VCP::Source
            VCP::UI
            VCP::Utils
        )]
    }, 

    'GeoIP' => {
        name => 'GeoIP Perl API', 
        url => 'http://www.maxmind.com/app/perl', 
        author => 'MaxMind', 
        author_url => 'http://www.maxmind.com/', 
        modules => [qw(
            Geo::IP
            Geo::IP::PurePerl
        )]
    }, 

    'NetGeoAPI' => {
        name => 'CAIDA NetGeo API', 
        url => 'http://www.caida.org/tools/utilities/netgeo/', 
        author => 'CAIDA', 
        author_url => 'http://www.caida.org/', 
        modules => [qw(
            CAIDA::NetGeoClient
        )]
    }, 

    'ChaSen' => {
        name => 'ChaSen', 
        url => 'http://chasen.naist.jp/hiki/ChaSen/', 
        author => 'Nara Institute of Science and Technology', 
        author_url => 'http://www.naist.jp/', 
        modules => [qw(
            Text::ChaSen
        )]
    }, 

    'Swish-e' => {
        name => 'Swish-e', 
        url => 'http://www.swish-e.org/', 
        author => 'Swish-e', 
        author_url => 'http://www.swish-e.org/', 
        modules => [qw(
            SWISH::API
        )]
    }, 

    'VMware' => {
        name => 'VMware Perl API', 
        url => 'http://www.vmware.com/support/developer/perl-API/doc/', 
        author => 'VMware', 
        author_url => 'http://www.vmware.com/', 
        modules => [qw(
            VMware::Control
            VMware::Control::Server
            VMware::Control::VM
        )]
    }, 

    'VOTable' => {
        name => 'VOTable', 
        url => 'http://www.us-vo.org/VOTable/', 
        author => 'US National Virtual Observatory', 
        author_url => 'http://www.us-vo.org/', 
        modules => [qw(
            VOTable::DOM
        )]
    }, 

    'RothWin32' => {
        name => "Roth Consulting's Perl Contributions", 
        url => 'http://www.roth.net/perl/', 
        author => 'Roth Consulting', 
        author_url => 'http://www.roth.net/', 
        modules => [qw(
            Win32::AdminMisc
            Win32::API::Prototype
            Win32::Daemon
            Win32::Perms
            Win32::RasAdmin
            Win32::Tie::Ini
        )]
    }, 

    'Interchange' => {
        name => 'Interchange Payment Modules', 
        url => 'http://www.interchange.rtfm.info/downloads/payments/', 
        author => 'Interchange', 
        author_url => 'http://www.interchange.rtfm.info/', 
        modules => [qw(
            Vend::Payment::AuthorizeNet
            Vend::Payment::BoA
            Vend::Payment::BusinessOnlinePayment
            Vend::Payment::CyberCash
            Vend::Payment::ICS
            Vend::Payment::ECHO
            Vend::Payment::EFSNet
            Vend::Payment::Ezic
            Vend::Payment::iTransact
            Vend::Payment::Linkpoint
            Vend::Payment::Linkpoint3
            Vend::Payment::MCVE
            Vend::Payment::Netbilling
            Vend::Payment::NetBilling2
            Vend::Payment::PRI
            Vend::Payment::ProcessNet
            Vend::Payment::Protx
            Vend::Payment::PSiGate
            Vend::Payment::Signio
            Vend::Payment::Skipjack
            Vend::Payment::TestPayment
            Vend::Payment::TCLink
            Vend::Payment::WellsFargo
        )]
    }, 

    'PayFlowPro' => {
        name => 'PayFlow Pro', 
        url => 'http://www.verisign.com/products-services/payment-processing/online-payment/payflow-pro/index.html', 
        author => 'VeriSign', 
        author_url => 'http://www.verisign.com/', 
        modules => [qw(
            PFProAPI
        )]
    }, 

    'TCLink' => {
        name => 'TCLink', 
        url => 'http://www.trustcommerce.com/tclink.php', 
        author => 'TrustCommerce', 
        url => 'http://www.trustcommerce.com/', 
        modules => [qw(
            Net::TCLink
        )]
    }, 

    'MVCE' => {
        name => 'Main Street Credit Verification Engine (MCVE)', 
        url => 'http://www.mcve.com/', 
        author => 'Main Street Softworks', 
        author_url => 'http://www.mcve.com/', 
        modules => [qw(
            MVCE
        )]
    }, 

    'LinkPoint' => {
        name => 'LinkPoint API', 
        url => 'https://www.linkpoint.com/viewcart/', 
        author => 'LinkPoint', 
        author_url => 'https://www.linkpoint.com/', 
        modules => [qw(
            lpperl
        )]
    }, 

    'ICS' => {
        name => 'CyberSource ICS', 
        url => 'http://www.cybersource.com/support_center/implementation/downloads/', 
        author => 'CyberSource', 
        author_url => 'http://www.cybersource.com/', 
        modules => [qw(
            ICS
        )]
    }, 

    'CyverCash' => {
        name => 'CyberCash', 
        url => 'http://www.cybersource.com/support_center/implementation/downloads/', 
        author => 'CyberSource', 
        author_url => 'http://www.cybersource.com/', 
        modules => [qw(
            CCMckLib3_2
            CCMckDirectLib3_2
            CCMckErrno3_2
        )]
    }, 

    'OpenECHO' => {
        name => 'OpenECHO', 
        url => 'http://www.openecho.com/index.php?ba=downloads', 
        author => 'OpenECHO', 
        author_url => 'http://www.openecho.com/', 
        modules => [qw(
            OpenECHO
        )]
    }, 

);

my %modules = ();

for my $soft (keys %softwares) {
    my @mods = @{$softwares{$soft}->{modules}};
    @modules{@mods} = ($softwares{$soft}) x @mods;
}



=head1 EXPORT

This module exports the functions C<is_3rd_party()> and C<module_information()>.

=head1 FUNCTIONS

=over 4

=item is_3rd_party()

Returns true if the given module name is a known third-party Perl module. 

B<Example>

    print "$module is a known third-party module\n" if is_3rd_party($module)

=cut

sub is_3rd_party {
    return exists $modules{$_[0]}
}

=item module_information()

Returns the information about a known third-party Perl Module or undef 
if the module is not known. The information is returnd as a hashref with 
the following keys: 

=over 4

=item *

C<name> is the name of the software that provides the given module; 

=item *

C<url> is the URL where this software can be found; 

=item *

C<author> is the name of the author who publishes the software; 

=item *

C<author_url> is the URL of the author's web site; 

=item *

C<modules> is an arrayref which contains the list of the Perl modules 
provided by the software.

=back

B<Example>

    my $info = module_information($module);
    print "$module is included in $info->{name}, which can be found at $info->{url}\n"

=cut

sub module_information {
    return exists $modules{$_[0]} ? $modules{$_[0]} : undef
}

=back

=head1 SEE ALSO

L<Module::CoreList>, L<CPANPLUS>

=head1 AUTHOR

SE<eacute>bastien Aperghis-Tramoni, E<lt>sebastien@aperghis.netE<gt>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-module-thirdparty@rt.cpan.org>, or through the web interface at
L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Module-ThirdParty>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2005 SE<eacute>bastien Aperghis-Tramoni, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Module::ThirdParty
