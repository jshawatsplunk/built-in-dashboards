# SignalFx Built-In Dashboards

This is a Terraform project containing the "built in" dashboards in SignalFx.

You can use these Terraform definitions to either submit improvements to the SignalFx dashboards, to see how they are made, or to make your own versions in your organization.

# Structure

Each "integration" is contained in a module. For example the AWS EC2 integration is contained in the "aws_ec2" directory. Any associated dashboards groups are specified therein. The convention is that each dashboard gets its own tf file.

# Using It

Using this repo you can `terraform apply` yourself a full copy of all the dashboards as a sort of staging environment. This will, of course, not replace the actual built-in content of SignalFx. That process is internal to SignalFx.

You'll need to provide the var `sfx_token` to use this. I recommend using a `terraform.tfvars` file, which is already in the `.gitignore` for frequent users.

# Exporter

There is an included `export_dashboards.py` script which aims to reduce the effort of export an existing dashboard.

## Requirements

This script requires Python 3. I encourage the use of a [venv](https://docs.python.org/3/library/venv.html). You can set it up like this:

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Usage

```
usage: export_dashboards.py [-h] --key KEY [--api_url API_URL] --name NAME
                            [--exclude [EXCLUDES [EXCLUDES ...]]] --output
                            OUTPUT (--group GROUP | --dashboard DASH)

Export a SignalFx asset as Terraform

optional arguments:
  -h, --help            show this help message and exit
  --key KEY             An API key for accessing SignalFx
  --api_url API_URL     The API URL, used for non-default realms
  --name NAME           The name of the resource after export, e.g. mychart0
  --exclude [EXCLUDES [EXCLUDES ...]]
                        A field to exclude from the emitted HCL
  --output OUTPUT       The name of the directory to which output will be
                        written
  --group GROUP         The ID of the dashboard group in SignalFx
  --dashboard DASH      The ID of the dashboard in SignalFx
```

Here's an example for a dashboard:

```
python export_dashboard.py --key XxX --dashboard DjJ6MCMAgAA --name sfx_aws_sqs_queue --output ./
```

This command will recursively export each individual chart in a dashboard group and emit a dashboard definition where these charts are referred to by their Terraform resource name. The output will reside in a file called `sfx_aws_sqs_queue.tf`.

For dashboard groups uses `--group`. The output directory will contain one file per dashboard group.

## Notes

The exporter does some regex surgery out the outputted HCL. By default it excludes computed fields `id` and `url` as well as the problematic `tags` field, which is deprecated. It also removes the "bounds" values for axes that are just fixed values and bare `viz_options` fields that only specify a label and no other information. The latter can cause weird problems on creation.
