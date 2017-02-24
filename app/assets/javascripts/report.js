DATE_FORMAT = 'YYYY-MM-DD';

$(document).ready((function () {
    $('#report_start_date').datetimepicker({
        format: DATE_FORMAT
    });

    $('#report_end_date').datetimepicker({
        useCurrent: false,//Important! See issue #1075
        format: DATE_FORMAT
    });

    $("#report_start_date").on("dp.change", function (e) {
        $('#report_end_date').data("DateTimePicker").minDate(e.date);
    });
    $("#report_end_date").on("dp.change", function (e) {
        $('#report_start_date').data("DateTimePicker").maxDate(e.date);
    });
}));