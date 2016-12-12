$('document').ready(function(){
	$('#table').bootstrapTable({
        data: window.experiments,
        onClickRow: function(row, element, field) {
            window.location = window.location.href + '/' + row.id;
        }
    });
});
