from datetime import datetime

from airflow import DAG
from airflow.decorators import task
from airflow.operators.bash import BashOperator

# A DAG represents a workflow, which is a collection of task
with DAG(dag_id="demo", start_date=datetime(2024,1,1), schedule="0 0 * * *") as dag:
    # task are represented as operators
    hello = BashOperator(task_id="hello", bash_command="echo hello")


    @task()
    def airflow():
        print("airflow")


    # set dependencies between tasks (bash then python print)
    hello >> airflow()