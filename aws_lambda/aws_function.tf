# signalfx_single_value_chart.sfx_aws_lambda_dash_0_0:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_0_0" {
  color_by                = "Dimension"
  description             = "over 5m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Invocations"
  program_text            = "A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "green"
    display_name = "Invocations - Sum(5m) - Sum"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_0_1:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_0_1" {
  color_by                = "Metric"
  is_timestamp_hidden     = false
  max_precision           = 5
  name                    = "Average Invocation Duration"
  program_text            = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'mean') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='average').publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Duration (ms)"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_0_2:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_0_2" {
  color_by                = "Dimension"
  description             = "over 5m | Spillover invocations are run on nonprovisioned concurrency, when all provisioned concurrency is in use."
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Spillover Invocations"
  program_text            = "A = data('ProvisionedConcurrencySpilloverInvocations', filter=filter('stat', 'sum') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='rate').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Provisioned Concurrent Invocations"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_0_3:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_0_3" {
  color_by                = "Dimension"
  description             = "over 5m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Errors"
  program_text            = "A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "brown"
    display_name = "errors"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_0_4:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_0_4" {
  color_by                = "Dimension"
  description             = "over 5m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Throttles"
  program_text            = "A = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "yellow"
    display_name = "Throttles - Sum(5m) - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_5:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_5" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of times a function is invoked in response to an event or invocation API call and associated errors or throttles."
  disable_sampling          = false
  name                      = "Invocations"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = "A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum().publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }

  viz_options {
    axis         = "left"
    display_name = "Invocations"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_6" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of times a function is invoked in response to an event or invocation API call."
  disable_sampling          = false
  name                      = "Invocations by Version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='sum').sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }

  viz_options {
    axis         = "left"
    display_name = "Invocations by version"
    label        = "A"
    value_suffix = "-invocations"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_7" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of invocations that are run on provisioned concurrency. Lambda increments the count once for each invocation that runs on provisioned concurrency."
  disable_sampling          = false
  name                      = "Provisioned Concurrency Invocations by Version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('ProvisionedConcurrencyInvocations', filter=filter('stat', 'sum') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='rate').sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "Provisioned Concurrent Invocations"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_8:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_8" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of events that are being processed on provisioned concurrency. For each invocation of an alias or version with provisioned concurrency, Lambda emits the current count."
  disable_sampling          = false
  name                      = "Provisioned Concurrent Executions by Version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('ProvisionedConcurrentExecutions', filter=filter('stat', 'upper') and filter('Resource', '*') and filter('ExecutedVersion', '*')).sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  viz_options {
    axis         = "left"
    display_name = "Provisioned Concurrent Executions"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_0_9:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_0_9" {
  color_by                = "Dimension"
  max_precision           = 0
  name                    = "Average Duration by Version"
  program_text            = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'mean') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='average').sum(by=['ExecutedVersion']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }

  viz_options {
    display_name = "version"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_10:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_10" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of invocations that failed due to errors in the function (response code 4XX)."
  disable_sampling          = false
  name                      = "Errors by Version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('ExecutedVersion', '*') and filter('Resource', '*'), rollup='sum').sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }

  viz_options {
    axis         = "left"
    display_name = "Errors by Version"
    label        = "A"
    value_suffix = "-errors"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_11:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_11" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of Lambda function invocation attempts that were throttled due to invocation rates exceeding the customerâ€™s concurrent limits (error code 429)."
  disable_sampling          = false
  name                      = "Throttles by version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='sum').sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = true
    property = "aws_function_version"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }

  viz_options {
    axis         = "left"
    display_name = "Throttles by Version"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_0_12:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_0_12" {
  color_by                = "Dimension"
  description             = "The % of total invocations handled by version"
  max_precision           = 0
  name                    = "% Invocations by Version"
  program_text            = <<-EOF
        A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='sum', extrapolation='zero').sum().publish(label='A', enable=False)
        B = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='sum', extrapolation='zero').sum(by=['ExecutedVersion']).publish(label='B', enable=False)
        C = (B/A).scale(100).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "aws_function_version"
  }

  viz_options {
    display_name = "version"
    label        = "C"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_13:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_13" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of invocations that are run on nonprovisioned concurrency, when all provisioned concurrency is in use. For a version or alias that is configured to use provisioned concurrency, Lambda increments the count once for each invocation that runs on non-provisioned concurrency."
  disable_sampling          = false
  name                      = "Provisioned Concurrency Spillover Invocations by Version"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('ProvisionedConcurrencySpilloverInvocations', filter=filter('stat', 'sum') and filter('Resource', '*') and filter('ExecutedVersion', '*'), rollup='rate').sum(by=['ExecutedVersion']).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = true
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "Provisioned Concurrent Invocations"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_0_14:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_0_14" {
  axes_include_zero         = true
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of events that are being processed on provisioned concurrency, divided by the total amount of provisioned concurrency allocated. For example, .5 indicates that 50 percent of allocated provisioned concurrency is in use. For each invocation of an alias or version with provisioned concurrency, Lambda emits the current count."
  disable_sampling          = false
  name                      = "Provisioned Concurrency Utilization"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "LineChart"
  program_text              = "A = data('ProvisionedConcurrencyUtilization', filter=filter('stat', 'upper') and filter('Resource', '*') and filter('ExecutedVersion', '*')).scale(100).publish(label='A')"
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 900
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = true
    property = "ExecutedVersion"
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
    property = "Resource"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }

  viz_options {
    axis         = "left"
    display_name = "Provisioned Concurrency Utilization"
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_dashboard.sfx_aws_lambda_dash_0:
resource "signalfx_dashboard" "sfx_aws_lambda_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_lambda.id
  discovery_options_query = "namespace:\"AWS/Lambda\""
  discovery_options_selectors = [
    "_exists_:FunctionName",
    "_exists_:aws_function_name",
  ]
  name = "Lambda (AWS) Function"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_11.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_0_9.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_0_4.id
    column   = 10
    height   = 1
    row      = 0
    width    = 2
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_0_2.id
    column   = 6
    height   = 1
    row      = 0
    width    = 2
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_8.id
    column   = 9
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_5.id
    column   = 0
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_0_1.id
    column   = 3
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_14.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_10.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_0_12.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_0_3.id
    column   = 8
    height   = 1
    row      = 0
    width    = 2
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_7.id
    column   = 6
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_6.id
    column   = 3
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_0_13.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }

  variable {
    alias                  = "Function Name"
    apply_if_exist         = false
    description            = "null"
    property               = "FunctionName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values = [
      "Choose a function",
    ]
    values_suggested = []
  }
}
