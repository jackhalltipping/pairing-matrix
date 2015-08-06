$(document).ready(function () {
            $('#tomorrow').hide();
            $('#this-week').hide();


  $('#today-btn').click(function () {
    console.log('hello');
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
