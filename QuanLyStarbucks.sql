Create database QuanLyStarbucks
Use QuanLyStarbucks

CREATE TABLE tbKhachHang
(
MaKH NCHAR (6) not null CONSTRAINT pk_tbKhachHang PRIMARY KEY,
MaCN NCHAR (6) not null CONSTRAINT df_tbKhachHang_ChiNhanh DEFAULT N'Chưa có thông tin ',
HoKH NVARCHAR (50) not null,
TenKH NVARCHAR (50) not null,
NgaySinhKH DATE,
GioiTinhKH NVARCHAR (10) CONSTRAINT ck_GioiTinh_tbKhachHang CHECK (GioiTinhKH IN (N'Nam', N'Nữ', N'Khác')),
DiaChiKH NVARCHAR (100),
SDTKH NVARCHAR (10) not null,
EmailKH NVARCHAR (50),
NgayDK DATE,
CMNDKH NVARCHAR (12),
TongDiem FLOAT not null,
ThanhVien NVARCHAR (50)
)

CREATE TABLE tbNhanVien
(
MaNV NCHAR (6) not null CONSTRAINT pk_tbNhanvien PRIMARY KEY,
MaCN NCHAR (6) not null CONSTRAINT df_tbNhanvien_ChiNhanh DEFAULT N'Chưa có thông tin ',
HoNV NVARCHAR (50),
TenNV NVARCHAR (50),
NgaySinhNV DATE,
GioiTinhNV NCHAR (10),
CMNDNV NVARCHAR (12),
DiaChiNV NVARCHAR (100),
SDTNV NVARCHAR (11),
EmailNV NVARCHAR (50)
)

CREATE TABLE tbPhuCap
(
MaPC NCHAR (6) not null CONSTRAINT pk_tbPhucap PRIMARY KEY,
MaNV NCHAR (6) not null CONSTRAINT fk_MaNV_PhuCap FOREIGN KEY (MaNV) REFERENCES tbNhanvien (MaNV),
PhuCap FLOAT
)

CREATE TABLE tbLoaiSanPham
(
MaLoaiSP NCHAR(6) not null CONSTRAINT pk_tbLoaiSanPham PRIMARY KEY,
TenLoaiSP  NVARCHAR(50) not null,
GhiChuLoaiSP NVARCHAR(100)
)

CREATE TABLE tbMenu
(
MaMon NCHAR (6) not null CONSTRAINT pk_tbMenu PRIMARY KEY,
TenMon NVARCHAR (100),
MaLoaiSP NCHAR(6) CONSTRAINT df_MaLoaiSP_tbMenu default N'Chưa có thông tin ',
GhiChuMenu NVARCHAR(100)
)

CREATE TABLE tbGiaMon
(
MaSoGia NCHAR (6) not null CONSTRAINT pk_tbGiaMon PRIMARY KEY,
MaMon NCHAR (6) CONSTRAINT df_MaMon_tbGiaMon default N'Chưa có thông tin ',
GiaMon FLOAT
)


CREATE TABLE tbHoaDon
(
MaHD NCHAR (6) not null CONSTRAINT pk_tbHoaDon PRIMARY KEY,
MaNV NCHAR (6) CONSTRAINT fk_MaNV_HoaDon FOREIGN KEY (MaNV) REFERENCES tbNhanvien (MaNV),
MaKH NCHAR (6) CONSTRAINT fK_MaKH_HoaDon FOREIGN KEY (MaKH) REFERENCES tbKhachHang (MaKH),
NgayLapHD DATE,
PTTT NVARCHAR (50)
)

CREATE TABLE tbChiNhanh
(
MaCN NCHAR (6) not null CONSTRAINT pk_tbChiNhanh PRIMARY KEY,
TenCN NVARCHAR (30) not null,
DiaChi NVARCHAR (100),
SDT NVARCHAR (11)
)

 CREATE TABLE tbChiTietHoaDon
(
MaHD NCHAR (6) not null CONSTRAINT fk_MaHD_tbChiTietHoaDon FOREIGN KEY (MaHD) REFERENCES tbHoaDon (MAHD),
MaMon NCHAR (6) not null CONSTRAINT fk_MaMon_tbChiTietHoaDon FOREIGN KEY (MaMon) REFERENCES tbMenu (MaMon),
SoLuong INT
)


