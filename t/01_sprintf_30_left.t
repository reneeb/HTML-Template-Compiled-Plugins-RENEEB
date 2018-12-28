#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use HTML::Template::Compiled;

my $template_sprintf_30 = '<%= test ESCAPE=SPRINTF_30_LEFT %>';
my $text                = 'hello world'; 

my $tmpl = HTML::Template::Compiled->new(
    scalarref => \$template_sprintf_30,
    plugin    => [ 'HTML::Template::Compiled::Plugin::Sprintf' ],
);

$tmpl->param( test => $text );
my $output = $tmpl->output;

is $output, 'hello world                   ', 'sprintf_30_left';

$tmpl->param( test => undef );
my $undef_output = $tmpl->output;

is $undef_output, '';

done_testing();
