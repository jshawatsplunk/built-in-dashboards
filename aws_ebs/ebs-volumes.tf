# signalfx_single_value_chart.sfx_aws_ebs_dash_0_0:
resource "signalfx_single_value_chart" "sfx_aws_ebs_dash_0_0" {
  color_by                = "Dimension"
  description             = "that reported in last hour"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Volumes"
  program_text            = "A = data('VolumeIdleTime', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EBS')).max(over='1h').count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "VolumeIdleTime - Maximum(1h) - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Metric"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Ops/Reporting Interval"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).sum().publish(label='A')
        B = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).sum().publish(label='B')
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
    display_name = "VolumeReadOps"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "VolumeWriteOps"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_0_2:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Metric"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Bytes/Reporting Interval"
  plot_type          = "ColumnChart"
  program_text       = <<-EOF
        A = data('VolumeReadBytes', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).sum().publish(label='A')
        B = data('VolumeWriteBytes', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).sum().publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

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
    display_name = "VolumeReadBytes"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "blue"
    display_name = "VolumeWriteBytes"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ebs_dash_0_3:
resource "signalfx_list_chart" "sfx_aws_ebs_dash_0_3" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Read Ops/Interval"
  program_text            = "A = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').scale(60).mean(by=['VolumeId']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_ebs_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read Ops/Interval"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeReadOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).publish(label='A', enable=False)
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
    label     = "ops/interval"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeReadOps - Scale:60"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_0_5:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Bytes/Read Op"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeReadBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EBS'), extrapolation='zero').publish(label='A', enable=False)
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
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes/op"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeReadBytes"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_ebs_dash_0_6:
resource "signalfx_list_chart" "sfx_aws_ebs_dash_0_6" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Write Ops/Interval"
  program_text            = "A = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).mean(by=['VolumeId']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_ebs_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Write Ops/Interval"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeWriteOps', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'sum'), rollup='rate', extrapolation='zero').scale(60).publish(label='A', enable=False)
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
    label     = "ops/interval"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeWriteOps - Scale:60"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_0_8:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Bytes/Write Op"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeWriteBytes', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EBS'), extrapolation='zero').publish(label='A', enable=False)
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
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes/op"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeWriteBytes"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_ebs_dash_0_9:
resource "signalfx_list_chart" "sfx_aws_ebs_dash_0_9" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Avg Queue Length (# ops)"
  program_text            = "A = data('VolumeQueueLength', filter=filter('namespace', 'AWS/EBS') and filter('stat', 'mean')).mean(by=['VolumeId']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_ebs_dash_0_10:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Read Latency (ms)"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeTotalReadTime', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EBS'), extrapolation='zero').scale(1000).publish(label='A', enable=False)
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
    label     = "ms/read"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeTotalReadTime - Scale:1000"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_time_chart.sfx_aws_ebs_dash_0_11:
resource "signalfx_time_chart" "sfx_aws_ebs_dash_0_11" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Write Latency (ms)"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('VolumeTotalWriteTime', filter=filter('stat', 'mean') and filter('namespace', 'AWS/EBS'), extrapolation='zero').scale(1000).publish(label='A', enable=False)
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
    label     = "ms/write"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "VolumeTotalWriteTime - Scale:1000"
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
    color        = "orange"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_dashboard.sfx_aws_ebs_dash_0:
resource "signalfx_dashboard" "sfx_aws_ebs_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_ebs.id
  discovery_options_query = "namespace:\"AWS/EBS\" AND _exists_:VolumeId"
  discovery_options_selectors = [
    "namespace:AWS/EBS",
    "sf_key:VolumeId",
  ]
  name = "EBS Volumes"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ebs_dash_0_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ebs_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ebs_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ebs_dash_0_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ebs_dash_0_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
}
