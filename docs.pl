#!/usr/bin/perl

use v5.12;
use strict;
use warnings;
use Cwd;

for (shift) {
    if (!defined) {
        print "No command given, use $0 help for help.\n";
    } elsif ($_ eq "help") {
        print "$0 help\n\n";
        print "help          Show this help\n";
        print "build         Publish the documentation.\n";
        print "serve [wiki]  Serve one of the wikis locally\n";
    } elsif ($_ eq "build") {
        system('git branch -D gh-pages');
        opendir(my $DIR, 'wiki') || die "Failed to open wiki dir: $!";
        while (my $wiki = readdir $DIR) {
            next unless rindex $wiki, '.', 0;
            print "Building wiki $wiki\n";
            mkdocs($wiki, 'mike', 'deploy', '-u', '-b', 'gh-pages', '--ignore', '-m', "$wiki wiki", "$wiki");
        }
        closedir($DIR);
        mkdocs('libx', 'mike', 'set-default', '-b', 'gh-pages', '--ignore', '-m', 'Default redirect', 'libx')
    } elsif ($_ eq "serve") {
        die 'serve requires an argument' unless $#ARGV + 1;
        mkdocs(shift, 'mkdocs', 'serve');
    } else {
        die "Unknown command: $_\n";
    }
}

sub mkdocs {
    my $wiki = shift;
    system('rm -rf build') && die "Failed to delete build directory: $!";
    system('mkdir build') && die "Failed to create build directory: $!";
    system('cp -ra theme build/') && die "Failed to copy theme: $!";
    system("cp -ra wiki/$wiki/* build/") && die "Failed to copy wiki: $!";
    open(my $FILEOUT, '>', 'build/mkdocs.yml') || die "Failed to open mkdocs.yml: $!";
    open(my $FILEIN, '<', "wiki/$wiki/mkdocs.yml") || die "Failed to read wiki meta for $wiki: $!";
    { local $/; print $FILEOUT (<$FILEIN>); }
    close($FILEIN);
    print $FILEOUT "\n\nedit_uri: https://github.com/ModdingX/WikiX/edit/master/wiki/$wiki/docs\n\n";
    open($FILEIN, '<', 'mkdocs.yml') || die "Failed to read main wiki meta: $!";
    { local $/; print $FILEOUT (<$FILEIN>); }
    close($FILEIN);
    close($FILEOUT);
    
    my $cwd = cwd();
    my $PATH = $ENV{PATH};
    $ENV{PATH} = "$cwd/venv/bin:" . $ENV{PATH};
    chdir('build');
    my $code = system(@_);
    $ENV{PATH} = $PATH;
    chdir($cwd);
    die "mkdocs failed with exit code $code" unless $code == 0;
}
