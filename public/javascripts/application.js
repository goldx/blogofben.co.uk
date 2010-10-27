// Google Analytics

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-19317363-1']);
_gaq.push(['_trackPageview']);

(function() {
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();



// jQuery

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

jQuery(function() {
  
  $('.article .article_content').append('<div class="comments" style="display: none;"></div>');
  
  $(".show-comment-link").click(function(e) {
    $.get(this.href, null, null, "script");
    return false;
  })
  
  $('#new_comment').live("submit", function(e) {
    $.post($(this).attr("action"), $(this).serialize(), null, "script");
    return false;
  })
  
});
