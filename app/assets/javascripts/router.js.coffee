EmberAdmin.Router.map (match)->
  # match('/').to('index')

  @resource 'categories', ->
    @route 'new'
    @route 'edit',
      path: ':category_id/edit'
    @route 'show',
      path: ':category_id'

  @resource 'users', ->
    @route 'new'
    @route 'edit',
      path: ':user_id/edit'
    @route 'show',
      path: ':user_id'

