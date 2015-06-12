var main = function() {
  $('.icon-menu').click(function() {
    $('.menu').animate({
      left: "0px"
    }, 200);

    $('body').animate({
      left: "285px"
    }, 200);
  });


  $('.icon-close').click(function() {
    $('.menu').animate({
      left: "-285px"
    }, 200);

    $('body').animate({
      left: "0px"
    }, 200);
  });
};






var c=0, words=['marriage','birthday','annual dinner','school'];


function loop(){
  $('h2 span').delay(1000).fadeTo(300,0,function(){
     $(this).text( words[++c%words.length]).fadeTo(300,1,loop);
  });
}

loop();


$(document).ready(main);