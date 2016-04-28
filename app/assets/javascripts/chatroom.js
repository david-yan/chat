refreshMessages();
window.setInterval(function(){
	refreshMessages();
}, 5000)

function refreshMessages(){
	$.ajax({
		url: '/chatroom/g/'+CHAT_ID,
		type:'get',
		success:function(data){
			console.log(data);
			drawMessages(data);
		}
	})
}

function drawMessages(data){
	$('#chatlog').html('')
	_.each(data, function(message){
		msg_div = "<li>" + message.user + ": " + message.body + "</li>"
		$('#chatlog').append(msg_div)
	})
}

$('#send-message').click(function(){
	$.ajax({
		url: '/chatroom/'+CHAT_ID+'/send_message',
		type: 'post',
		data: {body: $('#message-body').val()},
		success:function(data){
			refreshMessages()
		}
	})
})