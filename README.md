In `~/.aws/credentials` I have the following profile:

```
[localstack]
aws_access_key_id = test
aws_secret_access_key = test
region=eu-west-2
output=json
endpoint_url=http://localhost:4566
```

To deploy to localstack:

1. Run `localstack start`
2. `cd workspace1` and run `tflocal init` and then `tflocal apply`
3. `cd ../workspace2` and run `tflocal init` and then `tflocal apply`