-- CHÈN DỮ LIỆU KHÁCH HÀNG VÀO BẢNG tbKHACHHANG
INSERT INTO tbKhachHang (MaKH,MaCN,HoKH,TenKH,NgaySinhKH,GioiTinhKH,DiaChiKH,SDTKH,EmailKH,NgayDK,CMNDKH,TongDiem,ThanhVien)
VALUES
('KH0001','CN0001',N'Vũ Vương',N'Vinh',Convert(date,'2001/12/23'),'Nam',N'Lê Lợi,Quận 1,TP.HCM','0939393993','vvv.v3@gmail.com',Convert(date,'2022/02/02'),'384858461','10000',N'TV Kim Cương'),
('KH0002','CN0002',N'Lâm Hồ Thiên',N'Tống',Convert(date,'2002/08/12'),'Nam',N'Lê Lợi,Quận 1,Tp.HCM','0949481584','thientong.lh@gmail.com',Convert(date,'2022/02/02'),'385848461','20000',N'TV Kim Cương'),
('KH0003','CN0003',N'Grande',N'Ariana',Convert(date,'1993/06/26'),N'Nữ',N'Phú Mỹ Hưng,Phường Mỹ Quý,Tp.Long Xuyên,An Giang','0999999999','anrianatocduoingua@gmail.com',Convert(date,'2022/02/02'),'483858888','15000',N'TV Kim Cương'),
('KH0004','CN0004',N'Nguyễn Phong Phú',N'Quý',Convert(date,'1995/05/04'),'Nam',N'140 Bàn Cờ,Phường 3,Quận 3,TP.HCM','0939231993','phuquy.nppq@gmail.com',Convert(date,'2022/02/02'),'618823451','1000',N'TV Đồng'),
('KH0005','CN0005',N'Nguyễn Hưng',N'Phát',Convert(date,'2002/04/21'),'Nam',N'Hẻm 125/48 Lê Đức Thọ,Phường 7,Gò Vấp,TP.HCM','0939789393','nhphat123@gmail.com',Convert(date,'2002/02/03'),'845823451','1000',N'TV Đồng'),
('KH0006','CN0006',N'Lương Công',N'Tiến',Convert(date,'2002/04/04'),'Nam',N'67 Số 30,Phường 7,Gò Vấp,TP.HCM','0942296545','tiencongluong@gmail.com',Convert(date,'2022/02/03'),'385821000','9000',N'TV Vàng'),
('KH0007','CN0007',N'Tô Văn Duy',N'Đang',Convert(date,'1993/12/12'),'Nam',N'77 Trần Huy Liệu,Phường 12,Phú Nhuận,Tp.HCM','0942393993','duydang@gmail.com',Convert(date,'2022/02/03'),'882345823','3000',N'TV Bạc'),
('KH0008','CN0008',N'Trần Thị Như',N'Ý',Convert(date,'1997/04/06'),N'Nữ',N'21 Thạch Lam,Hoà Thanh,Tân Phú,TP.HCM','0939432234','nhuytran@gmail.com',Convert(date,'2022/02/03'),'858233451','10000',N'TV Kim Cương'),
('KH0009','CN0009',N'Đinh Như',N'Ý',Convert(date,'1999/10/28'),N'Nữ',N'426 Tên Lửa,Bình Trị Đông B,Bình Tân,TP.HCM','0934767898','dinhnhuy@gmail.com',Convert(date,'2022/02/03'),'885823451','1000',N'TV Đồng'),
('KH0010','CN0010',N'Trần Ý',N'Vy',Convert(date,'1992/12/09'),N'Nữ',N'53 Xuân Hồng,Phường 4,Tân Bình,TP.HCM','0939390220','yvyyy@gmail.com',Convert(date,'2022/02/03'),'345123451','1000',N'TV Đồng'),
('KH0011','CN0011',N'Nguyễn Thị Uyển',N'Vy',Convert(date,'1994/06/15'),N'Nữ',N'380 Nguyễn Thái Sơn,Phường 5,Gò Vấp,Tp.HCM','0939212454','uyenvy123@gmail.com',Convert(date,'2022/02/03'),'834513451','10000',N'TV Kim Cương'),
('KH0012','CN0012',N'Huỳnh Thị Mơ',N'Muội',Convert(date,'1990/09/07'),N'Nữ',N'31A/30 Nguyễn Quý Yêm,quận Bình Tân,TP.HCM','0939789900','momuoi.htmm@gmail.com',Convert(date,'2002/02/04'),'883451451','5000',N'TV Vàng'),
('KH0013','CN0013',N'Nguyễn Kiều Nhã',N'Linh',Convert(date,'1996/10/06'),N'Nữ',N'792/26 Kha Vạn Cân,Phường Linh Đông,Quận Thủ Đức,TP.HCM','0939909808','nhalinh.nknl@gmail.com',Convert(date,'2022/02/04'),'882345151','6000',N'TV Vàng'),
('KH0014','CN0014',N'Vũ Tường',N'Nguyên',Convert(date,'1998/12/05'),'Nam',N'Số 22 Nguyễn Ảnh Thủ,Bà Điểm,Hóc Môn,TP.HCM','0939323433','nguyenvu2310@gmail.com',Convert(date,'2022/02/04'),'882334511','1000',N'TV Đồng'),
('KH0015','CN0015',N'Đoàn Thị Kim',N'Anh',Convert(date,'2000/11/04'),N'Nữ',N'84 Đặng Văn Ngữ,Phường 10,Phú Nhuận,TP.HCM','0931888999','kimanhdoan@gmail.com',Convert(date,'2022/02/06'),'882343451','2000',N'TV Đồng'),
('KH0016','CN0016',N'Phạm Thị Kim',N'Ngân',Convert(date,'2002/11/03'),N'Nữ',N'385A Tây Thạnh,Tân Phú,TP.HCM','0900900600','kimnganpham@gmail.com',Convert(date,'2022/02/07'),'812389551','3000',N'TV Bạc'),
('KH0017','CN0017',N'Lại Thị Ngọc',N'Hà',Convert(date,'2002/02/17'),N'Nữ',N'346 Lê Văn Sỹ,P.2,Tân Bình,TP.HCM','0939300400','laingocha@gmail.com',Convert(date,'2022/02/08'),'882319551','5000',N'TV Vàng'),
('KH0018','CN0018',N'Đặng Minh',N'Tâm',Convert(date,'2001/01/16'),'Nam',N'27 Lê Cao Lãng,Phú Thạnh,Tân Phú,TP.HCM','0939339900','dangminhtam@gmail.com',Convert(date,'2022/02/09'),'822319551','4000',N'TV Bạc'),
('KH0019','CN0019',N'Thòng Tố Phương',N'Anh',Convert(date,'2000/12/20'),N'Nữ',N'54 Đ.Cây Trâm,Phường 8,Gò Vấp,TP.HCM','0912343434','phuonganhhh@gmail.com',Convert(date,'2022/02/10'),'884219551','9000',N'TV Vàng'),
('KH0020','CN0020',N'Lê Đức',N'Trọng',Convert(date,'2001/11/21'),'Nam',N'337/2 Lê Văn Sỹ,Phường 1,Tân Bình,TP.HCM','0908166188','ductronggg@gmail.com',Convert(date,'2022/02/13'),'222319551','10000',N'TV Kim Cương'),
('KH0021','CN0001',N'Trịnh Tuấn',N'Dũng',Convert(date,'2002/01/10'),'Nam',N'269 Linh Đông,P.Linh Đông,Quận Thủ Đức,TP.HCM','0916338899','tuandungtrinh@gmail.com',Convert(date,'2022/02/15'),'222389551','11000',N'TV Kim Cương'),
('KH0022','CN0002',N'Ngô Thị Tố',N'Nữ',Convert(date,'2003/05/09'),N'Nữ',N'40/3A Đường Đông Lân Hưng Lân,ấp Hưng Lân,Bà Điểm,Hóc Môn,TP.HCM','0919293949','tonungo@gmail.com',Convert(date,'2022/02/17'),'127635946','3000',N'TV Bạc'),
('KH0023','CN0003',N'Nguyễn Nhật',N'Huy',Convert(date,'2001/07/08'),'Nam',N'33 Mã Lò,phường Bình Trị Đông A,quận Bình Tân,TP.HCM','0909888777','nhathuyday@gmail.com',Convert(date,'2022/02/21'),'389551551','7000',N'TV Vàng'),
('KH0024','CN0004',N'Phạm Thị Tuyết',N'Mai',Convert(date,'2002/09/07'),N'Nữ',N'27 Lê Cao Lãng,Phú Thạnh,Tân Phú,TP.HCM','0916200900','tuyetmaipham@gmail.com',Convert(date,'2022/02/21'),'22334151','13000',N'TV Kim Cương'),
('KH0025','CN0005',N'Phan Đỗ Bảo',N'Nhi',Convert(date,'2000/12/06'),N'Nữ',N'180 Đường Số 1,phường Bình Trị Đông B,quận Bình Tân,TP.HCM','0922393993','phandobaonhi@gmail.com',Convert(date,'2022/02/21'),'223823341','1000',N'TV Đồng'),
('KH0026','CN0006',N'Lê Thị Ngọc',N'Trâm',Convert(date,'1999/05/15'),N'Nữ',N'Phan Đăng Lưu,Phường 3,Bình Thạnh,TP.HCM','0915783993','lengoctram@gmail.com',Convert(date,'2022/02/21'),'223349551','2000',N'TV Đồng'),
('KH0027','CN0007',N'Đinh Thảo',N'Uyên',Convert(date,'1997/04/25'),N'Nữ',N'110 Ca Văn Thỉnh,Phường 13,Tân Bình,TP.HCM','0939707993','dinhthaouyen@gmail.com',Convert(date,'2022/02/22'),'223419551','3000',N'TV Bạc'),
('KH0028','CN0008',N'Huỳnh Ngọc Yến',N'Trang',Convert(date,'1989/03/23'),N'Nữ',N'76 Hai Bà Trưng,Bến Nghé,Quận 1,TP.HCM','0939398793','huynhngocyentranggg@gmail.com',Convert(date,'2022/02/22'),'859323579','4000',N'TV Bạc'),
('KH0029','CN0009',N'Nguyễn Thị Trà',N'Giang',Convert(date,'1996/02/12'),N'Nữ',N'12H Nguyễn Thị Minh Khai,Đa Kao,Quận 1,TP.HCM','0939312343','tragiangday@gmail.com',Convert(date,'2022/02/23'),'934206583','5000',N'TV Vàng'),
('KH0030','CN0010',N'Ngô Thị Phượng',N'Hằng',Convert(date,'2002/01/19'),N'Nữ',N'48A Nguyễn Duy Hiệu,Thảo Điền,Thành phố Thủ Đức,TP.HCM','0912953993','phuonghangisme@gmail.com',Convert(date,'2022/02/23'),'934230583','1000',N'TV Đồng'),
('KH0031','CN0011',N'Trần Hoàng Bảo',N'Huy',Convert(date,'2001/01/17'),'Nam',N'219 Nguyễn Thị Định,Phường Bình Trưng Tây,Quận 2,TP.HCM','0926313993','tranhoangbaohuy@gmail.com',Convert(date,'2022/02/24'),'933242583','6000',N'TV Vàng'),
('KH0032','CN0012',N'Mai Tuấn',N'Kiệt',Convert(date,'2000/02/01'),'Nam',N'78 Đ.Tân Quý,Tân Quý,Tân Phú,TP.HCM','0987613993','maituankiet@gmail.com',Convert(date,'2022/02/24'),'934084023','8000',N'TV Vàng'),
('KH0033','CN0013',N'Lê Nguyễn Tường',N'Quy',Convert(date,'1992/06/02'),'Nam',N'419/2m Phan Xích Long,Phường 3,Phú Nhuận,TP.HCM','0939393993','tuongquylenguyen@gmail.com',Convert(date,'2022/02/25'),'934210583','7000',N'TV Vàng'),
('KH0034','CN0014',N'Tôn Nữ Ngọc',N'Thùy',Convert(date,'1998/04/04'),N'Nữ',N'38 Nguyễn Thượng Hiền,Phường 5,Quận 3,TP.HCM','0932266333','tonnungocthuy@gmail.com',Convert(date,'2022/02/25'),'934205813','1000',N'TV Đồng'),
('KH0035','CN0015',N'Nguyễn Ngọc Anh',N'Thư',Convert(date,'2002/10/06'),N'Nữ',N'243/29G Đường Tôn Đản,Phường 15,Quận 4,TP.HCM','0992925993','anhthunguyen@gmail.com',Convert(date,'2022/02/26'),'913420583','2000',N'TV Dồng'),
('KH0036','CN0016',N'Nguyễn Thị Hồng',N'Tiên',Convert(date,'2003/08/08'),N'Nữ',N'279 Lê Quang Sung,Phường 6,Quận 6,TP.HCM','0907334411','hongtiennguyen@gmail.com',Convert(date,'2022/02/26'),'193420583','1000',N'TV Đồng'),
('KH0037','CN0017',N'Trần',N'Trí',Convert(date,'2003/10/18'),'Nam',N'436 Lê Văn Việt,Hiệp Phú,Quận 9,TP.HCM','0901222999','trantriiii@gmail.com',Convert(date,'2022/02/27'),'293420583','1000',N'TV Đồng'),
('KH0038','CN0018',N'Lê Ngô Tường',N'Vy',Convert(date,'2001/12/12'),N'Nữ',N'7 Đường Tân Mỹ,Tân Thuận Tây,Quận 7,TP.HCM','0234553993','tuongvylengo@gmail.com',Convert(date,'2022/02/28'),'38823451','5000',N'TV Vàng'),
('KH0039','CN0019',N'Nguyễn Hồng',N'Khanh',Convert(date,'2002/11/16'),'Nam',N'9A Nguyễn Án,Phường 11,Quận 5,TP.HCM','0915234993','hongkhanhnguyen@gmail.com',Convert(date,'2022/03/01'),'885223451','3000',N'TV Bạc'),
('KH0040','CN0020',N'Tạ Quốc',N'Huy',Convert(date,'2000/09/24'),'Nam',N'Hẻm 200 Xóm Chiếu,Phường 14,Quận 4,TP.HCM','0915987993','taquochuy123@gmail.com',Convert(date,'2022/03/02'),'78823451','1000',N'TV Đồng'),
('KH0041','CN0001',N'Nguyễn Tấn',N'Phúc',Convert(date,'1994/07/14'),'Nam',N'193 Cô Giang,Quận 1,TP.HCM','0915712393','tanphucnguyen@gmail.com',Convert(date,'2022/03/02'),'908823451','2000',N'TV Đồng'),
('KH0042','CN0002',N'Nguyễn Thị Hoài',N'Thu',Convert(date,'1999/05/25'),N'Nữ',N'504-506 Hoàng Hữu Nam,Long Bình,Quận 9,TP.HCM','0915781233','hoaithunguyen@gmail.com',Convert(date,'2022/03/04'),'118823451','6000',N'TV Vàng'),
('KH0043','CN0003',N'Ngô Quốc',N'Tuấn',Convert(date,'1997/05/03'),'Nam',N'38d Học Lạc,Phường 14,Quận 5,TP.HCM','0915783111','ngoquoctuan111@gmail.com',Convert(date,'2022/03/04'),'128823451','8000',N'TV Vàng'),
('KH0044','CN0004',N'Vũ Hoàng',N'Quyên',Convert(date,'2003/11/01'),N'Nữ',N'210 Đường Nguyễn Duy Trinh,Phường Bình Trưng Tây,Quận 2,TP.HCM','0915799993','vuhoangquyen.vhq@gmail.com',Convert(date,'2022/03/04'),'8823451','4000',N'TV Bạc'),
('KH0045','CN0005',N'Cao Thị Ngọc',N'Bích',Convert(date,'2001/02/22'),N'Nữ',N'674 Xa lộ Hà Nội,Hiệp Phú,Quận 9,TP.HCM','0915783444','caongocbich@gmail.com',Convert(date,'2022/03/05'),'138823451','7000',N'TV Vàng'),
('KH0046','CN0006',N'Đỗ Trung',N'Kiên',Convert(date,'2000/04/14'),'Nam',N'144/24 Đường Hưng Phú, Phường 8, Quận 8,TP.HCM','0912383993','dochunkien@gmail.com',Convert(date,'2022/03/05'),'158823451','15000',N'TV Kim Cương'),
('KH0047','CN0007',N'Lê Hồng',N'Nhung',Convert(date,'2002/06/19'),N'Nữ',N'268 Lý Thái Tổ,Phường 1,Quận 3,TP.HCM','0915123493','hongnnhungle@gmail.com',Convert(date,'2022/03/05'),'248823451','19000',N'TV Kim Cương'),
('KH0048','CN0008',N'Vũ Thị Hoàng',N'Hậu',Convert(date,'1995/08/28'),N'Nữ',N'16 Đinh Tiên Hoàng,phường ĐaKao,Quận 1,TP.HCM','0914567993','hoanghauvu@gmail.com',Convert(date,'2022/03/05'),'238823451','2000',N'TV Đồng'),
('KH0049','CN0009',N'Lê Hoàng Thanh',N'Thảo',Convert(date,'1897/01/10'),N'Nữ',N'62/1 Đường Tân Mỹ,Tân Thuận Tây,Quận 7,TP.HCM','0999783993','lehoangthanhthao@gmail.com',Convert(date,'2022/03/06'),'822823451','6000',N'TV Vàng'),
('KH0050','CN0010',N'Phan Duy Nhật',N'Minh',Convert(date,'2002/02/12'),'Nam',N'122 Đường Hậu Giang,Phường 6,Quận 6,TP.HCM','0939000093','phanduynhatminh@gmail.com',Convert(date,'2022/03/06'),'832823451','8000',N'TV Vàng'),
('KH0051','CN0011',N'Ngô Hoàng',N'Phúc',Convert(date,'2000/03/01'),'Nam',N'387 Nguyễn Thị Định,Cát Lái,Quận 2,TP.HCM','0923453434','hoangphucngo@gmail.com',Convert(date,'2022/03/07'),'882342451','9000',N'TV Vàng'),
('KH0052','CN0012',N'Lưu Thành',N'Vinh',Convert(date,'1992/04/03'),'Nam',N'42 Đ. Hoàng Diệu, Phường 12, Quận 4,TP.HCM','0912399994','kuuthanhvinhhhh@gmail.com',Convert(date,'2022/03/07'),'881323451','2000',N'TV Đồng'),
('KH0053','CN0013',N'Nguyễn Đức',N'Thịnh',Convert(date,'1998/05/05'),'Nam',N'498 Hoà Hảo,Phường 5,Quận 10,TP.HCM','0912340000','ducthinhnguyen123@gmail.com',Convert(date,'2022/03/07'),'828623451','2000',N'TV Đồng'),
('KH0054','CN0014',N'Nguyễn Minh',N'Hiếu',Convert(date,'2002/09/07'),'Nam',N'924A,Tạ Quang Bửu,Phường 5,Quận 8,TP.HCM','0912000034','minhhieuuu@gmail.com',Convert(date,'2022/03/08'),'288234451','1000',N'TV Đồng'),
('KH0055','CN0015',N'Mai Tấn',N'Phát',Convert(date,'2003/12/09'),'Nam',N'16/73a Nguyễn Thiện Thuật,Phường 2,Quận 3,TP.HCM','0923343434','maitanphat123@gmail.com',Convert(date,'2022/03/08'),'288263451','4000',N'TV Bạc'),
('KH0056','CN0016',N'Cao Quỳnh',N'Như',Convert(date,'2003/11/19'),N'Nữ',N'136/1 Đ. Nguyễn Tri Phương,Phường 9,Quận 5,TP.HCM','0922343434','caoquynhnhu1911@gmail.com',Convert(date,'2022/03/09'),'884234451','7000',N'TV Vàng'),
('KH0057','CN0017',N'Triệu Thị Thảo',N'Nguyên',Convert(date,'2001/02/21'),N'Nữ',N'14b Làng Tăng Phú,Tăng Nhơn Phú A,Quận 9,TP.HCM','0956543434','thaonguyn2102@gmail.com',Convert(date,'2022/03/09'),'848263451','2000',N'TV Đồng'),
('KH0058','CN0018',N'Trần Ngọc Thúy',N'Diễm',Convert(date,'2002/03/22'),N'Nữ',N'An Dương Vương,Phường 3,Quận 5,TP.HCM','0912354434','tranngocthuydiem1234@gmail.com',Convert(date,'2022/03/10'),'882344251','3000',N'TV Bạc'),
('KH0059','CN0019',N'Vũ Thị Hồng',N'Nhung',Convert(date,'2000/04/27'),N'Nữ',N'200/8 Xóm Chiếu,Phường 16,Quận 4,TP.HCM','0942356434','hongnhungvu2704@gmail.com',Convert(date,'2022/03/10'),'882345216','1000',N'TV Đồng'),
('KH0060','CN0020',N'Nguyễn Thị Kim',N'Ngọc',Convert(date,'1994/05/05'),N'Nữ',N'51 Cao Thắng,Phường 3,Quận 3,TP.HCM','0987569424','Kimngocnguyen1505@gmail.com',Convert(date,'2022/03/11'),'882345129','14000',N'TV Kim Cương')


