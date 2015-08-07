$(document).ready(function () {
            $('#tomorrow').hide();
            $('#this-week').hide();

  getUserAvatar($('#hidden-user').html(), "github-avatar" );
  getUserAvatar($('#hidden-pair').html(), "pair-avatar" );


  $('#today-btn').click(function () {
    $('#today').show();
    $('#tomorrow').hide();
    $('#this-week').hide();
  });

  $('#tomorrow-btn').click(function () {
    $('#tomorrow').show();
    $('#today').hide();
    $('#this-week').hide();
  });

  $('#week-btn').click(function () {
    $('#this-week').show();
    $('#today').hide();
    $('#tomorrow').hide();
  });
});

function getUserAvatar(github, imageclass){
  var url = 'https://api.github.com/users/' + github ;
  var response = $.get(url).done(function() {
    var avatar = response.responseJSON.avatar_url
    $("." + imageclass).prepend('<img src='+avatar+'&s=200 />');
  });
};

