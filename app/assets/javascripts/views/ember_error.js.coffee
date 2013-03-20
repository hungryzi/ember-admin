Ember.ErrorInline = Ember.View.extend
  template: Ember.Handlebars.compile("<ul>{{#each error in view.errors}}<li>{{error}}</li>{{/each}}</ul>")
  tagName: 'span'
  classNames: ['error', 'error-inline']

Ember.ErrorSummary = Ember.View.extend
  template: Ember.Handlebars.compile("{{#each error in view.errors}}<p>{{error}}</p>{{/each}}")
  tagName: 'div'
  classNames: ['error', 'error-summary']

