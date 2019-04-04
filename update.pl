#!/usr/bin/perl -w

# Update all the markdown files that generate web pages to redirect to our new domain
#
# Expectations:
#    * All pages are all in the events, pages, and resources directories
#    * All pages are "page" layout and have a yaml open and close front matter
#
# Note: This doesn't handle index.md pages or root pages completely properly, 
#       those have to be manually tweaked.

my @filenames;

for my $f ("events", "pages", "resources") {
    push @filenames, `find $f -name "\*md"`;
}

# Stdout returns line endings, so remove them
chomp @filenames;

for my $filename (@filenames) {
    open my $infile, "<", $filename or die "Unable to open file '$filename'";
    my @lines = <$infile>;
    chomp @lines;
    close $infile;
    
    if ($lines[0] ne '---') {
	print "$filename: First line is not front matter?\n";
	print "$filename: $lines[0]\n";
	print "$filename: Skipping...\n";
	next;
    }

    my $endmatter = 0;
    for (my $i = 1; $i < scalar(@lines); $i += 1) {
	if ($lines[$i] eq '---') {
	    $endmatter = $i;
	    last;
	}
    }
    
    if ($endmatter == 0) {
	print "$filename: No endmatter found?\n";
	print "$filename: Skipping...\n";
	next;
    }
    
    print "Converting $filename...\n";
    
    my $url_base = 'http://innersourcecommons.org';
    my $url_part = '/' . substr($filename,0,-3) . '/';

    # Handle special cases for 'pages' and 'pages/pages_root_folder'
    #        directories, as well as index files
    # Using | (pipe) as separator to avoid lots of escaping in regex
    $url_part =~ s|/pages/pages-root-folder/|/|;
    $url_part =~ s|/pages/|/|;
    $url_part =~ s|/index/|/|;
    
    my $url = $url_base . $url_part;
    my $redirect = "redirect_to:\n    - $url";
    my $permalink = 'permalink: "' . $url_part . '"';

    my $layout = 'layout: redirect';
    
    push my @newlines, '---', $layout, $permalink, $redirect, '---', '';

    open my $outfile, ">", $filename or die "Unable to open '$filename' for writing: $!";
    print $outfile join("\n", @newlines);
    close $outfile;

    print "Done\n\n";

}
