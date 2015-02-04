AUI().add('user-bookmarks',function(A) {
  var Lang = A.Lang,
  isNull = Lang.isNull,

  NAME = 'user-bookmarks',
  NS = 'user-bookmarks',

  CONTAINER = 'container',

  // Custom Attributes
  CSS_HIDDEN = 'hide'
  ;

  var TPL_BOOKMARKS_TRIGGER = '<div class="bookmarks-trigger">{title}</div>';
  var TPL_BOOKMARKS_WRAP = '<div class="bookmarks-wrap"><h3>{title}</h3><div class="boomarks-view"></div><div class="boomarks-edit"></div></div>';

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
        bookmarksWrap: null,

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

            var bookmarksTriggerHtml = A.substitute(TPL_BOOKMARKS_TRIGGER, {
              title: 'Favoriter'
            });

            var bookmarksWrapHtml = A.substitute(TPL_BOOKMARKS_WRAP, {
              title: 'Favoritlista'
            });

            container.append(bookmarksTriggerHtml);
            container.append(bookmarksWrapHtml);

            var trigger = container.one('.bookmarks-trigger');
            var bookmarksWrap = container.one('.bookmarks-wrap');

            instance.bookmarksWrap = bookmarksWrap;

            trigger.on('click', instance._onTriggerClick, instance);

            //A.one('body').delegate('click', instance._onBodyClick, instance);

            instance._getBookmarks(function(bookmarks) {

              var bookmarksWrap = instance.bookmarksWrap;
              var bookmarksView = bookmarksWrap.one('.boomarks-view');

              A.each(bookmarks, function(item, index, collection) {

                bookmarksView.append('<div><a href="' + item.url + '" target="_BLANK">' + item.name + '</a></div>');

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


AUI().ready('user-bookmarks', function(A) {
  var userBookmarks = new A.UserBookmarks({
    container: '#bookmarks'
  }).render();
});
