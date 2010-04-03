# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_flow_session',
  :secret => 'bc6099d5bf16e9b67161596b0683ae9d1d1374e278c93b1675a81462517693a46538acfba8ac8dec5b77836c91beead359bd5e038470455b1bf66d10eefe0d47'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