INSERT INTO tbNhanVien(MaNV,MaCN,HoNV,TenNV,NgaySinhNV,GioiTinhNV,CMNDNV,DiaChiNV,SDTNV,EmailNV) 
VALUES
('NV0001','CN0001',N'Vũ Tường',N'Linh',Convert(date,'2001/01/22'),N'Nữ','461212121',N'38 Nguyễn Thượng Hiền,P.5,Quận 3,TP.HCM','0123393993','vutuonglinh123@gmail.com'),
('NV0002','CN0001',N'Vũ Duy',N'Thông',Convert(date,'2002/03/12'),N'Nam','384824322',N'111 Nguyễn Xuân Khoát,Quận Tân Phú,TP.HCM','0939344493','duythonngvu@gmail.com'),
('NV0003','CN0013',N'Doja',N'Cat',Convert(date,'1995/10/21'),N'Nữ','384858574',N'189 Cống Quỳnh,P.Nguyễn Cư Trình,Quận 1,TP.HCM','0935312343','dojacat@gmail.com'),
('NV0004','CN0004',N'Nicki',N'Minaj',Convert(date,'1982/12/08'),N'Nữ','384322441',N'2 Trần Bình Trọng,P.5,Quận Bình Thạnh,TP.HCM','0852785457','nickiminaj@gmail.com'),
('NV0005','CN0001',N'Cardi',N'B',Convert(date,'1992/10/11'),N'Nữ','342435631',N'285 Hùng Vương,P.9,Quận 5,TP.HCM','0939300003','cardib@gmail.com'),
('NV0006','CN0006',N'Nguyễn Phùng Vân',N'Anh',Convert(date,'2002/02/12'),N'Nữ','345836251',N'277 Võ Văn Tần,P.5,Quận 3,TP.HCM','0852785457','npvananh@gmail.com'),
('NV0007','CN0007',N'Nguyễn Thị Kim',N'Kiều',Convert(date,'2002/06/24'),N'Nữ','388251634',N'386/43B Lê Văn Sỹ,P.14,Quận 3,TP.HCM','0339317215','nguyenthikimkieu21032002@gmail.com'),
('NV0008','CN0008',N'Kim',N'Kardashian',Convert(date,'1980/10/20'),N'Nam','384254634',N'90 Nguyễn Thượng Hiền,P.5,Quận 3,TP.HCM','0938527993','brightwinisreal.otp@gmail.com'),
('NV0009','CN0009',N'Na',N'Jaemin',Convert(date,'2000/06/13'),N'Nữ','382482532',N'663 Quang Trung,Quận Gò Vấp,TP.HCM','0939393993','nana@gmail.com'),
('NV0010','CN0010',N'Trần Thủy',N'Tiên',Convert(date,'2002/05/09'),N'Nữ','345352152',N'380 Nguyễn Tri Phương,P.4,Quận 10,TP.HCM','0339317215','janetran@gmail.com'),
('NV0011','CN0011',N'Nguyễn Vũ Mẫn',N'Nhi',Convert(date,'2002/03/12'),N'Nữ','382532543',N'881 Hoàng Sa,P.9,Quận 3,TP.HCM','0939112293','nguyenvumannhi@gmail.com'),
('NV0012','CN0012',N'Nguyễn Cẩm',N'Vy',Convert(date,'2002/01/24'),N'Nữ','352452561',N'272A Nguyễn Tri Phương,P.4,Quận 10,TP.HCM','0852785457','nguyencamvy.dth@gmail.com'),
('NV0013','CN0012',N'Đặng Thanh',N'Hiền',Convert(date,'1999/04/02'),N'Nữ','352628461',N'757 Hoàng Sa,Quận 3,TP.HCM','0939303393','thanhhien91@gmail.com'),
('NV0014','CN0014',N'Lê Hoàng',N'Dương',Convert(date,'1989/03/04'),N'Nam','384852413',N'183/29G Tân Hoà Đông,Phường 14,Quận 6,TP.HCM','0339852705','hoangduong98@gmail.com'),
('NV0015','CN0012',N'Trần Xuân',N'Hiên',Convert(date,'1999/02/16'),N'Nữ','321424858',N'99A Trần Văn Đang,P.9,Quận 3,TP.HCM','0827393993','xuanhiencp@gmail.com'),
('NV0016','CN0001',N'Lê Nhật',N'Tường',Convert(date,'1997/01/05'),N'Nam','471989921',N'145 Nguyễn Gia Trí,Phường 25,Quận Bình Thạnh,,TP.HCM','0339317215','lenhattuong@gmail.com'),
('NV0017','CN0012',N'Vũ Minh',N'Trí',Convert(date,'1989/12/10'),N'Nam','471989921',N'C218 Xóm Chiếu,Quận 4,TP.HCM','0903393993','chuyenvientuvanpk@gmail.com'),
('NV0018','CN0001',N'Vũ Thu',N'Phương',Convert(date,'1999/06/20'),N'Nam','412314531',N'243/29E Tôn Đản,P.15,Quận 4,TP.HCM','0852785457','phuongacb@gmail.com'),
('NV0019','CN0019',N'Đoàn Kim',N'Anh',Convert(date,'1999/10/03'),N'Nữ','135314531',N'150 Lê Văn Sỷ,Phường 10,Phú Nhuận,TP.HCM','0939393993','kkanh@gmail.com'),
('NV0020','CN0020',N'Quách Xuân',N'Lâm',Convert(date,'1996/05/09'),N'Nam','131314256',N'223 Trần Bình Trọng,Quận 5,TP.HCM','0930339333','quachxuanlam@gmail.com'),
('NV0021','CN0001',N'Trần Tùng',N'Duy',Convert(date,'2000/12/27'),N'Nam','451234423',N'346 Lê Văn Sỹ,Phường 2,Quận Tân Bình,TP.HCM','0852785457','tungtranduy91@gmail.com'),
('NV0022','CN0002',N'Hồ Phương',N'Anh',Convert(date,'1998/08/04'),N'Nữ','245512346',N'Hẻm 386/43B Lê Văn Sỹ,Phường 14,Quận 3,TP.HCM','0085278993','phuonganh@gmail.com'),
('NV0023','CN0003',N'Mai Phương',N'Anh',Convert(date,'1997/04/06'),N'Nữ','134535644',N'147 đường số 9,Phước Bình,Quận 9,TP.HCM','0339317215','phanhhh@gmail.com'),
('NV0024','CN0012',N'Lưu Kiều',N'Hương',Convert(date,'2002/11/08'),N'Nữ','123423224',N'187/4 Mai Xuân Thưởng,Phường 5,Quận 6,TP.HCM','0930852783','kieuhuongluu@gmail.com'),
('NV0025','CN0005',N'Nguyễn Việt',N'Dũng',Convert(date,'1998/09/11'),N'Nam','245635356',N'493 Trường Chinh,Phường 14,Quận Tân Bình,TP.HCM','0339317215','nguyenvietdung@gmail.com'),
('NV0026','CN0006',N'Đỗ Hồng',N'Anh',Convert(date,'1992/07/22'),N'Nữ','245456357',N'12 Tổ 1 KP1,Hiệp Thành,Quận 12,TP.HCM','0939393993','dohonganh@gmail.com'),
('NV0027','CN0007',N'Nguyễn Ngọc',N'Trúc',Convert(date,'2002/05/02'),N'Nữ','476424562',N'321 Lãnh Binh Thăng,Phường 8,Quận 11,TP.HCM','0852785457','nguyenngoctruc@gmail.com'),
('NV0028','CN0008',N'Hoàng Việt	Quang',N'Huy',Convert(date,'2002/03/14'),N'Nam','254456727',N'319 Điện Biên Phủ,Quận Bình Thạnh,TP.HCM','0939393993','hoangvietquanghuy@gmail.com'),
('NV0029','CN0009',N'Lê Minh',N'Hiếu',Convert(date,'2002/01/17'),N'Nam','435564887',N'72 Trần Đình Xu,P.Cầu Kho,Quận 1,TP.HCM','0852783113','minhhieu@gmail.com'),
('NV0030','CN0010',N'Trần Tố',N'Tố',Convert(date,'1995/12/18'),N'Nữ','244887564',N'116/11 Phan Đăng Lưu,P.3,Quận Phú Nhuận,TP.HCM','0931111193','totoloto@gmail.com'),
('NV0031','CN0011',N'Đặng Giáng',N'Mi',Convert(date,'2002/10/23'),N'Nữ','654762242',N'60A Cao Thắng, P.5,Quận 3,TP.HCM','0939222293','giangmi@gmail.com'),
('NV0032','CN0012',N'Nguyễn Giáng',N'sON',Convert(date,'1998/08/28'),N'Nữ','566676883',N'835/17E Trần Hưng Đạo,P.1,Quận 5,TP.HCM','0912313993','giangson@gmail.com'),
('NV0033','CN0012',N'Liễu',N'Liễu',Convert(date,'1998/06/03'),N'Nữ','243678327',N'143 Lê Quang Sung,Quận 6,TP.HCM','0332317215','lieulieu@gmail.com'),
('NV0034','CN0015',N'Trương Mỹ',N'Lệ',Convert(date,'2000/04/07'),N'Nữ','343327242',N'243/29G Tôn Đản,phường 15,quận 4,TP.HCM','0851735457','milene@gmail.com'),
('NV0035','CN0001',N'Tú',N'Tú',Convert(date,'1991/02/14'),N'Nữ','647821347',N'9 Nguyễn Án,P.11,Quận 5,TP.HCM','0929299113','tutu@gmail.com'),
('NV0036','CN0016',N'Liễu',N'Liễu',Convert(date,'1997/12/28'),N'Nữ','245353821',N'Hẻm 419/2M Phan Xích Long,P.3,Quận Phú Nhuận,TP.HCM','0937364313','thuylieu@gmail.com'),
('NV0037','CN0017',N'Tôn Ngọc',N'Nữ',Convert(date,'1998/09/19'),N'Nữ','132327523',N'433/44 Lê Đại Hành,Phường 11,Quận 11,TP.HCM','0909813993','ngocnu@gmail.com'),
('NV0038','CN0018',N'Nhã Lan',N'Thanh',Convert(date,'1993/06/01'),N'Nữ','452313821',N'187 Cống Quỳnh,P.Phạm Ngũ Lão,Quận 1,TP.HCM','0990986332','nhalanthanh@gmail.com'),
('NV0039','CN0001',N'Kylie',N'Jenner',Convert(date,'1997/08/10'),N'Nữ','245821327',N'Số 22 Nguyễn Ảnh Thủ,Bà Điểm,Hóc Môn,TP.HCM','0109021213','chaquyen@gmail.com'),
('NV0040','CN0001',N'Kendall',N'Jenner',Convert(date,'1995/11/03'),N'Nữ','535721364',N'76 Nguyễn Văn Thủ,P.Đa Kao,Quận 1,TP.HCM','0981927613','sorimongtuyen@gmail.com')

