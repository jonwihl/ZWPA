// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize
//= require materialize-sprockets
//= require materialize-form
//= require_tree .


// @import "materialize";
// @import "https://fonts.googleapis.com/icon?family=Material+Icons";


$(document).ready(function() {
    alert("here");
    $('select').material_select();
  });

 // Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).delay(500).fadeOut();
   });
});

$(function() {
   $('.error-alert-box').fadeIn('normal');
});


//  var elem = document.querySelector('select');
//   var instance = M.FormSelect.init(elem, options);

//   $(document).ready(function(){
//     $('select').formSelect();
//   });

// $(document).ready(function() {
//     $('select').material_select();
//   });


//    $(document).ready(function(){
//     $('.collapsible').collapsible();
//   });
        
        

//    $('.carousel.carousel-slider').carousel({fullWidth: true});

//     $(document).ready(function(){
//       $('.carousel').carousel();
//     });
        

//   $(document).ready(function() {
//     Materialize.updateTextFields();
//   });
        