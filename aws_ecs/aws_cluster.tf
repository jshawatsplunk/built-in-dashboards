# signalfx_single_value_chart.sfx_aws_ecs_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_ecs_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Running Services"
  program_text            = "A = data('CPUUtilization', filter=filter('ServiceName', '*') and filter('stat', 'mean') and filter('namespace', 'AWS/ECS')).count(by=['ServiceName']).sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "CPUUtilization - Count by ServiceName - Sum"
    label        = "A"
    value_suffix = "services"
  }
}
# signalfx_single_value_chart.sfx_aws_ecs_dash_1_1:
resource "signalfx_single_value_chart" "sfx_aws_ecs_dash_1_1" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Running Tasks"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('ServiceName', '*') and filter('stat', 'count'), rollup='average').sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "A"
    label        = "A"
    value_suffix = "tasks"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_1_2" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU %"
  plot_type          = "LineChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'mean') and (not filter('ServiceName', '*'))).publish(label='A')"
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

  legend_options_fields {
    enabled  = true
    property = "ClusterName"
  }
  legend_options_fields {
    enabled  = true
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
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

  viz_options {
    axis         = "left"
    display_name = "CPUUtilization"
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_1_3" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Memory %"
  plot_type          = "LineChart"
  program_text       = "A = data('MemoryUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'mean') and (not filter('ServiceName', '*'))).publish(label='A')"
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

  legend_options_fields {
    enabled  = true
    property = "ClusterName"
  }
  legend_options_fields {
    enabled  = true
    property = "namespace"
  }
  legend_options_fields {
    enabled  = true
    property = "AWSUniqueId"
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

  viz_options {
    axis         = "left"
    display_name = "MemoryUtilization"
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_1_4" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Running Tasks"
  plot_type          = "AreaChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('ServiceName', '*') and filter('stat', 'count'), rollup='average').sum(by=['ClusterName']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
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
    label        = "A"
    value_suffix = "tasks"
  }
}
# signalfx_time_chart.sfx_aws_ecs_dash_1_5:
resource "signalfx_time_chart" "sfx_aws_ecs_dash_1_5" {
  axes_include_zero  = true
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Running Services"
  plot_type          = "AreaChart"
  program_text       = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('ServiceName', '*') and filter('stat', 'mean')).mean(by=['ServiceName']).count(by=['ClusterName']).publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# services"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "# running services"
    label        = "A"
    value_suffix = "services"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_1_6:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_1_6" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Services by CPU %"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ECS') and filter('stat', 'mean') and filter('ServiceName', '*')).mean(by=['ServiceName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_list_chart.sfx_aws_ecs_dash_1_7:
resource "signalfx_list_chart" "sfx_aws_ecs_dash_1_7" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Services by Memory %"
  program_text            = "A = data('MemoryUtilization', filter=filter('stat', 'mean') and filter('namespace', 'AWS/ECS') and filter('ServiceName', '*')).sum(by=['ServiceName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  time_range              = 900
  unit_prefix             = "Metric"

  viz_options {
    label        = "A"
    value_suffix = "%"
  }
}
# signalfx_dashboard.sfx_aws_ecs_dash_1:
resource "signalfx_dashboard" "sfx_aws_ecs_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_ecs.id
  discovery_options_query = "namespace:\"AWS/ECS\" AND _exists_:ServiceName AND _exists_:ClusterName"
  discovery_options_selectors = [
    "_exists_:ClusterName",
  ]
  name = "ECS (AWS) Cluster"

  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ecs_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_1_4.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_1_7.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_1_2.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_1_5.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_ecs_dash_1_1.id
    column   = 6
    height   = 1
    row      = 0
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_ecs_dash_1_6.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_ecs_dash_1_3.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }

  variable {
    alias                  = "Cluster"
    apply_if_exist         = false
    description            = "Name of the cluster"
    property               = "ClusterName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
