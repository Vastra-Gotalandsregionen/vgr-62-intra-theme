// Plain javascript that runs before AUI is ready (to prevent content flashing)

window.onload= onWindowLoad;

function onWindowLoad() {
	// Body
	classie.addClass(document.body, 'js');
}
