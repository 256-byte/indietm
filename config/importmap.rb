# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "stimulus-rails-nested-form" # @4.1.0
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.1
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @7.3.0
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @7.3.0
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.0.4
