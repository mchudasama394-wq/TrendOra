CREATE TABLE dbo.order_tbl
(
    Order_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    user_id NVARCHAR(150) NOT NULL,
    user_name NVARCHAR(150) NOT NULL,
    order_date DATETIME NOT NULL CONSTRAINT DF_order_tbl_order_date DEFAULT (GETDATE()),
    order_total_amount DECIMAL(18,2) NOT NULL,
    order_payment_method NVARCHAR(50) NOT NULL,
    order_status NVARCHAR(30) NOT NULL CONSTRAINT DF_order_tbl_order_status DEFAULT ('Pending')
);

CREATE TABLE dbo.order_item_tbl
(
    Order_item_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Order_id INT NOT NULL,
    prod_id INT NOT NULL,
    product_name NVARCHAR(200) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,
    line_total DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_order_item_tbl_order_tbl
        FOREIGN KEY (Order_id) REFERENCES dbo.order_tbl (Order_id)
        ON DELETE CASCADE
);
