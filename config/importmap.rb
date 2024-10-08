# frozen_string_literal: true

pin 'application', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'

pin 'popper', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
