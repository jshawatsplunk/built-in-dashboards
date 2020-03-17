# signalfx_single_value_chart.sfx_aws_asg_dash_0_0:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_0_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# AutoScaling Groups"
  program_text            = "A = data('GroupTotalInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).count(by=['AutoScalingGroupName']).sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupTotalInstances - Count by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_asg_dash_0_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total # Instances"
  plot_type          = "LineChart"
  program_text       = "A = data('GroupTotalInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
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
    display_name = "GroupTotalInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_list_chart.sfx_aws_asg_dash_0_2:
resource "signalfx_list_chart" "sfx_aws_asg_dash_0_2" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 0
  name                    = "Top Groups by # Instances"
  program_text            = "A = data('GroupTotalInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).top(count=5).publish(label='A')"
  secondary_visualization = "Sparkline"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_single_value_chart.sfx_aws_asg_dash_0_3:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_0_3" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "In Service Instances"
  program_text            = "A = data('GroupInServiceInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupInServiceInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_asg_dash_0_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "In Service Instances per Period"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupInServiceInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# instances"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "GroupInServiceInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_0_5:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_0_5" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Pending Instances"
  program_text            = "A = data('GroupPendingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupPendingInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_asg_dash_0_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Pending Instances per Interval"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupPendingInstances', filter=filter('namespace', 'AWS/AutoScaling') and filter('stat', 'mean')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# instances"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "GroupPendingInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_0_7:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_0_7" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Terminating Instances"
  program_text            = "A = data('GroupTerminatingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupTerminatingInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_0_8:
resource "signalfx_time_chart" "sfx_aws_asg_dash_0_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Terminating Instances per Period"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupTerminatingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling')).mean(by=['AutoScalingGroupName']).sum().publish(label='A')"
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "# instances"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "GroupTerminatingInstances - Mean by AutoScalingGroupName - Sum"
    label        = "A"
  }
}
# signalfx_dashboard.sfx_aws_asg_dash_0:
resource "signalfx_dashboard" "sfx_aws_asg_dash_0" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_asg.id
  discovery_options_query = "namespace:\"AWS/AutoScaling\" AND _exists_:AutoScalingGroupName"
  discovery_options_selectors = [
    "namespace:AWS/AutoScaling",
    "sf_key:AutoScalingGroupName",
  ]
  name = "AutoScaling - Multi Group"

  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_0_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_0_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_asg_dash_0_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_0_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_0_7.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_0_6.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_0_8.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_0_4.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_0_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
}
