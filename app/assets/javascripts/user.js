$(document).ready(function() {
  // cohort gallery and blacklist boxes
  var $usercard = $( ".user-container" ),
    $blacklist = $( ".blacklist" );

  // let the users be draggable
  $( ".individual-card", $usercard ).draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move"
  });

  // let the blacklist be droppable, accepting the users
  $blacklist.droppable({
    accept: ".individual-card",
    activeClass: "ui-state-highlight",
    drop: function( event, ui ) {
      blacklistUser( ui.draggable );
    }
  });

  // let the user container be droppable as well, accepting users from the blacklist
  $usercard.droppable({
    accept: ".individual-card",
    activeClass: "ui-state-highlight",
    drop: function( event, ui ) {
      unmarkUser( ui.draggable );
    }
  });


  $('.blacklist-selected').hide();
  $('.paired-selected').hide();

  // when paired selected
  $('.paired-button').click(function(){
    $(this).parents('div.individual-card').toggleClass('has-paired');
    $(this).siblings('.blacklist-selected').hide();
    $(this).siblings('.paired-selected').show();
  });

  //when blacklist button selected
  $('.blacklist-button').click(function(){
    $(this).parents('div.individual-card').toggleClass('has-paired');
    $(this).siblings('.paired-selected').hide();
    $(this).siblings('.blacklist-selected').show();
  });

  //Hiding and opening the blacklist
  $('.blacklist-dropdown').click(function(){
    $('.blacklist-card').show();
  });

  // user blacklist function
  var recycle_icon = "<a href='' title='Unmark user' class='refresh-button glyphicon glyphicon-refresh'></a>";
  function blacklistUser( $item ) {
    $item.fadeOut(function() {
      var $list = $( ".individual-card", $blacklist ).length ?
        $( "ul", $blacklist ) :
        $( "<ul class='list-group col-xs-6 cols-sm-4 col-md-2 user-card'/>" ).appendTo( ".blacklist .row" );

      $item.find( "a.blacklist-button" ).remove();
      $item.find(".user-buttons").append( recycle_icon );
      $item.appendTo( $list ).fadeIn();
    });
  }

  // unmarking user function
  var blacklist_icon = "<a class='blacklist-button'><span class='glyphicon glyphicon-minus-sign' aria-hidden='true'></span></a>";
  function unmarkUser( $item ) {
    $item.fadeOut(function() {
      var $usercard = $("ul", $usercard);
      $item
        .find( "a.refresh-button" )
          .remove()
        .end()
        .find(".user-buttons")
          .append( blacklist_icon )
        .end()
        .appendTo( $usercard )
        .fadeIn();
    });
  }
//fullscreen
// $('.fullscreen-button').hover(function(){
//   $(this).siblings('img').animate({
//     height: '30em',
//     width: '20em'
//   },'fast');
// });

  // resolve the icons behavior with event delegation
  $( "ul.individual-card" ).click(function( event ) {
    var $item = $( this ),
      $target = $( event.target );

    if ( $target.is( "a.blacklist-button" ) ) {
      blacklistUser( $item );
    } else if ( $target.is( "a.fullscreen-button" ) ) {
      viewLargerImage( $target );
    } else if ( $target.is( "a.refresh-button" ) ) {
      unmarkUser( $item );
    }

    return false;
  });
});
