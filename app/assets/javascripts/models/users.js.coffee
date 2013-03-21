EmberAdmin.User = DS.Model.extend
  email: DS.attr('string')
  bio: DS.attr('number')
  age: DS.attr('number')
  dob: DS.attr('date')
  gender: DS.attr('boolean')
  created_at: DS.attr('date')
  updated_at: DS.attr('date')
