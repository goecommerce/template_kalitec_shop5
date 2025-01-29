/**
 * Support Snippet Class
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template#cmsanchor-drops_javascripteindreamteam
 * @generator https://kreativkonzentrat.de/Drop-Builder
 */
(function($) {
	var GOE_SupportSnippet = function(elem, options) {
		this.init(elem, options);
	};

	GOE_SupportSnippet.prototype = {
		init: function(elem, options) {
			this.$elem = $(elem);
			this.options = $.extend({}, options);
			// Initialize your Drop here
		}
	};

	window.GOE_SupportSnippet = GOE_SupportSnippet;
})(jQuery);