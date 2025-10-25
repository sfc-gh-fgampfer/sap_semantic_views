# SAP SEMANTIC VIEWS HOL

1. Copy/Past and run all these in a Snowflake Worksheet. This will setup the git connection, fetch the repository
and will run the 3 sql script to setup the databases.

```sql

CREATE or replace DATABASE SAP_SEMANTIC_VIEWS_HOL;

CREATE OR REPLACE API INTEGRATION API_GITHUB_REPO_SAP_SEMANTIC_VIEWS
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-fgampfer/')
  ENABLED = TRUE;

CREATE OR REPLACE GIT REPOSITORY API_GITHUB_REPO_SAP_SEMANTIC_VIEWS
    api_integration = API_GITHUB_REPO_SAP_LLM_ANALYST
    origin = 'https://github.com/sfc-gh-fgampfer/sap_semantic_views';

-- Make sure we get the latest files
ALTER GIT REPOSITORY API_GITHUB_REPO_SAP_SEMANTIC_VIEWS FETCH;

-- enable cross-region inference if you wish to use a model which is not available in your region
ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION = 'ANY_REGION';

-- Create DBs, load data and create semantic views
EXECUTE IMMEDIATE FROM @SAP_SEMANTIC_VIEWS_HOL.PUBLIC.API_GITHUB_REPO_SAP_SEMANTIC_VIEWS/branches/main/SAP_DATA_PRODUCTS_COMPLETE_DDL.sql;
EXECUTE IMMEDIATE FROM @SAP_SEMANTIC_VIEWS_HOL.PUBLIC.API_GITHUB_REPO_SAP_SEMANTIC_VIEWS/branches/main/SAP_DATA_PRODUCTS_COMPLETE_INSERT_SAMPLE_DATA.sql;
EXECUTE IMMEDIATE FROM @SAP_SEMANTIC_VIEWS_HOL.PUBLIC.API_GITHUB_REPO_SAP_SEMANTIC_VIEWS/branches/main/SAP_DATA_PRODUCTS_COMPLETE_CREATE_SEMANTIC_VIEWS.sql;

```

2. Setup Agent.


3. Test Agent.


4. (optional) Extend Agent with non-SAP data from the Snowflake Marketplace