--CHÈN DỮ LIỆU MỘT VÀI CHI NHÁNH STARBUCKS Ở TPHCM VÀO BẢNG tbCHINHANH
INSERT INTO tbChiNhanh (MaCN,TenCN,DiaChi,SDT)
VALUES 
('CN0001',N'Starbucks New World',N'76 Lê Lai,Quận 1,TP.HCM','02838237952'),
('CN0002',N'Starbucks Estella',N'88 Song Hành,Phường An Phú,Quận 2,TP.HCM ','02836367424'),
('CN0003',N'Starbucks Leman',N'117 Nguyễn Đình Chiểu,Phường 6,Quận 3,TP.HCM','02839301092'),
('CN0004',N'Starbucks Nguyễn Huệ',N'99 Nguyễn Huệ,Quận 1,TP.HCM','02838210105'),
('CN0005',N'Starbucks Lakai',N'98-126 Nguyễn Tri Phương,Quận 5,TP.HCM','02839241251'),
('CN0006',N'Starbucks Pandora',N'1/1 Trường Chinh,Phường Tây Thạnh,Tân Phú,TP.HCM','02838126830'),
('CN0007',N'Starbucks Panorama',N'208 Trần Văn Trà,Quận 7,TP.HCM','02854138292'),
('CN0008',N'Starbucks Gò Vấp',N'168 Phan Văn Trị,Gò Vấp,TP.HCM','02835880146'),
('CN0009',N'Starbucks Thảo Điền',N'21 Thảo Điền,Quận 2,TP.HCM','02837442040'),
('CN0010',N'Starbucks Sư Vạn Hạnh',N'11 Sư Vạn Hạnh,Phường 12,Quận 10,TP.HCM','02836365485'),
('CN0011',N'Starbucks IBIS',N'2 Hồng Hà,Tân Bình,TP.HCM','02838486030'),
('CN0012',N'Starbucks Rex',N'141 Nguyễn Huệ,Quận 1,TP.HCM','02838244668'),
('CN0013',N'Starbucks mPlaza',N'mPlaza Saigon,39 Lê Duẩn,Quận 1,TP.HCM','02838234990'),
('CN0014',N'Starbucks Crescent Strip',N'CR1-02,Crescent Residence 1,103 Tôn Dật Tiên,Quận 7,Block A,Phú Mỹ Hưng,TP HCM','02866806191'),
('CN0015',N'Starbucks Landmark 81',N'L1-26,Ground Floor,Landmark Building,772 Điện Biên Phủ,Phường 22,Quận Bình Thạnh,TP.HCM','02836369858'),
('CN0016',N'Starbucks Gateway',N'Gateway Thảo Điền,177 Xa Lộ Hà Nội,Khu Phố 1,Phường Thảo Điền,Quận 2,TP.HCM','02836369894'),
('CN0017',N'Starbucks Riverpark',N'Riverpark Premier,31 Đặng Đức Thuật,Quận 7,TP.HCM','02873059798'),
('CN0018',N'Starbucks Gold View',N'TTTM The Gold View,346 Bến Vân Đồn,Quận 4,TP.HCM','02836363046'),
('CN0019',N'Starbucks Lotte Pico',N'1F2,PICO PLAZA,20 Cộng Hòa,Phường12,Quận Tân Bình,TP.HCM','02836201392'),
('CN0020',N'Starbucks Airport',N'Sân bay Tân Sơn Nhất – 45 Trường Sơn,Quận Tân Bình,Tp.HCM','02836209020')


