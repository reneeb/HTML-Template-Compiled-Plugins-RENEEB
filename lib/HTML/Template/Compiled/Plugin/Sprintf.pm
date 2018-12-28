package HTML::Template::Compiled::Plugin::Sprintf;

# ABSTRACT: Use sprintf in HTML::Template::Compiled templates

use strict;
use warnings;

use HTML::Template::Compiled;
HTML::Template::Compiled->register(__PACKAGE__);

our $VERSION = '0.03';

sub register{
    my ($class) = @_;
    my %plugs   = (
        escape => { 
            SPRINTF_30_LEFT => \&escape_sprintf_30_left,
            SPRINTF_6_RIGHT => \&escape_sprintf_6_right,
            SPRINTF_8_RIGHT => \&escape_sprintf_8_right,
        },
    );

   return \%plugs;
}

sub escape_sprintf_30_left {
    my ($escaped) = @_;
    return unless defined $escaped;

    my $string = sprintf "%-30s", $escaped;

    return $string;
}

sub escape_sprintf_6_right {
    my ($escaped) = @_;
    return unless defined $escaped;

    my $string = sprintf "%6s", $escaped;

    return $string;
}

sub escape_sprintf_8_right {
    my ($escaped) = @_;
    return unless defined $escaped;

    my $string = sprintf "%8s", $escaped;

    return $string;
}

1;

=head1 DESCRIPTION

Sometimes, you need formatted text (e.g. in mails) and you want to use sprintf.
This module provides 30 sprintf formatters for templates.

=head1 SYNOPSIS

  use HTML::Template::Compiled;
  
  my $template_sprintf_8 = '<%= test ESCAPE=SPRINTF_8_RIGHT %>';
  my $text               = 'hello';
  
  my $tmpl = HTML::Template::Compiled->new(
      scalarref => \$template_sprintf_8,
      plugin    => [ 'HTML::Template::Compiled::Plugin::Sprintf' ],
  );
  
  $tmpl->param( test => $text );
  my $output = $tmpl->output;

=head1 ESCAPES

=over 4

=item SPRINTF_8_RIGHT

=item SPRINTF_6_RIGHT

=item SPRINTF_20_LEFT

=back

=head1 METHODS

=head2 register

=head2 escape_sprintf_6_right

=head2 escape_sprintf_8_right

=head2 escape_sprintf_30_left

=cut
