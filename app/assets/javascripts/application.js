// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require sha256
//= require_tree .


// Function to get cookie from the browser
function getCookie(cookieName) {
  var name = cookieName + "=";
  var cookies_array = document.cookie.split(';');

  for(var i = 0; i < cookies_array.length; i++) {
    var cookie = cookies_array[i];

    while (cookie.charAt(0) == ' ') {
      cookie = cookie.substring(1);
    } if (cookie.indexOf(name) == 0) {
      return cookie.substring(name.length, cookie.length);
    }
  }

  return '';
}


// Function to submit access infos to users controller through ajax
function sendInfos(form) {
  // $(document).ready(function() {
  $(form)
    .on('success.form.fv', function(e) {
      // Prevent form submission
      e.preventDefault();

      var $form = $(e.target),
          fv = $form.data('formValidation');

      // Use Ajax to submit form data
      $.ajax({
        url: $form.attr('action'),
        type: 'POST',
        data: $form.serialize(),
        success: function(result) {
          // ... Process the result ...
        }
      });

      return false;
    });
// });
}

function createInfosForm() {
  var form = document.createElement('form');
  form.method = 'post';
  form.action = 'http://localhost:3000/users/page';
  form.id = 'new_page';

  // Add the form to dom
  document.body.appendChild(form);

  UserAccess.get(form);

  // Just submit
  // form.submit();

  // Remove form
  // document.body.removeChild(form);

  localStorage.clear();
}