-- CHÈN DỮ LIỆU PHÂN LOẠI TỪNG LOẠI NƯỚC VÀO VÀO BẢNG tbLOAISANPHAM
INSERT INTO tbLoaiSanPham(MaLoaiSP,TenLoaiSP,GhiChuLoaiSP) 
VALUES
('CB0001',N'Cold Brew',N'Món cà phê'),
('EC0001',N'Espresso',N'Món cà phê'),
('FB0001',N'Frappuccino Blended Beverages',N'Món thức uống đá xay Frappuccino'),
('BJ0001',N'Blended Juice Drinks',N'Món nước trái cây pha trộn'),
('TT0001',N'Teavana Teas',N'Món trà'),
('OB0001',N'Other Beverages',N'Một số món khác')


-- CHÈN DỮ LIỆU MÓN ĂN/NƯỚC UỐNG VÀO BẢNG tbMENU
INSERT INTO tbMenu(MaMon,TenMon,MaLoaiSP,GhiChuMenu)
VALUES
('SP0001',N'Mango Passion Fruit',N'BJ0001',N''),
('SP0002',N'Raspberry Black Currant',N'BJ0001',N''),
('SP0003',N'Cold Brew',N'CB0001',N''),
('SP0004',N'Vanilla Sweet Cream Cold Brew',N'CB0001',N''),
('SP0005',N'Flat White',N'EC0001',N''),
('SP0006',N'Cold Foam Iced Espresso',N'EC0001',N''),
('SP0007',N'Caffè Latte',N'EC0001',N''),
('SP0008',N'Caffè Mocha',N'EC0001',N''),
('SP0009',N'Asian Dolce Latte',N'EC0001',N''),
('SP0010',N'Caffè Americano',N'EC0001',N''),
('SP0011',N'Cappuccino',N'EC0001',N''),
('SP0012',N'Caramel Macchiato',N'EC0001',N''),
('SP0013',N'Iced Dolce Misto',N'EC0001',N''),
('SP0014',N'Dark Caramel Coffee Frappuccino',N'FB0001',N''),
('SP0015',N'Triple Mocha Frappuccino',N'FB0001',N''),
('SP0016',N'Java Chip Frappuccino',N'FB0001',N''),
('SP0017',N'Green Tea Cream Frappuccino',N'FB0001',N''),
('SP0018',N'Chocolate Chip Cream Frappuccino',N'FB0001',N''),
('SP0019',N'Caramel Cream Frappuccino',N'FB0001',N''),
('SP0020',N'Caramel Frappuccino',N'FB0001',N''),
('SP0021',N'Mocha Frappuccino',N'FB0001',N''),
('SP0022',N'Espresso Frappuccino',N'FB0001',N''),
('SP0023',N'Vanilla Cream Frappuccino',N'FB0001',N''),
('SP0024',N'Coffee Frappuccino',N'FB0001',N''),
('SP0025',N'Signature Chocolate',N'OB0001',N''),
('SP0026',N'Vanilla Black Tea Latte',N'TT0001',N''),
('SP0027',N'Iced Shaken Lemon Hibiscus Tea',N'TT0001',N''),
('SP0028',N'Iced Shaken Lemon Green Tea',N'TT0001',N''),
('SP0029',N'Green Tea Latte',N'TT0001',N''),
('SP0031',N'English Breakfast Tea Latte',N'TT0001',N''),
('SP0032',N'Iced Shaken Lemon Black Tea',N'TT0001',N''),
('SP0033',N'Earl Grey Tea Latte',N'TT0001',N''),
('SP0034',N'Iced Shaken Hibiscus Tea With Pomegranate Pearls',N'TT0001',N''),
('SP0035',N'Black Tea With Ruby Grapefruit & Honey',N'TT0001',N''),
('SP0036',N'Matcha & Espresso Fusion',N'TT0001',N''),
('SP0037',N'Chai Tea Latte',N'TT0001',N'')


