create database session3;
use session3;
-- bảng nhận viên
create table employee
(
    id_employee          varchar(4) primary key,
    name_employee        varchar(30),
    sex_employee         bit,
    email_employee       text        not null,
    address_employee     varchar(50),
    dayBirt_employee     datetime,
    place_birt           varchar(20),
    working_day_employee datetime    not null,
    phone_employee       varchar(15) not null,
    CMND_employee        varchar(15),
    id_Manager           varchar(4)
);
INSERT INTO employee(id_employee, name_employee, sex_employee, email_employee, address_employee, dayBirt_employee,
                     place_birt, working_day_employee, phone_employee, CMND_employee, id_Manager)
VALUES ('NV01', 'Nguyễn Văn An', 1, 'nv.an@example.com', '123 Đường ABC', '1990-05-15', 'Hà Nội', '2010-07-20',
        '0901234567', '123456789', NULL),
       ('NV02', 'Trần Thị Bình', 0, 'tt.bin@example.com', '456 Đường XYZ', '1985-09-30', 'TP.HCM', '2012-01-10',
        '0912345678', '987654321', 'NV01'),
       ('NV03', 'Lê Hoàng Long', 1, 'lh.long@example.com', '789 Đường KLM', '1995-12-25', 'Đà Nẵng', '2020-03-05',
        '0987654321', '543216789', 'NV01'),
       ('NV04', 'Phạm Thị Mai', 0, 'pt.mai@example.com', '456 Lê Lợi', '1988-07-02', 'Nghệ An', '2015-11-15',
        '0911111111', '111111111', 'NV02'),
       ('NV05', 'Vũ Đình Tuấn', 1, 'vd.tuan@example.com', '789 Trần Phú', '1992-02-20', 'Huế', '2018-09-28',
        '0999999999', '999999999', 'NV02');
-- bảng khách hàng
create table custumer
(
    id_custumer      varchar(4) primary key,
    name_custumer    varchar(30),
    address_custumer varchar(35)  not null,
    dayBirt_custumer datetime     not null,
    phone_custumer   varchar(255) not null

);
INSERT INTO custumer
VALUES ('KH01', 'Nguyễn Thanh Hằng', '12 Đường DEF', '1992-08-10', '0901112222'),
       ('KH02', 'Trương Minh Tuấn', '34 Đường GHI', '1980-03-25', '0933334444'),
       ('KH03', 'Lê Thị Thu Hương', '56 Đường JKL', '1995-11-30', '0977778888'),
       ('KH04', 'Phạm Văn Đức', '78 Đường MNO', '1987-06-15', '0944445555'),
       ('KH05', 'Hoàng Thị Bích', '90 Đường PQR', '2000-01-05', '0966667777');
-- bảng nhà cung cấp
create table supplier
(
    id_supplier      varchar(5) primary key,
    name_supplier    varchar(50),
    email_supplier   varchar(50),
    address_supplier varchar(50),
    phone_supplier   varchar(30),
    website_supplier varchar(30) not null
);
INSERT INTO supplier
VALUES ('NCC1', 'Công ty TNHH A', 'a@example.com', '12 Lý Thường Kiệt', '0901234567', 'www.a.com'),
       ('NCC2', 'Công ty TNHH B', 'b@example.com', '34 Trần Hưng Đạo', '0912345678', 'www.b.com'),
       ('NCC3', 'Công ty TNHH C', 'c@example.com', '56 Nguyễn Huệ', '0922223333', 'www.c.com'),
       ('NCC4', 'Công ty TNHH D', 'd@example.com', '78 Đường 30/4', '0933334444', 'www.d.com'),
       ('NCC5', 'Công ty TNHH E', 'e@example.com', '90 Lê Duẩn', '0944445555', 'www.e.com');

-- bảng phiếu nhâp
create table coupon
(
    id_coupon   varchar(5) primary key,
    id_employee varchar(4),
    id_supplier varchar(4),
    date_entry  datetime,
    note        varchar(100),
    foreign key (id_employee) references employee (id_employee),
    foreign key (id_supplier) references supplier (id_supplier)
);
INSERT INTO coupon
VALUES ('PN01', 'NV01', 'NCC1', '2023-07-15 10:30:00', 'Ghi chú cho phiếu nhập 1'),
       ('PN02', 'NV01', 'NCC2', '2023-07-16 11:45:00', 'Ghi chú cho phiếu nhập 2'),
       ('PN03', 'NV02', 'NCC3', '2023-07-17 09:20:00', 'Ghi chú cho phiếu nhập 3'),
       ('PN04', 'NV03', 'NCC4', '2023-07-18 14:00:00', 'Ghi chú cho phiếu nhập 4'),
       ('PN05', 'NV04', 'NCC5', '2023-07-19 16:10:00', 'Ghi chú cho phiếu nhập 5');

