copy_static_file 'config/locales/pt-BR.yml'
copy_static_file 'config/locales/app.pt-BR.yml'

git add: 'config/locales/*.yml'
git_commit 'Add pt-BR locale files.'

time_zone_config = <<TIME_ZONE

    config.time_zone = 'Brasilia'
TIME_ZONE

in_root do
  inject_into_file 'config/application.rb', time_zone_config, { after: "# config.time_zone = 'Central Time (US & Canada)'", verbose: false }
end

locale_config = <<LOCALE

    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :"pt-BR"
    config.i18n.locale = :"pt-BR"
LOCALE

in_root do
  inject_into_file 'config/application.rb', locale_config, { after: "# config.i18n.default_locale = :de", verbose: false }
end

git add: 'config/application.rb'
git_commit 'Add locale config.'
