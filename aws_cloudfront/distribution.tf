# signalfx_time_chart.sfx_aws_cloudfront_dash_0_0:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_0" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Requests/Interval"
    plot_type          = "AreaChart"
    program_text       = "A = data('Requests', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum') and filter('DistributionId', 'EJH671JAOI5SN'),rollup='rate').scale(60).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "# requests"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "Requests - Scale:60"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_1:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_1" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Total Error Rate %"
    plot_type          = "AreaChart"
    program_text       = "A = data('TotalErrorRate', filter=filter('namespace', 'AWS/CloudFront') and filter('DistributionId', 'EJH671JAOI5SN') and filter('stat', 'mean')).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "%"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "TotalErrorRate"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_2:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_2" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Bytes Downloaded/Interval"
    plot_type          = "AreaChart"
    program_text       = "A = data('BytesDownloaded', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum') and filter('DistributionId', 'EJH671JAOI5SN'),rollup='rate').scale(60).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
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
        display_name = "BytesDownloaded - Scale:60"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_3:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_3" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Bytes Uploaded/Interval"
    plot_type          = "AreaChart"
    program_text       = "A = data('BytesUploaded', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum') and filter('DistributionId', 'EJH671JAOI5SN'),rollup='rate').scale(60).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
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
        display_name = "BytesUploaded - Scale:60"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_4:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_4" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "4xx Error Rate %"
    plot_type          = "AreaChart"
    program_text       = "A = data('4xxErrorRate', filter=filter('namespace', 'AWS/CloudFront') and filter('DistributionId', 'EJH671JAOI5SN') and filter('stat', 'mean')).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "# errors"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "4xxErrorRate"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_5:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_5" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "5xx Error Rate %"
    plot_type          = "AreaChart"
    program_text       = "A = data('5xxErrorRate', filter=filter('namespace', 'AWS/CloudFront') and filter('DistributionId', 'EJH671JAOI5SN') and filter('stat', 'mean')).publish(label='A')"
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "%"
        min_value      = 0
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "5xxErrorRate"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_6:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_6" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Requests/Interval 24h Change %"
    plot_type          = "AreaChart"
    program_text       = <<-EOF
        A = data('Requests', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum') and filter('DistributionId', 'EJH671JAOI5SN'),rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = ((A-B)/B*100).publish(label='C')
    EOF
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "change %"
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "24h change %"
        label        = "C"
    }
    viz_options {
        axis         = "left"
        display_name = "A - Timeshift 1d"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        display_name = "Requests - Scale:60 - Mean(1h)"
        label        = "A"
    }
}
# signalfx_time_chart.sfx_aws_cloudfront_dash_0_7:
resource "signalfx_time_chart" "sfx_aws_cloudfront_dash_0_7" {
    axes_include_zero  = false
    axes_precision     = 0
    color_by           = "Dimension"
    disable_sampling   = false
    minimum_resolution = 0
    name               = "Bytes Downloaded/Interval 24h Change %"
    plot_type          = "AreaChart"
    program_text       = <<-EOF
        A = data('BytesDownloaded', filter=filter('namespace', 'AWS/CloudFront') and filter('stat', 'sum') and filter('DistributionId', 'EJH671JAOI5SN'),rollup='rate').scale(60).mean(over='1h').publish(label='A', enable=False)
        B = (A).timeshift('1d').publish(label='B', enable=False)
        C = ((A-B)/B*100).publish(label='C')
    EOF
    show_data_markers  = false
    show_event_lines   = false
    stacked            = false
    time_range         = 7200
    unit_prefix        = "Metric"

    axis_left {
        label          = "change %"
    }

    histogram_options {
        color_theme = "red"
    }

    viz_options {
        axis         = "left"
        display_name = "24h change %"
        label        = "C"
    }
    viz_options {
        axis         = "left"
        display_name = "A - Timeshift 1d"
        label        = "B"
    }
    viz_options {
        axis         = "left"
        display_name = "BytesDownloaded - Scale:60 - Mean(1h)"
        label        = "A"
    }
}
# signalfx_dashboard.sfx_aws_cloudfront_dash_0:
resource "signalfx_dashboard" "sfx_aws_cloudfront_dash_0" {
    charts_resolution           = "default"
    dashboard_group             = signalfx_dashboard_group.sfx_aws_cloudfront.id
    discovery_options_query     = "namespace:\"AWS/CloudFront\" AND _exists_:DistributionId"
    discovery_options_selectors = [
        "_exists_:DistributionId",
    ]
    name                        = "CloudFront Distribution"

    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_7.id
        column   = 6
        height   = 1
        row      = 3
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_2.id
        column   = 0
        height   = 1
        row      = 1
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_6.id
        column   = 0
        height   = 1
        row      = 3
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_5.id
        column   = 6
        height   = 1
        row      = 2
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_0.id
        column   = 0
        height   = 1
        row      = 0
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_4.id
        column   = 0
        height   = 1
        row      = 2
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_1.id
        column   = 6
        height   = 1
        row      = 0
        width    = 6
    }
    chart {
        chart_id = signalfx_time_chart.sfx_aws_cloudfront_dash_0_3.id
        column   = 6
        height   = 1
        row      = 1
        width    = 6
    }

    variable {
        alias                  = "distribution"
        apply_if_exist         = false
        description            = "CloudFront distribution"
        property               = "DistributionId"
        replace_only           = false
        restricted_suggestions = false
        value_required         = true
        values                 = [
            "Choose distribution",
        ]
        values_suggested       = []
    }
}
