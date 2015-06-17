// Plain javascript that runs before AUI is ready (to prevent content flashing)

window.onload= onWindowLoad;

function onWindowLoad() {
	// Body
	classie.addClass(document.body, 'js');

	bindMobileMenuTrigger(document.getElementById('mobileMenuTrigger'));
}

function bindMobileMenuTrigger(navigationTrigger) {
	if(navigationTrigger) {
		navigationTrigger.onclick = function(e) {

			var navigationId = 'navigation';

			classie.toggleClass(document.getElementById(navigationId), 'open');
			classie.toggleClass(navigationTrigger, 'mobile-menu-trigger-active');
			return false;
		}
		classie.addClass(navigationTrigger, 'mobile-menu-trigger-ready');
	}
}
