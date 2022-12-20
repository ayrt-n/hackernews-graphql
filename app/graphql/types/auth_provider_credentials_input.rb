module Types
  class AuthProviderCredentialsInput < BaseInputObject
    # Override graphql name
    graphql_name 'AUTH_PROVIDER_CREDENTIALS'

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
