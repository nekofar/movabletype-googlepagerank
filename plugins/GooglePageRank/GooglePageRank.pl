# GooglePageRank plugin for Movable Type
# Author: Milad Nekofar (http://www.nekofar.com)
# Released under the Artistic License
#
# $Id$

package MT::Plugin::GooglePageRank;

use strict;
use MT::Plugin;
use WWW::Google::PageRank;

my $plugin = MT::Plugin->new ({
	name => '<MT_TRANS phrase="Google PageRank">',
	version => '0.1',
	description => '<MT_TRANS phrase="This plugin allow you add the Google PageRank of the current blog into your pages.">',
	author_name => '<MT_TRANS phrase="Milad Nekofar">',
	author_link => 'http://weblog.nekofar.com/',
	l10n_class => 'GooglePageRank::L10N',
});
	
MT->add_plugin($plugin);
use MT::Template::Context;
MT::Template::Context->add_tag ('GooglePageRank',\&google_page_rank);
sub google_page_rank {
        my $blog = MT->instance->blog;
        my $url = $blog->site_url;
		my $page_rank = WWW::Google::PageRank->new;
 		$page_rank = scalar($page_rank->get($url));
 		return $page_rank;
}