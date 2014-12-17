AUI().add('user-bookmarks',function(A) {
  var Lang = A.Lang,
  isNull = Lang.isNull,

  NAME = 'user-bookmarks',
  NS = 'user-bookmarks',

  CONTAINER = 'container',

  // Custom Attributes
  CSS_HIDDEN = 'hide'
  ;

  var UserBookmarks = A.Component.create(
    {
      ATTRS: {

        container: {
          setter: A.one
        },

        someAttr: {
          value: null
        }

      },
      EXTENDS: A.Component,
      NAME: NAME,
      NS: NS,

      prototype: {

        bookmarks: null,

        initializer: function(config) {
          var instance = this;

          console.log('UserBookmarks - initializer');

          instance.bookmarks = [];

          instance._initBookmarks();

          if(themeDisplay.isSignedIn()) {
          }



        },

        renderUI: function() {
          var instance = this;

          console.log('UserBookmarks - renderUI');

        },

        bindUI: function() {
          var instance = this;

          console.log('UserBookmarks - bindUI');

        },

        _initBookmarks: function() {
          var instance = this;

          if(themeDisplay.isSignedIn()) {

            var container = instance.get(CONTAINER);

            container.append('<div class="bookmarks-trigger">Favoriter</div>');
            container.append('<div class="bookmarks-wrap">Favoritlista</div>');

            var trigger = container.one('.bookmarks-trigger');
            var bookmarksWrap = container.one('.bookmarkers-wrap');

            trigger.on('click', instance._onTriggerClick, instance);

            A.one('body').delegate('click', instance._onBodyClick, instance);

            instance._getBookmarks(function(bookmarks) {

              console.log(bookmarks);

              A.each(bookmarks, function(item, index, collection) {

                //item.url
                //item.name


                instance.get(CONTAINER).addClass('bookmarks-ready');

              }, instance);

            });
          }

        },

        _getBookmarks: function(callback) {
          var instance = this;

          Liferay.Service('/bookmarksentry/get-group-entries', {
            groupId: themeDisplay.getScopeGroupId(),
            userId: themeDisplay.getUserId(),
            folderId: 0,
            start: 0,
            end: 1000
          },
          callback);
        },

        _onBodyClick: function(e) {
          var instance = this;

          console.log(e);
        },

        _onTriggerClick: function(e) {
          var instance = this;

          var container = instance.get(CONTAINER);

          e.halt();

          if(container.hasClass('open')) {
            container.removeClass('open');
          } else {
            container.addClass('open');
          }
        },

        _someFunction: function() {
          var instance = this;
        }

      }
    }
  );

  A.UserBookmarks = UserBookmarks;

},1, {
  requires: [
  'aui-base',
  'aui-modal',
  'substitute'
  ]
}
);
