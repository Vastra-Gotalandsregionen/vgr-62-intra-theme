AUI().add('ifeed-consumer',function(A) {
  var Lang = A.Lang,
  isNull = Lang.isNull,
  Handlebars = A.Handlebars,

  NAME = 'ifeed-consumer',
  NS = 'ifeed-consumer',

  // Attributes
  CONSUMER_NODE = 'consumerNode',

  // Custom Attributes
  FOO = 'foo'
  ;

  var IfeedConsumer = A.Component.create(
    {
      ATTRS: {

        consumerNode: {
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

        feedContainers: null,
        templateNode: null,

        initializer: function(config) {
          var instance = this;

          var consumerNode = instance.get(CONSUMER_NODE);

          var feedContainers = consumerNode.all('.ifeed-parsed-container');
          var templateNodeId = consumerNode.getAttribute('data-templatenodeid');
          var templateNode = A.one('#' + templateNodeId);

          instance.feedContainers = feedContainers;
          instance.templateNode = templateNode;

          instance._configureHandlebars();
          instance._getFeedViews();
        },

        _configureHandlebars: function () {
          var instance = this;

          // Add conditional helper
          Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
            switch (operator) {
                case '==':
                    return (v1 == v2) ? options.fn(this) : options.inverse(this);
                case '===':
                    return (v1 === v2) ? options.fn(this) : options.inverse(this);
                case '<':
                    return (v1 < v2) ? options.fn(this) : options.inverse(this);
                case '<=':
                    return (v1 <= v2) ? options.fn(this) : options.inverse(this);
                case '>':
                    return (v1 > v2) ? options.fn(this) : options.inverse(this);
                case '>=':
                    return (v1 >= v2) ? options.fn(this) : options.inverse(this);
                case '&&':
                    return (v1 && v2) ? options.fn(this) : options.inverse(this);
                case '||':
                    return (v1 || v2) ? options.fn(this) : options.inverse(this);
                default:
                    return options.inverse(this);
            }
          });

        },

        _getFeedViews: function() {
          var instance = this;

          instance.feedContainers.each(function (item, index, list) {
            instance._getJSONP(item);
          });
        },

        _getJSONP: function(feedContainer) {
          var instance = this;

          var url = feedContainer.getAttribute('data-url');
          var feedContentNode = feedContainer.one('.ifeed-parsed-content');

          var service = new A.JSONPRequest(url, {
            args: [ feedContainer],
            context: instance,
            on: {
              success: instance._handleJSONP,
              failure: instance._handleJSONPFailure
            }
          });

          service.send();

          feedContentNode.addClass('loading');
        },

        _handleJSONP: function(response, feedContainer) {
          var instance = this;

          var json = response;
          var templateNode = instance.templateNode;

          var templateNodeContent = templateNode.getHTML();
          var template = Handlebars.compile(templateNodeContent);

          var feedContentNode = feedContainer.one('.ifeed-parsed-content');
            
          feedContentNode.setHTML(template(json));

          instance._setupDisplayType(feedContainer);

          feedContentNode.removeClass('loading');


        },

        _handleJSONPFailure: function(response, feedContainer) {
          var instance = this;

          feedContainer.removeClass('loading');
        },

        _setupDisplayType: function(feedContainer) {
          var instance = this;

          var displayType = feedContainer.getAttribute('data-displaytype');
          var feedContentNode = feedContainer.one('.ifeed-parsed-content');
          var titleNode = feedContainer.one('.ifeed-parsed-title');
          var hasTitleNode = false;
          if(titleNode) {
            hasTitleNode = true;
          }

          if(hasTitleNode && (displayType == 'collapsible-open' || displayType == 'collapsible-closed') ) {
            var expanded = true;
            if(displayType == 'collapsible-closed') {
              expanded = false;
            }

            var toggler = new A.Toggler({
              animated: true,
              container: feedContainer,
              content: feedContentNode,
              expanded: expanded,
              header: titleNode
            });

            feedContainer.addClass('ifeed-parsed-collapsible');

          }

        },

        _someFunction: function() {
          var instance = this;
        }

      }
    }
  );

  A.IfeedConsumer = IfeedConsumer;

},1, {
  requires: [
  'aui-base',
  'aui-toggler',
  'handlebars',
  'jsonp',
  'jsonp-url'
  ]
}
);
