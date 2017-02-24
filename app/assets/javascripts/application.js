//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require turbolinks-compatibility
//= require moment
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker

//= require_tree .

DATE_FORMAT = 'YYYY-MM-DD';

document.addEventListener("turbolinks:load", function () {
    if ($('li.active').html() != undefined) {
        $('li.active').removeClass('active');
    }
    $('a[href="' + location.pathname + '"]').parent('li').addClass('active');
});

// Bootstrap 3 Datepicker v4
$(document).ready((function () {
    $('#finance_action_date').datetimepicker({
        format: DATE_FORMAT
    });
}));


$(document).ready((function () {
    $('#search_from_date').datetimepicker({
        format: DATE_FORMAT
    });

    $('#search_to_date').datetimepicker({
        useCurrent: false,//Important! See issue #1075
        format: DATE_FORMAT
    });

    $("#search_from_date").on("dp.change", function (e) {
        $('#search_to_date').data("DateTimePicker").minDate(e.date);
    });
    $("#search_to_date").on("dp.change", function (e) {
        $('#search_from_date').data("DateTimePicker").maxDate(e.date);
    });
}));
