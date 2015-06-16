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

          instance._initIfeedConsumers();
          instance._initMegaDrop();
          instance._initTopSearch();
        },

        bindUI: function() {
          var instance = this;
        },

        _initIfeedConsumers: function() {
          var instance = this;

          var ifeedConsumerNodes = A.all('.ifeed-consumer');

          ifeedConsumerNodes.each(function (item, index, list) {

            var ifeedConsumer = new A.IfeedConsumer({
              consumerNode: item
            }).render();

          });


        },

        _initMegaDrop: function () {

          var megaDrop = new A.VgrIntraMegaDrop({
            navigationNode: '#navigation'
          }).render();

        },

        _initTopSearch: function () {

          var topSearchInput = A.one('#header .top-search .search-keywords');
          var searchPortletInput = A.one('.portlet-search [name = "_3_keywords"]');

          if(topSearchInput && searchPortletInput) {
            topSearchInput.set('value', searchPortletInput.get('value'));
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
  'ifeed-consumer',
  'substitute',
  'vgrintra-megadrop'
  ]
}
);
