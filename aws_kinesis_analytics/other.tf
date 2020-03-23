# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_0:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_0" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "# of successful delivery performed"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Delivery Success Rate"
  plot_type          = "LineChart"
  program_text       = "A = data('Success', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'count'),rollup='rate').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  axis_left {
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "Success"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_1:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_1" {
  color_by                = "Dimension"
  description             = "lag between the time an application is reading from the source"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Stream Input Lag"
  program_text            = "A = data('MillisBehindLatest', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'mean')).mean().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "MillisBehindLatest - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_2:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_2" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Average Input Processing"
  program_text            = "A = data('InputProcessing.Duration', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'mean')).mean().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "InputProcessing.Duration - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_3:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_3" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Bytes Received"
  program_text            = "A = data('Bytes', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Input') and filter('stat', 'sum'),rollup='rate').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Bytes - Sum"
    label        = "A"
    value_unit   = "Byte"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_4:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_4" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Bytes Sent"
  program_text            = "A = data('Bytes', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Output') and filter('stat', 'sum'),rollup='rate').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Bytes - Sum"
    label        = "A"
    value_unit   = "Byte"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_5:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Bytes Received/Sent Trend"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('Bytes', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Input') and filter('stat', 'sum'), rollup='sum').sum().publish(label='A')
        B = data('Bytes', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Output') and filter('stat', 'sum'), rollup='sum').sum().publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "Sent"
    label        = "B"
    plot_type    = "ColumnChart"
    value_unit   = "Byte"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "Received"
    label        = "A"
    plot_type    = "ColumnChart"
    value_unit   = "Byte"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_6:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_6" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Records Received"
  program_text            = "A = data('Records', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Input') and filter('stat', 'count'), rollup='sum').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Records - Sum"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_7:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_7" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Records Sent"
  program_text            = "A = data('Records', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Output') and filter('stat', 'count'), rollup='sum').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Records - Sum"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_8:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Records Received/Sent Trend"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('Records', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Input') and filter('stat', 'sum'),rollup='rate').sum().publish(label='A')
        B = data('Records', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('Flow', 'Output') and filter('stat', 'sum'),rollup='rate').sum().publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "Received"
    label        = "A"
    value_suffix = "records"
  }
  viz_options {
    axis         = "left"
    display_name = "Sent"
    label        = "B"
    value_suffix = "records"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_9:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Input Processing Ok Records"
  plot_type          = "LineChart"
  program_text       = "B = data('InputProcessing.OkRecords', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'sum'), rollup='sum').publish(label='B')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "InputProcessing.OkRecords"
    label        = "B"
    value_suffix = "records"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_10:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Input Processing Failed Records"
  plot_type          = "LineChart"
  program_text       = "A = data('InputProcessing.ProcessingFailedRecords', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'sum'), rollup='sum').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "InputProcessing.ProcessingFailedRecords"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_11:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_11" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Input Processing Dropped Records"
  plot_type          = "LineChart"
  program_text       = "A = data('InputProcessing.DroppedRecords', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'sum'), rollup='sum').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "InputProcessing.DroppedRecords"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_12:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_analytics_dash_1_12" {
  color_by                = "Dimension"
  description             = "The time taken for Lambda function invocation"
  is_timestamp_hidden     = false
  max_delay               = 0
  max_precision           = 0
  name                    = "Average Lambda Delivery"
  program_text            = "A = data('LambdaDelivery.Duration', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'mean')).mean().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "LambdaDelivery.Duration - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_13:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_13" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Lambda Delievery Ok Records"
  plot_type          = "LineChart"
  program_text       = "A = data('LambdaDelivery.OkRecords', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'sum'), rollup='sum').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "LambdaDelivery.OkRecords"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_14:
resource "signalfx_time_chart" "sfx_aws_kinesis_analytics_dash_1_14" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "Application | Id | AWSUniqueId"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "Lambda Delivery Failed Records"
  plot_type          = "LineChart"
  program_text       = "A = data('LambdaDelivery.DeliveryFailedRecords', filter=filter('namespace', 'AWS/KinesisAnalytics') and filter('stat', 'sum'), rollup='sum').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = true
    property = "Application"
  }
  legend_options_fields {
    enabled  = true
    property = "Id"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Flow"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_originatingMetric"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "LambdaDelivery.DeliveryFailedRecords"
    label        = "A"
    value_suffix = "records"
  }
}
# signalfx_dashboard.sfx_aws_kinesis_analytics_dash_1:
resource "signalfx_dashboard" "sfx_aws_kinesis_analytics_dash_1" {
  charts_resolution = "default"
  dashboard_group   = signalfx_dashboard_group.sfx_aws_kinesis_analytics.id
  name              = "Kinesis Analytics"

  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_2.id
    column   = 9
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_14.id
    column   = 7
    height   = 1
    row      = 4
    width    = 5
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_12.id
    column   = 0
    height   = 1
    row      = 4
    width    = 2
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_4.id
    column   = 3
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_7.id
    column   = 3
    height   = 1
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_5.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_13.id
    column   = 2
    height   = 1
    row      = 4
    width    = 5
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_analytics_dash_1_1.id
    column   = 6
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_analytics_dash_1_8.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }

  variable {
    alias                  = "AWSUniqueId"
    apply_if_exist         = false
    property               = "AWSUniqueId"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
  variable {
    alias                  = "application"
    apply_if_exist         = false
    property               = "Application"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
