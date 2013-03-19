DS.RESTAdapter.configure "plurals", { category: "categories" }
EmberAdmin.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create({ namespace: 'api' })