-- bảng phiếu xuất
create table bill
(
    id_bill     varchar(5) primary key,
    id_employee varchar(4),
    id_custumer varchar(4),
    sale_date   datetime,
    note        text,
    foreign key (id_employee) references employee (id_employee),
    foreign key (id_custumer) references custumer (id_custumer)
);
INSERT INTO bill
VALUES ('PX01', 'NV01', 'KH01', '2023-07-15 13:45:00', 'Ghi chú cho phiếu xuất 1'),
       ('PX02', 'NV01', 'KH02', '2023-07-16 15:30:00', 'Ghi chú cho phiếu xuất 2'),
       ('PX03', 'NV02', 'KH03', '2023-07-17 12:20:00', 'Ghi chú cho phiếu xuất 3'),
       ('PX04', 'NV03', 'KH04', '2023-07-18 17:00:00', 'Ghi chú cho phiếu xuất 4'),
       ('PX05', 'NV04', 'KH05', '2023-07-19 19:15:00', 'Ghi chú cho phiếu xuất 5');


-- bảng loại sản phẩm
create table product_type
(
    id_product_type   varchar(4) primary key,
    name_product_type varchar(30),
    note              varchar(100)
);
INSERT INTO product_type
VALUES ('LSP1', 'Điện thoại di động', 'Loại sản phẩm điện thoại di động'),
       ('LSP2', 'Laptop', 'Loại sản phẩm laptop'),
       ('LSP3', 'Máy tính bảng', 'Loại sản phẩm máy tính bảng'),
       ('LSP4', 'Điều hòa', 'Loại sản phẩm điều hòa'),
       ('LSP5', 'Tủ lạnh', 'Loại sản phẩm tủ lạnh');


-- Bảng sản phẩm
create table product
(
    id_product      varchar(4) primary key,
    id_product_type varchar(4),
    name_product    varchar(50),
    unit_product    varchar(10),
    img_product     varchar(255),
    note            varchar(100) not null,
    foreign key (id_product_type) references product_type (id_product_type)
);
INSERT INTO product
VALUES ('SP01', 'LSP1', 'Điện thoại Samsung Galaxy', 'Cái', 'samsung-galaxy.jpg', 'Điện thoại Samsung Galaxy mới nhất'),
       ('SP02', 'LSP1', 'Điện thoại iPhone 13', 'Cái', 'iphone-13.jpg', 'Điện thoại iPhone 13 chính hãng'),
       ('SP03', 'LSP2', 'Laptop Dell XPS 15', 'Cái', 'dell-xps-15.jpg', 'Laptop Dell XPS 15 cao cấp'),
       ('SP04', 'LSP3', 'Máy tính bảng iPad Air', 'Cái', 'ipad-air.jpg', 'Máy tính bảng iPad Air mỏng nhẹ'),
       ('SP05', 'LSP4', 'Điều hòa Panasonic', 'Cái', 'panasonic-ac.jpg', 'Điều hòa Panasonic tiết kiệm điện');

-- bảng chi tiếu phiếu nhập
CREATE TABLE coupon_detail
(
    id_product  varchar(4),
    id_coupon   varchar(5),
    quantity    smallint,
    entry_price real,
    foreign key (id_product) references product (id_product),
    foreign key (id_coupon) references coupon (id_coupon)
);

INSERT INTO coupon_detail (id_product, id_coupon, quantity, entry_price)
VALUES ('SP01', 'PN01', 10, 1000.00),
       ('SP02', 'PN01', 20, 700.00),
       ('SP03', 'PN02', 5, 250.00),
       ('SP04', 'PN03', 8, 350.00),
       ('SP05', 'PN03', 15, 500.00);

-- bảng chi tiếu phiếu xuất
CREATE TABLE bill_detail
(
    id_bill    varchar(5),
    id_product varchar(4),
    quantity   double,
    price      double,
    foreign key (id_product) references product (id_product),
    foreign key (id_bill) references bill (id_bill)
);

INSERT INTO bill_detail (id_bill, id_product, quantity, price)
VALUES ('PX01', 'SP01', 5, 1500.00),
       ('PX01', 'SP02', 8, 1000.00),
       ('PX02', 'SP03', 3, 500.00),
       ('PX03', 'SP04', 2, 700.00),
       ('PX03', 'SP05', 7, 900.00);


-- bai 3: thêm nhân viên mới
insert into employee (id_employee, name_employee, sex_employee, email_employee, address_employee, dayBirt_employee,
                      place_birt, working_day_employee, phone_employee, CMND_employee, id_Manager)
values ('NV06', 'Bùi Đình Huân ', 1, 'huan.huan@example.com', '789 ninh binh', '1999-02-18', 'ninh binh', '2018-09-28',
        '0999999999', '999999999', 'NV02');
insert into product (id_product, id_product_type, name_product, unit_product, img_product, note)
values ('SP06', 'LSP4', 'Điều hòa Panasonic', 'Cái', 'panasonic-ac.jpg', 'Điều hòa Panasonic tiết kiệm điện');
-- bài4 ;
-- 1. Cập nhật lại số điện thoại mới cho khách hàng mã KH5. (Tùy chọn các thông tin liên quan)
update custumer
set phone_custumer = '0968523991'
where id_custumer = 'KH05';
-- 2. Cập nhật lại địa chỉ mới của nhân viên mã NV05 (Tùy chọn các thông tin liên quan)
update employee
set address_employee = 'xóm 2 -khánh thịnh -yên mô- ninh bình'
where id_employee = 'NV05';
-- Bài 5: Dùng lệnh DELETE xóa dữ liệu các bảng
-- 1. Xóa nhân viên mới vừa thêm tại yêu cầu C.3
delete
from employee
where id_employee = 'NV06';
-- 2. Xóa sản phẩm mã SP06
delete
from product
where id_product = 'NV06';
-- Bài 6: Dùng lệnh SELECT lấy dữ liệu từ các bảng
-- 1. Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên,
-- họ tên nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp theo tuổi.
select id_employee,
       name_employee,
       sex_employee,
       dayBirt_employee,
       address_employee,
       phone_employee,
       timestampdiff(year, dayBirt_employee, curdate())
