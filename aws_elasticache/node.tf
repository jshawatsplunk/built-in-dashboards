# signalfx_single_value_chart.sfx_aws_elasticache_dash_2_0:
resource "signalfx_single_value_chart" "sfx_aws_elasticache_dash_2_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Nodes"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheClusterId', 'CacheNodeId', 'aws_region']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "CPUUtilization - Mean by CacheClusterId,CacheNodeId,aws_region - Count"
    label        = "A"
  }
}
# signalfx_single_value_chart.sfx_aws_elasticache_dash_2_1:
resource "signalfx_single_value_chart" "sfx_aws_elasticache_dash_2_1" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 3
  name                    = "Hit Rate %"
  program_text            = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='A', enable=False)
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='B', enable=False)
        C = (A/(A+B)*100).publish(label='C')
    EOF
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "*Hits - Sum"
    label        = "A"
  }
  viz_options {
    display_name = "*Misses - Sum"
    label        = "B"
  }
  viz_options {
    display_name = "hit rate %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_2:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Cache Hits & Misses /Interval"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['sf_metric']).publish(label='A')
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['sf_metric']).publish(label='B')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = true
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "count"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    color = "brown"
    label = "B"
  }
  viz_options {
    axis  = "left"
    color = "green"
    label = "A"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_3:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Items & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CurrItems', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "items - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "CurrItems"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_4:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Bytes & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('BytesUsedForCache*', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "BytesUsedForCache"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_5:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_5" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CurrConnections & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CurrConnections', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "conns - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "CurrConnections"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_6:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Avg CPU % & 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).mean().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "cpu % - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "CPUUtilization"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_7:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "FreeableMemory & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('FreeableMemory', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "FreeableMemory - Sum"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_8:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_8" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Evictions/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('Evictions', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).mean().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "evictions - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "Evictions"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_9:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Bytes In/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesIn', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "NetworkBytesIn"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_10:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Bytes Out/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesOut', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "NetworkBytesOut"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_2_11:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_2_11" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "SwapUsage & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('SwapUsage', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
        B = (A).mean(over='1h').publish(label='B', enable=False)
        C = (B).timeshift('1d').publish(label='C', enable=False)
        D = (B/C - 1).scale(100).publish(label='D')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Binary"

  axis_left {
    label     = "bytes - BLUE"
    min_value = 0
  }

  axis_right {
    label = "change % - RED"
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "A - Mean(1h)"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "C - Timeshift 1d"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "SwapUsage"
    label        = "A"
  }
  viz_options {
    axis         = "right"
    color        = "brown"
    display_name = "24h change %"
    label        = "D"
    plot_type    = "LineChart"
  }
}
# signalfx_dashboard.sfx_aws_elasticache_dash_2:
resource "signalfx_dashboard" "sfx_aws_elasticache_dash_2" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_elasticache.id
  discovery_options_query = "namespace:\"AWS/ElastiCache\""
  discovery_options_selectors = [
    "_exists_:CacheNodeId",
  ]
  name = "ElastiCache Node"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_elasticache_dash_2_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_elasticache_dash_2_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_2_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }

  variable {
    alias                  = "cluster id"
    apply_if_exist         = false
    description            = "ElastiCache cluster id as represented in the AWS api"
    property               = "CacheClusterId"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
  variable {
    alias                  = "cluster name"
    apply_if_exist         = false
    description            = "The name  of the cluster as displayed in AWS"
    property               = "aws_cache_cluster_name"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
  variable {
    alias                  = "node"
    apply_if_exist         = false
    description            = "ElastiCache node id"
    property               = "CacheNodeId"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
  variable {
    alias                  = "region"
    apply_if_exist         = false
    description            = "AWS region"
    property               = "aws_region"
    replace_only           = false
    restricted_suggestions = false
    value_required         = false
    values                 = []
    values_suggested       = []
  }
}
