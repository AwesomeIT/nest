$('document').ready(function(){
	$('#table').bootstrapTable({
        data: window.experiments,
        onClickRow: function(row, element, field) {
            window.location = '/experiments/' + row.id;
        }
    });

    $('#active_samples').bootstrapTable({
        data: window.samples
    });

    var selectedSamples = window.samples.map(x => x.id);

    var samples = window.all_samples.map(function(x) {
        x.selected = selectedSamples.includes(x.id);
        return x;
    })

    $('#update_samples').bootstrapTable({
        data: samples
    });

    $('#submit_button').on('click', function (e) {
        var samples = $('#update_samples').bootstrapTable('getSelections');

        $.ajax({
          url: "/experiments/samples/" + window.experiment.id,
          type: "post",
          datatype: "json",
          data: {sample_ids: samples.map(x => x.id) || []},
          success: function(data){
            $('#active_samples').bootstrapTable("load", samples);
          },
          error: function() {
            alert('An error occurred. Please try again later.');
          }
        });
    })
});
