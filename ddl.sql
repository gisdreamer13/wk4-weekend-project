CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(60),
    customer_address VARCHAR(200),
    customer_phone BIGINT,
    customer_email VARCHAR(50)
)

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) references customer(customer_id),
    year INTEGER,
    make VARCHAR(50),
    model VARCHAR(50),
    price NUMERIC(10,2),
    color VARCHAR(50)
)

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    car_id INTEGER NOT NULL,
    FOREIGN KEY (car_id) references car(car_id),
    sale_id INTEGER NOT NULL,
    FOREIGN KEY (sale_id) references sale(sale_id),
    service_id INTEGER NOT NULL,
    FOREIGN KEY (service_id) references service_table(service_id), -- circle back to the service_table key and run this one
    invoice_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    invoice_price NUMERIC(10,2)
)

CREATE TABLE service_table(
    service_id SERIAL PRIMARY KEY,
    mechanic_id INTEGER NOT NULL,
    FOREIGN KEY (mechanic_id) references mechanic(mechanic_id),
    service_cost NUMERIC(8,2)
)

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    mechanic_store INTEGER,
    mechanic_name INTEGER,
    mechanic_phone BIGINT,
    mechanic_email VARCHAR(60),
    mechanic_status VARCHAR(5)
)

CREATE TABLE sale(
    sale_id SERIAL PRIMARY KEY,
    salesperson_id INTEGER NOT NULL,
    FOREIGN KEY (salesperson_id) references salesperson(salesperson_id)
)

CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    salesperson_store INTEGER,
    salesperson_name VARCHAR(60),
    salesperson_email VARCHAR(60),
    salesperson_phone BIGINT,
    salesperson_status VARCHAR(5)
)