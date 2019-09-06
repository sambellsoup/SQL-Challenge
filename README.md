Basic SQL Queries
Steps
Connecting
Using any IDE you prefer (SQL Workbench, dbeaver, DataGrip, etc), connect the postgresql instance with the hostname, port, database name, user and password you have been specified.

Database table
Once connected, verify that you can access the public.orders table by running select count(1) from public.orders.

The database table includes the following columns:

order_id - the unique id of an order.
customer_id - the unique id of the customer that placed the order.
created_at - the time the order was created.
updated_at - the time the order was updated.
closed_at - the time the order was closed.
processed_at - the time the order was processed.
status - the status of the order.
number - an internal identifier for the order.
total_price - the total price the customer paid, including tax.
total_tax - the total tax the customer paid.
payment_status - the payment status of the order.
Queries
You have been asked to furnish a series of queries of basic analysis on the orders. Each query should be saved in a file with the corresponding query number in the file's name.

We need basic insight into hourly sales performance. We'd like a query that shows the following metrics by hour:
revenue (total_price less total_tax) total number of orders number of orders placed by a customer who has previously placed an order

Upon further inspection, it has been noticed that there are a number of hours for which there are no orders. It's not clear why, so we'd like a query that lists all hours for which there are no orders.

Your query from #1 may not have accounted for hours for which there are no orders. Copy your query from #1 and ammend the query to show "0" for all metrics when there is no data for a given hour.

We'd like to know the difference in revenue from customers who have completed one order versus customers who have completed more than one order. Write a query that shows the total revenue (total_price less total_tax) for each of these two groups: New Customers and Returning Customers.

We'd like a rudimentary estimate of when a customer might place another order and the next order's value, based on the time between their last two orders. For all customers that have completed more than one order, write a query that shows the customer_id, last_order_date and next_projected_order_date, and next_projected_order_value where next_projected_order_date is their last order plus the amount of time between their last two orders and next_projected_order_value is the average of their last two orders' total_price less total_tax.

You might find that some customers have orders that are only seconds apart from each other. This seems like bad data. Copy the query from #5 and ammend to filter out any customers whose orders are less than a minute from each other.


These are the connection details for that PostgreSQL database:
Host: njoy-testing-env.c2ag7j9q24ns.us-east-1.rds.amazonaws.com
Port: 5416
User: reader
Password is here: https://pwpush.com/p/epmm2p4uvgx5nu4a
database name: dev
