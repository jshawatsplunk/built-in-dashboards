# signalfx_single_value_chart.sfx_aws_elb_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_elb_dash_1_0" {
  color_by                = "Dimension"
  description             = "that reported in last hour"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# LBs"
  program_text            = "A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='zero').sum(by=['LoadBalancerName']).count().max(over='1h').publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "# LB"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_elb_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_elb_dash_1_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Latency Over Last Minute"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('Latency', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancerName']).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "ms"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "Latency - Sum by LoadBalancerName"
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
# signalfx_list_chart.sfx_aws_elb_dash_1_2:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_2" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "LBs with Worst Average Latency (ms)"
  program_text            = "A = data('Latency', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancerName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  unit_prefix             = "Metric"

}
# signalfx_single_value_chart.sfx_aws_elb_dash_1_3:
resource "signalfx_single_value_chart" "sfx_aws_elb_dash_1_3" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Requests/min"
  program_text            = "A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().scale(60).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "RequestCount - Sum - Scale:60"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_elb_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_elb_dash_1_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Requests/min"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).sum(by=['LoadBalancerName']).publish(label='A', enable=False)
        B = (A).min().publish(label='B')
        C = (A).percentile(pct=10).publish(label='C')
        D = (A).percentile(pct=50).publish(label='D')
        E = (A).percentile(pct=90).publish(label='E')
        F = (A).max().publish(label='F')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "RequestCount - Scale:60 - Sum by LoadBalancerName"
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
# signalfx_list_chart.sfx_aws_elb_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_5" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top LBs by Requests/min"
  program_text            = "A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('stat', 'sum') and filter('LoadBalancerName', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['LoadBalancerName']).top(count=5).scale(60).publish(label='A')"
  secondary_visualization = "Sparkline"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_elb_dash_1_6:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_6" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Frontend Errors/min"
  program_text            = "A = data('HTTPCode_ELB_*', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').sum(by=['sf_metric', 'LoadBalancerName']).scale(60).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_elb_dash_1_7:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_7" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Highest Backend Error %"
  program_text            = <<-EOF
        A = data('HTTPCode_Backend_*', filter=filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*'), rollup='rate', extrapolation='zero').sum(by=['LoadBalancerName']).publish(label='A', enable=False)
        B = data('HTTPCode_Backend_2XX', filter=filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*'), extrapolation='zero',rollup='rate').sum(by=['LoadBalancerName']).publish(label='B', enable=False)
        C = data('HTTPCode_Backend_3XX', filter=filter('stat', 'sum') and filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*'), extrapolation='zero',rollup='rate').sum(by=['LoadBalancerName']).publish(label='C', enable=False)
        D = (1 - (B+C)/A).scale(100).publish(label='D')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "HTTPCode_Backend_* - Sum by LoadBalancerName"
    label        = "A"
  }
  viz_options {
    display_name = "HTTPCode_Backend_2XX - Sum by LoadBalancerName"
    label        = "B"
  }
  viz_options {
    display_name = "HTTPCode_Backend_3XX - Sum by LoadBalancerName"
    label        = "C"
  }
}
# signalfx_list_chart.sfx_aws_elb_dash_1_8:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_8" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Backend Connection Errors/min"
  program_text            = "A = data('BackendConnectionErrors', filter=filter('AvailabilityZone', '*') and filter('stat', 'sum') and filter('LoadBalancerName', '*'), extrapolation='zero',rollup='rate').sum(by=['LoadBalancerName']).scale(60).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_elb_dash_1_9:
resource "signalfx_list_chart" "sfx_aws_elb_dash_1_9" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "LBs with Highest Unhealthy Host %"
  program_text            = <<-EOF
        A = data('HealthyHostCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancerName']).publish(label='A', enable=False)
        B = data('UnHealthyHostCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancerName']).publish(label='B', enable=False)
        C = (B/(A+B)).scale(100).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "HealthyHostCount - Sum by LoadBalancerName"
    label        = "A"
  }
  viz_options {
    display_name = "UnHealthyHostCount - Sum by LoadBalancerName"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_elb_dash_1_10:
resource "signalfx_time_chart" "sfx_aws_elb_dash_1_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "per loadbalancer"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Requests/min 7d Change %"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('RequestCount', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').scale(60).mean(over='1h').sum(by=['LoadBalancerName']).publish(label='A', enable=False)
        B = (A).timeshift('1w').publish(label='B', enable=False)
        C = (A/B-1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1w"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "RequestCount - Scale:60 - Mean(1h) - Sum by LoadBalancerName"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "change %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_elb_dash_1_11:
resource "signalfx_time_chart" "sfx_aws_elb_dash_1_11" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "per loadbalancer"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Latency 7d Change %"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('Latency', filter=filter('AvailabilityZone', '*') and filter('LoadBalancerName', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).sum(by=['LoadBalancerName']).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1w').publish(label='B', enable=False)
        C = (A/B - 1).scale(100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "%"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1w"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "Latency - Sum by LoadBalancerName - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "change %"
    label        = "C"
  }
}
# signalfx_text_chart.sfx_aws_elb_dash_1_12:
resource "signalfx_text_chart" "sfx_aws_elb_dash_1_12" {
  markdown = <<-EOF
        Empty charts indicate no activity of that category

        Docs for [ELB CloudWatch metrics](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/elb-metricscollected.html)
    EOF
  name     = "Notes"
}
# signalfx_dashboard.sfx_aws_elb_dash_1:
resource "signalfx_dashboard" "sfx_aws_elb_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_elb.id
  description             = "Overview of the Amazon ELB service."
  discovery_options_query = "namespace:\"AWS/ELB\""
  discovery_options_selectors = [
    "namespace:AWS/ELB",
    "sf_key:LoadBalancerName",
  ]
  name = "ELB Instances"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elb_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_elb_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_elb_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elb_dash_1_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elb_dash_1_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elb_dash_1_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elb_dash_1_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_text_chart.sfx_aws_elb_dash_1_12.id
    column   = 0
    height   = 1
    row      = 4
    width    = 4
  }
}
