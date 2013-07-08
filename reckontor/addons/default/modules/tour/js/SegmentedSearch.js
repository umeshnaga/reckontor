window.Viator = window.Viator || {};

/**
 * Segmented Autocomplete Search Component.
 * 
 * @author apoudel
 * @created 28/11/2012
 */
Viator.SegmentedSearch = function() {

	var arrowIndex = -1;

	var hoverItemIndex = -1;

	var inited = false;
	var visible = false;

	var minLength = 2;
	var id = 'freeTextKeyword';
	var delay = 0;

	var URL = SITE_URL + 'tour/search_keyword_ajax/';

	var cache = {};

	/*
	 * previous keywords typed by user. used primarily to detect if the entered
	 * character is space and trimmed keyword is the same as the last keyword.
	 * note: this var has no other purpose and gets reset when focus is lost on
	 * the input element.
	 */
	var previousKeyword;

	/* the keyword used for search */
	var keyword;
	var htmlStrippedKeyword;

	// var INVALID_CHARS_PATTERN=/[\&\*\#\^\$]+/g;
	var INVALID_CHARS_PATTERN = /[\*\#\^\$\&]+/g;
	// var INVALID_WORDS=/(update|delete)/ig;

	var DEFAULT_ITEM_CSS_HOVER_CLASS = 'segmented-search-item-hover';
	var FIND_MORE_ITEM_CSS_HOVER_CLASS = 'segmented-search-find-more-item-hover';

	function escapeRegExp(str) {
		return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
	}

	function stripHTML(str) {
		return str.replace(/<[^>]*>/gm, '');
	}

	function sanitizeKeyword(keyword) {
		htmlStrippedKeyword = $.trim(stripHTML(keyword));
		return escapeRegExp(htmlStrippedKeyword.replace(INVALID_CHARS_PATTERN,
				''));
	}

	function sendRequest(_keyword, callback, url, requestId) {

		// strip special characters. Which isn't really necessary but will do it
		// nevertheless
		// term=term.replace(INVALID_CHARS_PATTERN,'');
		// term=$.trim(term);
		keyword = sanitizeKeyword(_keyword);

		if (keyword.length < minLength) {
			callback([]);
			return;
		}

		if (cache[keyword]) {
			callback(cache[keyword]);
			return;
		}

		$.ajax({
			url : url ? url : URL + encodeURIComponent(keyword),
			type : 'get',
			cache : true,
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',

			success : function(response) {

				var items = createAutoCompleteItems(response);

				// only dispaly suggestion box if there are any results
				if (items.length == 1 && items[0].category == 'moreResults') {
					items = [];
				}
				// 
				cache[keyword] = items;
				callback(items);

			},
			error : function(jqXHR, textStatus, errorThrown) {
				if (window.console) {
					console.log('SeggmentedSearch._sendRequest error occured:'
							+ textStatus);
				}
			}
		});

		previousKeyword = keyword;
	}

	function createAutoCompleteItems(response) {

		var segments = {
			tours : {
				"category" : "TOURS & ACTIVITIES",
				items : response["products"]
			},
			destinations : {
				"category" : "POPULAR DESTINATIONS",
				items : response["destinations"]
			},
			search : {
				"category" : "moreResults",
				items : response["moreResults"]
			}
		};

		var autoCompleItems = [];
		for ( var key in segments) {
			var segment = segments[key];
			if (segment.items && segment.items.length > 0) {
				for ( var index in segment.items) {
					var item = segment.items[index];
					item.label = item.title;
					item.category = segment.category;
					item.value = item.id;
					autoCompleItems.push(item);
				}
			}

		}

		return autoCompleItems;

	}

	function applyHoverEffect(item) {

		if ($(item).hasClass('find-more-results')) {
			$(item).addClass(FIND_MORE_ITEM_CSS_HOVER_CLASS);
		} else {
			$(item).addClass(DEFAULT_ITEM_CSS_HOVER_CLASS);
		}
	}

	function removeHoverEffect(item) {

		if ($(item).hasClass('find-more-results')) {
			$(item).removeClass(FIND_MORE_ITEM_CSS_HOVER_CLASS);
		} else {
			$(item).removeClass(DEFAULT_ITEM_CSS_HOVER_CLASS);
		}
	}

	function onKeyBoardAction(evt) {

		var pointer = arrowIndex;

		var preventDefault = false;

		var keyCode = evt.keyCode;
		if (keyCode != 38 && keyCode != 40 && keyCode != 13)
			return true;

		var items = $('#segmented-search-container .ui-autocomplete-item a');

		switch (keyCode) {
		case 38: // up
			pointer--;
			break;
		case 40: // down
			pointer++
			break;
		case 13:
			if (arrowIndex == -1 || arrowIndex <= items.size())
				return true;
			else
				evt.preventDefault();
			preventDefault = true
			break;
		}

		if (items.size() == 0) {
			evt.preventDefault();
			arrowIndex = -1;
			return false;
		}

		if (arrowIndex > -1 && arrowIndex < items.size()) {
			var item = items.get(arrowIndex);
			removeHoverEffect(item);
		}

		if (hoverItemIndex > -1 && hoverItemIndex < items.size()) {
			var item = items.get(hoverItemIndex);
			removeHoverEffect(item);
			pointer = parseInt(hoverItemIndex) + (keyCode == 38 ? -1 : 1);
		}

		if (pointer >= items.size()) {
			pointer = items.size() - 1;
		} else if (pointer < 0) {
			pointer = 0;
		}
		var item = items.get(pointer);
		if (keyCode == 13) {
			if (visible && item && item.url) {
				document.location.href = item.href;
				return false;
			} else {
				$($($('#' + id)).parents('form:first')).submit();
				// ($('#'+id).get(0).form).submit();
			}
			return true;
		} else {
			applyHoverEffect(item);

			// $(item).addClass('segmented-search-item-hover');
		}

		// evt.preventDefault();
		arrowIndex = pointer;

		hoverItemIndex = -1;

		return !preventDefault;
	}

	function setUpEventhandlers() {

		// add keyboard keys listener
		$('#' + id).keydown(function(evt) {

			return onKeyBoardAction(evt);

		});

		// reset previous keyword on blur.

		$('#' + id).blur(function(evt) {

			previousKeyword = null;

		});

		$(".segmented-search a")
				.live(
						'mouseover',
						function() {

							applyHoverEffect(this);

							if (arrowIndex > 0) {

								var items = $('#segmented-search-container .ui-autocomplete-item a');

								if (arrowIndex > -1
										&& arrowIndex < items.size()) {

									var lastHoverItem = $(items.get(arrowIndex));
									removeHoverEffect(lastHoverItem);
									// lastHoverItem.removeClass('segmented-search-item-hover');

									// check if the last item selected using
									// arrow keys is the same as the current
									// hover item.
									// if it is same add the class again as so
									// the mouseover style is reapplied
									if (lastHoverItem.attr('index') == $(this)
											.attr('index'))
										applyHoverEffect(lastHoverItem);
								}
							}
							arrowIndex = -1;
							var _tmp = this;
							var x = $(_tmp).attr('index');
							hoverItemIndex = parseInt($(this).attr('index'));

						});

		$(".segmented-search a").live('mouseout', function() {
			arrowIndex = -1;
			removeHoverEffect(this);

		});

	}

	return {

		/**
		 * 
		 * @param {Object}
		 *            config Configuration Object Literal<br>
		 *            <b>config.minLength {Integer}:</b> The minimum charachers
		 *            that should be entered before Autocomplete kicks in.<br>
		 *            Defaults is 2.<br>
		 *            <b>config.id {String}:</b> The textbox id to attach
		 *            autocomplete to. <b>config.delay {Integer}:</b> The delay
		 *            in seconds before autocomplete kicks in. Default 0.
		 * 
		 */
		init : function(config) {

			if (inited) {
				// Already inited.problem due to duplicate console.js
				// include.Should not be issue when calling from optimizely
				// though
				return;
			}

			if (config) {

				if (config.minLength) {
					minLength = config.minLength;
				}
				if (config.id) {
					id = config.id;
				}

				if (config.delay) {
					delay = config.delay;
				}
			}

			$
					.widget(
							"custom.catcomplete",
							$.ui.autocomplete,
							{
								_renderMenu : function(ul, items) {

									var self = this;
									$(ul).addClass("segmented-search");
									// var keyword=$('#'+id).val();

									var currentCategory = "";
									$
											.each(
													items,
													function(index, item) {
														if (item.category != currentCategory) {

															if (item.category != 'moreResults') {
																ul
																		.append('<li class="ui-autocomplete-category"><i class="icon icon-arrow-south-west"></i>'
																				+ item.category
																				+ "</li>");
															}
															currentCategory = item.category;
														}

														self
																._renderItem(
																		ul,
																		item,
																		htmlStrippedKeyword,
																		index);

													});
									if (items.length > 0) {
										visible = true;
									}
								}
							});

			$(document.body)
					.append(
							'<div id="segmented-search-container" style="position:absolute;"></div>');

			$('#' + id).catcomplete({
				minLength : minLength,
				delay : delay,
				appendTo : '#segmented-search-container',
				focus : function(event, ui) {
					// prevent the plugin from automatically setting value of
					// search box to item.id
					event.preventDefault(); // Prevent the default focus
											// behavior.
				},
				source : function(request, callback) {
					visible = false;
					arrowIndex = -1;
					hoverItemIndex = -1;

					sendRequest(request.term, callback);

				},
				select : function(a, b) {
					document.location.href = SITE_URL + b.item.url;
					return false;
				},
				open : function(event, ui) {

					var off = $('.ui-autocomplete').offset();
					var ul = $($('.ui-autocomplete').get(0));
					var left = off.left;
					$('.ui-autocomplete').css({
						'left' : left + 'px',
						'max-width' : $('#freeTextSearchDiv').outerWidth(true) + 'px'
					});

				}
			}).data("catcomplete")._renderItem = function(ul, item, keyword,
					index) {
				var title = item.label.replace(new RegExp("(" + keyword + ")",
						"gi"), '<b style="font-weight:bold">$1</b>');

				if (item.category == 'moreResults') {
					$(
							'<li class="ui-autocomplete-item ui-autocomplete-search"></li>')
							.data("item.autocomplete", item)
							.append(
									'<a id="find-more-results" class="find-more-results" index="'
											+ index
											+ '" href="'
											+ item.url
											+ '"><i class="icon icon-search-alt"></i> Find more results for "<b style="font-weight:bold !important;">'
											+ htmlStrippedKeyword /* decodeURIComponent(htmlStrippedKeyword) */
											+ '<b>"</a></li>').appendTo(ul);

				} else {
					$('<li class="ui-autocomplete-item"></li>')
							.data("item.autocomplete", item)
							.append(
									'<a index="'
											+ index
											+ '" href="'
											+ item.url
											+ '">'
											+ title
											+ '<span class="ui-autocomplete-item-destination">'
											+ item.dest + '<span></a>')
							.appendTo(ul);
				}
			};

			setUpEventhandlers();

			inited = true;

		},
		/*
		 * temporary hook to disable autocomplete for ab testing.
		 * 
		 */
		destroy : function() {

			$('#' + id).catcomplete("destroy");
			$('#' + id).unbind();// remove custom handlers keydown and blur

		}
	}

}();
