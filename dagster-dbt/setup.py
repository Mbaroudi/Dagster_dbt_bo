from setuptools import find_packages, setup

setup(
    name="postcard_company_dm",
    packages=find_packages(),
    install_requires=[
        "dagster==1.5.10",
        "dagster-dbt==0.21.10",
        "duckdb==0.9.2",
        "dbt-core==1.7.3",
        "dbt-duckdb==1.7.0",
        "dagster-duckdb==0.21.10"
    ],
    extras_require={"dev": ["dagit", "pytest"]},
)
