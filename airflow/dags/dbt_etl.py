from airflow import DAG
from airflow.providers.ssh.operators.ssh import SSHOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'cagri',
    'depends_on_past': False,
    'start_date': datetime(2024, 12, 13),
    'email': ['your_email@example.com'],
    'email_on_failure': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'dbt_pipeline',
    default_args=default_args,
    description='DBT pipeline with Trino',
    schedule_interval=timedelta(days=1),
)

# Debug task
dbt_debug = SSHOperator(
    task_id='dbt_debug',
    command='cd /dbt && dbt debug --profiles-dir /dbt/profiles --project-dir /dbt/project',
    ssh_conn_id='dbt_ssh',
    dag=dag
)

# Seed task
dbt_seed = SSHOperator(
    task_id='dbt_seed',
    command='cd /dbt && dbt seed --profiles-dir /dbt/profiles --project-dir /dbt/project',
    ssh_conn_id='dbt_ssh',
    dag=dag
)

# Run task
dbt_run = SSHOperator(
    task_id='dbt_run',
    command='cd /dbt && dbt run --profiles-dir /dbt/profiles --project-dir /dbt/project',
    ssh_conn_id='dbt_ssh',
    dag=dag
)

# Set task dependencies
dbt_debug >> dbt_seed >> dbt_run