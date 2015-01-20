AUI().add('ifeed-parser',function(A) {
  var Lang = A.Lang,
  isNull = Lang.isNull,

  NAME = 'ifeed-parser',
  NS = 'ifeed-parser',

  CONTAINER = 'container',

  // Custom Attributes
  CSS_HIDDEN = 'hide'
  ;

  var IfeedParser = A.Component.create(
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

        parsedFeed: null,

        initializer: function(config) {
          var instance = this;

          console.log('IfeedParser - initializer');

          var container = instance.get(CONTAINER);

          instance._getFeed();

        },

        renderUI: function() {
          var instance = this;
        },

        bindUI: function() {
          var instance = this;
        },

        _getFeed: function() {
          var instance = this;

          var container = instance.get(CONTAINER);

          var url = container.getAttribute('data-url');

          console.log('flag 1');

          if(!url) {
            return;
          }

          function handleJSONP(response) {
            console.log('handleJSONP');
          }

          console.log('flag 2');

          var url = url + '?callback=handleJSONP';

          var service = new A.JSONPRequest(url, handleJSONP);

          console.log('flag 3');

          service.send();

          console.log('flag 4');


        },

        _someFunction: function() {
          var instance = this;
        }

      }
    }
  );

  A.IfeedParser = IfeedParser;

},1, {
  requires: [
  'aui-base',
  'aui-modal',
  'substitute',
  'jsonp',
  'jsonp-url'
  ]
}
);
