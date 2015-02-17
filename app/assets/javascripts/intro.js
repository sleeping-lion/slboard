//= require application
//= require fancybox
//= require jquery.easing
//= require plugin/jquery.uri.js

$(document).ready(function() {
    $("a.simple_image").fancybox({
        'opacity'   : true,
        'overlayShow'        : true,
        'overlayColor': '#000000',
        'overlayOpacity'     : 0.9,
        'titleShow':true,
        'openEffect'  : 'elastic',
        'closeEffect' : 'elastic'
      });
      
  $("#sl_gallery_slide .item a").click(function(){
    var galleryId=$.uri.setUri($(this).attr('href')).param("id");
  
    $.get('/intro_photos/'+galleryId+'.json',function(data){
      
      $("#sl_gallery_left a").attr('href',data.photo.url).attr('title',data.title);
      $("#sl_gallery_left span").text(data.title).css('bottom',-30);
      $("#sl_gallery_left img").attr('src',data.photo.large_thumb.url).animate({ opacity: "1" }, 400,function(){  $("#sl_gallery_left span").animate({bottom:0,opacity:'0.8'},400)});
      $("#sl_gallery_menu a:first").attr('href','/intro_photos/'+data.id+'/edit');
      $("#sl_gallery_menu a:eq(1)").attr('href','/intro_photos/'+data.id);
    });
    
    return false;
  });  

  $('.scrollable').scrollable({circular: true, mousewheel: true}).navigator().autoscroll({interval: 3000});
});