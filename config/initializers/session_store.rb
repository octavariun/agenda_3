# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_agenda_session',
  :secret      => 'c90989ea87d628d42c3e913d3d7b08e87f06c301eb96e769e1bbc6bf28e98524bfdca71a67b10c1f4f5d7f50ab5b79e1d677de51f55d37f10330c4518b2d7381'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
