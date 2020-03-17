# signalfx_single_value_chart.sfx_aws_api_gateway_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_api_gateway_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "API Resources"
  program_text            = "A = data('Count', rollup='latest').count(by=['Resource']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Count - Count by Resource - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_1" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Total number of API calls to all API resources in 5 minutes intervals"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Total Number of API calls"
  plot_type          = "AreaChart"
  program_text       = "A = data('Count', filter=filter('stat', 'count'), rollup='latest').sum(by=['stat']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "Count - Sum by stat"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_2" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "Total number API calls to all API resources in 5 minute intervals by HTTP method"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "API Calls by HTTP Method"
  on_chart_legend_dimension = "Method"
  plot_type                 = "ColumnChart"
  program_text              = "A = data('Count', filter=filter('stat', 'count') and filter('Method', '*'), rollup='latest').sum(by=['Method']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Method"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }

  viz_options {
    axis         = "left"
    display_name = "Count - Sum by Method"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_3" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "Total number 4XX status responses from all API resources in 5 minutes intervals by HTTP method"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "4XX Responses by HTTP Method"
  on_chart_legend_dimension = "Method"
  plot_type                 = "ColumnChart"
  program_text              = "A = data('4XXError', filter=filter('Method', '*'), rollup='latest').sum(by=['Method']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Method"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }

  viz_options {
    axis         = "left"
    display_name = "4XXError - Sum by Method"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_api_gateway_dash_1_4:
resource "signalfx_list_chart" "sfx_aws_api_gateway_dash_1_4" {
  color_by                = "Dimension"
  description             = "Top 10 API resources by highest number of 4xx responses in 5 minutes intervals"
  disable_sampling        = false
  max_delay               = 0
  max_precision           = 1
  name                    = "Highest Number of 4xx Responses"
  program_text            = "A = data('4XXError', rollup='latest').sum(by=['Resource']).top(by=['Resource'], count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "Method"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "ApiName"
  }
  legend_options_fields {
    enabled  = true
    property = "Resource"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "Stage"
  }

  viz_options {
    display_name = "4XXError - Sum by Resource - Top 5 by Resource"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_api_gateway_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_api_gateway_dash_1_5" {
  color_by                = "Dimension"
  description             = "Top 10 API resources by highest number of 5xx responses in 5 minutes intervals"
  disable_sampling        = false
  max_delay               = 0
  max_precision           = 1
  name                    = "Highest Number of 5xx Responses"
  program_text            = "A = data('5XXError', rollup='latest').sum(by=['Resource']).top(by=['Resource'], count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "Method"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "ApiName"
  }
  legend_options_fields {
    enabled  = true
    property = "Resource"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "Stage"
  }

  viz_options {
    display_name = "5XXError - Sum by Resource - Top 5 by Resource"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_6" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "Total number 5XX status responses from all API resources in 5 minutes intervals by HTTP method"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "5XX Responses by HTTP Method"
  on_chart_legend_dimension = "Method"
  plot_type                 = "ColumnChart"
  program_text              = "A = data('5XXError', filter=filter('Method', '*'), rollup='latest').sum(by=['Method']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Method"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }

  viz_options {
    axis         = "left"
    display_name = "5XXError - Sum by Method"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_7" {
  axes_include_zero         = true
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The time between when API Gateway receives a request from a client and when it returns a response to the client"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "Average Latency across all API Resources"
  on_chart_legend_dimension = "metric"
  plot_type                 = "AreaChart"
  program_text              = "A = data('Latency', filter=filter('stat', 'mean'), rollup='latest').mean().publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "Latency - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_time_chart.sfx_aws_api_gateway_dash_1_8:
resource "signalfx_time_chart" "sfx_aws_api_gateway_dash_1_8" {
  axes_include_zero         = true
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The time between when API Gateway relays a request to the back end and when it receives a response from the back end"
  disable_sampling          = false
  max_delay                 = 0
  minimum_resolution        = 0
  name                      = "Average Integration Latency across all API Resources"
  on_chart_legend_dimension = "metric"
  plot_type                 = "AreaChart"
  program_text              = "A = data('IntegrationLatency', filter=filter('stat', 'mean'), rollup='latest').mean().publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  unit_prefix               = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "IntegrationLatency - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_dashboard.sfx_aws_api_gateway_dash_1:
resource "signalfx_dashboard" "sfx_aws_api_gateway_dash_1" {
  charts_resolution = "default"
  dashboard_group   = signalfx_dashboard_group.sfx_aws_api_gateway.id
  description       = "An overview of all AWS API Gateway resources"
  name              = "Overview"
  time_range        = "-5h"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_7.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_api_gateway_dash_1_4.id
    column   = 6
    height   = 2
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_api_gateway_dash_1_5.id
    column   = 9
    height   = 2
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_api_gateway_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_api_gateway_dash_1_8.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
}
