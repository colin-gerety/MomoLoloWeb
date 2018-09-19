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

$(document).ready(function() {
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
})

$(function() {
 $("#mobileWrapper").click(showMobileMenu);
 $("#mobileMenuCancel").click(hideMobileMenu);
 $(window).resize(resizeHandler);
 $("#loginMenuIcon").click(showLoginMenu);
 $("#loginMenuCancel").click(hideLoginMenu);
});

