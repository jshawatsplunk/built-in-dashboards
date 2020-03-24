# signalfx_single_value_chart.sfx_aws_sqs_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_sqs_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Active Queues"
  program_text            = "A = data('NumberOfMessagesSent', filter=filter('namespace', 'AWS/SQS') and filter('stat', 'sum'),rollup='rate').mean(over='15m').count(by=['QueueName', 'aws_region']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "NumberOfMessagesSent - Mean(15m) - Count by QueueName,aws_region - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sqs_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total #Msg / Min"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('NumberOfMessagesSent', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SQS'),rollup='rate').sum().scale(60).publish(label='A')
        B = data('NumberOfMessagesReceived', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SQS'),rollup='rate').sum().scale(60).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "sent - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "received - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "NumberOfMessagesSent"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "NumberOfMessagesReceived"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_sqs_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Sent Bytes / Min"
  plot_type          = "AreaChart"
  program_text       = "A = data('SentMessageSize', filter=filter('namespace', 'AWS/SQS') and filter('stat', 'sum'),rollup='rate').scale(60).sum().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# bytes"
    min_value = 0
  }

  axis_right {
    label     = "received - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "SentMessageSize - Scale:60 - Sum"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_sqs_dash_1_3:
resource "signalfx_list_chart" "sfx_aws_sqs_dash_1_3" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Queues #Msg Sent / Min"
  program_text            = "A = data('NumberOfMessagesSent', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SQS'),rollup='rate').scale(60).sum(by=['QueueName', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_sqs_dash_1_4:
resource "signalfx_list_chart" "sfx_aws_sqs_dash_1_4" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Queues #Msg Recv / Min"
  program_text            = "A = data('NumberOfMessagesReceived', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SQS'),rollup='rate').scale(60).sum(by=['QueueName', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_sqs_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_sqs_dash_1_5" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Age of oldest message (secs)"
  program_text            = "A = data('ApproximateAgeOfOldestMessage', filter=filter('namespace', 'AWS/SQS') and filter('stat', 'mean')).sum(by=['QueueName', 'aws_region']).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "QueueName"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_region"
  }

}
# signalfx_time_chart.sfx_aws_sqs_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Appx #Msg Visible"
  plot_type          = "LineChart"
  program_text       = "A = data('ApproximateNumberOfMessagesVisible', filter=filter('stat', 'mean') and filter('namespace', 'AWS/SQS')).mean(by=['QueueName', 'aws_region']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# messages"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "ApproximateNumberOfMessagesVisible"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sqs_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Appx #Msg Not Visible"
  plot_type          = "LineChart"
  program_text       = "A = data('ApproximateNumberOfMessagesNotVisible', filter=filter('stat', 'mean') and filter('namespace', 'AWS/SQS')).mean(by=['QueueName', 'aws_region']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# messages"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "ApproximateNumberOfMessagesNotVisible"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sqs_dash_1_8:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Appx #Msg Delayed"
  plot_type          = "LineChart"
  program_text       = "A = data('ApproximateNumberOfMessagesDelayed', filter=filter('stat', 'mean') and filter('namespace', 'AWS/SQS')).mean(by=['QueueName', 'aws_region']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# messages"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "ApproximateNumberOfMessagesDelayed - Mean by QueueName,aws_region"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sqs_dash_1_9:
resource "signalfx_time_chart" "sfx_aws_sqs_dash_1_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total #Msg Deleted / Min"
  plot_type          = "AreaChart"
  program_text       = "A = data('NumberOfMessagesDeleted', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SQS'),rollup='rate').sum().scale(60).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# messages"
    min_value = 0
  }

  axis_right {
    label     = "received - RED"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "NumberOfMessagesDeleted"
    label        = "A"
  }
}
# signalfx_dashboard.sfx_aws_sqs_dash_1:
resource "signalfx_dashboard" "sfx_aws_sqs_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_sqs.id
  discovery_options_query = "namespace:\"AWS/SQS\" AND _exists_:QueueName"
  discovery_options_selectors = [
    "namespace:AWS/SQS",
    "sf_key:QueueName",
  ]
  name = "SQS Queues"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sqs_dash_1_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_9.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_7.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sqs_dash_1_8.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sqs_dash_1_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sqs_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_sqs_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
}
