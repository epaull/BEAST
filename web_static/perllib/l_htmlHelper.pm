#!/usr/bin/perl -w
#Author:            Sam Boyarsky (xenicson@gmail.com)
#Create Date:       03.14.2008
#Location:          /projects/sysbio/www/cgi-bin/Sam/htmlHelper.pm

package l_htmlHelper;

use strict; 
use warnings;
use English;
use Pod::Usage;
use CGI qw(:standard);
use CGI;
use CGI::Carp qw(fatalsToBrowser);

our @ISA		= qw(Exporter);
#our @EXPORT	= qw(printHeader printFooter $WEB_ROOT $WEB_CGI $WEB_STATIC $WEB_TEMP $PATH_CGI $PATH_STATIC $PATH_TEMP $TEMP_CHMOD );
#our @EXPORT	= qw(printHeader printFooter WEB_ROOT WEB_CGI WEB_STATIC WEB_TEMP PATH_CGI PATH_STATIC PATH_TEMP TEMP_CHMOD );
our @EXPORT		= qw(printHeader printFooter DEBUG beginSection endSection);
our @EXPORT_OK	= qw();
our $VERSION	= 1.00;



use constant WEB_ROOT		=> 'http://users.soe.ucsc.edu/~samb/metatrans/';
#use constant WEB_CGI		=> 'scripts/';
use constant WEB_STATIC		=> '~samb';
use constant WEB_TEMP		=> 'samb/temp';
use constant PATH_CGI		=> '/cse/grads/samb/.html/metatrans';
use constant DEBUG			=> 0;

$OUTPUT_AUTOFLUSH = 1; # Flush standard output immediately.  (maybe could be written as $| or $AUTOFLUSH ???)
    
sub printHeader($)
{
    my($title) = @_;
    print header;   # is roughly equivilant to this line: print "Content-Type: text/html; charset=ISO-8859-1\n\n";
    #print "<html xmlns='http://www.w3.org/1999/xhtml' lang='en-US' xml:lang='en-US'>\n";
    print "<html>\n";
    print "<head>\n";
    print "<title>$title</title>\n";
    print "<script type='text/javascript' src='".WEB_ROOT."js/prototype.js?&ts=".time."'></script>\n";
    print "<script type='text/javascript' src='".WEB_ROOT."js/ajaxHelper.js?&ts=".time."'></script>\n";
    print "<script type='text/javascript' src='".WEB_ROOT."js/metatrans.js?&ts=".time."'></script>\n";
    print "<link rel='stylesheet' type='text/css' href='".WEB_ROOT."css/metatrans_style.css'/>";
    print "</head>\n";
    print "<form>\n";    #do we need to name the form or anything???????
    
}

sub printFooter()
{
    print "</form>\n";
    print "</body>\n";
    print "</html>\n";
}

sub beginSection($$)
{
	my($section, $display) = @_;
	my $arrow = $display ? "images/down_arrow.png" : "images/right_arrow.png";
	$display = $display ? "block":"none";
	print "<div id='$section' onclick=\"swapDiv2('$section\_content', '$section\_arrow');\" class='expandable_header'><h3><img id='$section\_arrow' src='$arrow' height='10px' width='10px'>&nbsp;$section</h3></div>\n";
	print "<div id='$section\_content' style='display:$display'>\n";

}

sub endSection($)
{
	my($section) = @_;
	print "</div> <!-- end $section -->\n";
}