-- CHÈN DỮ LIỆU GIÁ VÀO BẢNG tbGIAMON (Dữ liệu giá tại store Starbucks New World Quận 1)
INSERT INTO tbGiaMon(MaSoGia,MaMon,GiaMon) 
VALUES
('GM0001','SP0001','90000'),
('GM0002','SP0002','90000'),
('GM0003','SP0003','65000'),
('GM0004','SP0004','75000'),
('GM0005','SP0005','80000'),
('GM0006','SP0006','75000'),
('GM0007','SP0007','80000'),
('GM0008','SP0008','90000'),
('GM0009','SP0009','85000'),
('GM0010','SP0010','65000'),
('GM0011','SP0011','80000'),
('GM0012','SP0012','80000'),
('GM0013','SP0013','65000'),
('GM0014','SP0014','105000'),
('GM0015','SP0015','105000'),
('GM0016','SP0016','105000'),
('GM0017','SP0017','105000'),
('GM0018','SP0018','105000'),
('GM0019','SP0019','100000'),
('GM0020','SP0020','100000'),
('GM0021','SP0021','100000'),
('GM0022','SP0022','100000'),
('GM0023','SP0023','100000'),
('GM0024','SP0024','900000'),
('GM0025','SP0025','80000'),
('GM0026','SP0026','85000'),
('GM0027','SP0027','75000'),
('GM0028','SP0028','75000'),
('GM0029','SP0029','80000'),
('GM0031','SP0031','80000'),
('GM0032','SP0032','75000'),
('GM0033','SP0033','80000'),
('GM0034','SP0034','80000'),
('GM0035','SP0035','80000'),
('GM0036','SP0036','85000'),
('GM0037','SP0037','80000')


