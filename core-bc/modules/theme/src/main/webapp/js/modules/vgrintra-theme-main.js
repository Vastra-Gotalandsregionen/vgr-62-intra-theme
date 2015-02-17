AUI().add('vgrintra-theme-main',function(A) {
  var Lang = A.Lang,

  NAME = 'vgrintra-theme-main',
  NS = 'vgrintra-theme-main'
  ;

  var VgrIntraThemeMain = A.Component.create(
    {
      ATTRS: {

        someAttr: {
          value: 'someValue'
        }
      },
      EXTENDS: A.Component,
      NAME: NAME,
      NS: NS,
      prototype: {

        initializer: function(config) {
          var instance = this;
        },

        renderUI: function() {
          var instance = this;

          instance._fixBookmarksPortlet();
        },

        bindUI: function() {
          var instance = this;
        },

        _fixBookmarksPortlet: function() {
          var instance = this;

          // If signed out
          if(!themeDisplay.isSignedIn()) {
            var bookmarksPortlet = A.one('#p_p_id_intrabookmarks_WAR_bookmarksjsfportlet_');

            if(bookmarksPortlet) {
              bookmarksPortlet.addClass('no-portlet-content');
            }
          }

        },

        _someFunction: function() {
          var instance = this;
        }

      }
    }
  );

  A.VgrIntraThemeMain = VgrIntraThemeMain;

},1, {
  requires: [
  'aui-base',
  'event',
  'substitute'
  ]
}
);
