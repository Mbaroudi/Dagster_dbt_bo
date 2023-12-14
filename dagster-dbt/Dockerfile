FROM python:3.11

# Copy the dagster-dbt project files into the container
COPY dagster-dbt dagster-dbt


WORKDIR /dagster-dbt

# Install dagster-dbt dependencies

RUN pip install -e ".[dev]"

# Navigate to the dbt directory and run dbt deps

WORKDIR /dagster-dbt/postcard_company_dm/dbt

RUN dbt deps

# Navigate back to the dagster-dbt directory

WORKDIR /dagster-dbt/postcard_company_dm
