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

          instance._alignPuffHeight();
        },

        bindUI: function() {
          var instance = this;
        },

        _alignPuffHeight: function() {
          var instance = this;

          var puffNodes = A.all('.columns-2-4-a .span3 .content-box');

          var largestHeight = 0;

          // Find largest height
          puffNodes.each(function(item, index, list) {
            var computedHeightStr = item.getComputedStyle("height");

            try {
              var computedHeight = parseInt(computedHeightStr);
              if(computedHeight > largestHeight) {
                largestHeight = computedHeight;
              }
            } catch (e) {}
          });

          // Set height on each puff to largest height
          puffNodes.each(function(item, index, list) {
            item.setStyle('min-height', largestHeight + 'px');
          });
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
