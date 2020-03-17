# signalfx_single_value_chart.sfx_aws_asg_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "GroupMinSize"
  program_text            = "A = data('GroupMinSize', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupMinSize"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_1_1:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_1" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "GroupMaxSize"
  program_text            = "A = data('GroupMaxSize', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupMaxSize"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_1_2:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_2" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 2
  name                    = "GroupDesiredCapacity"
  program_text            = "A = data('GroupDesiredCapacity', filter=filter('stat', 'mean') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupDesiredCapacity"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_1_3:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_3" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "In Service Instances"
  program_text            = "A = data('GroupInServiceInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupInServiceInstances"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_asg_dash_1_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "In Service Instances per Period"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupInServiceInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
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
    display_name = "GroupInServiceInstances"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_1_5:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_5" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Pending Instances"
  program_text            = "A = data('GroupPendingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupPendingInstances"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_asg_dash_1_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Pending Instances per Interval"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupPendingInstances', filter=filter('namespace', 'AWS/AutoScaling') and filter('stat', 'mean') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
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
    display_name = "GroupPendingInstances"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_asg_dash_1_7:
resource "signalfx_single_value_chart" "sfx_aws_asg_dash_1_7" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "Total Terminating Instances"
  program_text            = "A = data('GroupTerminatingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "GroupTerminatingInstances"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_asg_dash_1_8:
resource "signalfx_time_chart" "sfx_aws_asg_dash_1_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Terminating Instances per Period"
  plot_type          = "AreaChart"
  program_text       = "A = data('GroupTerminatingInstances', filter=filter('stat', 'mean') and filter('namespace', 'AWS/AutoScaling') and filter('AutoScalingGroupName', 'EC2ContainerService-default-439766bb-17a3-41cb-9e17-134df785fafe-EcsInstanceAsg-ZI6N93VA0FRE')).publish(label='A')"
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
    display_name = "GroupTerminatingInstances"
    label        = "A"
  }
}
# signalfx_dashboard.sfx_aws_asg_dash_1:
resource "signalfx_dashboard" "sfx_aws_asg_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_asg.id
  discovery_options_query = "namespace:\"AWS/AutoScaling\" AND _exists_:AutoScalingGroupName"
  discovery_options_selectors = [
    "namespace:AWS/AutoScaling",
    "sf_key:AutoScalingGroupName",
  ]
  name = "AutoScaling - Single Group"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_1_6.id
    column   = 6
    height   = 1
    row      = 2
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_1_8.id
    column   = 6
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_asg_dash_1_4.id
    column   = 6
    height   = 1
    row      = 1
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_7.id
    column   = 0
    height   = 1
    row      = 3
    width    = 6
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_asg_dash_1_5.id
    column   = 0
    height   = 1
    row      = 2
    width    = 6
  }

  variable {
    alias                  = "AutoScaling group"
    apply_if_exist         = false
    description            = "AutoScaling group"
    property               = "AutoScalingGroupName"
    replace_only           = false
    restricted_suggestions = false
    value_required         = true
    values = [
      "Choose group",
    ]
    values_suggested = []
  }
}
