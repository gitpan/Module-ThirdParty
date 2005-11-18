package Module::ThirdParty;
use strict;
require Exporter;

{ no strict;
  $VERSION = '0.13';
  @ISA = (Exporter);
  @EXPORT = qw(is_3rd_party module_information);
}

=head1 NAME

Module::ThirdParty - Provide information for 3rd party modules (outside CPAN)

=head1 VERSION

Version 0.13

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
Internet (outside CPAN) and "closed" modules available only through 
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

    'Zeus-ModPerl' => {
        name => ' Zeus Web Server Perl Extensions', 
        url => 'http://support.zeus.com/doc/api/perl/', 
        author => 'Zeus Technology', 
        author_url => 'http://www.zeus.com/', 
        modules => [qw(
            ui::admin::Admin::Admin_Security
            ui::web::Access::Bandwidth_Throttling
            ui::web::Access::htaccess_Support
            ui::web::Access::Referrer_Checking
            ui::web::Access::Restricting_Access
            ui::web::Access::Users_and_Groups
            ui::web::Access::Users_and_Groups::Edit_group
            ui::web::Access::Users_and_Groups::Edit_user
            ui::web::Add_Ons::Imagemaps
            ui::web::Add_Ons::Search_Engine
            ui::web::Admin::Preferences
            ui::web::Admin::SSL_Certificates
            ui::web::Admin::Technical_Support
            ui::web::Admin::Technical_Support::Review
            ui::web::API_Support::CGI::General
            ui::web::API_Support::CGI::Sandboxing
            ui::web::API_Support::FastCGI
            ui::web::API_Support::ISAPI
            ui::web::API_Support::Java_Servlets
            ui::web::API_Support::NSAPI
            ui::web::API_Support::Perl
            ui::web::API_Support::SSI
            ui::web::API_Support::ZDAC
            ui::web::Change::Config_Difference
            ui::web::Change::Review_Modification
            ui::web::Create::Group
            ui::web::Create::Virtual_Server
            ui::web::Delete
            ui::web::File_Handling::Content_Compression
            ui::web::File_Handling::Content_Negotiation
            ui::web::File_Handling::File_Upload
            ui::web::File_Handling::MIME_Types
            ui::web::General::Advanced_Settings
            ui::web::General::Config_Summary
            ui::web::General::Fundamentals
            ui::web::General::Processing_Summary
            ui::web::General::SSL_Security::Client_Certificates
            ui::web::General::SSL_Security::General
            ui::web::Information
            ui::web::Machines::Configuration
            ui::web::Machines::Current_Connections
            ui::web::Machines::Grouped_Reports
            ui::web::Machines::Licensing
            ui::web::Machines::Licensing::Update
            ui::web::Machines::Monitoring::ChooseCounters
            ui::web::Machines::Real_Time_Monitoring
            ui::web::Machines::Traffic_History
            ui::web::MainIndex
            ui::web::Monitoring::Error_Handling
            ui::web::Monitoring::Forensic_Logging
            ui::web::Monitoring::Request_Logging
            ui::web::Monitoring::Statistics_Gathering
            ui::web::Monitoring::User_Tracking
            ui::web::Protection::Connection_Limiting
            ui::web::Protection::Edit_Rule
            ui::web::Protection::General
            ui::web::Protection::Request_Filtering
            ui::web::Protection::Request_Filtering::Rule
            ui::web::Protection::Request_Filtering::Upload
            ui::web::Protection::Review_Modification
            ui::web::SSL::VICE
            ui::web::Subservers::Subservers
            ui::web::Third_Party::FrontPage
            ui::web::Third_Party::PHP
            ui::web::Traffic_History::Cluster_Traffic_Analysis
            ui::web::Traffic_History::Traffic_Overview
            ui::web::Traffic_History::Website_Comparison
            ui::web::URL_Handling::Directory_Requests
            ui::web::URL_Handling::Gateway
            ui::web::URL_Handling::Handlers
            ui::web::URL_Handling::Home_Directories
            ui::web::URL_Handling::Request_Rewriting
            ui::web::URL_Handling::Request_Rewriting::ModRewriteConvert
            ui::web::URL_Handling::Response_Headers
            ui::web::URL_Handling::Spelling_Correction
            ui::web::URL_Handling::URL_Mappings
            Zeus::Admin::AdminVSConfig
            Zeus::Admin::AdminVSStorage
            Zeus::Admin::UIComponents
            Zeus::CGI
            Zeus::ConfigErrors
            Zeus::ConfigStorageControl
            Zeus::Diverter
            Zeus::Dumper
            Zeus::Execute
            Zeus::Exporter
            Zeus::FastCGI
            Zeus::Form
            Zeus::GroupConfig
            Zeus::HTMLTemplater
            Zeus::HTMLUtils
            Zeus::I18N
            Zeus::KeyValueConfig
            Zeus::KeyValueConfigFile
            Zeus::MD5
            Zeus::Menu
            Zeus::ModPerl
            Zeus::ModPerl::Connection
            Zeus::ModPerl::Constants
            Zeus::ModPerl::Cookie
            Zeus::ModPerl::FakeRequest
            Zeus::ModPerl::File
            Zeus::ModPerl::HeaderTable
            Zeus::ModPerl::Include
            Zeus::ModPerl::Log
            Zeus::ModPerl::NotesTable
            Zeus::ModPerl::PerlRun
            Zeus::ModPerl::Registry
            Zeus::ModPerl::RegistryLoader
            Zeus::ModPerl::Reload
            Zeus::ModPerl::Request
            Zeus::ModPerl::Server
            Zeus::ModPerl::SSI
            Zeus::ModPerl::Symbol
            Zeus::ModPerl::Table
            Zeus::ModPerl::URI
            Zeus::ModPerl::Util
            Zeus::MultiConfigs
            Zeus::PDF
            Zeus::PEM
            Zeus::PreferencesConfig
            Zeus::PreferencesStorage
            Zeus::Section
            Zeus::SSLSet
            Zeus::SSLSets
            Zeus::SSLStorage
            Zeus::TempFile
            Zeus::TimeLocal
            Zeus::UIComponents
            Zeus::Util
            Zeus::VICE
            Zeus::Web::AccessRule
            Zeus::Web::AMP
            Zeus::Web::Cipher
            Zeus::Web::Deployer
            Zeus::Web::DynamicConfig
            Zeus::Web::DynamicConfigs
            Zeus::Web::DynamicConfigSanity
            Zeus::Web::FrontPage
            Zeus::Web::GUI
            Zeus::Web::GzipHash
            Zeus::Web::HookData
            Zeus::Web::KeyToPage
            Zeus::Web::License
            Zeus::Web::MappingUI
            Zeus::Web::PerlStartup
            Zeus::Web::RequestRewriteSupport
            Zeus::Web::Storage_FS
            Zeus::Web::SubserverHash
            Zeus::Web::SupportInfo
            Zeus::Web::UIComponents
            Zeus::Web::VSCommand
            Zeus::Web::VSConfig
            Zeus::Web::VSConfigs
            Zeus::Web::VSConfigSanity
            Zeus::Web::VSDeploymentConfig
            Zeus::Web::VSDeploymentStorage
            Zeus::Web::VSGroupConfig
            Zeus::Web::VSGroupStorage
            Zeus::Web::VSStatus
            Zeus::Web::VSStorage
            Zeus::Web::ZWSStat
            Zeus::Web::ZWSStat::Descriptions
            Zeus::Widget
            Zeus::ZInstall::Cluster
            Zeus::ZInstall::Common
            Zeus::ZInstall::Products
            Zeus::ZInstall::Questions
            Zeus::ZInstall::TkInstall
            Zeus::ZInstall::ZInstall
            Zeus::ZSSL
            ZeusOS
            ZWS4Conf
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
        name => 'Version CoPy (VCP)', 
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

    'GeoPlot' => {
        name => 'GeoPlot Perl API', 
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
        name => 'NetGeo API', 
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

    'Sprog' => {
        name => 'Sprog', 
        url => 'http://sprog.sourceforge.net/', 
        author => 'Grant McLean', 
        author_url => 'http://homepages.paradise.net.nz/gmclean1/', 
        modules => [qw(
            Sprog
            Sprog::Accessor
            Sprog::ClassFactory
            Sprog::Debug
            Sprog::Gear
            Sprog::Gear::ApacheLogParse
            Sprog::Gear::ApacheLogParse::Parser
            Sprog::Gear::CommandFilter
            Sprog::Gear::CommandIn
            Sprog::Gear::CSVSplit
            Sprog::Gear::FindReplace
            Sprog::Gear::Grep
            Sprog::Gear::ImageBorder
            Sprog::Gear::InputByLine
            Sprog::Gear::InputFromFH
            Sprog::Gear::ListToCSV
            Sprog::Gear::ListToRecord
            Sprog::Gear::LowerCase
            Sprog::GearMetadata
            Sprog::Gear::NameFields
            Sprog::Gear::OutputToFH
            Sprog::Gear::ParseHTMLTable
            Sprog::Gear::PerlBase
            Sprog::Gear::PerlCode
            Sprog::Gear::PerlCodeAP
            Sprog::Gear::PerlCodeHP
            Sprog::Gear::PerlCodePA
            Sprog::Gear::PerlCodePH
            Sprog::Gear::ReadFile
            Sprog::Gear::ReplaceFile
            Sprog::Gear::RetrieveURL
            Sprog::Gear::SelectColumns
            Sprog::Gear::SelectFields
            Sprog::Gear::SlurpFile
            Sprog::Gear::StripWhitespace
            Sprog::Gear::TemplateTT2
            Sprog::Gear::TextInput
            Sprog::Gear::TextWindow
            Sprog::Gear::UpperCase
            Sprog::Gear::WriteFile
            Sprog::GlibEventLoop
            Sprog::GtkAutoDialog
            Sprog::GtkAutoDialog::CheckButton
            Sprog::GtkAutoDialog::ColorButton
            Sprog::GtkAutoDialog::Entry
            Sprog::GtkAutoDialog::RadioButton
            Sprog::GtkAutoDialog::RadioButtonGroup
            Sprog::GtkAutoDialog::SpinButton
            Sprog::GtkAutoDialog::TextView
            Sprog::GtkEventLoop
            Sprog::GtkGearView
            Sprog::GtkGearView::Paths
            Sprog::GtkGearView::TextWindow
            Sprog::GtkView
            Sprog::GtkView::AboutDialog
            Sprog::GtkView::AlertDialog
            Sprog::GtkView::Chrome
            Sprog::GtkView::DnD
            Sprog::GtkView::HelpViewer
            Sprog::GtkView::Menubar
            Sprog::GtkView::Palette
            Sprog::GtkView::PrefsDialog
            Sprog::GtkView::Toolbar
            Sprog::GtkView::WorkBench
            Sprog::HelpParser
            Sprog::Machine
            Sprog::Machine::Scheduler
            Sprog::Preferences
            Sprog::Preferences::Unix
            Sprog::PrintProxy
            Sprog::PrintProxyTie
            Sprog::TestHelper
            Sprog::TextGearView
            Sprog::TextGearView::TextWindow
            Sprog::TextView
        )]
    }, 

    'Vx' => {
        name => 'Vx', 
        url => 'http://opensource.fotango.com/software/vx/', 
        author => 'Fotango', 
        author_url => 'http://www.fotango.com/', 
        modules => [qw(
            SQL
            Vx
            Vx::Abstract
            Vx::Address
            Vx::Address::Container
            Vx::Address::Email
            Vx::Address::Postal
            Vx::Address::Telephone
            Vx::Base
            Vx::Binary
            Vx::Class::Chameleon
            Vx::Collection
            Vx::Collection::Container
            Vx::Collection::ContainerHash
            Vx::Collection::ContainerPublisheable
            Vx::Collection::Element
            Vx::Config
            Vx::Constants
            Vx::Context
            Vx::Counter
            Vx::Data
            Vx::Data::Container
            Vx::Data::Image
            Vx::Data::Null
            Vx::Data::Sound
            Vx::Datastore
            Vx::Datastore::Builder
            Vx::Datastore::Cache
            Vx::Data::Text
            Vx::Event
            Vx::Facade
            Vx::Fulfillment
            Vx::Fulfillment::Type
            Vx::Function
            Vx::Globals
            Vx::Image
            Vx::Image::Manipulation
            Vx::Image::Manipulation::Container
            Vx::Image::Manipulation::Crop
            Vx::Image::Manipulation::Handler
            Vx::Image::Manipulation::Rotate
            Vx::Image::PrintArea::Container
            Vx::Image::PrintArea::Crop
            Vx::Image::PrintArea::Element
            Vx::Image::Rendering
            Vx::Image::Util
            Vx::Init::Fotango
            Vx::Init::Fotango::Canon
            Vx::Init::Fotango::Canon::UK
            Vx::Interface::Cloneable
            Vx::Interface::Container
            Vx::Interface::Filter
            Vx::Interface::Publish
            Vx::Interface::Singleton
            Vx::Manipulation
            Vx::Manipulation::Container
            Vx::Metadata
            Vx::ObjectTree
            Vx::PathWalker
            Vx::Person
            Vx::Person::Contact
            Vx::Person::User
            Vx::Product
            Vx::Product::Container
            Vx::Product::Element
            Vx::Product::Type
            Vx::Profile
            Vx::Profile::Function
            Vx::Profile::Object
            Vx::Profile::Right
            Vx::Publication
            Vx::Purchase
            Vx::Purchase::Container
            Vx::Purchase::Element
            Vx::Purchase::Event
            Vx::Service::Account
            Vx::Service::Admin
            Vx::Service::DVD
            Vx::Service::Fulfillment
            Vx::Service::Purchase
            Vx::Service::Share
            Vx::Service::Storage
            Vx::Share
            Vx::Share::Event
            Vx::Share::Received
            Vx::Share::Sent
            Vx::SOAP
            Vx::SOAP::Daemon
            Vx::SOAP::DataFilter
            Vx::SOAP::DataStore
            Vx::SOAP::Dispatcher
            Vx::SOAP::Session
            Vx::Sound
            Vx::Sound::Manipulation
            Vx::Sound::Manipulation::Container
            Vx::Transaction::Container
            Vx::Transaction::Element
            Vx::Transaction::Processor
            Vx::Transaction::Processor::CC
            Vx::Transaction::Processor::CC::Datacash
            Vx::Transaction::Processor::Configurator
            Vx::Transaction::Processor::Configurator::Datacash
            Vx::Transaction::Processor::Null
            Vx::Upload::Event
            Vx::View
            Vx::View::Container
            Vx::View::Image
            Vx::View::Manager
            Vx::View::Sound
        )]
    }, 

    'PerlHP' => {
        name => 'PerlHP', 
        url => 'http://wakaba.c3.cx/perlhp/', 
        author => '!WAHa.06x36', 
        author_url => 'http://wakaba.c3.cx/', 
        modules => [qw(
            PerlHP
            PerlHP::Comments
            PerlHP::Utils
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
        author => 'Directi', 
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
        url => 'http://www.mainstreetsoftworks.com/', 
        author => 'Main Street Softworks', 
        author_url => 'http://www.mainstreetsoftworks.com/', 
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
if the module is not known. The information is returned as a hashref with 
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
        push @softs, {
            author => $softwares{$soft}{author}, name => $softwares{$soft}{name}, 
            url => $softwares{$soft}{url}, author_url => $softwares{$soft}{author_url}, 
        }
    }
    return @softs
}

=back

=head1 KNOWN THIRD-PARTY SOFTWARE

Here is the list of the third-party software know by this version of 
C<Module::ThirdParty>. 

=over 4

=item *

!WAHa.06x36 I<PerlHP> - L<http://wakaba.c3.cx/perlhp/>

=item *

Apache Foundation I<mod_perl 1.0> - L<http://perl.apache.org/>

=item *

Apple I<Perl/Objective-C bridge> - L<http://developer.apple.com/>

=item *

Autrijus Tang I<Version CoPy (VCP)> - L<http://search.cpan.org/dist/VCP-autrijus-snapshot/>

=item *

Best Practical I<Request Tracker> - L<http://bestpractical.com/rt/>

=item *

Brandon Long I<ClearSilver> - L<http://www.clearsilver.net/>

=item *

CAIDA I<GeoPlot Perl API> - L<http://www.caida.org/tools/visualization/geoplot/>

=item *

CAIDA I<NetGeo API> - L<http://www.caida.org/tools/utilities/netgeo/>

=item *

CyberSource I<CyberCash> - L<http://www.cybersource.com/support_center/implementation/downloads/>

=item *

I<CyberSource ICS> - L<http://www.cybersource.com/support_center/implementation/downloads/>

=item *

I<Directi Perl API> - L<http://manage.directi.com/kb/servlet/KBServlet/faq685.html>

=item *

Fidelia I<NetVigil> - L<http://www.fidelia.com/products/>

=item *

Fotango I<Vxw> - L<http://opensource.fotango.com/software/vx/>

=item *

Gemplus I<TLP Driver> - L<http://www.gemplus.com/techno/tlp_drivers/index.html>

=item *

Gisle Aas I<Perl::API> - L<http://search.cpan.org/dist/Perl-API/>

=item *

Grant McLean I<Sprog> - L<http://sprog.sourceforge.net/>

=item *

I<Interchange Payment Modules> - L<http://www.interchange.rtfm.info/downloads/payments/>

=item *

I<LinkPoint API> - L<https://www.linkpoint.com/viewcart/>

=item *

Logical Information Machines I<Market Information Machine> - L<http://www.lim.com/download/download_perl_api.html>

=item *

Main Street Softworks I<Main Street Credit Verification Engine (MCVE)> - L<http://www.mainstreetsoftworks.com/>

=item *

ManageIt I<perl4patrol> - L<http://www.manageit.ca/p_and_s/tools/perl4patrol/perl4patrol.html>

=item *

Nara Institute of Science and Technology I<ChaSen> - L<http://chasen.naist.jp/hiki/ChaSen/>

=item *

I<OpenECHO> - L<http://www.openecho.com/index.php?ba=downloads>

=item *

Paradata Systems I<OpenConnect> - L<http://www.paradata.com/tech/>

=item *

I<Perforce> - L<http://public.perforce.com/guest/tony_smith/perforce/API/Perl/index.html>

=item *

Progress Software I<Fathom Management Perl API> - L<http://psdn.progress.com/library/fathom/>

=item *

rfp.labs I<LibWhisker> - L<http://www.wiretrip.net/rfp/lw.asp>

=item *

rfp.labs I<LibWhisker2> - L<http://www.wiretrip.net/rfp/lw1.asp>

=item *

I<Roth Consulting's Perl Contributions> - L<http://www.roth.net/perl/>

=item *

Six Apart I<Movable Type> - L<http://www.sixapart.com/movabletype/>

=item *

I<Subversion> - L<http://subversion.tigris.org/>

=item *

I<Swish-e> - L<http://www.swish-e.org/>

=item *

TrustCommerce I<TCLink> - L<http://www.trustcommerce.com/>

=item *

US National Virtual Observatory I<VOTable> - L<http://www.us-vo.org/VOTable/>

=item *

VeriSign I<PayFlow Pro> - L<http://www.verisign.com/products-services/payment-processing/online-payment/payflow-pro/index.html>

=item *

I<VMware Perl API> - L<http://www.vmware.com/support/developer/perl-API/doc/>

=item *

Zeus Technology I< Zeus Web Server Perl Extensions> - L<http://support.zeus.com/doc/api/perl/>

=back

=head1 SEE ALSO

L<Module::CoreList>, L<CPANPLUS>, L<Parse::BACKPAN::Packages>

=head1 AUTHOR

SE<eacute>bastien Aperghis-Tramoni, E<lt>sebastien@aperghis.netE<gt>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-module-thirdparty@rt.cpan.org>, or through the web interface at
L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Module-ThirdParty>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2005 SE<eacute>bastien Aperghis-Tramoni, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Module::ThirdParty
