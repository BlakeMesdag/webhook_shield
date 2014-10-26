# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
WebhookShield::Application.config.secret_key_base = '480468d89c66de9395a42337606c7ae1bc40d565391fabec7ffc0f952c7156f4907078a6439a27d18194ed103673d8e02ce57064be9fe3a1b35c26b6b62b53d0'
