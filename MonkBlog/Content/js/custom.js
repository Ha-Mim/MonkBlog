/* NAV ELEMENTS */
$(document).ready(function() {
	if ($(window).width() > 767) {
    $('li:has(ul)').addClass('dropdown');
	$('li:has(ul)').children('a').addClass('dropdown-tg');
	$('li ul li').children('a').removeClass('dropdown-tg');
	}
});

/* CONTACT FORM */
/* FORM VALIDATION JAVASCRIPT */
$(document).ready(function() {
	$('form#contact-form').submit(function() {
		$('form#contact-form .alert').remove();
		var hasError = false;
		$('.requiredField').each(function() {
			if(jQuery.trim($(this).val()) == '') {
            	var labelText = $(this).prev('span').text();
            	$(this).addClass('input-error');
            	$(this).parent().find('span').addClass('input-error');
            	hasError = true;
            } else if($(this).hasClass('email')) {
            	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            	if(!emailReg.test(jQuery.trim($(this).val()))) {
            		var labelText = $(this).prev('span').text();
            		$(this).addClass('input-error');
            	$(this).parent().find('span').addClass('input-error');
            		hasError = true;
            	}
            }
		});
		if(!hasError) {
			$('form#contact-form .btn-submit').fadeOut(1, function() {
				$(this).parent().append('<input tabindex="5" value="Sending..." class="btn-submit btn">');
			});
			var formInput = $(this).serialize();
			$.post($(this).attr('action'),formInput, function(data){
				$('form#contact-form').slideUp("fast", function() {
					$(this).before('<div class="alert alert-success">Your email was successfully sent!</div>');
				});
			});
		}

		return false;

	});
});

$(document).ready(function(){
   $("[rel='tooltip']").tooltip();
});

$(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto();
});

function is_touch_device() {
  return !!('ontouchstart' in window) // works on most browsers 
	  || !!('onmsgesturechange' in window); // works on ie10
};

$(document).ready(function (){  
	if (!is_touch_device() && $(window).width() > 767) {
	var topbar = $("#top-bar").height();
	$('.header-top-wrap').scrollToFixed({
			preFixed: function()  {
				$('.header-top-wrap').addClass("nav-fixed");
					$(document).scroll(function(){
						if ($(document).scrollTop() > topbar+100 ) {
								$('.header-top-wrap .container').css({
										'padding-top' : '15px',
										'padding-bottom' : '15px'
										});
							} 
							else {
								$('.header-top-wrap .container').css({
										'padding-top' : '35px',
										'padding-bottom' : '35px'
										});
								}
						})
					},
			postFixed: function() {$('.header-top-wrap').removeClass("nav-fixed")
			}
	})
	}
});

$(document).ready(function (){   
	 $(".fit-vid").fitVids();
});

$(document).ready(function (){   
	$('.animation').waypoint(function() {
		$(this).addClass('animated').css('opacity','1');
	}, { offset: '70%' })
});

/* TWITTER WIDGET */
$(document).ready(function() { 
$('.widget-twitter').tweet({
			modpath: 'js/twitter/',
			username: 'envato',
			join_text: null,
			avatar_size: null,
			count: 3,
			loading_text: 'loading twitter feed...',
			template: "{text}<br>{time}"
	});
});

$(window).load(function(){  
	// cache container
	var $container = $('#portfolio-page');
	// initialize isotope
	$container.isotope({
	  // options...
	});
	
	// filter items when filter link is clicked
	$('#filters a').click(function(){
	  var selector = $(this).attr('data-filter');
	  $container.isotope({ filter: selector });
	  
	  //active classes
	  $('#filters li a').removeClass('active');
	  $(this).addClass('active');
	  
	  return false;
	});
	
	if ( is_touch_device() ) {
	$('#sort-portfolio').click(function(){
	  $('#filters').toggle(1);
	  return false;
		})
	}

});
