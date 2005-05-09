package Module::ThirdParty;
use strict;
require Exporter;

{ no strict;
  $VERSION = '0.06';
  @ISA = (Exporter);
  @EXPORT = qw(is_3rd_party module_information);
}

=head1 NAME

Module::ThirdParty - Provide information for 3rd party modules (outside CPAN)

=head1 VERSION

Version 0.06

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
third-party modules. This module tries to address this need by providing 
such a list. 

Why bother in the first place? Because some CPAN modules 
specify such third-party softwares. Therefore installing them may not 
be as easy as other CPAN modules because one must first find and 
manually install the prerequisites. The aim of C<Module::ThirdParty> 
is to provide basic information to installer shells like C<CPANPLUS> 
and to give hints to the user. 

Note that there is also another category of modules regarding 
dependencies problems: the ghost modules. Those are modules no longer 
present on the CPAN, but which still haunt it from old PREREQS. They 
can be found in the BackPAN graveyard, for which the only map is 
C<Parse::BACKPAN::Packages>. 

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

    'RT' => {
        name => 'Request Tracker', 
        url => 'http://bestpractical.com/rt/', 
        author => 'Best Practical', 
        author_url => 'http://bestpractical.com/', 
        modules => [qw(
            RT
            RT::ACE
            RT::ACL
            RT::Action::AutoOpen
            RT::Action::Autoreply
            RT::Action::CreateTickets
            RT::Action::EscalatePriority
            RT::Action::Generic
            RT::Action::Notify
            RT::Action::NotifyAsComment
            RT::Action::RecordComment
            RT::Action::RecordCorrespondence
            RT::Action::ResolveMembers
            RT::Action::SendEmail
            RT::Action::SetPriority
            RT::Action::UserDefined
            RT::Attachment
            RT::Attachments
            RT::Attribute
            RT::Attributes
            RT::Base
            RT::CachedGroupMember
            RT::CachedGroupMembers
            RT::Condition::AnyTransaction
            RT::Condition::BeforeDue
            RT::Condition::Generic
            RT::Condition::Overdue
            RT::Condition::OwnerChange
            RT::Condition::PriorityChange
            RT::Condition::PriorityExceeds
            RT::Condition::QueueChange
            RT::Condition::StatusChange
            RT::Condition::UserDefined
            RT::CurrentUser
            RT::CustomField
            RT::CustomFields
            RT::CustomFieldValue
            RT::CustomFieldValues
            RT::Date
            RT::EmailParser
            RT::Group
            RT::GroupMember
            RT::GroupMembers
            RT::Groups
            RT::Handle
            RT::I18N
            RT::I18N::cs
            RT::I18N::i_default
            RT::Interface::CLI
            RT::Interface::Email
            RT::Interface::Email::Auth::GnuPG
            RT::Interface::Email::Auth::MailFrom
            RT::Interface::Email::Filter::SpamAssassin
            RT::Interface::REST
            RT::Interface::Web
            RT::Interface::Web::Handler
            RT::Link
            RT::Links
            RT::ObjectCustomField
            RT::ObjectCustomFields
            RT::ObjectCustomFieldValue
            RT::ObjectCustomFieldValues
            RT::Principal
            RT::Principals
            RT::Queue
            RT::Queues
            RT::Record
            RT::Scrip
            RT::ScripAction
            RT::ScripActions
            RT::ScripCondition
            RT::ScripConditions
            RT::Scrips
            RT::Search::ActiveTicketsInQueue
            RT::SearchBuilder
            RT::Search::FromSQL
            RT::Search::Generic
            RT::System
            RT::Template
            RT::Templates
            RT::Ticket
            RT::Tickets
            RT::Transaction
            RT::Transactions
            RT::URI
            RT::URI::base
            RT::URI::fsck_com_rt
            RT::User
            RT::Users
        )]
    }, 

    'VCP' => {
        name => 'Version CoPy', 
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

    'P4' => {
        name => 'Perforce', 
        url => 'http://public.perforce.com/guest/tony_smith/perforce/API/Perl/index.html', 
        author => 'Perforce', 
        author_url => 'http://www.perforce.com/', 
        modules => [qw(
            P4
        )]
    }, 

    'Perl::API' => {
        name => 'Perl::API', 
        url => 'http://search.cpan.org/dist/Perl-API/', 
        author => 'Gisle Aas', 
        author_url => 'http://gisle.aas.no/', 
        modules => [qw(
            Perl::API
        )]
    }, 

    'PerlObjCBridge' => {
        name => 'Perl/Objective-C bridge', 
        url => 'http://developer.apple.com/', 
        author => 'Apple', 
        author_url => 'http://www.apple.com/', 
        modules => [qw(
            PerlObjCBridge
            Foundation
        )]
    }, 

    'LibWhisker' => {
        name => 'LibWhisker', 
        url => 'http://www.wiretrip.net/rfp/lw.asp', 
        author => 'rfp.labs', 
        author_url => 'http://www.wiretrip.net/rfp/', 
        modules => [qw(
            LW
        )]
    }, 

    'LibWhisker2' => {
        name => 'LibWhisker2', 
        url => 'http://www.wiretrip.net/rfp/lw1.asp', 
        author => 'rfp.labs', 
        author_url => 'http://www.wiretrip.net/rfp/', 
        modules => [qw(
            LW2
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

    'GeoPlot' => {
        name => 'CAIDA GeoPlot Perl API', 
        url => 'http://www.caida.org/tools/visualization/geoplot/', 
        author => 'CAIDA', 
        author_url => 'http://www.caida.org/', 
        modules => [qw(
            GeoPlot
            GPMod::Node
            GPMod::Link
            GPMod::Key
            GPMod::Path
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

    'MT' => {
        name => 'Movable Type', 
        url => 'http://www.sixapart.com/movabletype/', 
        author => 'Six Apart', 
        author_url => 'http://www.sixapart.com/', 
        modules => [qw(
            MT
            MT::App
            MT::App::CMS
            MT::App::Comments
            MT::App::NotifyList
            MT::App::Search
            MT::App::Search::Context
            MT::App::Trackback
            MT::App::Viewer
            MT::Atom
            MT::Atom::Entry
            MT::AtomServer
            MT::AtomServer::Weblog
            MT::Author
            MT::Blog
            MT::Builder
            MT::Callback
            MT::Category
            MT::ConfigMgr
            MT::DateTime
            MT::Entry
            MT::ErrorHandler
            MT::FileInfo
            MT::FileMgr
            MT::FileMgr::Local
            MT::Image
            MT::Image::ImageMagick
            MT::Image::NetPBM
            MT::ImportExport
            MT::IPBanList
            MT::L10N
            MT::L10N::en_us
            MT::Log
            MT::Mail
            MT::Notification
            MT::Object
            MT::ObjectDriver
            MT::ObjectDriver::DBI
            MT::ObjectDriver::DBI::mysql
            MT::ObjectDriver::DBI::postgres
            MT::ObjectDriver::DBI::sqlite
            MT::ObjectDriver::DBM
            MT::Permission
            MT::Placement
            MT::Plugin
            MT::PluginData
            MT::Plugin::Nofollow
            MT::Promise
            MT::Request
            MT::Sanitize
            MT::Serialize
            MT::Session
            MT::TBPing
            MT::Template
            MT::Template::Context
            MT::TemplateMap
            MT::Trackback
            MT::Util
            MT::XMLRPC
            MT::XMLRPCServer
            MT::XMLRPCServer::Util
        )]
    }, 

    'ClearSilver' => {
        name => 'ClearSilver', 
        url => 'http://www.clearsilver.net/', 
        author => 'Brandon Long', 
        author_url => 'http://www.fiction.net/blong/', 
        modules => [qw(
            ClearSilver
        )]
    }, 

    'TLPDriver' => {
        name => 'TLP Driver', 
        url => 'http://www.gemplus.com/techno/tlp_drivers/index.html', 
        author => 'Gemplus', 
        author_url => 'http://www.gemplus.com/', 
        modules => [qw(
            cardreader
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

    'NetVigil' => {
        name => 'NetVigil', 
        url => 'http://www.fidelia.com/products/', 
        author => 'Fidelia', 
        author_url => 'http://www.fidelia.com/', 
        # other useful link: 
        #   http://www.navya.com/
        #   http://www.navya.com/netvigil/   --  NetVigil documentation
        modules => [qw(
            NetVigil
            NetVigil::Clients
            NetVigil::Clients::SimpleServer
            NetVigil::Clients::WmiQueryDaemon
            NetVigil::Config
            NetVigil::Debug
            NetVigil::Discover::Static
            NetVigil::Discover::SNMP
            NetVigil::Discover::WMI
            NetVigil::ExternalData
            NetVigil::Message
            NetVigil::MonitorStatus
            NetVigil::NameSpace
            NetVigil::Provisioning
            NetVigil::SimpleServerClient
            NetVigil::SocketIO
        )]
    }, 

    'perl4patrol' => {
        name => 'perl4patrol', 
        url => 'http://www.manageit.ca/p_and_s/tools/perl4patrol/perl4patrol.html', 
        author => 'ManageIt', 
        author_url => 'http://www.manageit.ca/', 
        modules => [qw(
            perl4patrol
        )]
    }, 

    'Directi' => {
        name => 'Directi Perl API', 
        url => 'http://manage.directi.com/kb/servlet/KBServlet/faq685.html', 
        author => 'Brandon Long', 
        author_url => 'http://www.directi.com/', 
        modules => [qw(
            Customers
            DirectICustomerService
            DirectIDomainContact
            DirectIDomainFwdService
            DirectIDomainService
            DirectIFund
            DirectIMailFwdService
            DirectISerialiser
            DirectISerialiser12
            DirectIXMLIO
            DirectIXMLIO12
            DomainContact
            DomainFwd
            DomOrder
            DomUSContact
            ErrorTraping
            Fund
            MailFwd
            SOAPProperty
            Website
            Zone
        )]
    }, 

    'Fathom' => {
        name => 'Fathom Management Perl API', 
        url => 'http://psdn.progress.com/library/fathom/', 
        author => 'Progress Software', 
        author_url => 'http://www.progress.com/', 
        modules => [qw(
            Fathom
            Fathom::Alerts
            Fathom::ConfigAdvisor
            Fathom::Constants
            Fathom::Defaults
            Fathom::Jobs
            Fathom::Library
            Fathom::OpenEdge
            Fathom::Reports
            Fathom::Resources
            Fathom::Users
            Fathom::Utils
            Fathom::Views
            HTMLInput
            HTMLStripper
        )]
    }, 

    'MIM' => {
        name => 'Market Information Machine', 
        url => 'http://www.lim.com/download/download_perl_api.html', 
        author => 'Logical Information Machines', 
        author_url => 'http://www.lim.com/', 
        modules => [qw(
            xmim4
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

    'OpenConnect' => {
        name => 'OpenConnect', 
        url => 'http://www.paradata.com/tech/', 
        author => 'Paradata Systems', 
        author_url => 'http://www.paradata.com/', 
        modules => [qw(
            ACHRequest
            ACHResponse
            AdditionalField
            BatchRequest
            BatchResponse
            constants
            CountryCodes
            CreditCardRequest
            CreditCardResponse
            PayerAuthenticationRequest
            PayerAuthenticationResponse
            RecurringRequest
            RecurringResponse
            SecureHttp
            TransactionClient
            TransactionRequest
            TransactionResponse
            URLEncoder
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

    'CyberCash' => {
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

=item B<is_3rd_party()>

Returns true if the given module name is a known third-party Perl module. 

B<Example>

    print "$module is a known third-party module\n" if is_3rd_party($module)

=cut

sub is_3rd_party {
    return exists $modules{$_[0]}
}

=item B<module_information()>

Returns the information about a known third-party Perl Module or C<undef> 
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

=item B<provides()>

Returns a list of hashref with the name and author of each 
software for which this module provides information. 

B<Example>

Prints the list of known third-party modules sorted by software name.

    print "Known third-party software:\n";
    my @softs = Module::ThirdParty::provides;
    for my $soft (sort {$a->{name} cmp $b->{name}} @softs) {
        print " - $$soft{name} by $$soft{author} \n"
    }

=cut

sub provides {
    my @softs = ();
    for my $soft (keys %softwares) {
        push @softs, { author => $softwares{$soft}{author}, name => $softwares{$soft}{name} }
    }
    return @softs
}

=back

=head1 SEE ALSO

L<Module::CoreList>, L<CPANPLUS>, L<Parse::BACKPAN::Packages>

=head1 AUTHOR

SE<eacute>bastien Aperghis-Tramoni, E<lt>sebastien@aperghis.netE<gt>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-module-thirdparty@rt.cpan.org>, or through the web interface at
L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Module-ThirdParty>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2005 SE<eacute>bastien Aperghis-Tramoni, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Module::ThirdParty
