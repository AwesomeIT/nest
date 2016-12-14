$('document').ready(function(){
	$('#rate-slider').slider({
		ticks: [0, 100],
	    ticks_snap_bounds: 1
	});

    $('#play').on('click', function() {
		var audio = document.getElementById("audio");
       audio.play();
    })

    $('#submit_score').on('click', function (e) {
    	var score = $('#rate-slider').data('slider').getValue() / 100;
    	var experiment = window.experiment.id;
    	var sample = window.samples[0].id;
        $.ajax({
          url: "/score",
          type: "post",
          datatype: "json",
          data: {score: score, experiment_id: experiment, sample_id: sample},
          success: function(data){
            window.samples.shift();
            if (window.samples.length === 0) {
            	window.location = "/experiments";
            }

            var audio = document.getElementById("audio");
            audio.src = window.samples[0].s3Url;
            document.getElementById("num_samples").textContent=window.samples.length;
          },
          error: function() {
            alert('An error occurred. Please try again later.');
          }
        });
    })
});