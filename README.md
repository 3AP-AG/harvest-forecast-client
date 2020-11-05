# harvest-forecast-client
Harvest Forecast Client for their unofficial API

## Using the package
harvest-forecast-client is provided as a Maven package, published to the GitHub Package Registry (ghpr). 

In most cases, you will want to add the package to your project using Maven or Gradle. However, the package can be
downloaded directly from [the registry](https://github.com/orgs/3AP-AG/packages?repo_name=harvest-forecast-client) if
required.

## Developing
This repo provides an OpenApi 3 (OAS3) specification for the Harvest Forecast API. Harvest do not provide documentation
for this API. 

The specification is provided as a single file at `src/main/resources/harvest-forecast-api.yaml`. 

### Updating the OAS3 spec
To help with API development, Speccy and Prettier are provided. To get started, install them with: `yarn install`.

Changes can be made to the `src/main/resources/harvest-forecast-api.yaml` file. After making changes, you can format the
YAML files with `yarn pretty:write`. You can also check the YAML is valid for OAS3 with `yarn lint`.

Though not required, you may find it useful to inspect the OAS3 spec in ReDoc. You can do this with `yarn serve`.

### Generating the client library
The CI/CD process handles all the required steps to generate and publish the package to ghpr.

To generate the Java client library locally:
```shell script
mvn clean install
```
