# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_flow_session',
  :secret => 'ac3b6facd6c70cc2ba687c8321a6faa0c8b8915acf7d5283765745a63b3cf28970a14c57ee92cf199a03f99e542e740f06487e17d5ae34681ad10567571c715e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
