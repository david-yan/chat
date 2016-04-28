$('#login-btn').click(function(){
	name = $('#login-name').val()
	$.ajax({
		url:'login',
		type:'POST',
		data:{
			text: name
		},
		success:function(data){
			console.log('success');
		}
	})
})