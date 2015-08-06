$(document).ready(function() {
  // cohort gallery and blacklist boxes
  var $usercard = $( ".user-card" ),
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
    activeClass: "ui-state-highlight",
    drop: function( event, ui ) {
      blacklistUser( ui.draggable );
    }
  });

  // let the gallery be droppable as well, accepting users from the blacklist
  $usercard.droppable({
    activeClass: "custom-state-active",
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

  // user blacklist function
  var recycle_icon = "<a href='' title='Unmark user' class='glyphicon glyphicon-refresh'>Unmark User</a>";
  function blacklistUser( $item ) {
    $item.fadeOut(function() {
      var $list = $( "ul", $blacklist ).length ?
        $( "ul", $blacklist ) :
        $( "<ul class='user-card ui-helper-reset'/>" ).appendTo( $blacklist );

      $item.find( "a.ui-icon-trash" ).remove();
      $item.append( recycle_icon ).appendTo( $list ).fadeIn();
    });
  }

  // unmarking user function
  var trash_icon = "<a href='#' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
  function unmarkUser( $item ) {
    $item.fadeOut(function() {
      $item
        .find( "a.ui-icon-refresh" )
          .remove()
        .end()
        .css( "width", "96px")
        .append( trash_icon )

        .end()
        .appendTo( $cohort_gallery )
        .fadeIn();
    });
  }

  // image preview function, demonstrating the ui.dialog used as a modal window
  function viewLargerImage( $link ) {
    var src = $link.attr( "href" ),
      title = $link.siblings( "img" ).attr( "alt" ),
      $modal = $( "img[src$='" + src + "']" );

    if ( $modal.length ) {
      $modal.dialog( "open" );
    } else {
      var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
        .attr( "src", src ).appendTo( "body" );
      setTimeout(function() {
        img.dialog({
          title: title,
          width: 400,
          modal: true
        });
      }, 1 );
    }
  }

  // resolve the icons behavior with event delegation
  $( "ul.cohort_gallery > li" ).click(function( event ) {
    var $item = $( this ),
      $target = $( event.target );

    if ( $target.is( "a.ui-icon-trash" ) ) {
      blacklistUser( $item );
    } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
      viewLargerImage( $target );
    } else if ( $target.is( "a.ui-icon-refresh" ) ) {
      unmarkUser( $item );
    }

    return false;
  });
});
