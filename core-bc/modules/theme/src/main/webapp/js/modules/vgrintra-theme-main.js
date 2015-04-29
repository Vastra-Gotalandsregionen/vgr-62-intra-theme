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

          var megaDrop = new A.VgrIntraMegaDrop({
            navigationNode: '#navigation'
          }).render();

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
  'ifeed-consumer', // Not used in this module but loaded here so its available for other components later (ifeed WCD)
  'substitute',
  'vgrintra-megadrop'
  ]
}
);
