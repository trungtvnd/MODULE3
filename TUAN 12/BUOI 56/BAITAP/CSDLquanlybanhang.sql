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

INSERT INTO Customer(cName, cAge) VALUE ('Minh Quan', 10) , ('Ngoc Oanh', 20) , ('Hong Ha', 50) , ('Hong Thom', 28) , ('Van Khuyen', 34);

INSERT INTO OrderCustomer(cID, oDate, oTotalPrice) VALUES (1,'2021-03-20', null ) ;
 INSERT INTO OrderCustomer(cID, oDate, oTotalPrice) VALUES (2, '2021-03-15', null) , (1, '2021-04-20', null) , (4, '2021-03-05', null), (5, '2021-06-01', null);
 
 INSERT INTO Product(pName, pPrice) VALUES('May Giat', 3) , ('Tu Lanh', 5), ('Dieu Hoa', 7), ('Quat', 1), ('Bep Dien', 2);
 
 INSERT INTO OrderDetail(oID, pID, odQTY) VALUEs(1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), (3, 1, 8), (2, 5, 4), (2, 3, 3), (4, 5, 1), (5, 4,1);
 
 
 -- cau1
 SELECT oc.oID, oc.oDate, oc.oTotalprice
 From OrderCustomer oc;
 
 -- cau 2 Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
 
 SELECT c.cName, c.cAge, p.pName, Sum(od.odQTY) as 'So Luong'
 FROM Customer c
 JOIN ordercustomer oc On oc.cID = c.cID 
 JOIN orderdetail od ON od.oID = oc.oID 
 JOIN Product p ON od.pID = p.pID
 GROUP BY c.cName, p.pName;
 
 -- cau 3 Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
 
 SELECT c.cID, c.cName
 FROM Customer c
 left JOIN ordercustomer o ON o.cID = c.cID
 WHERE o.cID is Null;
 



 
 
 