$(document).ready(function() {
  console.log("cohorts file");
  // cohort gallery and blacklist boxes
  var $cohort_gallery = $( "#cohort_gallery" ),
    $blacklist = $( "#blacklist" );

  // let the users be draggable
  $( "li", $cohort_gallery ).draggable({
    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
    revert: "invalid", // when not dropped, the item will revert back to its initial position
    containment: "document",
    helper: "clone",
    cursor: "move"
  });

  // let the blacklist be droppable, accepting the users
  $blacklist.droppable({
    accept: "#cohort_gallery > li",
    activeClass: "ui-state-highlight",
    drop: function( event, ui ) {
      blacklistUser( ui.draggable );
    }
  });

  // let the gallery be droppable as well, accepting users from the blacklist
  $cohort_gallery.droppable({
    accept: "#blacklist li",
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
    $('.blacklist-selected').hide();
    $('.paired-selected').show();
  });

  //when blacklist button selected
  $('.blacklist-button').click(function(){
    $(this).parents('div.individual-card').toggleClass('has-paired');
    $('.paired-selected').hide();
    $('.blacklist-selected').show();
  });

  // user blacklist function
  var recycle_icon = "<a href='#' title='Recycle this image' class='ui-icon ui-icon-refresh'>Recycle image</a>";
  function blacklistUser( $item ) {
    $item.fadeOut(function() {
      var $list = $( "ul", $blacklist ).length ?
        $( "ul", $blacklist ) :
        $( "<ul class='cohort_gallery ui-helper-reset'/>" ).appendTo( $blacklist );

      $item.find( "a.ui-icon-trash" ).remove();
      $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
        $item
          .animate({ width: "48px" })
          .find( "img" )
            .animate({ height: "36px" });
      });
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
        .find( "img" )
          .css( "height", "72px" )
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
