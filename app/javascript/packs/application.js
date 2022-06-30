// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"

import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../stylesheets/application'
import lightbox2 from 'lightbox2'
require('@hotwired/turbo-rails')
require('jquery')
// require("stylesheets/application.scss")
Rails.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
lightbox2.option({
  'fadeDuration': 100,
  'wrapAround': true,
  'alwaysShowNavOnTouchDevices': true
})