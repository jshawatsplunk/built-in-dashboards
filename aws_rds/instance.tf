# signalfx_time_chart.sfx_aws_rds_dash_0_0:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_0" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read/Write Ops/sec"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('ReadIOPS', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')
        B = data('WriteIOPS', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "reads/sec - RED"
    min_value = 0
  }

  axis_right {
    label     = "writes/sec - BLUE"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "ReadIOPS"
    label        = "A"
    plot_type    = "ColumnChart"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "WriteIOPS"
    label        = "B"
    plot_type    = "ColumnChart"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "latency per operation"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read/Write Latency (ms)"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('ReadLatency', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).scale(1000).publish(label='A')
        B = data('WriteLatency', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).scale(1000).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "reads - RED"
    min_value = 0
  }

  axis_right {
    label     = "writes - BLUE"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "ReadLatency - Scale:1000"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "WriteLatency - Scale:1000"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_2:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "bytes/sec"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read/Write Throughput"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('ReadThroughput', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')
        B = data('WriteThroughput', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "reads - RED"
    min_value = 0
  }

  axis_right {
    label     = "writes - BLUE"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    color        = "brown"
    display_name = "ReadThroughput"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "WriteThroughput"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_3:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU %"
  plot_type          = "AreaChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "cpu %"
    max_value = 110
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "CPUUtilization"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Free RAM"
  plot_type          = "AreaChart"
  program_text       = "A = data('FreeableMemory', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "FreeableMemory"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_5:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Free Storage Space"
  plot_type          = "AreaChart"
  program_text       = "A = data('FreeStorageSpace', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "FreeStorageSpace"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Database Connections"
  plot_type          = "AreaChart"
  program_text       = "A = data('DatabaseConnections', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# connections"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "DatabaseConnections"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Receive Throughput"
  plot_type          = "AreaChart"
  program_text       = "A = data('NetworkReceiveThroughput', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes/sec"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "NetworkReceiveThroughput"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_8:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Transmit Throughput"
  plot_type          = "AreaChart"
  program_text       = "A = data('NetworkTransmitThroughput', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes/sec"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "NetworkTransmitThroughput"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_9:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Avg Disk Queue Depth"
  plot_type          = "AreaChart"
  program_text       = "A = data('DiskQueueDepth', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# pending requests"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "DiskQueueDepth"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_10:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Swap Space Used"
  plot_type          = "AreaChart"
  program_text       = "A = data('SwapUsage', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "SwapUsage"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_rds_dash_0_11:
resource "signalfx_time_chart" "sfx_aws_rds_dash_0_11" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "R/W IOPS 24h Change %"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('ReadIOPS', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).mean(over='1h').publish(label='A', enable=False)
        B = data('WriteIOPS', filter=filter('namespace', 'AWS/RDS') and filter('stat', 'mean')).mean(over='1h').publish(label='B', enable=False)
        C = (A).timeshift('1d').publish(label='C', enable=False)
        D = (B).timeshift('1d').publish(label='D', enable=False)
        E = ((A-C)/C*100).publish(label='E')
        F = ((B-D)/D*100).publish(label='F')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label = "reads - RED"
  }

  axis_right {
    label = "writes - BLUE"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "B - Timeshift 1d"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "(B-H)/H*100"
    label        = "F"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "(A-G)/G*100"
    label        = "E"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "ReadIOPS - Mean(1h)"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "azure"
    display_name = "WriteIOPS - Mean(1h)"
    label        = "B"
  }
}
# signalfx_dashboard.sfx_aws_rds_dash_0:
resource "signalfx_dashboard" "sfx_aws_rds_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_rds.id
  discovery_options_query = "namespace:\"AWS/RDS\" AND _exists_:DBInstanceIdentifier"
  discovery_options_selectors = [
    "_exists_:DBInstanceIdentifier",
  ]
  name = "RDS Instance"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_rds_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }

  variable {
    alias                  = "instance"
    apply_if_exist         = false
    description            = "RDS DB Instance"
    property               = "DBInstanceIdentifier"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values = [
      "Choose Instance",
    ]
    values_suggested = []
  }
}
