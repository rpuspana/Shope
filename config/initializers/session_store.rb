# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shope_session',
  :secret      => '1ee8d203fd9b444738dbcf43aa81e8b8507e43623cd0ef9f3fc48e4b655394d85d9fa897b0590c4075547fa24b2f364d81b7ebfc7429c4b9d0323ba8b366b380'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
