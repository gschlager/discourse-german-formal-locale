#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/inline'

gemfile(true) do
  gem 'translations-manager', git: 'https://github.com/discourse/translations-manager.git'
end

require 'translations_manager'

YML_DIRS = ['config/locales'].map { |d| File.expand_path(d) }
YML_FILE_PREFIXES = ['client', 'server']
TRANSIFEX_LOCALE = 'de_DE'
DISCOURSE_LOCALE = 'de_formal'

TranslationsManager::TransifexUpdater
  .new(YML_DIRS, YML_FILE_PREFIXES, TRANSIFEX_LOCALE)
  .perform(update_tx_config: false, language_map: { TRANSIFEX_LOCALE => DISCOURSE_LOCALE })
