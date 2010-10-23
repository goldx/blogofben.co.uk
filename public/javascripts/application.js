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
