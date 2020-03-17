# signalfx_single_value_chart.sfx_aws_alb_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_alb_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# of Active Connections"
  program_text            = "A = data('ActiveConnectionCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum'), rollup='latest').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "ActiveConnectionCount - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_alb_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_alb_dash_1_1" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Target Reponse Time Distribution"
  plot_type         = "AreaChart"
  program_text      = <<-EOF
        A = data('TargetResponseTime', filter=filter('AvailabilityZone', '*') and filter('stat', 'mean') and filter('LoadBalancer', '*') and filter('namespace', 'AWS/ApplicationELB') and filter('TargetGroup', '*'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancer']).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  viz_options {
    axis         = "left"
    display_name = "TargetResponseTime - Sum by LoadBalancer"
    label        = "A"
    value_unit   = "Second"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "p10"
    label        = "C"
    value_unit   = "Second"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "median"
    label        = "D"
    value_unit   = "Second"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "min"
    label        = "B"
    value_unit   = "Second"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "max"
    label        = "F"
    value_unit   = "Second"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "p90"
    label        = "E"
    value_unit   = "Second"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_2:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_2" {
  color_by                = "Dimension"
  max_precision           = 2
  name                    = "Top 5 LBs by Target Response Time"
  program_text            = "A = data('TargetResponseTime', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'mean') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*')).sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AvailabilityZone"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    enabled  = false
    property = "TargetGroup"
  }

  viz_options {
    display_name = "TargetResponseTime - Sum by LoadBalancer - Top 5"
    label        = "A"
    value_unit   = "Second"
  }
}
# signalfx_single_value_chart.sfx_aws_alb_dash_1_3:
resource "signalfx_single_value_chart" "sfx_aws_alb_dash_1_3" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Requests Count"
  program_text            = "A = data('RequestCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), rollup='average').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "RequestCount - Sum"
    label        = "A"
    value_suffix = "reqs"
  }
}
# signalfx_time_chart.sfx_aws_alb_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_alb_dash_1_4" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Request Count Percentile Distribution"
  plot_type         = "AreaChart"
  program_text      = <<-EOF
        A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('stat', 'sum') and filter('namespace', 'AWS/ApplicationELB') and filter('LoadBalancer', '*') and filter('TargetGroup', '*'), rollup='average').sum(by=['LoadBalancer']).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  viz_options {
    axis         = "left"
    display_name = "RequestCount - Sum by LoadBalancer"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "p10"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "median"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "min"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "max"
    label        = "F"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_5" {
  color_by                = "Dimension"
  max_precision           = 2
  name                    = "Top 5 LBs by Number of Requests"
  program_text            = "A = data('RequestCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), rollup='average').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AvailabilityZone"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    enabled  = false
    property = "TargetGroup"
  }

  viz_options {
    display_name = "Top 5 LBs"
    label        = "A"
    value_suffix = "reqs"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_6:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_6" {
  color_by                = "Dimension"
  description             = "3xx, 4xx, and 5xx responses"
  max_precision           = 2
  name                    = "Top 5 LBs by HTTP Errors"
  program_text            = "A = data('HTTPCode_ELB*XX*', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*'), rollup='average').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    property = "AvailabilityZone"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }

  viz_options {
    display_name = "."
    label        = "A"
    value_suffix = "errors"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_7:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_7" {
  color_by                = "Dimension"
  description             = " "
  max_precision           = 2
  name                    = "Top 5 LBs by Target TLS Negotiation Errors"
  program_text            = "A = data('TargetTLSNegotiationErrorCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), rollup='rate').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    display_name = "errors"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_8:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_8" {
  color_by                = "Dimension"
  max_precision           = 2
  name                    = "Top 5 LBs by Target Connection Errors"
  program_text            = "A = data('TargetConnectionErrorCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), rollup='average').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    display_name = "Target Connection Errors"
    label        = "A"
    value_suffix = "errors"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_9:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_9" {
  color_by                = "Dimension"
  max_precision           = 2
  name                    = "Top 5 LBs by HTTP Target Errors"
  program_text            = "A = data('HTTPCode_T*', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*') and (not filter('sf_metric', 'HTTPCode_Target_2XX_Count')), rollup='average').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AvailabilityZone"
  }
  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    enabled  = false
    property = "TargetGroup"
  }

  viz_options {
    display_name = "HTTP Target Errors"
    label        = "A"
    value_suffix = "errors"
  }
}
# signalfx_time_chart.sfx_aws_alb_dash_1_10:
resource "signalfx_time_chart" "sfx_aws_alb_dash_1_10" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "Number of TLS connections initiated by the client that did not establish a session with the load balancer. Possible causes include a mismatch of ciphers or protocols."
  disable_sampling  = false
  name              = "Top 5 LBs by Client TLS Negotiation Errors"
  plot_type         = "LineChart"
  program_text      = "A = data('ClientTLSNegotiationErrorCount', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'sum') and filter('AvailabilityZone', '*'), rollup='average').sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 900
  timezone          = "UTC"
  unit_prefix       = "Metric"

  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "AvailabilityZone"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
  }

  viz_options {
    axis         = "left"
    display_name = "errors"
    label        = "A"
    value_suffix = "errors"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_11:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_11" {
  color_by                = "Dimension"
  description             = "Number of load balancer capacity units (LCU) used by your load balancer. You pay for the number of LCUs that you use per hour."
  max_precision           = 2
  name                    = "Top 5 LBs by LCU Usage"
  program_text            = "A = data('ConsumedLCUs', filter=filter('namespace', 'AWS/ApplicationELB') and filter('stat', 'mean')).sum(by=['LoadBalancer']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  time_range              = 900
  unit_prefix             = "Metric"

  legend_options_fields {
    enabled  = false
    property = "AWSUniqueId"
  }
  legend_options_fields {
    enabled  = true
    property = "LoadBalancer"
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
    display_name = "LCU Usage"
    label        = "A"
    value_suffix = "LCUs"
  }
}
# signalfx_list_chart.sfx_aws_alb_dash_1_12:
resource "signalfx_list_chart" "sfx_aws_alb_dash_1_12" {
  color_by                = "Dimension"
  max_precision           = 3
  name                    = "LBs with Highest Unhealthy Host %"
  program_text            = <<-EOF
        A = data('HealthyHostCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancer', '*') and filter('stat', 'mean') and filter('namespace', 'AWS/ApplicationELB') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancer']).publish(label='A', enable=False)
        B = data('UnHealthyHostCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancer', '*') and filter('stat', 'mean') and filter('namespace', 'AWS/ApplicationELB') and filter('AvailabilityZone', '*') and filter('TargetGroup', '*'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancer']).publish(label='B', enable=False)
        C = (B/(A+B)).scale(100).top(count=5).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    label        = "C"
    value_suffix = "%"
  }
  viz_options {
    display_name = "HealthyHostCount - Sum by LoadBalancer"
    label        = "A"
  }
  viz_options {
    display_name = "UnHealthyHostCount - Sum by LoadBalancer"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_alb_dash_1_13:
resource "signalfx_time_chart" "sfx_aws_alb_dash_1_13" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "Comparing now to 7 days ago | if LB did not exist 7 days ago, chart will not be populated"
  disable_sampling  = false
  name              = "% Change in Request Count per Load Balancer"
  plot_type         = "LineChart"
  program_text      = <<-EOF
        A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancer', '*') and filter('stat', 'sum') and filter('namespace', 'AWS/ApplicationELB') and filter('TargetGroup', '*'), rollup='average').mean(over='1h').sum(by=['LoadBalancer']).publish(label='A', enable=False)
        B = (A).timeshift('1w').publish(label='B', enable=False)
        C = (A/B-1).scale(100).publish(label='C')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1w"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "RequestCount - Mean(1h) - Sum by LoadBalancer"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "change %"
    label        = "C"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_alb_dash_1_14:
resource "signalfx_time_chart" "sfx_aws_alb_dash_1_14" {
  axes_include_zero = false
  axes_precision    = 0
  color_by          = "Dimension"
  description       = "Comparing now vs 7 days ago | If LB did not exist 7 days ago, chart will not be populated"
  disable_sampling  = false
  name              = "% Change in Target Reponse Time per LB"
  plot_type         = "LineChart"
  program_text      = <<-EOF
        A = data('TargetResponseTime', filter=filter('AvailabilityZone', '*') and filter('LoadBalancer', '*') and filter('stat', 'mean') and filter('namespace', 'AWS/ApplicationELB') and filter('TargetGroup', '*'), rollup='average').sum(by=['LoadBalancer']).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1w').publish(label='B', enable=False)
        C = (A/B-1).scale(100).publish(label='C')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1w"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "TargetResponseTime - Sum by LoadBalancer - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "change %"
    label        = "C"
    value_suffix = "%"
  }
}
# signalfx_dashboard.sfx_aws_alb_dash_1:
resource "signalfx_dashboard" "sfx_aws_alb_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_alb.id
  description             = "Overview of the Amazon ALB service."
  discovery_options_query = "namespace:\"AWS/ApplicationELB\""
  discovery_options_selectors = [
    "namespace:AWS/ApplicationELB",
    "sf_key:LoadBalancer",
  ]
  name = "Application ELB Instances"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_12.id
    column   = 0
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_alb_dash_1_13.id
    column   = 4
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_alb_dash_1_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_alb_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_alb_dash_1_14.id
    column   = 8
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_alb_dash_1_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_alb_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_alb_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_alb_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }

  variable {
    alias                  = "Availability Zone"
    apply_if_exist         = false
    description            = "null"
    property               = "AvailabilityZone"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
