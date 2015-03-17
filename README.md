# Intra Theme #

The project oppna-program-intra-theme is a Liferay theme plugin which includes customizations of the look and feel of a Liferay portal (css, images, markup and javascript).

![Screenshot of ANS-intra](https://bytebucket.org/monator/vgr-62-intra-theme/raw/c3d468e9c91ca8917daefb4e8b60b2f471178e41/documentation/ans-intra-screen.png?token=adb16746c8efaa36a7bfc2e87c7d451a7ac1172d)

## Templates ##

The templates folder contains [ Freemarker ](http://freemarker.org/) templates for the theme.

The main template is the portal_normal.ftl file. This template contains the overall structure for the page and calls the other templates for rendering.

* init_custom.ftl includes custom settings, freemarker variables, functions and marcos used by the other templates.
* The other templates are included directly or indirectly by portal_normal.ftl

### Freemarker Macros ###

* includeWCD - macro for including a Web Content Display portlet in theme
* includePortlet - macro for including any portlet in theme

[ Read more about Freemarker Macros here. ](http://freemarker.org/docs/ref_directive_macro.html) templates for the theme.

## CSS ##

For CSS styling this project utilizes [ SASS ](http://sass-lang.com) and the mixin library [ Compass ](http://compass-style.org). Both of these are included in core Liferay since version 6.1 and is considered best practise for developing effective and maintainable CSS in a Liferay theme project.

### custom.css ###
custom.css is the main file in which other files are included a long with imports of Compass plugins available in Liferay but not loaded per default.

At the same hierarchical level are also aui.css and _aui_variables.scss which are copies of the vanilla Liferay versions of these files.

### Partials ###
All styling are placed in files in the partials folder. Each partial starts with an underscore and has the file extension .scss. When importing a partial with the file name _my-partial.scss the underscore and file extension is excluded:

  @import 'partials/some-folder/my-partial';

### _variables.scss ###

The partials structure follows the Atomic Design model (se below) - atom, molecules and organisms. The additional folder utilities include mixins, portlet-overrides and - most importantly - the variables partial.

The varibles partial includes variables resused throughout all the other partials, such as breakpoints, colors, sizes.

### Atomic Design ###

The partial structure follows the [ Atomic Design ](http://bradfrost.com/blog/post/atomic-web-design/) model, in which components are structure as atoms, molecules and organisms.

![Atomic Design](http://bradfrost.com/wp-content/uploads/2013/06/atomic-design.png)

* Atoms are the basic building blocks of matter. Applied to web interfaces, atoms are our HTML tags, such as a form label, an input or a button.
* Molecules are groups of atoms bonded together. For example, a form label, input or button aren’t too useful by themselves, but combine them together as a form and now they can actually do something together.
* Organisms are groups of molecules joined together to form a relatively complex, distinct section of an interface - such as header, content, footer.

## Javascript ##

Main javascript functionality is implemented using [Alloy UI](http://alloyui.com/) which is based on [YUI3](http://yuilibrary.com/).

### Main js modules ###

The main module for the theme is modules/vgr-intra-theme-main.js. This module is instantiated in theme-main.js. Also, the folder includes the module ifeed-consumer.js which is used by WCM and Asset Display Templates on the Liferay site to consume iFeeds.

### Fixes ###

The theme includes a few utilities for older browsers:

* [Modernizr](http://modernizr.com/) is a JavaScript library that detects HTML5 and CSS3 features in the user’s browser.
* [selectivizr](http://selectivizr.com/) is a JavaScript utility that emulates CSS3 pseudo-classes and attribute selectors in Internet Explorer 6-8

### POJS ###

Javascript libraries are great, but requires some download time. Sometimes it's preferable that simpler javascript is run fast - before all libraries have been downloaded. This is what the Plain Old Javascript (POJS) modules do.

## Configuration ##

The theme can be configured in a number a couple of ways through settings in the init_custom.ftl

### Custom Fields ###

A number of custom fields can be configured for the site. These custom fields are added in the Control Panel -> Portal Configuration -> Custom Fields. If multiple instances of Liferay are used, the custom fields are configured at the default instance.

The custom fields used for this theme are configured for the Site model. Since Site Administrators do not per default have permission to edit site custom fields, a portal scope roled should preferably be created including permissions for editing the used custom fields. Permission needs to be added to the role for each custom field added.

* topnav_article_id - Liferay WCM article id. Used to display a navigation list (above the main navigation).
* top_alert_article_id - Liferay WCM article id. Used to display an alert box at the top of each page with a message. (feature still experimental styling-wise)
* footer_col_1_article_id - Liferay WCM article id. Used for left footer column content.
* footer_col_2_article_id - Liferay WCM article id. Used for right footer column content.

When working with the footer articles, remember that the footer itself has a fix height (configured in _variables.scss) to enable a cross-browser sticky footer effect.

### Other requirements ###

While the custom fields discussed above degrades gracefully when not properly configured, the variables use_favorites_quickadd if true, requires the oppna-program-favorites-portlet to be deployed to the Liferay server.
