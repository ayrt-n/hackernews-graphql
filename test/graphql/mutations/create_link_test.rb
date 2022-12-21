require 'test_helper'

class Mutations::CreateLinkTest < ActiveSupport::TestCase
  def create_user
    User.create(name: 'test', email: 'test@example.com', password: '123456')
  end

  def perform(user: nil, **args)
    Mutations::CreateLink.new(object: nil, field: nil, context: { current_user: create_user }).resolve(**args)
  end

  test 'create a new link' do
    link = perform(
      url: 'http://example.com',
      description: 'description',
      user: create_user
    )

    assert link.persisted?
    assert_equal link.description, 'description'
    assert_equal link.url, 'http://example.com'
  end
end
