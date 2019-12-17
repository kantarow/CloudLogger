import consumer from "./consumer"

$(function() {
	var chart = Chartkick.charts["chart-1"];
	var series_id = $('.series').attr("series_id");
	console.log(series_id);
	$('.series').each(function(index, series) { 
		consumer.subscriptions.create({ channel: "SeriesChannel", series_id: series_id }, {
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
