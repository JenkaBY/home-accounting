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
// bootstrap/sprockets provides individual Bootstrap Javascript files (alert.js or dropdown.js)
// while bootstrap provides a concatenated file containing all Bootstrap Javascripts.

//= require jquery
//= require jquery_ujs
//= require bootstrap/custom
//= require bootstrap
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .


document.addEventListener("turbolinks:load", function () {
    if ($('li.active').html() != undefined) {
        $('li.active').removeClass('active');
    }
    $('a[href="' + location.pathname + '"]').parent('li').addClass('active');
});

// Bootstrap 3 Datepicker v4
$(function () {
    $('#datetimepicker1').datetimepicker({
        format: 'YYYY-MM-DD'
    });
});


$(function () {
    $('#datetimepicker_startdate').datetimepicker({
        format: 'YYYY-MM-DD'
    });

    $('#datetimepicker_enddate').datetimepicker({
        useCurrent: false ,//Important! See issue #1075
        format: 'YYYY-MM-DD'
    });

    $("#datetimepicker_startdate").on("dp.change", function (e) {
        $('#datetimepicker_enddate').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker_enddate").on("dp.change", function (e) {
        $('#datetimepicker_startdate').data("DateTimePicker").maxDate(e.date);
    });
});

