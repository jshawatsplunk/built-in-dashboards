# signalfx_single_value_chart.sfx_aws_cloudfront_dash_1_0:
resource "signalfx_single_value_chart" "sfx_aws_cloudfront_dash_1_0" {
    color_by                = "Dimension"
    is_timestamp_hidden     = false
    max_precision           = 0
    name                    = "# Distributions"
    program_text            = "A = data('Requests', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum'), extrapolation='last_value', maxExtrapolations=5,rollup='rate').count().publish(label='A')"
    secondary_visualization = "None"
    show_spark_line         = false
    unit_prefix             = "Metric"

    }
# signalfx_time_chart.sfx_aws_cloudfront_dash_1_1:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_1_1" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Total Requests/Interval"
    plot_type          = "AreaChart"
    program_text       = "A = data('Requests', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').sum(by=['DistributionId']).scale(60).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = true
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "requests/interval"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "requests/interval"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_1_2:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_1_2" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Total Downloaded Bytes/Interval"
    plot_type          = "AreaChart"
    program_text       = "A = data('BytesDownloaded', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').scale(60).sum(by=['DistributionId']).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = true
    time_range         = 7200
    unit_prefix        = "Binary"

    axis_left {
        label          = "bytes"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "BytesDownloaded"
        label        = "A"
    }
}
# signalfx_list_chart.sfx_aws_cloudfront_dash_1_3:
resource "signalfx_list_chart" "sfx_aws_cloudfront_dash_1_3" {
    color_by                = "Dimension"
    description             = "requests/interval"
    disable_sampling        = false
    max_precision           = 5
    name                    = "Top Distributions by Requests"
    program_text            = "A = data('Requests', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').scale(60).top(count=5).sum(by=['DistributionId']).publish(label='A')"
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"

    }
# signalfx_list_chart.sfx_aws_cloudfront_dash_1_4:
resource "signalfx_list_chart" "sfx_aws_cloudfront_dash_1_4" {
    color_by                = "Dimension"
    disable_sampling        = false
    max_precision           = 0
    name                    = "Top Distributions by Bytes Downloaded"
    program_text            = "A = data('BytesDownloaded', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum'), extrapolation='zero',rollup='rate').scale(60).top(count=5).sum(by=['DistributionId']).publish(label='A')"
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Binary"

    }
# signalfx_time_chart.sfx_aws_cloudfront_dash_1_5:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_1_5" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Error Rate % by Distribution"
    plot_type          = "LineChart"
    program_text       = "A = data('TotalErrorRate', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'mean'), extrapolation='zero').mean(by=['DistributionId']).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "errors %"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "TotalErrorRate - Mean by DistributionId"
        label        = "A"
    }
}
# signalfx_list_chart.sfx_aws_cloudfront_dash_1_6:
resource "signalfx_list_chart" "sfx_aws_cloudfront_dash_1_6" {
    color_by                = "Dimension"
    disable_sampling        = false
    max_precision           = 3
    name                    = "Top Distribitions by Total Error Rate %"
    program_text            = "A = data('TotalErrorRate', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'mean'), extrapolation='zero').mean(by=['DistributionId']).top(count=5).publish(label='A')"
    secondary_visualization = "Sparkline"
    sort_by                 = "-value"
    unit_prefix             = "Metric"

    }
# signalfx_dashboard.sfx_aws_cloudfront_dash_1:
resource "signalfx_dashboard" "sfx_aws_cloudfront_dash_1" {
    charts_resolution           = "default"
    dashboard_group             = signalfx_dashboard_group.sfx_aws_cloudfront.id
    discovery_options_query     = "namespace:\"AWS/CloudFront\" AND _exists_:DistributionId"
    discovery_options_selectors = [
        "namespace:AWS/CloudFront",
        "sf_key:DistributionId",
    ]
    name                        = "CloudFront Distributions"

    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_1_1.id
        column   = 4
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_1_5.id
        column   = 0
        height   = 1
        row      = 2
        width    = 6
    }
    chart {
        chart_id = signalfx_single_value_chart.sfx_aws_cloudfront_dash_1_0.id
        column   = 0
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_cloudfront_dash_1_4.id
        column   = 6
        height   = 1
        row      = 1
        width    = 6
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_cloudfront_dash_1_6.id
        column   = 6
        height   = 1
        row      = 2
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_1_2.id
        column   = 8
        height   = 1
        row      = 0
        width    = 4
    }
    chart {
        chart_id = signalfx_list_chart.sfx_aws_cloudfront_dash_1_3.id
        column   = 0
        height   = 1
        row      = 1
        width    = 6
    }
}
