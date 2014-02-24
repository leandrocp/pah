cache_config = <<HEREDOC


  # Cache engine for Sprockets
  config.assets.cache_store = :dalli_store
HEREDOC

in_root do
  inject_into_file 'config/environments/production.rb',
    cache_config, {
      after: "config.assets.compile = false",
      verbose: false
    }
end

git add: 'config/environments/production.rb'
git_commit 'Add assets.cache_store configuration.'