-- CHÈN DỮ LIỆU HÓA ĐƠN VÀO BẢNG tbHOADON
INSERT INTO tbHoaDon(MaHD,MaNV,MaKH,NgayLapHD,PTTT) 
VALUES
('HD0001','NV0034','KH0001',CONVERT(DATE,'2022/02/20'),N'Tiền mặt'),
('HD0002','NV0032','KH0003',CONVERT(DATE,'2022/02/20'),N'Dùng điểm thưởng'),
('HD0003','NV0030','KH0005',CONVERT(DATE,'2022/02/20'),N'Tiền mặt'),
('HD0004','NV0028','KH0007',CONVERT(DATE,'2022/02/20'),N'Thanh toán bằng PayPal'),
('HD0005','NV0026','KH0009',CONVERT(DATE,'2022/02/20'),N'Tiền mặt'),
('HD0006','NV0024','KH0011',CONVERT(DATE,'2022/02/25'),N'Dùng điểm thưởng'),
('HD0007','NV0022','KH0002',CONVERT(DATE,'2022/02/25'),N'Thanh toán bằng Apple Pay'),
('HD0008','NV0020','KH0004',CONVERT(DATE,'2022/02/25'),N'Thanh toán bằng PayPal'),
('HD0009','NV0018','KH0006',CONVERT(DATE,'2022/02/25'),N'Dùng điểm thưởng'),
('HD0010','NV0015','KH0008',CONVERT(DATE,'2022/02/25'),N'Dùng điểm thưởng'),
('HD0011','NV0013','KH0010',CONVERT(DATE,'2022/02/25'),N'Thanh toán bằng Apple Pay'),
('HD0012','NV0001','KH0013',CONVERT(DATE,'2022/02/25'),N'Thanh toán bằng Internet Banking'),
('HD0013','NV0009','KH0015',CONVERT(DATE,'2022/03/25'),N'Dùng điểm thưởng'),
('HD0014','NV0002','KH0012',CONVERT(DATE,'2022/03/25'),N'Thanh toán bằng PayPal'),
('HD0015','NV0003','KH0014',CONVERT(DATE,'2022/03/25'),N'Dùng điểm thưởng'),
('HD0016','NV0005','KH0016',CONVERT(DATE,'2022/03/25'),N'Dùng điểm thưởng'),
('HD0017','NV0004','KH0018',CONVERT(DATE,'2022/03/25'),N'Thanh toán bằng Internet Banking'),
('HD0018','NV0006','KH0021',CONVERT(DATE,'2022/03/25'),N'Thanh toán bằng PayPal'),
('HD0019','NV0007','KH0022',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0020','NV0008','KH0023',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng PayPal'),
('HD0021','NV0036','KH0025',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Apple Pay'),
('HD0022','NV0038','KH0026',CONVERT(DATE,'2022/03/11'),N'Dùng điểm thưởng'),
('HD0023','NV0040','KH0027',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Internet Banking'),
('HD0024','NV0039','KH0029',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Apple Pay'),
('HD0025','NV0037','KH0031',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng PayPal'),
('HD0026','NV0035','KH0033',CONVERT(DATE,'2022/03/11'),N'Dùng điểm thưởng'),
('HD0027','NV0033','KH0035',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0028','NV0031','KH0036',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0029','NV0029','KH0038',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0030','NV0027','KH0040',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Internet Banking'),
('HD0031','NV0010','KH0042',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng PayPal'),
('HD0032','NV0011','KH0044',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Internet Banking'),
('HD0033','NV0012','KH0046',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Apple Pay'),
('HD0034','NV0014','KH0047',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Internet Banking'),
('HD0035','NV0016','KH0048',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng Apple Pay'),
('HD0036','NV0017','KH0049',CONVERT(DATE,'2022/03/11'),N'Thanh toán bằng PayPal'),
('HD0037','NV0019','KH0051',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0038','NV0021','KH0055',CONVERT(DATE,'2022/03/11'),N'Dùng điểm thưởng'),
('HD0039','NV0023','KH0060',CONVERT(DATE,'2022/03/11'),N'Tiền mặt'),
('HD0040','NV0025','KH0003',CONVERT(DATE,'2022/03/11'),N'Tiền mặt')



-- CHÈN DỮ LIỆU CHI TIẾT HÓA ĐƠN VÀO BẢNG tbCHITIETHOAODN
INSERT INTO tbChiTietHoaDon(MaHD,MaMon,SoLuong) 
VALUES
('HD0001','SP0017','1'),
('HD0002','SP0023','2'),
('HD0003','SP0003','2'),
('HD0004','SP0002','2'),
('HD0005','SP0005','1'),
('HD0006','SP0001','4'),
('HD0007','SP0007','1'),
('HD0008','SP0008','3'),
('HD0009','SP0009','3'),
('HD0010','SP0010','2'),
('HD0011','SP0004','2'),
('HD0012','SP0012','3'),
('HD0013','SP0013','4'),
('HD0014','SP0014','3'),
('HD0015','SP0015','1'),
('HD0016','SP0006','1'),
('HD0017','SP0017','1'),
('HD0018','SP0018','6'),
('HD0019','SP0019','1'),
('HD0020','SP0020','1'),
('HD0021','SP0021','4'),
('HD0022','SP0022','1'),
('HD0023','SP0013','1'),
('HD0024','SP0024','3'),
('HD0025','SP0025','2'),
('HD0026','SP0021','1'),
('HD0027','SP0027','2'),
('HD0028','SP0028','1'),
('HD0029','SP0029','2'),
('HD0030','SP0031','3'),
('HD0031','SP0032','1'),
('HD0032','SP0027','2'),
('HD0033','SP0034','1'),
('HD0034','SP0035','2'),
('HD0035','SP0036','2'),
('HD0036','SP0037','2'),
('HD0037','SP0025','1'),
('HD0038','SP0037','2'),
('HD0039','SP0011','1'),
('HD0040','SP0016','3')

-- CHÈN DỮ LIỆU PHỤ CẤP LƯƠNG VÀO BẢNG tbPHUCAP
INSERT INTO tbPhuCap(MaPC,MaNV,PhuCap) 
VALUES
('PC0001','NV0002','150000'),
('PC0002','NV0006','250000'),
('PC0003','NV0007','200000'),
('PC0004','NV0010','200000'),
('PC0005','NV0011','150000'),
('PC0006','NV0012','200000'),
('PC0007','NV0003','100000'),
('PC0008','NV0040','200000'),
('PC0009','NV0005','100000'),
('PC0010','NV0009','300000')



--SYNONYM
--1. Tạo tên đồng nghĩa cho tbKhachHang thành KH để tên ngắn gọn hơn
CREATE SYNONYM KH FOR tbKhachHang
--Kiểm thử
SELECT * FROM KH

--2. Tạo tên đồng nghĩa mm truy xuất vào tbNhanVien do người dùng dbo làm chủ sở hữu
CREATE SYNONYM MM FOR dbo.tbNhanVien
--Kiểm thử
SELECT * FROM MM

--INDEX
--1. Tạo index cho giá món trên bảng tbGiaMon
CREATE INDEX index_price on tbGiaMon(GiaMon)
--Kiểm thử
SELECT * FROM tbGiaMon
WITH(INDEX(index_price))
WHERE GiaMon = '90000'

--2. Tạo index trên cột ngày sinh của bảng tbKhachHang
CREATE INDEX index_NgaySinh on tbKhachHang(NgaySinhKH)
--Kiểm thử
SELECT * FROM tbKhachHang
WITH(INDEX(index_NgaySinh))
WHERE YEAR(NgaySinhKH) = '2002'

--VIEW
--1. Tạo view vwKhachHangVip với các thông tin gồm: Mã Khách Hàng, Họ Tên Khách Hàng, Ngày Sinh, Email, Địa Chỉ, Số Điện Thoại, Thành Viên của các Khách Hàng là TV Vàng hoặc Kim Cương có ngày sinh trong tháng hiện hành.
CREATE VIEW vwKhachHangVip AS
SELECT MaKH, HoKH + ' ' + TenKH AS N'Họ Tên Khách Hàng', NgaySinhKH, (YEAR(GETDATE()) - YEAR(NgaySinhKH)) AS N'Tuổi', EmailKH, DiaChiKH, SDTKH, ThanhVien
FROM tbKhachHang
WHERE MONTH(NgaySinhKH) = MONTH(GETDATE()) AND (ThanhVien = N'TV Vàng' OR ThanhVien = N'TV Kim Cương')
--Kiểm thử
SELECT * FROM vwKhachHangVip

--2. Tạo view vwSoNhanVienTrongChiNhanh với các thông tin: Mã Chi Nhánh, Tên Chi Nhánh, Số Lượng Nhân Viên của các chi nhánh. Và Ghi Chú lại:
/*-	Nếu Số Lượng Nhân Viên < 2 thì ghi Thiếu Nhân Viên, cần bổ sung nhân lực
-	Nếu 2 <= Số Lượng Nhân Viên < 5 thì ghi Đủ Nhân Viên
-	Nếu Số Lượng Nhân Viên >= 5 thì ghi Thừa Nhân Viên, cần phân bố lại nhân sự*/
CREATE VIEW vwSoNhanVienTrongChiNhanh AS
SELECT CN.MaCN, TenCN, DiaChi, COUNT(MaNV) AS N'Số Lượng Nhân Viên',
CASE
WHEN COUNT(MaNV) <2 THEN N'Thiếu Nhân Viên, cần bổ sung nhân sự'
WHEN COUNT(MaNV) <5 THEN N'Đủ Nhân Viên'
ELSE N'Thừa Nhân Viên, cần phân bố lại nhân sự '
END AS N'Ghi Chú'
FROM tbChiNhanh CN INNER JOIN tbNhanVien NV ON CN.MaCN = NV.MaCN
GROUP BY CN.MaCN, TenCN, DiaChi
--Kiểm thử
SELECT * FROM vwSoNhanVienTrongChiNhanh

--3. Tạo view vwTriGiaHoaDon với các thông tin: Ngày Lập Hóa Đơn, Mã Hóa Đơn, Mã Khách Hàng, Họ Tên Khách Hàng, Mã Món, Tên Món, Tên Loại Sản Phẩm, Gía Món, Số Lượng, Tổng trị giá hóa đơn (Giá Bán x Số Lượng) của các mặt hàng thuộc loại món Espresso
CREATE VIEW vwTriGiaHoaDon AS
SELECT NgayLapHD, hd.MaHD, kh.MaKH, HoKH + ' ' + TenKH AS N'Họ Tên Khách Hàng' , ct.MaMon, mn.TenMon, lsp.TenLoaiSP, GiaMon, SoLuong, SUM(GiaMon*SoLuong) AS 'Tổng Tiền'
FROM tbChiTietHoaDon ct JOIN tbHoaDon hd ON ct.MaHD = hd.MaHD 
JOIN tbGiaMon gm ON ct.MaMon = gm.MaMon 
JOIN tbMenu mn ON mn.MaMon = gm.MaMon 
JOIN tbLoaiSanPham lsp ON lsp.MaLoaiSP = mn.MaLoaiSP
JOIN tbKhachHang kh ON hd.MaKH = kh.MaKH
WHERE lsp.TenLoaiSP = 'Espresso'
GROUP BY NgayLapHD, hd.MaHD, kh.MaKH ,ct.MaMon,mn.TenMon, lsp.TenLoaiSP, HoKH + ' ' + TenKH, GiaMon, SoLuong
--Kiểm thử
SELECT * FROM vwTriGiaHoaDon 

--4. Tạo view vwBestSeller với các cho biết: Mã món, Tên món, Số lượng đặt của món được đặt mua nhiều nhất
CREATE VIEW vwBestSeller AS
SELECT mn.MaMon, TenMon, SUM(SoLuong) AS N'Số Lượng'
FROM tbMenu mn INNER JOIN tbChiTietHoaDon cthd ON mn.MaMon=cthd.MaMon
GROUP BY mn.MaMon, TenMon
HAVING SUM(SoLuong) >= All (SELECT SUM(SoLuong) 
					FROM tbChiTietHoaDon 
					GROUP BY MaMon)
--Kiểm thử
SELECT * FROM vwBestSeller


--FUNCTION
--1. Thông tin Khách hàng với tham số nhập vào là mã CN
Create function f_ThongTinNVTheoMaCN (@MaCN nchar(6))
Returns table 
As
Return 
	Select *
	From tbNhanVien
	Where @MaCN = MaCN
--Thực thi với mã hóa đơn 'CN0002'
Select * from f_ThongTinNVTheoMaCN ('CN0002')

---2. Doanh thu của từng sản phẩm
Create function f_DoanhThuTheoSanPham (@MaMon nchar(6))
Returns int
As
Begin
Declare @DoanhThu int 
Select @DoanhThu = Sum(GiaMon*SoLuong)
From  tbMenu join tbChiTietHoaDon CTHD on tbMenu.MaMon=CTHD.MaMon
			 join tbGiaMon on tbMenu.MaMon=tbGiaMon.MaMon
Where @MaMon=tbMenu.MaMon
Return @DoanhThu
End
--Thực thi Mã Món 'SP0037'
Print dbo.f_DoanhThuTheoSanPham ('SP0037')

--STORE PROCEDURE
--1. Xem top 3 chi nhánh có doanh thu cao nhất tháng 3/2022
Create proc sp_DoanhThuTop3Thang03Nam2022
As
Select Top(3) tbChiNhanh.MaCN, DiaChi, tbNhanVien.MaNV, HoNv + ' ' + TenNV as N'Họ tên Nhân viên', SoLuong*GiaMon as N'Doanh thu'
From tbNhanVien join tbHoaDon on tbNhanVien.MaNV=tbHoaDon.MaNV
join tbChiNhanh on tbNhanVien.MaCN=tbChiNhanh.MaCN
join tbChiTietHoaDon on tbHoaDon.MaHD=tbChiTietHoaDon.MaHD
join tbGiaMon on tbChiTietHoaDon.MaMon=tbGiaMon.MaMon
Where Month(NgayLapHD)='3' and Year(NgayLapHD)='2022'
Group by tbChiNhanh.MaCN, DiaChi, tbNhanVien.MaNV, HoNv + ' ' + TenNV, SoLuong*GiaMon
Order by N'Doanh thu' DESC

--Thực thi Doanh thu top 3 tháng 03/2022
EXEC sp_DoanhThuTop3Thang03Nam2022

--2. Xem số lượng khách hàng có tổng giá trị hóa đơn trên 250000 đồng ở mỗi chi nhánh
Create proc sp_DemSLKHCoHDTren250000
As
Select tbChiNhanh.TenCN, COUNT(TbKhachHang.MaKH) as 'Số lượng khách hàng có tổng hóa đơn trên 250000'
From tbKhachHang join tbChiNhanh on tbKhachHang.MaCN=tbChiNhanh.MaCN
				 join tbHoaDon on tbHoaDon.MaKH=tbKhachHang.MaKH
				 join tbChiTietHoaDon on tbHoaDon.MaHD=tbChiTietHoaDon.MaHD
				 join tbGiaMon on tbChiTietHoaDon.MaMon=tbGiaMon.MaMon
Where SoLuong*GiaMon>250000
Group by TenCN
-- Thực thi Số lượng khách hàng có tổng giá trị hóa đơn trên 250000
EXEC sp_DemSLKHCoHDTren250000

--3. Xuất họ tên Nhân viên kèm tiền phụ cấp với tham số truyền vào là MaNV
Create proc sp_ThongTinNhanVien @MaNV nchar(6)
As
Select tbNhanVien.MaNV, HoNV+' '+TenNV as N'Họ và tên', PhuCap
From tbNhanVien join tbPhuCap on tbNhanVien.MaNV=tbPhuCap.MaNV
Where tbNhanVien.MaNV=@MaNV
--Thực thi với MaNV='NV0002'
EXEC sp_ThongTinNhanVien 'NV0002'

--4. Xuất thông tin hóa đơn bao gồm Tên khách hàng, Tên món, Ngày lập HD, Hạng thành viên với tham số truyền vào là MAKH
Create proc sp_ThongTinHoaDon @MaKH nchar(6)
As
Select tbKhachHang.MaKH, HoKh + ' ' + TenKH as N'Họ tên KH', TenMon, NgayLapHD, ThanhVien, SoLuong*GiaMon as N'Tổng giá trị hóa đơn'
From tbKhachHang join tbHoaDon on tbKhachHang.MaKH=tbHoaDon.MaKH
				 join tbChiTietHoaDon on TbHoaDon.MaHD=tbChiTietHoaDon.MaHD
				 join tbMenu on tbMenu.MaMon=tbChiTietHoaDon.MaMon
				 join tbGiaMon on tbMenu.MaMon=tbGiaMon.MaMon
Where tbHoaDon.MaKH=@MaKH
--Thực thi với Mã nhân viên 'KH0008'
EXEC sp_ThongTinHoaDon 'KH0008'

--5. Xem KH có đủ điểm lên hạng Vàng không. Với tham số truyền vào là MaKH
Create proc sp_KhachDuDiemVang @MaKH nchar(6)
As
Declare @TongDiem float
Select @TongDiem=TongDiem
From tbKhachHang
Where @MaKH=MaKH

If @TongDiem>=5000
	Print N'Thành viên đã đủ điểm lên hạng vàng'
Else
	Print N'Thành viên thiếu ' + Convert(varchar, 5000-@TongDiem) + N' để lên Vàng'
-- Thực thi 1: KH0001
EXEC sp_KhachDuDiemVang 'KH0001'
-- Thực thi 2: KH0015
EXEC sp_KhachDuDiemVang 'KH0015'

--6. Xem số lần sản phẩm xuất hiện trong hóa đơn với tham số truyền vào là Tên món
Create proc sp_SoLuongSanPham @TenMon nvarchar(100)
As
Select tbMenu.MaMon, TenMon, sum(SoLuong) as 'Số lượng'
From tbMenu join tbChiTietHoaDon on tbMenu.MaMon=tbChiTietHoaDon.MaMon
Where @TenMon=TenMon
Group by tbMenu.MaMon, TenMon
--Thực thi với tên món 'Green Tea Cream Frappuccino'
EXEC sp_SoLuongSanPham 'Green Tea Cream Frappuccino'

--7. Lưu trữ các khách hàng có tổng trị giá đơn hàng từ 200.000 trở lên vào bảng tbKhachVip
Create proc Pr_KhachVip
as
Begin
if not exists (select * from sys.objects where object_id=OBJECT_ID('dbo.tbKhachVip'))
Begin
	Create table tbKhachVip
	(
		MaKHVip nchar (6),
		HoTenKHVip nvarchar(100),
		TenKHVip nvarchar(50),
		Trigia float,
		ThanhVien nvarchar(50)
	)
End
	Insert into tbKhachVip
	Select tbKhachHang.MaKH, HoKH, TenKH, sum(SoLuong*GiaMon), ThanhVien
	From tbHoaDon, tbKhachHang, tbChiTietHoaDon, tbGiaMon
	where tbKhachHang.MaKH=tbHoaDon.MaKH 
	and tbHoaDon.MaHD=tbChiTietHoaDon.MaHD 
	and tbChiTietHoaDon.MaMon=tbGiaMon.MaMon
	and tbKhachHang.MaKH not in (Select MaKHVip from tbKhachVip) 
	group by tbKhachHang.MaKH, HoKH, TenKh, ThanhVien
	Having sum(SoLuong*GiaMon)>=500000
End
-- Thực thi
EXEC Pr_KhachVip
Select * from tbKhachVip

-------TRIGGER
--1. Cập nhật giá món phải lớn hơn 0
Create trigger trig_GiaMon
On tbGiaMon
For update
As
	Declare @GiaMon float
	Select @GiaMon = GiaMon from inserted
	If (@GiaMon<0)
	Begin
	Print N'Giá món phải lớn hơn 0'
	rollback
	End
--Trường hợp sai
Update tbGiaMon
Set GiaMon=-10000
Where MaSoGia='GM0001'
--Trường hợp đúng
Update tbGiaMon
Set GiaMon=95000
Where MaSoGia='GM0001'
-- Kiểm tra trường hợp đúng
Select * from tbGiaMon
Where MaSoGia='GM0001'

--2. Thêm thông tin nhân viên với yêu cầu đủ 18 tuổi trong bảng tbNhanVien
Create Trigger trig_iNhanVienDu18Tuoi
On tbNhanVien
For insert
As 
Begin
	Declare @Tuoi int
	Select @Tuoi=FLOOR(DATEDIFF(DAY,NgaySinhNV,Getdate())/365.25) from tbNhanVien
	If (@Tuoi is null) or ((select count(*) from tbNhanVien where @Tuoi>=18)=0)
	Begin
		Print N'Nhân viên chưa đủ 18 tuổi'
		rollback
	End
End

--Trường hợp sai
Insert into tbNhanVien
Values ('NV0041','CN0002',N'Vũ Thị',N'Trường',Convert(date,'2004/04/16'),N'Nữ','46121513',N'40 Lê Văn Việt,P.Hiệp Phú,Quận 3,TP.HCM','0123393993','vuthitruong13@gmail.com')
--Trường hợp đúng
Insert into tbNhanVien
Values ('NV0041','CN0002',N'Vũ Thị',N'Trường',Convert(date,'2004/04/07'),N'Nữ','46121513',N'40 Lê Văn Việt,P.Hiệp Phú,Quận 3,TP.HCM','0123393993','vuthitruong13@gmail.com')
--Truy vấn
Select * From tbNhanVien
Where MaNV='NV0041'
------USER
--1. Tạo user cho cấp quản lý
Create Login QuanLy with password ='12345', default_database = QuanLyStarbucks
Create User QuanLy for login QuanLy
--Cấp quyền
Grant Select, Insert, Update, Delete on tbNhanVien to QuanLy
Grant Select, Insert, Update, Delete on tbKhachHang to QuanLy
Grant Select, Insert, Update, Delete on tbHoaDon to QuanLy
Grant Select, Insert, Update, Delete on tbChiTietHoaDon to QuanLy
Grant Select, Insert, Update, Delete on tbGiaMon to QuanLy
Grant Select, Insert, Update, Delete on tbPhuCap to QuanLy
Grant Select, Insert, Update, Delete on tbMenu to QuanLy

 --2. Tạo user cho cấp nhân viên
Create Login NhanVien with password ='12345', default_database = QuanLyStarbucks
Create User NhanVien for login NhanVien
--Cấp quyền
Grant Select, Insert, Update, Delete on tbKhachHang to NhanVien
Grant Select, Insert, Update, Delete on tbHoaDon to NhanVien
Grant Select, Insert, Update, Delete on tbChiTietHoaDon to NhanVien
Grant Select on tbGiaMon to NhanVien
Grant Select on tbMenu to NhanVien
Grant Select on tbPhuCap to NhanVien

--Tạo store procedure để kết nối Visual Studio tạo report xem hạng khách hàng thành viên đầu vào là hạng thành viên 
CREATE PROC sp_hangkhachhang @ThanhVien NCHAR(50)
AS
SELECT MaKH, HoKH, TenKH, GioiTinhKH, NgaySinhKH, SDTKH, EmailKH, DiaChiKH, TongDiem, ThanhVien
FROM tbKhachHang
WHERE ThanhVien =@ThanhVien
--Thực Thi
EXEC sp_hangkhachhang N'TV Kim Cương'


--Tạo store procedure để kết nối Visual Studio tạo report xem thông tin nhân viên nhận được phụ cấp đầu vào là Mã Nhân Viên 
Create proc sp_PhuCapNhanVien @MaNV nchar(6)
As
Select nv.MaNV, HoNV, TenNV, GioiTinhNV, NgaySinhNV, PhuCap
From tbNhanVien nv join tbPhuCap pc on nv.MaNV=pc.MaNV
Where nv.MaNV=@MaNV
--Thực thi với MaNV='NV0002'
EXEC sp_PhuCapNhanVien 'NV0002'
