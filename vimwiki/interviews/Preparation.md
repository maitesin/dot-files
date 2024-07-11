# Preparation

## ACID
ACID stands for **Atomicity**, **Consistency**, **Isolation**, and **Durability**.

* **Atomicity**: The operations that constitute the transaction will either all succeed or all fail. There is no in-between state.
* **Consistency**: The transaction cannot bring the database to an invalid state. After the transaction is committed or rolled back, the rules for each record will still apply, and all future transactions will see the effect of the transaction. Also named **Strong Consistency**.
* **Isolation**: The execution of multiple transactions concurrently will have the same effect as if they had been executed sequentially.
* **Durability**: Any committed transaction is written to non-volatile storage. It will not be undone by a crash, power loss, or network partition.

## Load Balancers
The most basic load balancer could be done with a simple Nginx instance. But one of the most important parts of the load balancer would be the policy it applies to decide which one of the servers gets used by each user.

* Random
* Round-Robbin
* Weighted Round-Robbin
* Hashing
* Consistent Hashing
* Rendezvous Hashing
