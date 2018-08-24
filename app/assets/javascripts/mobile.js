function showMobileMenu(event) {
 $("#appBlocker").removeClass("EnableApp");
 $("#appBlocker").addClass("BlockApp");
 $("#mobileMenuIcon").removeClass("ShowMobileIcon");
 $("#mobileMenuIcon").addClass("HideMobileIcon");
 $("#mobileMenuCancel").removeClass("HideMobileCancel");
 $("#mobileMenuCancel").addClass("ShowMobileCancel");
 $("#menuList").removeClass("HideMenuList");
 $("#menuList").addClass("ShowMenuList");
 event.preventDefault();
}

function hideMobileMenu(event) {
 $("#appBlocker").removeClass("BlockApp");
 $("#appBlocker").addClass("EnableApp");
 $("#mobileMenuIcon").removeClass("HideMobileIcon");
 $("#mobileMenuIcon").addClass("ShowMobileIcon");
 $("#mobileMenuCancel").removeClass("ShowMobileCancel");
 $("#mobileMenuCancel").addClass("HideMobileCancel");
 $("#menuList").removeClass("ShowMenuList");
 $("#menuList").addClass("HideMenuList");
 event.preventDefault();
}

$(function() {
 $("#mobileMenuIcon").click(showMobileMenu);
 $("#mobileMenuCancel").click(hideMobileMenu);
});

