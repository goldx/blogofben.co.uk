# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blogofben.co.uk_session',
  :secret      => '10a8de2b505ffd41f9d378a5ba99638257607d7af068450af56561ddcb8eef0118b69874f8b8685e661d91f2e27d2d89f4d5c9e92755e4744a886d232513a095'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
