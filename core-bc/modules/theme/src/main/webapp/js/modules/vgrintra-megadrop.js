AUI().add('vgrintra-megadrop',function(A) {
  var Lang = A.Lang,

  NAME = 'vgrintra-megadrop',
  NS = 'vgrintra-megadrop',

  NAVIGATION_NODE = 'navigationNode'

  ;

  var VgrIntraMegaDrop = A.Component.create(
    {
      ATTRS: {

        navigationNode: {
          setter: A.one
        },

        someAttr: {
          value: 'someValue'
        }
      },
      EXTENDS: A.Component,
      NAME: NAME,
      NS: NS,
      prototype: {

        activeNode: null,
        activeTimer: null,
        dropdownItems: null,

        initializer: function(config) {
          var instance = this;

          var dropdownItems = instance.get(NAVIGATION_NODE).all('.dropdown');

          instance.dropdownItems = dropdownItems;

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

          instance.dropdownItems.on('hover', function(e) {
            var currentTarget = e.currentTarget;

            if(instance.currentTimer != null) {
              instance.currentTimer.cancel();
            }

            instance.activeNode = currentTarget;
            instance.currentTimer = A.later(400, instance, instance._show);
          }, function(e) {
            var currentTarget = e.currentTarget;

            if(instance.currentTimer != null) {
              instance.currentTimer.cancel();
            }

            instance.activeNode = currentTarget;
            instance.currentTimer = A.later(400, instance, instance._hide);

          }, instance);

        },

        _hide: function() {
          var instance = this;

          instance.activeNode.removeClass('on');
          instance.activeNode.one('.mega-drop').removeClass('on');
        },

        _show: function() {
          var instance = this;

          // Hide all dropdowns
          instance.dropdownItems.removeClass('on');
          instance.dropdownItems.all('.mega-drop').removeClass('on');

          instance.activeNode.addClass('on');
          instance.activeNode.one('.mega-drop').addClass('on');

        },

        _someFunction: function() {
          var instance = this;
        }

      }
    }
  );

  A.VgrIntraMegaDrop = VgrIntraMegaDrop;

},1, {
  requires: [
  'aui-base',
  'event',
  'substitute'
  ]
}
);
