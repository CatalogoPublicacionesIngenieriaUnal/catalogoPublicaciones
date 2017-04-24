/*Tomado de http://themes.chriswatterston.com/accordion-menu/*/
// \\ General accordion events // \\
$(document).ready(function() {
	initMenu();
});
function initMenu() {
	$('#am_menu ul').hide();
	$('#am_menu li a').click(function() { // \\ Change .hover to .click if you want the menu to expand on click and not hover // \\
		$('#am_menu li ul li ul').show().addClass('am_deep_menu');
		var checkElement = $(this).next();
		if ((checkElement.is('#am_menu ul')) && (!checkElement.is(':visible'))) {
			$('#am_menu ul:visible').slideUp('slow');
			checkElement.slideDown('slow');
			return false;
		} else {
			$(this).unbind('click');
		}
	});
	$('#am_menu a').each(function() {
		if($(this).parent('li').children('ul').size() > 0) {
			$(this).append('<div id="am_menu_is_parent"></div>');
        }
    });
}

$(document).ready(function() {
	var pathname = window.location.pathname;
	var selecteda = $(".nav-selected a").attr("href");
	if ( selecteda == pathname ){
		$('.nav-path-selected').parent().children().show();
		$('#am_menu li ul li ul').addClass('am_deep_menu');
	}
	if ($('#am_menu ul li').has('ul')) {
		$('#am_menu ul li').addClass('am_dropdown');
		$('#am_menu ul li ul').addClass('am_dropdown_stop');
	}
});