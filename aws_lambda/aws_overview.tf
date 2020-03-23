# signalfx_single_value_chart.sfx_aws_lambda_dash_2_0:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_0" {
  color_by                = "Dimension"
  description             = "last 5m, including different function versions"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Active Functions"
  program_text            = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*'), rollup='count', extrapolation='zero').count(by=['Resource']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Active Function Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_2_1:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_2_1" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "last 5m, including different function versions | depends on metadata synchronization to acquire account id"
  disable_sampling  = false
  name              = "Active Functions by AWS Account"
  plot_type         = "AreaChart"
  program_text      = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and filter('FunctionName', '*'), rollup='rate', extrapolation='zero').sum(by=['FunctionName', 'Resource']).sum(over='5m').count(by=['aws_account_id']).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = true
  time_range        = 3600
  timezone          = "UTC"
  unit_prefix       = "Metric"

  legend_options_fields {
    enabled  = true
    property = "aws_account_id"
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
    display_name = "Active Function Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_2_2:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_2_2" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "last 5m, including different function versions | depends on metadata synchronization to acquire aws region"
  disable_sampling  = false
  name              = "Active Functions by AWS Region"
  plot_type         = "AreaChart"
  program_text      = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'count') and filter('Resource', '*') and filter('FunctionName', '*'), rollup='rate', extrapolation='zero').sum(by=['FunctionName', 'Resource']).sum(over='5m').count(by=['aws_region']).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = true
  time_range        = 3600
  timezone          = "UTC"
  unit_prefix       = "Metric"

  legend_options_fields {
    enabled  = false
    property = "aws_account_id"
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
    property = "aws_region"
  }
  legend_options_fields {
    enabled  = true
    property = "FunctionName"
  }
  legend_options_fields {
    enabled  = true
    property = "Resource"
  }

  viz_options {
    axis         = "left"
    display_name = "Active Function Count"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_2_3:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_3" {
  color_by                = "Dimension"
  description             = "over last 5m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Invocations"
  program_text            = "A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "green"
    display_name = "Invocations - Sum(5m) - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_2_4:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_2_4" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of times a function reported an invocation, error, or throttle"
  disable_sampling          = false
  name                      = "Invocations | Errors | Throttles"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum().publish(label='A')
        B = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum().publish(label='B')
        C = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum().publish(label='C')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 3600
  timezone                  = "UTC"
  unit_prefix               = "Metric"

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "Errors"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "Invocations"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "yellow"
    display_name = "Throttles"
    label        = "C"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_5:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_5" {
  color_by                = "Dimension"
  description             = "sum over 5m"
  max_precision           = 0
  name                    = "Invocations by function"
  program_text            = "A = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum(by=['FunctionName']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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

  viz_options {
    display_name = "Invocations - Sum(5m) - Sum by FunctionName"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_2_6:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_6" {
  color_by                = "Dimension"
  description             = "over last 5m"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Errors"
  program_text            = "A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    color        = "brown"
    display_name = "Errors - Sum(5m) - Sum"
    label        = "A"
  }
}
# signalfx_heatmap_chart.sfx_aws_lambda_dash_2_7:
resource "signalfx_heatmap_chart" "sfx_aws_lambda_dash_2_7" {
  description    = "% of invocations with errors (5m)"
  group_by       = []
  hide_timestamp = false
  name           = "Error Heatmap by Function"
  program_text   = <<-EOF
        A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='last_value', maxExtrapolations=2).sum(over='5m').sum(by=['FunctionName']).publish(label='A', enable=False)
        B = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='last_value', maxExtrapolations=2).sum(over='5m').sum(by=['FunctionName']).publish(label='B', enable=False)
        C = (A/B).scale(100).publish(label='C')
    EOF
  sort_by        = "-value"
  unit_prefix    = "Metric"

  color_scale {
    color = "lime_green"
    gt    = 340282346638528860000000000000000000000
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 0
  }
  color_scale {
    color = "red"
    gt    = 20
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 340282346638528860000000000000000000000
  }
  color_scale {
    color = "vivid_yellow"
    gt    = 0
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 5
  }
  color_scale {
    color = "yellow"
    gt    = 5
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 20
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_8:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_8" {
  color_by                = "Dimension"
  description             = "over 5m"
  max_precision           = 0
  name                    = "% of total errors by function"
  program_text            = <<-EOF
        B = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='B', enable=False)
        A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum(by=['FunctionName']).publish(label='A', enable=False)
        C = (A/B).scale(100).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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

  viz_options {
    display_name = "A/B - Scale:100"
    label        = "C"
    value_suffix = "%"
  }
  viz_options {
    display_name = "Errors - Sum(5m) - Sum by FunctionName"
    label        = "A"
  }
  viz_options {
    display_name = "Total Errors"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_9:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_9" {
  color_by                = "Dimension"
  description             = "sum over 5m"
  max_precision           = 0
  name                    = "Errors by Function"
  program_text            = "A = data('Errors', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*'), rollup='sum', extrapolation='zero').sum(over='5m').sum(by=['FunctionName']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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

  viz_options {
    display_name = "Errors - Sum(5m) - Sum by FunctionName"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_2_10:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_10" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Average Duration of All Functions"
  program_text            = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'mean') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='average').mean().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "Duration - Mean"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_time_chart.sfx_aws_lambda_dash_2_11:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_2_11" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "The elapsed wall clock time from when the function code starts executing as a result of an invocation to when it stops executing."
  disable_sampling  = false
  name              = "Average Duration per Function"
  plot_type         = "LineChart"
  program_text      = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'mean') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').mean(by=['FunctionName']).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 3600
  timezone          = "UTC"
  unit_prefix       = "Metric"

  axis_left {
    label = "ms"
  }

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

  viz_options {
    axis         = "left"
    display_name = "average duration"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_12:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_12" {
  color_by                = "Dimension"
  max_precision           = 0
  name                    = "Average Duration by Function"
  program_text            = "A = data('Duration', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'mean') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='average').sum(by=['FunctionName']).publish(label='A')"
  refresh_interval        = 3600
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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
    property = "sf_metric"
  }
  legend_options_fields {
    enabled  = false
    property = "stat"
  }
  legend_options_fields {
    enabled  = false
    property = "namespace"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = false
    property = "Resource"
  }

  viz_options {
    display_name = "Execution time"
    label        = "A"
    value_unit   = "Millisecond"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_2_13:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_13" {
  color_by                = "Dimension"
  description             = "over last 5m"
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
# signalfx_heatmap_chart.sfx_aws_lambda_dash_2_14:
resource "signalfx_heatmap_chart" "sfx_aws_lambda_dash_2_14" {
  description    = "% of Invocations throttled | 0% -5% Yellow, 5% - 20% Orange, >20% Red"
  group_by       = []
  hide_timestamp = false
  name           = "Throttle Heatmap"
  program_text   = <<-EOF
        A = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum(over='5m').sum(by=['FunctionName']).publish(label='A', enable=False)
        B = data('Invocations', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum').sum(over='5m').sum(by=['FunctionName']).publish(label='B', enable=False)
        C = (A/B).scale(100).publish(label='C')
    EOF
  unit_prefix    = "Metric"

  color_scale {
    color = "lime_green"
    gt    = 340282346638528860000000000000000000000
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 0
  }
  color_scale {
    color = "red"
    gt    = 20
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 340282346638528860000000000000000000000
  }
  color_scale {
    color = "vivid_yellow"
    gt    = 0
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 5
  }
  color_scale {
    color = "yellow"
    gt    = 5
    gte   = 340282346638528860000000000000000000000
    lt    = 340282346638528860000000000000000000000
    lte   = 20
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_15:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_15" {
  color_by                = "Dimension"
  description             = "over 5m"
  max_precision           = 0
  name                    = "% of total throttles by function"
  program_text            = <<-EOF
        A = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*'), rollup='sum', extrapolation='zero').sum(over='5m').sum().publish(label='A', enable=False)
        B = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*'), rollup='sum', extrapolation='zero').sum(over='5m').sum(by=['FunctionName']).publish(label='B', enable=False)
        C = (B/A).scale(100).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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

  viz_options {
    display_name = "% of total"
    label        = "C"
    value_suffix = "%"
  }
  viz_options {
    display_name = "Throttles - Sum(5m) - Sum by FunctionName"
    label        = "B"
  }
  viz_options {
    display_name = "Total Throttles"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_lambda_dash_2_16:
resource "signalfx_list_chart" "sfx_aws_lambda_dash_2_16" {
  color_by                = "Dimension"
  description             = "sum over 5m"
  max_precision           = 0
  name                    = "Throttles by function"
  program_text            = "A = data('Throttles', filter=filter('namespace', 'AWS/Lambda') and filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='sum', extrapolation='zero').sum(over='5m').sum(by=['FunctionName']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

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

  viz_options {
    display_name = "Throttles - Sum(5m) - Sum by FunctionName"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_lambda_dash_2_17:
resource "signalfx_single_value_chart" "sfx_aws_lambda_dash_2_17" {
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
# signalfx_time_chart.sfx_aws_lambda_dash_2_18:
resource "signalfx_time_chart" "sfx_aws_lambda_dash_2_18" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "The number of invocations that are run on nonprovisioned concurrency, when all provisioned concurrency is in use. For a version or alias that is configured to use provisioned concurrency, Lambda increments the count once for each invocation that runs on non-provisioned concurrency."
  disable_sampling          = false
  name                      = "Provisioned Concurrency Spillover Invocations by Function"
  on_chart_legend_dimension = "ExecutedVersion"
  plot_type                 = "AreaChart"
  program_text              = "A = data('ProvisionedConcurrencySpilloverInvocations', filter=filter('stat', 'sum') and filter('Resource', '*') and (not filter('ExecutedVersion', '*')), rollup='rate').sum(by=['FunctionName']).publish(label='A')"
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
# signalfx_dashboard.sfx_aws_lambda_dash_2:
resource "signalfx_dashboard" "sfx_aws_lambda_dash_2" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_lambda.id
  discovery_options_query = "namespace:\"AWS/Lambda\""
  discovery_options_selectors = [
    "namespace:AWS/Lambda",
  ]
  name = "Lambda (AWS) Overview"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_5.id
    column   = 9
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_17.id
    column   = 0
    height   = 1
    row      = 7
    width    = 3
  }
  chart {
    chart_id = signalfx_heatmap_chart.sfx_aws_lambda_dash_2_14.id
    column   = 3
    height   = 2
    row      = 5
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_16.id
    column   = 0
    height   = 1
    row      = 6
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_8.id
    column   = 9
    height   = 2
    row      = 2
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_13.id
    column   = 0
    height   = 1
    row      = 5
    width    = 3
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_2_1.id
    column   = 3
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_2_4.id
    column   = 3
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_2_2.id
    column   = 9
    height   = 1
    row      = 0
    width    = 3
  }
  chart {
    chart_id = signalfx_heatmap_chart.sfx_aws_lambda_dash_2_7.id
    column   = 3
    height   = 2
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_2_18.id
    column   = 3
    height   = 1
    row      = 7
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 3
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_lambda_dash_2_11.id
    column   = 3
    height   = 1
    row      = 4
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_lambda_dash_2_10.id
    column   = 0
    height   = 1
    row      = 4
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_15.id
    column   = 9
    height   = 2
    row      = 5
    width    = 3
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_lambda_dash_2_12.id
    column   = 9
    height   = 1
    row      = 4
    width    = 3
  }

  variable {
    alias                  = "AWS Account ID"
    apply_if_exist         = false
    description            = "null"
    property               = "aws_account_id"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
