# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Added
pin "@popperjs/core", to: "@popperjs--core.js" # Needed for Bootstrap
pin "@rails/ujs", to: "@rails--ujs.js" # Unobstructive JavaScript
pin "@nathanvda/cocoon", to: "@nathanvda--cocoon.js" # @1.2.14  Cocoon
pin "bootstrap", to: "bootstrap.min.js"
