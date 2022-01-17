CREATE TABLE Customer(
	cID    INT AUTO_INCREMENT PRIMARY KEY,
    cName  VARCHAR(40) NOT NULL,
    cAge   INT 
);

CREATE TABLE OrderCustomer(
	oID         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cID 		INT NOT NULL,
    oDate        DateTime NOT NULL,
    oTotalprice  DOUBLE,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product(
	pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pName VARCHAR(50) NOT NULL,
    pPrice DOUBLE NOT NULL
);

CREATE TABLE OrderDetail(
	oID INT NOT NULL,
    pID INT NOT NULL,
    odQTY INT NOT NULL,
    FOREIGN KEY (oID) REFERENCES ordercustomer (oID),
    FOREIGN KEY (pID) REFERENCES Product (pID)
);