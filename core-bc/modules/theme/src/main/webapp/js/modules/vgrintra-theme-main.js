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

          instance._initMegaDrop();
        },

        bindUI: function() {
          var instance = this;
        },

        _initMegaDrop: function () {
          var instance = this;

          /*
        	$('.main-navigation .dropdown').hover(
        		function () {
        			if ($(window).width() >= breakPointMedium) {
        				$(this).addClass('on');
        				$(this).find('.mega-drop').addClass('on');
        			}
        		},
        		function () {
        			if ($(window).width() >= breakPointMedium) {
        				$(this).removeClass('on');
        				$(this).find('.mega-drop').removeClass('on');
        			}
        		}
        	);

          */

          var dropdownItems = A.all('.main-navigation .dropdown');

          dropdownItems.on('hover', function(e) {
            var currentTarget = e.currentTarget;

            currentTarget.addClass('on');
            currentTarget.one('.mega-drop').addClass('on');

          }, function(e) {
            var currentTarget = e.currentTarget;

            currentTarget.removeClass('on');
            currentTarget.one('.mega-drop').removeClass('on');
          }, instance);

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
