// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require materialize-sprockets
//= require materialize-form
//= require_tree .
//= require dataTables/jquery.dataTables
// @import "materialize";
// @import "https://fonts.googleapis.com/icon?family=Material+Icons";


$(document).ready(function() {
    $('select').material_select();
    $('#town_details').after('<%= j render("new_client_form") %>');
    $("#userlist").dataTable( {
    columnDefs: [
        { targets: [0, 1, 2, 3], visible: true, },
        { targets: [4,5], visible: true, "orderable": false },
        ]
    });

    $("#userlist2").dataTable( {
    columnDefs: [
        { targets: [0, 1, 2, 3], visible: true, },
        { targets: [4], visible: true, "orderable": false }
        ]
    });

    $("#clientlist").dataTable( {
    columnDefs: [
        { targets: [0, 1, 2, 3, 4], visible: true, },
        { targets: [5, 6], visible: true, "orderable": false }
        ]
    });

    $("#archiveclintlist").dataTable( {
        columnDefs: [
            { targets: [0, 1, 2, 3, 4], visible: true, },
            { targets: [5], visible: true, "orderable": false }
        ]
    });

    $("#landfill").dataTable();
    $("#recycling").dataTable();
    $("#compost").dataTable();
    $("#reuse").dataTable();
    $("#food_recovery").dataTable();

    $("#all").dataTable();

    $("#dashboard").dataTable();

    $('.carousel').carousel();
    $('.sidenav').sidenav();

})

 // Flash fade
$(function() {
   $('.alert-box').fadeIn('normal', function() {
      $(this).fadeOut(2000);
   });
});

$(function() {
   $('.error-alert-box').fadeIn('normal');
   $('.error-alert-box').fadeOut(2000);
});


$(document).ready(function() {
    $('#users').DataTable( {
        "order": [[ 3, "desc" ]]
    } );
} );

// Mobile sidebar 
//$(function() {
//    $('.button-collapse').sideNav({
//      menuWidth: 300, // Default is 300
//      edge: 'left', // Choose the horizontal origin
//      closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
//      draggable: true // Choose whether you can drag to open on touch screens
//    });
//} );

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
        