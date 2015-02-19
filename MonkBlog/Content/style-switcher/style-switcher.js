

$.stylesheets = (function () {
    var stylesheets,
        add,
        clear;

    add = function (cssfile) {
        $('head').append('<link class="switch" href="' + cssfile + '" rel="stylesheet" />');
        return stylesheets;
    };

    addbg = function (stylebg) {
        $('head').append('<style class="preview-bg">.preview-boxed { background: ' + stylebg +' !important; }</style>');
        return stylesheets;
    };

    clear = function () {
        $('head link[class=switch]').remove();
        $('head style[class=preview-bg]').remove();
		$('body').removeClass("preview-boxed");	  
		$(window).resize();
        return stylesheets;
    };
	
    return stylesheets = {
        add: add,
		addbg: addbg,
        clear: clear
    };
} ());



$(document).ready(function (){  
	function is_touch_device() {
	  return !!('ontouchstart' in window) // works on most browsers 
		  || !!('onmsgesturechange' in window); // works on ie10
	};
	
	if ( !is_touch_device() && $(window).width() > 920) {
			
			 $('.style-switcher').pep({ constrainTo: 'window', useCSSTranslation: false });
		} else {
			$('.style-switcher').css("display","none");
			 }

});


$(window).ready(function(){

   
  $('.ss-open').click(function () {
	  $('.ss-open i').toggleClass("icon-chevron-up icon-chevron-down");
	  $('.ss-header').toggleClass("ss-header-open");
	  $('.ss-body').slideToggle();
	  return false;
  });
  
$('#ss-boxed a').click(function() {
    $('body').addClass("preview-boxed");	  
	$(window).resize();
	return false;	  
})
  
$('#ss-wide a').click(function() {
	
    $('body').removeClass("preview-boxed");		  
	$(window).resize();
	return false;
	
})

  
$('.ss-width li a').click(function()
{
  $('.ss-width li').removeClass('ss-active');
  $(this).parent().addClass('ss-active');
  

  if ( $('#ss-boxed').hasClass('ss-active')) {
		  $('.ss-background-wrap').slideDown();
	  } else {
		  $('.ss-background-wrap').slideUp();
		}
	
});
  
$('.ss-color li a').click(function()
{
  $('.ss-color li').removeClass('ss-active');
  $(this).parent().addClass('ss-active');
});

$('.ss-background li a').click(function()
{
  $('.ss-background li').removeClass('ss-active');
  $(this).parent().addClass('ss-active');
});
  

	
$('.ss-color a').click(function () {
	$.stylesheets.add($(this).attr('rel'));
	return false;

});	

$('.ss-background a').click(function () {
	$.stylesheets.addbg($(this).attr('rel'));
	return false;

});

$('.style-switcher .ss-reset').click(function () {
	$.stylesheets.clear();
	$('.ss-body li').removeClass('ss-active');
	$('.ss-body li:first-child').addClass('ss-active');
	$('.ss-background-wrap').slideUp();
	return false;

});  

   
});



