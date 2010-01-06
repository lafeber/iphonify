# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iphonify.net_session',
  :secret      => '3d4d1274ed2543871f50c90f06acffd1fe3867d8bed43b8166a7e67ad993edf9b8f80c72dac3c4d212b75a9afa2572e7c6c35edb7d56e9913291a826fe5d3e1c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
