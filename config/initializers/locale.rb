# config/initializers/locale.rb

# where I18 should search for the translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb.yml}')]

# Set the available locales
I18n.available_locales = ['en', 'pt']

# Set the default locale
I18n.default_locale = :en
