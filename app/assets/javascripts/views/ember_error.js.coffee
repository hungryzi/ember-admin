Ember.ErrorSummary = Ember.View.extend
  template: Ember.Handlebars.compile("{{#each error in view.errors}}<p>{{error}}</p>{{/each}}")
  tagName: 'div'
  classNames: ['text-error']

