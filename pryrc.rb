# vim: set ft=ruby:
# .pryrc

# use this method to load gems outside bundler
def require_global_gem path, gem
  $LOAD_PATH.push "#{Gem.paths.home}/gems/#{path}/lib"
    require gem
end

require_global_gem "rb-readline-0.5.5", "rb-readline"

# use fzf for history search
def RbReadline.rl_reverse_search_history(_sign, _key)
  rl_insert_text `cat #{Pry.config.history_file} | sort | uniq | fzf-tmux -p |  tr -d '\n'`
end


if Rails.env.test?
  include FactoryBot::Syntax::Methods
end

def clean_db
  return unless Rails.env.test?

  DatabaseCleaner.clean_with :truncation
end
