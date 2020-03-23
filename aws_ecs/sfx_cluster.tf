# signalfx_single_value_chart.sfx_aws_ecs_dash_4_0:
resource "signalfx_single_value_chart" "sfx_aws_ecs_dash_4_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Task Definitions"
  program_text            = "B = data('cpu.usage.total', filter=filter('ClusterName', '*'),rollup='rate').sum(by=['ecs_task_group']).count().publish(label='B')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "cpu.usage.total - Sum by ecs_task_group - Count"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_4_1:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_4_1" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_delay               = 0
  max_precision           = 0
  name                    = "# Running Tasks"
  program_text            = <<-EOF
        A = data('cpu.usage.system', filter=filter('ClusterName', '*'),rollup='rate').sum(by=['ecs_task_arn']).count().publish(label='A')
        B = data('cpu.usage.system', filter=filter('AWSUniqueId', '*') and filter('ClusterName', '*'),rollup='rate').sum(by=['ecs_task_arn']).count().publish(label='B')
        C = (A-B).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    display_name = "All Tasks"
    label        = "A"
  }
  viz_options {
    display_name = "EC2 Tasks"
    label        = "B"
  }
  viz_options {
    display_name = "Fargate Tasks"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_4_2:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_4_2" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  description               = "distribution"
  disable_sampling          = false
  minimum_resolution        = 0
  name                      = "Cluster CPU %"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        A = data('cpu.usage.total', filter=filter('ecs_task_group', '*'), rollup='rate').publish(label='A', enable=False)
        B = data('cpu.usage.system', filter=filter('ecs_task_group', '*'), rollup='rate').publish(label='B', enable=False)
        C = ((A/B)*100).publish(label='C', enable=False)
        E = (C).min().publish(label='E')
        G = (C).percentile(pct=10).publish(label='G')
        F = (C).percentile(pct=50).publish(label='F')
        H = (C).percentile(pct=95).publish(label='H')
        D = (C).max().publish(label='D')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 7200
  unit_prefix               = "Metric"

  axis_left {
    label     = "CPU %"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "C"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "cpu.percent"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "P10"
    label        = "G"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "Median"
    label        = "F"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "Min"
    label        = "E"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "Max"
    label        = "D"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "P95"
    label        = "H"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_4_3:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_4_3" {
  axes_include_zero         = false
  axes_precision            = 0
  color_by                  = "Dimension"
  disable_sampling          = false
  minimum_resolution        = 0
  name                      = "Memory %"
  on_chart_legend_dimension = "plot_label"
  plot_type                 = "AreaChart"
  program_text              = <<-EOF
        A = data('memory.usage.total', filter=filter('ecs_task_group', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
        B = data('memory.usage.limit', filter=filter('ecs_task_group', '*')).publish(label='B', enable=False)
        C = ((A/B)*100).publish(label='C', enable=False)
        E = (C).min().publish(label='E')
        G = (C).percentile(pct=10).publish(label='G')
        F = (C).percentile(pct=50).publish(label='F')
        H = (C).percentile(pct=95).publish(label='H')
        D = (C).max().publish(label='D')
    EOF
  show_data_markers         = false
  show_event_lines          = false
  stacked                   = false
  time_range                = 7200
  unit_prefix               = "Metric"

  axis_left {
    label     = "memory %"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "Memory Limit"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "Memory Usage %"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    display_name = "Total Memory Usage"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "P10"
    label        = "G"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "Median"
    label        = "F"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "Min"
    label        = "E"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "Max"
    label        = "D"
    value_suffix = "%"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "P95"
    label        = "H"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_4_4:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_4_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  max_delay          = 0
  minimum_resolution = 0
  name               = "# Running Tasks"
  plot_type          = "AreaChart"
  program_text       = "A = data('cpu.usage.system', filter=filter('ClusterName', '*'),rollup='rate').sum(by=['ecs_task_arn']).count().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 900
  unit_prefix        = "Metric"

  axis_left {
    label     = "# tasks"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "All Tasks"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_4_5:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_4_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Task Definitions"
  plot_type          = "AreaChart"
  program_text       = "B = data('cpu.usage.total', filter=filter('ClusterName', '*'),rollup='rate').mean(by=['ecs_task_group']).count().publish(label='B')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# task definitions"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "cpu.usage.total - Mean by ecs_task_group - Count"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_4_6:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_4_6" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Task Definitions by CPU %"
  program_text            = <<-EOF
        A = data('cpu.usage.total', filter=filter('ecs_task_group', '*'), rollup='rate').publish(label='A', enable=False)
        B = data('cpu.usage.system', filter=filter('ecs_task_group', '*'), rollup='rate').publish(label='B', enable=False)
        C = ((A/B)*100).mean(by=['ecs_task_group']).top(count=5).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    display_name = "(A/B)*100 - Mean by ecs_task_group - Top 5"
    label        = "C"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_4_7:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_4_7" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Task Definitions by Memory %"
  program_text            = <<-EOF
        A = data('memory.usage.total', filter=filter('ecs_task_group', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
        B = data('memory.usage.limit', filter=filter('ecs_task_group', '*')).publish(label='B', enable=False)
        C = ((A/B)*100).mean(by=['ecs_task_group']).top(count=5).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    display_name = "(A/B)*100 - Mean by ecs_task_group - Top 5"
    label        = "C"
  }
}
# signalfx_dashboard.sfx_aws_ecs_dash_4:
resource "signalfx_dashboard" "sfx_aws_ecs_dash_4" {
  charts_resolution = "default"
  dashboard_group   = signalfx_dashboard_group.sfx_aws_ecs.id
  name              = "ECS (SignalFx) Cluster"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_4_7.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_4_1.id
    column   = 6
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_4_2.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_4_6.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_4_5.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_4_4.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_4_3.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ecs_dash_4_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 6
  }

  variable {
    alias                  = "Cluster"
    apply_if_exist         = false
    description            = "ECS cluster"
    property               = "ClusterName"
    replace_only           = true
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
