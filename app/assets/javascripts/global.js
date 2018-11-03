function showMobileMenu(event) {
 /*
 $("#appBlocker").removeClass("EnableApp");
 $("#appBlocker").addClass("BlockApp");
 */

 $("#mobileWrapper").removeClass("ShowMobileWrapper");
 $("#mobileWrapper").addClass("HideMobileWrapper");

 $("#mobileMenuCancel").removeClass("HideMobileCancel");
 $("#mobileMenuCancel").addClass("ShowMobileCancel");
 $("#menuList").removeClass("HideMenuList");
 $("#menuList").addClass("ShowMenuList");
 event.preventDefault();
}

function hideMobileMenu(event) {
 /*
 $("#appBlocker").removeClass("BlockApp");
 $("#appBlocker").addClass("EnableApp");
 */

 $("#mobileWrapper").removeClass("HideMobileWrapper");
 $("#mobileWrapper").addClass("ShowMobileWrapper");

 $("#mobileMenuCancel").removeClass("ShowMobileCancel");
 $("#mobileMenuCancel").addClass("HideMobileCancel");
 $("#menuList").removeClass("ShowMenuList");
 $("#menuList").addClass("HideMenuList");

 event.preventDefault();
}

function showLoginMenu(event) {
 /*
 $("#appBlocker").removeClass("EnableApp");
 $("#appBlocker").addClass("BlockApp");
 */

 $("#loginWrapper").removeClass("ShowLoginWrapper");
 $("#loginWrapper").addClass("HideLoginWrapper");

 $("#loginMenuCancel").removeClass("HideLoginCancel");
 $("#loginMenuCancel").addClass("ShowLoginCancel");
 $("#loginList").removeClass("HideLoginList");
 $("#loginList").addClass("ShowLoginList");
 event.preventDefault();
}

function hideLoginMenu(event) {
 /*
 $("#appBlocker").removeClass("BlockApp");
 $("#appBlocker").addClass("EnableApp");
 */

 $("#loginWrapper").removeClass("HideLoginWrapper");
 $("#loginWrapper").addClass("ShowLoginWrapper");

 $("#loginMenuCancel").removeClass("ShowLoginCancel");
 $("#loginMenuCancel").addClass("HideLoginCancel");
 $("#loginList").removeClass("ShowLoginList");
 $("#loginList").addClass("HideLoginList");
 event.preventDefault();
}

function adjustEventNotification(event) {
  if ($('input[name=event\\[display_notify\\]]').is(":checked")) {
    $('#notificationFields').removeClass("HideFields");
    $('#notificationFields').addClass("ShowFields");
  } else {
    $('#notificationFields').removeClass("ShowFields");
    $('#notificationFields').addClass("HideFields");
  }
}

function adjustFormEventRecurrence(event) {
  var selectedField = '#recurrentEvent';
  var unSelectedField = '#nonRecurrentEvent';

  switch ($('input[name=event\\[recurrent\\]]:checked').val()) {
    case 'true':
      break;
    case 'false':
      selectedField = '#nonRecurrentEvent';
      unSelectedField = '#recurrentEvent';
      break;
    default:
      return; /* alert("Improper value sent to event radio button.");  */
  };
  $(selectedField).removeClass("HideFields");
  $(selectedField).addClass("ShowFields");
  $(unSelectedField).removeClass("ShowFields");
  $(unSelectedField).addClass("HideFields");
}

function resizeHandler(event) {
 $("#appBlocker").removeClass("BlockApp");
 $("#appBlocker").removeClass("EnableApp");

 $("#mobileWrapper").removeClass("HideMobileWrapper");
 $("#mobileWrapper").removeClass("ShowMobileWrapper");

 $("#mobileMenuCancel").removeClass("ShowMobileCancel");
 $("#mobileMenuCancel").removeClass("HideMobileCancel");
 $("#menuList").removeClass("ShowMenuList");
 $("#menuList").removeClass("HideMenuList");
}

function onReady() {
  $("#mobileWrapper").click(showMobileMenu);
  $("#mobileMenuCancel").click(hideMobileMenu);
  $(window).resize(resizeHandler);
  $("#loginMenuIcon").click(showLoginMenu);
  $("#loginMenuCancel").click(hideLoginMenu);

  if ($('input[name=event\\[recurrent\\]]')) {
    $('input[name=event\\[recurrent\\]]').change(adjustFormEventRecurrence);
    $('input[name=event\\[display_notify\\]]').change(adjustEventNotification);
    adjustFormEventRecurrence(null);
    adjustEventNotification(null);
  }

  var owl = $('.owl-carousel');
  owl.owlCarousel({
    items: 4,
    loop: true,
    dots: false,
    margin: 2,
    autoplay: true,
    autoplaySpeed: 3000,
    autoplayTimeout: 3000,
    autoplayHoverPause: true
  });
}

$( document ).on('turbolinks:load', function() {
  onReady();
})


$(document).ready(function() {
  /* onReady();  only call in turbolinks:load */
})


