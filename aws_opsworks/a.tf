# signalfx_single_value_chart.sfx_aws_opsworks_dash_0_0:
resource "signalfx_single_value_chart" "sfx_aws_opsworks_dash_0_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "# Stacks"
  program_text            = "A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('StackId', '*'), extrapolation='last_value', maxExtrapolations=5).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu_idle - Count"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_opsworks_dash_0_1:
resource "signalfx_single_value_chart" "sfx_aws_opsworks_dash_0_1" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "# Layers"
  program_text            = "A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('LayerId', '*'), extrapolation='last_value', maxExtrapolations=5).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

}
# signalfx_single_value_chart.sfx_aws_opsworks_dash_0_2:
resource "signalfx_single_value_chart" "sfx_aws_opsworks_dash_0_2" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 4
  name                    = "# of Instances"
  program_text            = "A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('InstanceId', '*'), extrapolation='last_value', maxExtrapolations=5).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu_idle - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_3:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU % by Stack"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='A', enable=False)
        B = (100-A).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "cpu %"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "cpu_idle - Mean by StackId"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU % by Layer"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('LayerId', '*')).mean(by=['LayerId']).publish(label='A', enable=False)
        B = (100-A).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "cpu %"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "cpu %"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "cpu_idle - Mean by LayerId"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_5:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU % by Instance"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('InstanceId', '*')).publish(label='A', enable=False)
        B = (100-A).publish(label='B')
        C = (B).min().publish(label='C')
        D = (B).percentile(pct=10).publish(label='D')
        E = (B).percentile(pct=50).publish(label='E')
        F = (B).percentile(pct=90).publish(label='F')
        G = (B).max().publish(label='G')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "cpu %"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "cpu %"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "cpu_idle"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "p10"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "median"
    label        = "E"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "min"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "max"
    label        = "G"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "p90"
    label        = "F"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_6:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_6" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Stacks by CPU %"
  program_text            = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='A', enable=False)
        B = (100-A).top(count=5).publish(label='B')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu_idle - Mean by StackId"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_7:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_7" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Layers by CPU %"
  program_text            = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('LayerId', '*')).mean(by=['LayerId']).publish(label='A', enable=False)
        B = (100-A).top(count=5).publish(label='B')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu_idle - Mean by LayerId"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_8:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_8" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Instances by CPU %"
  program_text            = <<-EOF
        A = data('cpu_idle', filter=filter('namespace', 'AWS/OpsWorks') and filter('stat', 'mean') and filter('InstanceId', '*')).mean(by=['InstanceId']).publish(label='A', enable=False)
        B = (100-A).top(count=5).publish(label='B')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu_idle - Mean by InstanceId"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_9:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Memory by Stack"
  plot_type          = "AreaChart"
  program_text       = "A = data('memory_total', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean'), extrapolation='last_value', maxExtrapolations=5).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
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
    display_name = "memory_total"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_10:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Memory % by Stack"
  plot_type          = "LineChart"
  program_text       = <<-EOF
        A = data('memory_used', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).publish(label='A', enable=False)
        B = data('memory_total', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).publish(label='B', enable=False)
        C = (A/B*100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "memory %"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "memory %"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "memory_total"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "memory_used"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_11:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_11" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Stacks by Memory %"
  program_text            = <<-EOF
        A = data('memory_used', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='A', enable=False)
        B = data('memory_total', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='B', enable=False)
        C = (A/B*100).top(count=5).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "memory_total - Mean by StackId"
    label        = "B"
  }
  viz_options {
    display_name = "memory_used - Mean by StackId"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_12:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_12" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total # Processes by Stack"
  plot_type          = "AreaChart"
  program_text       = "A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean'), extrapolation='last_value').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# processes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "procs"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_13:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_13" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Processes by Stack"
  plot_type          = "LineChart"
  program_text       = "A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean'), extrapolation='last_value').publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# processes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "procs"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_14:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_14" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Stacks by # Processes"
  program_text            = "A = data('procs', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean'), extrapolation='last_value').mean(by=['StackId']).ceil().publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_opsworks_dash_0_15:
resource "signalfx_time_chart" "sfx_aws_opsworks_dash_0_15" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Load-5min by Stack"
  plot_type          = "LineChart"
  program_text       = "A = data('load_5', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "load_5"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "load_5"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_16:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_16" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Stacks by Load-5min"
  program_text            = "A = data('load_5', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_list_chart.sfx_aws_opsworks_dash_0_17:
resource "signalfx_list_chart" "sfx_aws_opsworks_dash_0_17" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Stacks by Load-15min"
  program_text            = "A = data('load_15', filter=filter('namespace', 'AWS/OpsWorks') and filter('StackId', '*') and filter('stat', 'mean')).mean(by=['StackId']).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_dashboard.sfx_aws_opsworks_dash_0:
resource "signalfx_dashboard" "sfx_aws_opsworks_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_opsworks.id
  description             = "Default dashboard."
  discovery_options_query = "_exists_:namespace"
  discovery_options_selectors = [
    "namespace:AWS/OpsWorks",
  ]
  name = "OpsWorks (a)"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_14.id
    column   = 8
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_opsworks_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_opsworks_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_12.id
    column   = 0
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_17.id
    column   = 8
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_15.id
    column   = 0
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_13.id
    column   = 4
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_opsworks_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_16.id
    column   = 4
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_opsworks_dash_0_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_opsworks_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
}
