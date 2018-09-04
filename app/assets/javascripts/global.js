function showMobileMenu(event) {
 $("#appBlocker").removeClass("EnableApp");
 $("#appBlocker").addClass("BlockApp");

 $("#mobileWrapper").removeClass("ShowMobileWrapper");
 $("#mobileWrapper").addClass("HideMobileWrapper");

 $("#mobileMenuCancel").removeClass("HideMobileCancel");
 $("#mobileMenuCancel").addClass("ShowMobileCancel");
 $("#menuList").removeClass("HideMenuList");
 $("#menuList").addClass("ShowMenuList");
 event.preventDefault();
}

function hideMobileMenu(event) {
 $("#appBlocker").removeClass("BlockApp");
 $("#appBlocker").addClass("EnableApp");

 $("#mobileWrapper").removeClass("HideMobileWrapper");
 $("#mobileWrapper").addClass("ShowMobileWrapper");

 $("#mobileMenuCancel").removeClass("ShowMobileCancel");
 $("#mobileMenuCancel").addClass("HideMobileCancel");
 $("#menuList").removeClass("ShowMenuList");
 $("#menuList").addClass("HideMenuList");
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

$(function() {
 $("#mobileWrapper").click(showMobileMenu);
 $("#mobileMenuCancel").click(hideMobileMenu);
 $(window).resize(resizeHandler);
});
