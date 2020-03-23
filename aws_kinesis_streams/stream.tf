# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_0:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_0" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "The number of GetRecords calls throttled for the stream"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read Throughput Exceeded"
  plot_type          = "AreaChart"
  program_text       = "A = data('ReadProvisionedThroughputExceeded', filter=filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "Read Throughput Exceeded"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "The number of records rejected due to throttling for the stream"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Write Throughput Exceeded"
  plot_type          = "AreaChart"
  program_text       = "A = data('WriteProvisionedThroughputExceeded', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "# records"
  }

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "Write Throughput Exceeded"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_2:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "The age of the last record in all GetRecords calls made against an Kinesis stream. A value of zero indicates that the records being read are completely caught up with the stream"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "GetRecords Iterator Age (ms)"
  plot_type          = "AreaChart"
  program_text       = "A = data('GetRecords.IteratorAgeMilliseconds', filter=filter('stat', 'mean') and filter('namespace', 'AWS/Kinesis')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "age (ms)"
  }

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "Iterator Age (ms)"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_3:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_streams_dash_0_3" {
  color_by                = "Dimension"
  description             = "The number of bytes successfully put to the Kinesis stream, including bytes from PutRecord and PutRecords"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Average Incoming Bytes"
  program_text            = "A = data('IncomingBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/Kinesis'), rollup='latest').publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Binary"

  viz_options {
    display_name = "Incoming Bytes"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_4" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  disable_sampling          = false
  minimum_resolution        = 0
  name                      = "Incoming Bytes Distribution"
  on_chart_legend_dimension = "stat"
  plot_type                 = "LineChart"
  program_text              = <<-EOF
        A = data('IncomingBytes', filter=filter('stat', 'lower') and filter('namespace', 'AWS/Kinesis')).publish(label='A')
        B = data('IncomingBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/Kinesis')).publish(label='B')
        C = data('IncomingBytes', filter=filter('stat', 'upper') and filter('namespace', 'AWS/Kinesis')).publish(label='C')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 7200
  unit_prefix               = "Binary"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "max"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "mean"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "min"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_5:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_streams_dash_0_5" {
  color_by                = "Dimension"
  description             = "The number of records successfully put to the Kinesis stream, including records from PutRecord and PutRecords"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Incoming Records"
  program_text            = "A = data('IncomingRecords', filter=filter('stat', 'count'), rollup='latest').publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Incoming Records"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Incoming Records Trend"
  plot_type          = "AreaChart"
  program_text       = "A = data('IncomingRecords', filter=filter('stat', 'count') and filter('namespace', 'AWS/Kinesis'), rollup='latest').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
  legend_options_fields {
    enabled  = true
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "IncomingRecords"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "The number of successful GetRecords operations"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Successful GetRecords Operations"
  plot_type          = "AreaChart"
  program_text       = "A = data('GetRecords.Success', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'count'), rollup='latest').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "Successful GetRecords Ops"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_8:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Successful PutRecord(s) Operations"
  plot_type          = "AreaChart"
  program_text       = "A = data('PutRecord*.Success', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'count'), rollup='latest').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    display_name = "Successful PutRecord(s) Ops"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_9:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_9" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The time taken per GetRecords operation in milliseconds"
  disable_sampling          = false
  minimum_resolution        = 0
  name                      = "GetRecord Latency (ms) Distribution"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        C = data('GetRecords.Latency', filter=filter('stat', 'lower')).publish(label='C')
        A = data('GetRecords.Latency', filter=filter('stat', 'mean')).publish(label='A')
        B = data('GetRecords.Latency', filter=filter('stat', 'upper')).publish(label='B')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 7200
  unit_prefix               = "Metric"

  axis_left {
    label = "latency (ms)"
  }

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "max"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "mean"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "min"
    label        = "C"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_10:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_streams_dash_0_10" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 4
  name                    = "Average GetRecord Latency (ms)"
  program_text            = "A = data('GetRecords.Latency', filter=filter('stat', 'mean')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GetRecords.Latency"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_11:
resource "signalfx_time_chart" "sfx_aws_kinesis_streams_dash_0_11" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The time taken per PutRecord operation in milliseconds"
  disable_sampling          = false
  minimum_resolution        = 0
  name                      = "PutRecord Latency (ms) Distribution"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        A = data('PutRecord*.Latency', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'lower')).publish(label='A')
        B = data('PutRecord*.Latency', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'mean')).publish(label='B')
        C = data('PutRecord*.Latency', filter=filter('namespace', 'AWS/Kinesis') and filter('stat', 'upper')).publish(label='C')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 7200
  unit_prefix               = "Metric"

  axis_left {
    label = "latency (ms)"
  }

  histogram_options {
    color_theme = "red"
  }

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
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
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "StreamName"
  }

  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "max"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "mean"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "min"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_12:
resource "signalfx_single_value_chart" "sfx_aws_kinesis_streams_dash_0_12" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 4
  name                    = "Average PutRecord Latency (ms)"
  program_text            = "A = data('PutRecord*.Latency', filter=filter('stat', 'mean')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "PutRecord*.Latency"
    label        = "A"
  }
}
# signalfx_dashboard.sfx_aws_kinesis_streams_dash_0:
resource "signalfx_dashboard" "sfx_aws_kinesis_streams_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_kinesis_streams.id
  description             = "Stream-level metrics for Amazon Kinesis Streams"
  discovery_options_query = "namespace:\"AWS/Kinesis\" AND _exists_:StreamName"
  discovery_options_selectors = [
    "_exists_:StreamName",
  ]
  name = "Kinesis Stream"

  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_8.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_9.id
    column   = 0
    height   = 1
    row      = 4
    width    = 8
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 8
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_11.id
    column   = 0
    height   = 1
    row      = 5
    width    = 8
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_6.id
    column   = 4
    height   = 1
    row      = 2
    width    = 8
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_7.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_10.id
    column   = 8
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_kinesis_streams_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_kinesis_streams_dash_0_12.id
    column   = 8
    height   = 1
    row      = 5
    width    = 4
  }

  variable {
    alias                  = "StreamName"
    apply_if_exist         = false
    property               = "StreamName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values                 = []
    values_suggested       = []
  }
}
