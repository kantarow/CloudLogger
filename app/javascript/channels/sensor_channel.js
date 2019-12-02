import consumer from "./consumer"

$(function() {
	var chart = Chartkick.charts["chart-1"];
	$('.series').each(function(index, series) { 
		consumer.subscriptions.create({ channel: "SensorChannel", series_id: series.getAttribute("series_id") }, {
			connected() {
				console.log("connected");
			},

			disconnected() {
				console.log("disconnectd");
			},

			received(data) {
				console.log("received");
				console.log(data);
				chart.data[index].data.push(data["body"]);
				chart.updateData(chart.data);
			}
		});
	});
});
