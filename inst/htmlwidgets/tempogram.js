HTMLWidgets.widget({

  name: 'tempogram',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        //el.innerText = x.data;

        var newSvg = document.getElementById(el.id);
        newSvg.innerHTML += '<svg id="chart1" style="overflow: visible; padding-left: 20px; padding-bottom: 10px; width: 95%; height: 95%; margin: auto;"></svg>';

        var histcatexplong = x.data;
        var colors = x.colors;

        if (colors !== undefined && colors !== null){
            var colorScale = colors;
        } else {
    			  var colorScale = d3.scale.category20().range();
        }

        var chart;
        nv.addGraph(function () {
            chart = nv.models.stackedAreaChart()
                .useInteractiveGuideline(true)
                .x(function (d) {
                    return d[0]
                })
                .y(function (d) {
                    return d[1]
                })
                .showLegend(false)
                .duration(300)
                .color(colorScale);
            var formatCount = d3.format(",.0f"),
                formatTime = d3.time.format("%H:%M %p"),
                //formatMinutes = function(d) { return formatTime(new Date(2020, 0, 0, 0, d)); };
                formatMinutes = function (d) {
                    return formatTime(new Date(2020, 0, 0, 0, d));
                };
            chart.xAxis.tickFormat(formatMinutes);

            chart.yAxis.tickFormat(d3.format('.01f'));

            chart.margin({top: 0, right: 10, bottom: 0, left: 0});

            d3.select('#chart1')
                .datum(histcatexplong)
                .transition().duration(1000)
                .call(chart)
                .each('start', function () {
                    setTimeout(function () {
                        d3.selectAll('#chart1 *').each(function () {
                            if (this.__transition__)
                                this.__transition__.duration = 1;
                        })
                    }, 0)
                });

            nv.utils.windowResize(chart.update);
            return chart;
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
