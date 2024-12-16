# Nessie HandBook

### Start The Nessie CLI
```bash
docker exec -it nessie bash

java -jar nessie-cli.jar --uri http://localhost:19120/api/v2
```

### Create Namespace:
```bash
CREATE NAMESPACE jaffle_shop
```

### Create Branch
```bash
CREATE BRANCH jaffle_shop
```

### Use the Branch
```bash
USE BRANCH jaffle_shop
```

### Select the brach
You can check the `http://localhost:19120/tree/main` for root branch:
```bash
use branch main
```

### See the logs
```bash
main> SHOW LOG
commit a00c0259513b25595d439baffbe60ec4868dd20a39618c71aa457dde5d1c5b29   
Author:  root                                                             
Date:    Dec 15, 2024, 5:12:25 PM UTC (committed: 2024-12-15T17:12:25.423665999Z)                                                                   
Parents: 95feb21aa3cf675032ea9d1691905c581b47102a5aa4a196d7433ab5d33444e4                                                                               
Iceberg commit against table jaffle_shop_sc.dim_customers                                                                                       

commit 95feb21aa3cf675032ea9d1691905c581b47102a5aa4a196d7433ab5d33444e4   
Author:  root                                                             
Date:    Dec 15, 2024, 5:12:25 PM UTC (committed: 2024-12-15T17:12:25.363132988Z)                                                                   
Parents: 01815f3c1469dd763a0533857c4b349fa6e6b5182cb724f566d3c84f23be0471                                                                               
Iceberg append against jaffle_shop_sc.dim_customers              
...
...                                                                               
```

### List Contents:
```bash
main> LIST CONTENTS
      NAMESPACE jaffle_shop_sc
  ICEBERG_TABLE jaffle_shop_sc.customer_orders
  ICEBERG_TABLE jaffle_shop_sc.customer_payments
  ICEBERG_TABLE jaffle_shop_sc.dim_customers
  ICEBERG_TABLE jaffle_shop_sc.fct_orders
  ICEBERG_TABLE jaffle_shop_sc.order_payments
  ICEBERG_TABLE jaffle_shop_sc.raw_customers
  ICEBERG_TABLE jaffle_shop_sc.raw_orders
  ICEBERG_TABLE jaffle_shop_sc.raw_payments
  ICEBERG_TABLE jaffle_shop_sc.stg_customers
  ICEBERG_TABLE jaffle_shop_sc.stg_orders
  ICEBERG_TABLE jaffle_shop_sc.stg_payments
main>
```

### Check the Command:
`https://projectnessie.org/nessie-0-96-0/cli/`