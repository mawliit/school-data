-- Create database
CREATE DATABASE SchoolInventory;

-- Use the created database
USE SchoolInventory;

-- Create table for items
CREATE TABLE Items (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    Description TEXT,
    Quantity INT DEFAULT 0,
    Unit VARCHAR(50),
    Category VARCHAR(50),
    Location VARCHAR(255)
);

-- Create table for suppliers
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    Address TEXT
);

-- Create table for orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create table for order details
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ItemID INT,
    QuantityOrdered INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Create table for issuances
CREATE TABLE Issuances (
    IssuanceID INT AUTO_INCREMENT PRIMARY KEY,
    IssuanceDate DATE,
    IssuedTo VARCHAR(255),
    ItemID INT,
    QuantityIssued INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Create table for returns
CREATE TABLE Returns (
    ReturnID INT AUTO_INCREMENT PRIMARY KEY,
    ReturnDate DATE,
    ReturnedBy VARCHAR(255),
    ItemID INT,
    QuantityReturned INT,
    Reason TEXT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

-- Insert sample data (optional)
INSERT INTO Items (ItemName, Description, Quantity, Unit, Category, Location)
VALUES
    ('Desk', 'Wooden desk for students', 50, 'Piece', 'Furniture', 'Classroom'),
    ('Chair', 'Student chair', 100, 'Piece', 'Furniture', 'Classroom'),
    ('Laptop', 'Lenovo ThinkPad', 20, 'Unit', 'Electronics', 'Computer Lab'),
    ('Projector', 'BenQ projector', 5, 'Unit', 'Electronics', 'Multimedia Room');

INSERT INTO Suppliers (SupplierName, ContactPerson, Phone, Email, Address)
VALUES
    ('ABC Furniture', 'John Doe', '123-456-7890', 'abc@furniture.com', '123 Main St'),
    ('Tech Solutions', 'Jane Smith', '987-654-3210', 'tech@solutions.com', '456 Oak Ave');

-- Example order
INSERT INTO Orders (OrderDate, SupplierID) VALUES (CURRENT_DATE(), 1); 

-- Example order details
INSERT INTO OrderDetails (OrderID, ItemID, QuantityOrdered, UnitPrice)
VALUES
    (1, 1, 20, 100.00), -- Desk
    (1, 2, 50, 50.00); -- Chair

-- Example issuance
INSERT INTO Issuances (IssuanceDate, IssuedTo, ItemID, QuantityIssued)
VALUES (CURRENT_DATE(), 'John Smith', 1, 5); -- Issue 5 desks

-- Example return
INSERT INTO Returns (ReturnDate, ReturnedBy, ItemID, QuantityReturned, Reason)
VALUES (CURRENT_DATE(), 'Jane Doe', 2, 3, 'Damaged'); -- Return 3 chairs

-- To create this database in GitHub:

1. **Create a new repository** on GitHub.
2. **Create a file** named `school_inventory.sql` within your repository.
3. **Copy and paste** the SQL code into this file.
4. **Commit and push** the changes to your repository.

This will create a basic database structure for your school inventory management system. You can further enhance it by:

* Adding more tables (e.g., users, roles, reports).
* Implementing data validation and constraints.
* Creating stored procedures and functions for common operations.
* Developing a user interface (e.g., using PHP, Python, or JavaScript) to interact with the database.

This code provides a starting point for building a robust inventory management system. Remember to adapt and expand it based on the specific needs of your school.
