# signalfx_time_chart.sfx_aws_sns_dash_0_0:
resource "signalfx_time_chart" "sfx_aws_sns_dash_0_0" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Messages Published/Min"
  plot_type          = "AreaChart"
  program_text       = "A = data('NumberOfMessagesPublished', filter=filter('namespace', 'AWS/SNS') and filter('TopicName', '*') and filter('stat', 'sum'),rollup='rate').scale(60).sum().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# messages/interval"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "NumberOfMessagesPublished"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_sns_dash_0_1:
resource "signalfx_single_value_chart" "sfx_aws_sns_dash_0_1" {
  color_by                = "Dimension"
  description             = "over last hour"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "# Active Topics"
  program_text            = "A = data('NumberOfMessagesPublished', filter=filter('TopicName', '*') and filter('namespace', 'AWS/SNS') and filter('stat', 'sum'),rollup='rate').max(over='1h').mean(by=['TopicName']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "A"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_sns_dash_0_2:
resource "signalfx_list_chart" "sfx_aws_sns_dash_0_2" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Topics by Messages/Min"
  program_text            = "A = data('NumberOfMessagesPublished', filter=filter('TopicName', '*') and filter('namespace', 'AWS/SNS') and filter('stat', 'sum'),rollup='rate').mean(by=['TopicName']).top(count=5).scale(60).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_sns_dash_0_3:
resource "signalfx_time_chart" "sfx_aws_sns_dash_0_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Messages Published/Min per Topic"
  plot_type          = "AreaChart"
  program_text       = "A = data('NumberOfMessagesPublished', filter=filter('TopicName', '*') and filter('namespace', 'AWS/SNS') and filter('stat', 'sum'),rollup='rate').mean(by=['TopicName']).scale(60).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "#messages/interval"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "NumberOfMessagesPublished"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sns_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_sns_dash_0_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Overall Delivery Success %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NumberOfNotificationsDelivered', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SNS'),rollup='rate').sum().publish(label='A', enable=False)
        B = data('NumberOfNotificationsFailed', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SNS'),rollup='rate').sum().publish(label='B', enable=False)
        C = (A/(A+B)*100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    high_watermark = 100
    label          = "success %"
    max_value      = 110
    min_value      = 0
  }

  axis_right {
    label = "Red - Failed"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "success %"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "failed"
    label        = "B"
    plot_type    = "AreaChart"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "successfully delivered"
    label        = "A"
    plot_type    = "AreaChart"
  }
}
# signalfx_list_chart.sfx_aws_sns_dash_0_5:
resource "signalfx_list_chart" "sfx_aws_sns_dash_0_5" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Topics with Lowest Delivery Success %"
  program_text            = <<-EOF
        A = data('NumberOfNotificationsDelivered', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SNS'),rollup='rate').sum(by=['TopicName']).publish(label='A', enable=False)
        B = data('NumberOfNotificationsFailed', filter=filter('stat', 'sum') and filter('namespace', 'AWS/SNS'),rollup='rate').sum(by=['TopicName']).publish(label='B', enable=False)
        C = (A/(A+B)*100).bottom(count=5).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "+value"
  unit_prefix             = "Metric"

  viz_options {
    color        = "brown"
    display_name = "failed"
    label        = "B"
  }
  viz_options {
    color        = "green"
    display_name = "successfully delivered"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_sns_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_sns_dash_0_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Bytes Published/Interval"
  plot_type          = "AreaChart"
  program_text       = "A = data('PublishSize', filter=filter('namespace', 'AWS/SNS') and filter('TopicName', '*') and filter('stat', 'mean')).sum(by=['TopicName']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "bytes/interval"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "PublishSize"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_sns_dash_0_7:
resource "signalfx_list_chart" "sfx_aws_sns_dash_0_7" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 2
  name                    = "Top Topics by Bytes/Message"
  program_text            = "A = data('PublishSize', filter=filter('namespace', 'AWS/SNS') and filter('TopicName', '*') and filter('stat', 'mean')).mean(by=['TopicName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_sns_dash_0_8:
resource "signalfx_list_chart" "sfx_aws_sns_dash_0_8" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Topics by Bytes Published/Interval"
  program_text            = "A = data('PublishSize', filter=filter('namespace', 'AWS/SNS') and filter('TopicName', '*') and filter('stat', 'mean')).mean(by=['TopicName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_dashboard.sfx_aws_sns_dash_0:
resource "signalfx_dashboard" "sfx_aws_sns_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_sns.id
  discovery_options_query = "namespace:\"AWS/SNS\" AND _exists_:TopicName"
  discovery_options_selectors = [
    "_exists_:TopicName",
    "namespace:AWS/SNS",
    "sf_key:TopicName",
  ]
  name = "SNS"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_sns_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sns_dash_0_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sns_dash_0_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sns_dash_0_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sns_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_sns_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_sns_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sns_dash_0_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_sns_dash_0_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
}
