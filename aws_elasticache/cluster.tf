# signalfx_single_value_chart.sfx_aws_elasticache_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_elasticache_dash_1_0" {
  color_by                = "Dimension"
  is_timestamp_hidden     = false
  max_precision           = 0
  name                    = "# Nodes"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheClusterId', 'CacheNodeId', 'aws_region']).count().publish(label='A')"
  secondary_visualization = "None"
  show_spark_line         = false
  unit_prefix             = "Metric"

  viz_options {
    display_name = "CPUUtilization - Mean by CacheClusterId,CacheNodeId,aws_region - Count"
    label        = "A"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_1" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Cache Hits & Misses /Min"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'),rollup='rate').sum(by=['sf_metric']).scale(60).publish(label='A')
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'),rollup='rate').sum(by=['sf_metric']).scale(60).publish(label='B')
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_2" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "# Items & 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CurrItems', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='A')
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
    label     = "# items - BLUE"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_3:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_3" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Metric"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Hit Rate %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='A', enable=False)
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='B', enable=False)
        C = (A/(A+B) * 100).publish(label='C')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "%"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis         = "left"
    display_name = "*Hits - Sum"
    label        = "A"
  }
  viz_options {
    axis         = "left"
    display_name = "*Misses - Sum"
    label        = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "memcached hit %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_4:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_4" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Metric"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Hit Rate % by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).publish(label='A', enable=False)
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).publish(label='B', enable=False)
        C = (A/(A+B) * 100).publish(label='C', enable=False)
        D = (C).min().publish(label='D')
        E = (C).percentile(pct=10).publish(label='E')
        F = (C).percentile(pct=50).publish(label='F')
        G = (C).percentile(pct=90).publish(label='G')
        H = (C).max().publish(label='H')
    EOF
  show_data_markers  = false
  show_event_lines   = false
  stacked            = false
  time_range         = 7200
  unit_prefix        = "Metric"

  axis_left {
    label     = "%"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
  }
  viz_options {
    axis  = "left"
    label = "B"
  }
  viz_options {
    axis         = "left"
    display_name = "hit rate %"
    label        = "C"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "p10"
    label        = "E"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "median"
    label        = "F"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "min"
    label        = "D"
  }
  viz_options {
    axis         = "left"
    color        = "magenta"
    display_name = "max"
    label        = "H"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "p90"
    label        = "G"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_5:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_5" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Lowest Hit Rate % Nodes"
  program_text            = <<-EOF
        A = data('*Hits', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).publish(label='A', enable=False)
        B = data('*Misses', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and filter('stat', 'sum') and filter('CacheNodeId', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).publish(label='B', enable=False)
        C = (A/(A+B) * 100).bottom(count=5).publish(label='C')
    EOF
  secondary_visualization = "None"
  sort_by                 = "+value"
  unit_prefix             = "Metric"

  viz_options {
    display_name = "hit rate %"
    label        = "C"
  }
}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_6:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_6" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Avg CPU% & 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('stat', 'mean') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean().publish(label='A')
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
    display_name = "CPUUtilization - Mean"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_7:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_7" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CPU% by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
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
    label     = "%"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_8:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_8" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 3
  name                    = "Top Nodes by CPU%"
  program_text            = "A = data('CPUUtilization', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_9:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_9" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "SwapUsage (bytes) & 24h Change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('SwapUsage', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'mean') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
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
    display_name = "SwapUsage - Sum"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_10:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_10" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "SwapUsage (bytes) by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('SwapUsage', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
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
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_11:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_11" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Nodes by SwapUsage (bytes)"
  program_text            = "A = data('SwapUsage', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'aws_region', 'CacheClusterId']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Binary"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_12:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_12" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Connections & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CurrConnections', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'mean') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
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
    label     = "CurrConnections - BLUE"
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
    display_name = "CurrConnections - Sum"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_13:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_13" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "CurrConnections by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('CurrConnections', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
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
    label     = "# connections"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_14:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_14" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Nodes by CurrConnections"
  program_text            = "A = data('CurrConnections', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_15:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_15" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Evictions/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('Evictions', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'sum') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').sum().publish(label='A')
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
    display_name = "Evictions - Sum"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_16:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_16" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Evictions/Interval by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('Evictions', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'sum') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').publish(label='A', enable=False)
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
    label     = "evictions"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_17:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_17" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Nodes by Evictions/Interval"
  program_text            = "A = data('Evictions', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Metric"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_18:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_18" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Network Bytes In/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesIn', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'mean') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
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
    display_name = "NetworkBytesIn - Sum"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_19:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_19" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Bytes In/Interval by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesIn', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
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
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_20:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_20" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Nodes by Network Bytes In/Interval"
  program_text            = "A = data('NetworkBytesIn', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Binary"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_21:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_21" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total Network Bytes Out/Interval & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesOut', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'mean') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
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
    display_name = "NetworkBytesOut - Sum"
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_22:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_22" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Network Bytes Out/Interval by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('NetworkBytesOut', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
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
    label     = "bytes"
    min_value = 0
  }

  histogram_options {
    color_theme = "red"
  }

  viz_options {
    axis  = "left"
    label = "A"
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
    color        = "pink"
    display_name = "p90"
    label        = "E"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_23:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_23" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Top Nodes by Network Bytes Out/Interval"
  program_text            = "A = data('NetworkBytesOut', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "-value"
  unit_prefix             = "Binary"

}
# signalfx_time_chart.sfx_aws_elasticache_dash_1_24:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_24" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "Total FreeableMemory & 24h change %"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('FreeableMemory', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheClusterId', '*') and (not filter('CacheNodeId', '*')) and filter('stat', 'mean') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).sum().publish(label='A')
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
# signalfx_time_chart.sfx_aws_elasticache_dash_1_25:
resource "signalfx_time_chart" "sfx_aws_elasticache_dash_1_25" {
  axes_include_zero  = false
  axes_precision     = 0
  color_by           = "Dimension"
  description        = "percentile distribution"
  disable_sampling   = false
  minimum_resolution = 0
  name               = "FreeableMemory by Node"
  plot_type          = "AreaChart"
  program_text       = <<-EOF
        A = data('FreeableMemory', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).publish(label='A', enable=False)
        H = (A).min().publish(label='H')
        I = (A).percentile(pct=10).publish(label='I')
        J = (A).percentile(pct=50).publish(label='J')
        K = (A).percentile(pct=90).publish(label='K')
        M = (A).max().publish(label='M')
    EOF
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
    axis  = "left"
    label = "A"
  }
  viz_options {
    axis         = "left"
    color        = "aquamarine"
    display_name = "A - P10"
    label        = "I"
  }
  viz_options {
    axis         = "left"
    color        = "azure"
    display_name = "A - P50"
    label        = "J"
  }
  viz_options {
    axis         = "left"
    color        = "green"
    display_name = "A - Minimum"
    label        = "H"
  }
  viz_options {
    axis         = "left"
    color        = "pink"
    display_name = "A - P90"
    label        = "K"
  }
  viz_options {
    axis         = "left"
    color        = "purple"
    display_name = "A - Maximum"
    label        = "M"
  }
}
# signalfx_list_chart.sfx_aws_elasticache_dash_1_26:
resource "signalfx_list_chart" "sfx_aws_elasticache_dash_1_26" {
  color_by                = "Dimension"
  disable_sampling        = false
  max_precision           = 4
  name                    = "Least FreeableMemory (bytes) Nodes"
  program_text            = "A = data('FreeableMemory', filter=filter('namespace', 'AWS/ElastiCache') and filter('CacheNodeId', '*') and filter('stat', 'mean') and filter('CacheClusterId', '*') and filter('aws_region', '*'), extrapolation='last_value', maxExtrapolations=5).mean(by=['CacheNodeId', 'CacheClusterId', 'aws_region']).top(count=5).publish(label='A')"
  secondary_visualization = "None"
  sort_by                 = "+value"
  unit_prefix             = "Binary"

}
# signalfx_dashboard.sfx_aws_elasticache_dash_1:
resource "signalfx_dashboard" "sfx_aws_elasticache_dash_1" {
  charts_resolution       = "default"
  dashboard_group         = signalfx_dashboard_group.sfx_aws_elasticache.id
  discovery_options_query = "namespace:\"AWS/ElastiCache\" AND NOT CacheNodeId:*"
  discovery_options_selectors = [
    "_exists_:CacheClusterId",
  ]
  name = "ElastiCache Cluster"

  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_1.id
    column   = 4
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_13.id
    column   = 4
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_9.id
    column   = 0
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_8.id
    column   = 8
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_6.id
    column   = 0
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_18.id
    column   = 0
    height   = 1
    row      = 6
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_15.id
    column   = 0
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_14.id
    column   = 8
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_12.id
    column   = 0
    height   = 1
    row      = 4
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_17.id
    column   = 8
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_7.id
    column   = 4
    height   = 1
    row      = 2
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_3.id
    column   = 0
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_10.id
    column   = 4
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_22.id
    column   = 4
    height   = 1
    row      = 7
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_23.id
    column   = 8
    height   = 1
    row      = 7
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_11.id
    column   = 8
    height   = 1
    row      = 3
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_4.id
    column   = 4
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_20.id
    column   = 8
    height   = 1
    row      = 6
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_5.id
    column   = 8
    height   = 1
    row      = 1
    width    = 4
  }
  chart {
    chart_id = signalfx_list_chart.sfx_aws_elasticache_dash_1_26.id
    column   = 8
    height   = 1
    row      = 8
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_21.id
    column   = 0
    height   = 1
    row      = 7
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_25.id
    column   = 4
    height   = 1
    row      = 8
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_19.id
    column   = 4
    height   = 1
    row      = 6
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_2.id
    column   = 8
    height   = 1
    row      = 0
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_24.id
    column   = 0
    height   = 1
    row      = 8
    width    = 4
  }
  chart {
    chart_id = signalfx_time_chart.sfx_aws_elasticache_dash_1_16.id
    column   = 4
    height   = 1
    row      = 5
    width    = 4
  }
  chart {
    chart_id = signalfx_single_value_chart.sfx_aws_elasticache_dash_1_0.id
    column   = 0
    height   = 1
    row      = 0
    width    = 4
  }

  variable {
    alias                  = "cluster id"
    apply_if_exist         = false
    description            = "ElastiCache Cluster Id as displayed in the AWS API"
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