from employee
order by timestampdiff(year, dayBirt_employee, curdate());
-- 2. Liệt kê các hóa đơn nhập hàng trong tháng 7/2023, gồm thông tin số phiếu nhập,
-- mã nhân viên nhập hàng, họ tên nhân viên, họ tên nhà cung cấp, ngày nhập hàng, ghi chú.
select c.id_coupon        as 'số phiếu nhập',
       e.id_employee      as 'mã nhân viên nhập hàng',
       e.name_employee    as 'họ tên nhân viên',
       s.address_supplier as 'họ tên nhà cung cấp',
       c.date_entry       as 'ngày nhâp hàng',
       c.note             as 'ghi chú'
from coupon c
         inner join session3.employee e on c.id_employee = e.id_employee
         inner join session3.supplier s on c.id_supplier = s.id_supplier
where month(c.date_entry) = 7
  and year(c.date_entry) = 2023
;
-- 3. Liệt kê tất cả sản phẩm có đơn vị tính là cai, gồm tất cả thông tin về sản phẩm.
select *
from product
where unit_product = 'cai';
-- 4. Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin:
-- số phiếu nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá
-- nhập, thành tiền.
select cd.id_coupon                 as 'số phiếu nhập',
       p.id_product                 as 'mã sản phẩm',
       p.name_product               as 'tên sản phẩm',
       pt.id_product_type           as 'loại sản phẩm ',
       p.unit_product               as 'đơn vị tính',
       cd.quantity                  as 'số lượng',
       cd.entry_price               as ' giá  nhập',
       cd.quantity * cd.entry_price as ' thành tiền'
from product p
         inner join coupon_detail cd on p.id_product = cd.id_product
         inner join session3.product_type pt on p.id_product_type = pt.id_product_type;
-- 5. Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm
-- thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại,
-- email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng.
select s.id_supplier      as 'mã nhà cũng cấp',
       s.name_supplier    as 'tên nhà cung cấp',
       s.email_supplier   as 'email',
       s.address_supplier as 'địa chỉ',
       s.phone_supplier   as 'số điện thoại',
       c.id_coupon        as 'số phiếu nhập',
       c.date_entry       as 'ngày nhập'
from supplier s
         join session3.coupon c on s.id_supplier = c.id_supplier
where
    month(c.date_entry) = 7 and year(c.date_entry) = 2023;
-- 6. Liệt kê chi tiết hóa đơn bán hàng trong 8 tháng đầu năm 2023 gồm thông tin:
-- số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm,
-- đơn vị tính, số lượng, giá bán, doanh thu.
select
    b.id_bill AS 'Số phiếu xuất',
    e.name_employee AS 'Nhân viên bán hàng',
    b.sale_date AS 'Ngày bán',
    p.id_product AS 'Mã sản phẩm',
    p.name_product AS 'Tên sản phẩm',
    p.unit_product AS 'Đơn vị tính',
    bd.quantity AS 'Số lượng',
    bd.price AS 'Giá bán',
    bd.quantity * bd.price AS 'Doanh thu'
from  bill b
join session3.bill_detail bd on b.id_bill = bd.id_bill
join session3.employee e on b.id_employee = e.id_employee
join product p on bd.id_product = p.id_product
where
    month(b.sale_date) between  1 and 8 and year(b.sale_date) = 2023;
-- 7. Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm tất cả thông tin của khách hàng
select *
from  custumer
where month(dayBirt_custumer) = 12;
-- Liệt kê các hóa đơn bán hàng từ ngày 15/07/2023 đến 18/07/2023 gồm các thông tin: số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị tính, số lượng, giá bán, doanh thu.
SELECT
    b.id_bill AS 'Số phiếu xuất',
    e.name_employee AS 'Nhân viên bán hàng',
    b.sale_date AS 'Ngày bán',
    p.id_product AS 'Mã sản phẩm',
    p.name_product AS 'Tên sản phẩm',
    p.unit_product AS 'Đơn vị tính',
    bd.quantity AS 'Số lượng',
    bd.price AS 'Giá bán',
    bd.quantity * bd.price AS 'Doanh thu'
FROM
    bill b
        INNER JOIN
    bill_detail bd ON b.id_bill = bd.id_bill
        INNER JOIN
    employee e ON b.id_employee = e.id_employee
        INNER JOIN
    product p ON bd.id_product = p.id_product
WHERE
    b.sale_date BETWEEN '2023-07-15' AND '2023-07-18';
