# Slot Machine for BigQuery

When Google cloud customers start using BigQuery they usually start with the on-demand billing model. After a while, as their usage stabilizes they start checking the Reservations model.
They ask Three main questions:
1. Will moving to reservations save me money ?
2. What max_slots value will give me the best cost-performance ratio ?
3. Should I set a baseline value ? If yes then what value ?

This notebook contains a series of queries that begin with the INFORMATION_SCHEMA.JOBS and INFORMATION_SCHEMA.JOBS_TIMELINE views and tries to calculate the best values to answer those questions.
You can find detailed instructions and explanations in the notebook itself.

### Usage

1. Clone the repository
2. Upload the Slot_machine.ipynb file to BigQuery notebook.
3. Follow the instructions in the notebook itself.

### Disclaimer
Workloads change over time and even from day to day. While the process of evaluation tries to be as precise as possible, there is no way to know precisely in advance what the cost or the slot consumption will be. So this gives you an estimation but continuous monitoring and tuning will be needed. Make sure to monitor the performance and cost closely in the first days after the change to see that there are no surprises in performance or cost.
