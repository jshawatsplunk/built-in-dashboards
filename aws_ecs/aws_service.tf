# signalfx_single_value_chart.sfx_aws_ecs_dash_2_0:
resource "signalfx_single_value_chart" "sfx_aws_ecs_dash_2_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Running Tasks"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'count') and filter('ServiceName', '*'), rollup='average').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    label        = "A"
    value_suffix = "tasks"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_2_1:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_2_1" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Running Tasks"
  plot_type          = "LineChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'count') and filter('ServiceName', '*'), rollup='average').sum().publish(label='A')"
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
    display_name = "# tasks"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_2_2:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_2_2" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU %"
  plot_type          = "LineChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'mean')).mean(by=['ClusterName', 'ServiceName']).publish(label='A')"
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
    display_name = "CPUUtilization - Mean by ClusterName,ServiceName"
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_2_3:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_2_3" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Memory %"
  plot_type          = "LineChart"
  program_text       = "A = data('MemoryUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'mean')).mean(by=['ClusterName', 'ServiceName']).publish(label='A')"
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
    display_name = "MemoryUtilization - Mean by ClusterName,ServiceName"
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_dashboard.sfx_aws_ecs_dash_2:
resource "signalfx_dashboard" "sfx_aws_ecs_dash_2" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_ecs.id
  discovery_options_query = "namespace:\"AWS/ECS\" AND _exists_:ServiceName AND _exists_:ClusterName"
  discovery_options_selectors = [
    "_exists_:ServiceName",
  ]
  name = "ECS (AWS) Service"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_2_2.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_2_3.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_2_1.id
    column   = 6
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ecs_dash_2_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 6
  }

  variable {
    alias                  = "Cluster"
    apply_if_exist         = false
    property               = "ClusterName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
  variable {
    alias                  = "Service"
    apply_if_exist         = false
    property               = "ServiceName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
