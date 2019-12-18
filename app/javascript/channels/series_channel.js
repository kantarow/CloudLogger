import consumer from "./consumer"

$(function() {
	var chart = Chartkick.charts["chart-1"];
	$('.series').each(function(index, series) { 
		var series_id = series.getAttribute("series_id");
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
				$('#series-' + String(series_id)).text(data["body"][1]);
			}
		});
	});
});
