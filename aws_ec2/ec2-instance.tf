# signalfx_single_value_chart.sfx_aws_ec2_dash_0_0:
resource "signalfx_single_value_chart" "sfx_aws_ec2_dash_0_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 2
  name                    = "CPU %"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/EC2') and filter('stat', 'mean') and filter('InstanceId', 'i-e8b1df4b'), extrapolation='last_value', maxExtrapolations=5).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"
}
# signalfx_time_chart.sfx_aws_ec2_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_0_1" {
  axes_include_zero = false
  axes_precision    = 3
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "CPU % Trend"
  plot_type         = "AreaChart"
  program_text      = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/EC2') and filter('stat', 'mean') and filter('InstanceId', 'i-e8b1df4b'), extrapolation='last_value', maxExtrapolations=5).publish(label='A')"
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  axis_left {
    label     = "cpu %"
    max_value = 110
    min_value = 0
  }

  viz_options {
    axis         = "left"
    display_name = "cpu %"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_ec2_dash_0_2:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_0_2" {
  color_by                = "Dimension"
  max_precision           = 4
  name                    = "Disk I/O / Min"
  program_text            = "A = data('Disk*', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').mean(by=['sf_metric']).scale(60).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "+sf_originatingMetric"
  time_range              = 900
  unit_prefix             = "Metric"
}
# signalfx_time_chart.sfx_aws_ec2_dash_0_3:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_0_3" {
  axes_include_zero = false
  axes_precision    = 3
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Disk I/O Bytes/Min"
  plot_type         = "ColumnChart"
  program_text      = <<-EOF
        A = data('DiskWriteBytes', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='A')
        B = data('DiskReadBytes', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='B')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Binary"

  axis_left {
    label     = "bytes written - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "bytes read - RED"
    min_value = 0
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "bytes written/interval"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "bytes read/interval"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ec2_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_0_4" {
  axes_include_zero = false
  axes_precision    = 3
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Disk IOPs/Min"
  plot_type         = "ColumnChart"
  program_text      = <<-EOF
        A = data('DiskWriteOps', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='A')
        B = data('DiskReadOps', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='B')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Metric"

  axis_left {
    label     = "write ops - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "read ops - RED"
    min_value = 0
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "write ops/interval"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "read ops/interval"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ec2_dash_0_5:
resource "signalfx_list_chart" "sfx_aws_ec2_dash_0_5" {
  color_by                = "Dimension"
  max_precision           = 3
  name                    = "Network I/O Bytes/Min"
  program_text            = <<-EOF
        A = data('NetworkIn', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').mean().scale(60).publish(label='A')
        B = data('NetworkOut', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').mean().scale(60).publish(label='B')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "+sf_originatingMetric"
  time_range              = 900
  unit_prefix             = "Binary"

  viz_options {
    display_name = "bytes in"
    label        = "A"
  }
  viz_options {
    display_name = "bytes out"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ec2_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_0_6" {
  axes_include_zero = false
  axes_precision    = 3
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Network I/O Bytes/Min"
  plot_type         = "ColumnChart"
  program_text      = <<-EOF
        A = data('NetworkIn', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='A')
        B = data('NetworkOut', filter=filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5, rollup='rate').sum().scale(60).publish(label='B')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Binary"

  axis_left {
    label     = "bytes out - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "bytes in - RED"
    min_value = 0
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "bytes out/interval"
    label        = "B"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "bytes in/interval"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ec2_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_ec2_dash_0_7" {
  axes_include_zero = false
  axes_precision    = 3
  color_by          = "Dimension"
  disable_sampling  = false
  name              = "Disk I/O Bytes/Operation"
  plot_type         = "ColumnChart"
  program_text      = <<-EOF
        A = data('DiskWriteBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b')).sum().publish(label='A', enable=False)
        B = data('DiskReadBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b')).sum().publish(label='B', enable=False)
        C = data('DiskWriteOps', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b')).sum().publish(label='C', enable=False)
        D = data('DiskReadOps', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EC2') and filter('InstanceId', 'i-e8b1df4b')).sum().publish(label='D', enable=False)
        E = (A/C).publish(label='E')
        F = (B/D).publish(label='F')
    EOF
  show_data_markers = false
  show_event_lines  = false
  stacked           = false
  time_range        = 7200
  timezone          = "UTC"
  unit_prefix       = "Binary"

  axis_left {
    label     = "bytes/write - BLUE"
    min_value = 0
  }

  axis_right {
    label     = "bytes/read - RED"
    min_value = 0
  }

  viz_options {
    axis         = "left"
    color        = "blue"
    display_name = "byte/write"
    label        = "E"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "byte/read"
    label        = "F"
  }
}
# signalfx_dashboard.sfx_aws_ec2_dash_0:
resource "signalfx_dashboard" "sfx_aws_ec2_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_ec2.id
  discovery_options_query = "namespace:\"AWS/EC2\" AND _exists_:InstanceId"
  discovery_options_selectors = [
    "_exists_:InstanceId",
  ]
  name = "EC2 Instance"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_ec2_dash_0_4.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ec2_dash_0_2.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ec2_dash_0_1.id
    column   = 6
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ec2_dash_0_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ec2_dash_0_3.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ec2_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ec2_dash_0_6.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ec2_dash_0_7.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }

  variable {
    alias                  = "instance"
    apply_if_exist         = false
    description            = "EC2 instance"
    property               = "InstanceId"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values = [
      "Choose instance",
    ]
    values_suggested = []
  }
}
