# signalfx_single_value_chart.sfx_aws_ecs_dash_3_0:
resource "signalfx_single_value_chart" "sfx_aws_ecs_dash_3_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Clusters"
  program_text            = "A = data('cpu.usage.system', extrapolation='last_value', maxExtrapolations=5,rollup='rate').mean(by=['ClusterName']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "A"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_3_1:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_1" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_delay               = 0
  max_precision           = 0
  name                    = "# Running Tasks"
  program_text            = <<-EOF
        A = data('cpu.usage.system', filter=filter('ecs_task_arn', '*'),rollup='rate').sum(by=['ecs_task_arn']).count().publish(label='A')
        B = data('cpu.usage.system', filter=filter('ecs_task_arn', '*') and filter('AWSUniqueId', '*'),rollup='rate').sum(by=['ecs_task_arn']).count().publish(label='B')
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
# signalfx_list_chart.sfx_aws_ecs_dash_3_2:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_2" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_delay               = 0
  max_precision           = 0
  name                    = "# Running Containers"
  program_text            = <<-EOF
        A = data('cpu.usage.system', filter=filter('ecs_task_arn', '*'),rollup='rate').count().publish(label='A')
        B = data('cpu.usage.system', filter=filter('ecs_task_arn', '*') and filter('AWSUniqueId', '*'),rollup='rate').count().publish(label='B')
        C = (A-B).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    display_name = "All Containers"
    label        = "A"
  }
  viz_options {
    display_name = "EC2 Containers"
    label        = "B"
  }
  viz_options {
    display_name = "Fargate Containers"
    label        = "C"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_3_3:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_3" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Clusters by CPU %"
  program_text            = <<-EOF
        A = data('cpu.usage.total', filter=filter('ecs_task_group', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['ClusterName']).top(count=5).publish(label='A', enable=False)
        B = data('cpu.usage.system', filter=filter('ecs_task_group', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').mean(by=['ClusterName']).publish(label='B', enable=False)
        C = ((A/B)*100).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    label        = "C"
    value_suffix = "%"
  }
  viz_options {
    display_name = "Cluster CPU Usage"
    label        = "A"
  }
  viz_options {
    display_name = "Total Cluster CPU"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_3_4:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_4" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Clusters by Memory %"
  program_text            = <<-EOF
        A = data('memory.usage.total', extrapolation='last_value', maxExtrapolations=5).sum(by=['ClusterName']).top(count=5).publish(label='A', enable=False)
        B = data('memory.usage.limit').sum(by=['ClusterName']).publish(label='B', enable=False)
        C = ((A/B)*100).publish(label='C')
    EOF
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    label        = "C"
    value_suffix = "%"
  }
  viz_options {
    display_name = "Cluster Memory Total"
    label        = "B"
  }
  viz_options {
    display_name = "Cluster Memory Used"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_3_5:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_3_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Running Tasks by Cluster"
  plot_type          = "LineChart"
  program_text       = "B = data('cpu.usage.total', filter=filter('ClusterName', '*'),rollup='rate').sum(by=['ecs_task_arn']).count(by=['ClusterName']).publish(label='B')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
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
    display_name = "# running tasks"
    label        = "B"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_3_6:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_3_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Running Containers by Cluster"
  plot_type          = "LineChart"
  program_text       = "B = data('cpu.usage.total', filter=filter('ClusterName', '*'),rollup='rate').count(by=['ClusterName']).publish(label='B')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
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
    display_name = "# running containers"
    label        = "B"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_3_7:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_7" {
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
    label        = "C"
    value_suffix = "%"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_3_8:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_3_8" {
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
    label        = "C"
    value_suffix = "%"
  }
}
# signalfx_dashboard.sfx_aws_ecs_dash_3:
resource "signalfx_dashboard" "sfx_aws_ecs_dash_3" {
  charts_resolution = "default"
  dashboard_group   = signalfx_dashboard_group.sfx_aws_ecs.id
  name              = "ECS (SignalFx)"

  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ecs_dash_3_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_7.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_4.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_8.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_3_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_3_6.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_3_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
}
