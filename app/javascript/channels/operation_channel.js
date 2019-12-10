import consumer from "./consumer"

$(function() {
	const operationChannel = consumer.subscriptions.create({ channel: "OperationChannel", data_logger_id: $(".data_logger").attr("data_logger_id") }, {
		operate(operation) {
			return this.perform('operate', {
				"operation": operation
			});
		}
	});

	$('#operation-button').on('click', function(){
		operationChannel.operate($('#operation-input').val());
	});
});
