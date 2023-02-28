# Starbucks-Customer-Management
## Giới thiệu
*Tên Đồ Án:* **Quản trị cơ sở dữ liệu Hệ thống khách hàng thân thiết tại StarBucks.**  
*Ngôn ngữ:* **SQL.**
## Phân tích thiết kế cơ sở dữ liệu
### *Mô hình dữ liệu mức quan niệm:*   ![image](https://user-images.githubusercontent.com/126310227/221373376-8e43296c-73ee-413f-a6d4-b70e69c219b3.png)  
### *Sơ đồ Diagram:*  ![image](https://user-images.githubusercontent.com/126310227/221373486-03a99e12-2e55-45a7-bf6e-ff084baee3ee.png)
## Ứng dụng
### *Phần ứng dụng của đồ án sẽ bao gồm như sau:*  
| Tên ứng dụng| Số câu thực hiện |
|------|-------|
| Synonym | 2 |
| Index| 2 |
| View | 4 | 
| Function | 2 | 
| Store Procedure | 6 | 
| Trigger | 2 | 
| User | 2 |
| Reporting Services | 2 |
### *Dưới đây sẽ là một số kết quả trong phần này*
#### Mẫu 1:
Tạo view vwSoNhanVienTrongChiNhanh với các thông tin: *Mã Chi Nhánh, Tên Chi Nhánh, Số Lượng Nhân Viên của các chi nhánh.*  
Và Ghi Chú lại:  
-	Nếu Số Lượng Nhân Viên < 2 thì ghi ***Thiếu Nhân Viên, cần bổ sung nhân lực.***  
-	Nếu 2 <= Số Lượng Nhân Viên < 5 thì ghi ***Đủ Nhân Viên.***  
-	Nếu Số Lượng Nhân Viên >= 5 thì ghi ***Thừa Nhân Viên, cần phân bố lại nhân sự.***  
**Kết quả**  
![image](https://user-images.githubusercontent.com/126310227/221744380-c831a789-1ef5-49b3-a81c-323cef1f3e7f.png)  
#### Mẫu 2:  
Tạo store procedure để xem thẻ khách hàng đủ điểm lên hạng Vàng không với tham số truyền vào là MaKH.  
**Kết quả**  
![image](https://user-images.githubusercontent.com/126310227/221744787-bf7f2c27-dd43-4b21-baa6-b8f056e72f98.png)  
#### Mẫu 3:  
Tạo trigger để khi cập nhật giá món thì giá món phải lớn hơn 0.    
**-	Kết quả trường hợp bị lỗi**  
![image](https://user-images.githubusercontent.com/126310227/221745022-73d06357-07cc-406d-b7ba-41715b4eea0b.png)  
**-	Kết quả trường hợp đúng**  
![image](https://user-images.githubusercontent.com/126310227/221745110-c9c1bb5d-946f-44d7-b88a-84dcf0a4473a.png)  
#### Mẫu 4:  
Tạo trigger để thêm thông tin nhân viên, yêu cầu nhân viên phải đủ 18 tuổi.  
**-	Kết quả trường hợp bị lỗi**  
![image](https://user-images.githubusercontent.com/126310227/221745262-a461d942-58fb-4887-85a4-b560b97b675c.png)  
**-	Kết quả trường hợp đúng**  
![image](https://user-images.githubusercontent.com/126310227/221745291-a37bcbc0-050b-4b62-a364-f60968207fd3.png)  
#### Mẫu 5:
Tạo Báo Cáo cho phép xem danh sách những khách hàng có cùng hạng dựa vào tên hạng thành viên.    
**Kết quả**  
![image](https://user-images.githubusercontent.com/126310227/221745493-34e95067-86ac-4be5-b488-f837c0701b62.png)  
![image](https://user-images.githubusercontent.com/126310227/221745510-61cd06af-cf3a-462b-b1fb-2fb692915dbb.png)  

## Kết luận
### Ưu điểm
-	Tạo mô hình thực thể cho thấy các dữ liệu có liên kết với nhau bởi các khóa chính làm cho thông tin được tìm nhanh chóng và đầy đủ.  
-	Tìm hiểu và theo dõi, phân tích thói quen mua sắm của khách hàng thông qua hoạt động của mô hình khách hàng thân thiết, từ đó sẽ xây dựng thành một phần mềm, và dễ dàng điều chỉnh chính sách phù hợp đối với từng khách hàng cũng như đưa ra nhiều chính sách chăm sóc phù hợp nhằm giữ chân họ.  
-	Tìm hiểu được cơ sở lý thuyết về hệ thống quản lý khách hàng thân thiết.  
-	Cài đặt hệ quản trị cơ sở dữ liệu SQL Server để quản lý về mảng khách hàng thân thiết của chuỗi cửa hàng cà phê Starbucks tại các chi nhánh ở Tp.HCM
-	Xây dựng được CSDL quản lý hoạt động kinh doanh của chuỗi cửa hàng Starbucks ở Tp.HCM (Tập trung về mảng khách hàng).  
-	Tạo được chức năng Reporting Services dùng để tạo các báo cáo ᴠà quản lý các báo cáo thông qua Visual Studio, ѕau khi báo cáo được tạo có thể trích хuất ra nhiều định dạng khác nhau như: Eхcel, PDF, CSV, XML, TIFF haу dưới dạng ᴠăn bản ᴡeb.  
-	Nghiên cứu về các hoạt động thực tế về việc quản lý khách hàng thân thiết một cách hiệu quả, thuận lợi trong việc quản lý thông tin khách hàng, tăng cơ hội bán hàng, tăng độ chính xác trong quản lý, tối ưu các nguồn lực trong thời đại công nghệ 4.0 song song với các cách thức quản lý truyền thống.  
### Nhược điểm
-	Kỹ năng thực hiện các mô hình thiết kế thông qua việc sử dụng các công cụ thiết kế trên máy tính chưa tốt, các mô hình có độ chuẩn xác chưa cao.  
-	Quản lí quá trình thực hiện đồ án còn thiếu hợp lý, cân đối cả về mặt nội dung lẫn thời gian.  
-	Một số chức năng của hệ thống chưa hoàn thiện.  
-	Hệ quản trị cơ sở chưa triệt để.  
-	Bảo mật dữ liệu chưa được tốt.  
  
