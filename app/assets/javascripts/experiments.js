$('document').ready(function(){
	var data = [
		{
	    	"name": "Experiment1",
	    	"id": 1,
            "samples": 3
		}
	];
	$('#table').bootstrapTable({
        data: data,
        onClickRow: function(row, element, field) {
        	console.log(row);
        }
    });
    $('#table2').bootstrapTable({
        data: data
    });
});
