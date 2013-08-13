#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$gtkmm_version = "2.24.4";
$major = 2;
$minor = 24;
$micro = 4;
$binary_age = 2404;
$interface_age = 0;
$current_minus_age = 0;
$gtkmm_module_name = "libgtkmm-2.24";
$gdkmm_module_name = "libgdkmm-2.24";
$exec_prefix = "lib";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@PACKAGE_VERSION@/$gtkmm_version/g;
	    s/\@ATK_API_VERSION@/$atk_api_version/g;
	    s/\@PANGO_API_VERSION@/$pango_api_version/g;
	    s/\@GLIB_API_VERSION@/$glib_api_version/g;
	    s/\@GTK_API_VERSION@/$gtk_api_version/g;
	    s/\@GDK_PIXBUF_API_VERSION@/$gdk_pixbuf_api_version/g;
	    s/\@GTKMM_MAJOR_VERSION\@/$major/g;
	    s/\@GTKMM_MINOR_VERSION\@/$minor/g;
	    s/\@GTKMM_MICRO_VERSION\@/$micro/g;
	    s/\@GTKMM_INTERFACE_AGE\@/$interface_age/g;
	    s/\@GTKMM_BINARY_AGE\@/$binary_age/g;
	    s/\@GDKMM_MAJOR_VERSION\@/$major/g;
	    s/\@GDKMM_MINOR_VERSION\@/$minor/g;
	    s/\@GDKMM_MICRO_VERSION\@/$micro/g;
	    s/\@GDKMM_INTERFACE_AGE\@/$interface_age/g;
	    s/\@GDKMM_BINARY_AGE\@/$binary_age/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@GTKMM_MODULE_NAME@/$gtkmm_module_name/g;
	    s/\@GDKMM_MODULE_NAME@/$gdkmm_module_name/g;
	    s/\@PERL@/$perl_path/g;
	    s/\@prefix@/$exec_prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@datarootdir@/$data_root_dir/g;
	    s/\@M4@/$m4_path/g;
	    s/\@libdir@/$generic_library_folder/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@AtkmmBuildRootFolder@/$atkmm_build_root_folder/g;
	    s/\@GlibmmBuildRootFolder@/$glibmm_build_root_folder/g;
	    s/\@PangommBuildRootFolder@/$pangomm_build_root_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    print OUTPUT;
	}
}

process_file ("gtk/gtkmmconfig.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("gdk/gdkmmconfig.h");
	process_file ("build/msvc/gtkmm.vsprops");
}