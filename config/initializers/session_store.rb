# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shopping_cart_session',
  :secret      => 'dc0df5bc3bfc6f6add4b2c572626fce9432ff8e7050c627458c8b785bc57e3ed1a70664efd6ee1cc516bda8e0d3ed16e06ec409bd8daa00ef921b2f5466b2c28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
