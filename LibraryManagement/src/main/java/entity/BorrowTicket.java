package entity;

public class BorrowTicket {
	private int id;
    private String readerName; // Lấy từ bảng readers
    private String bookTitle;  // Lấy từ bảng books
    private String borrowDate;
    private String dueDate;
    private String status;
    
 // Thêm các trường này nếu chưa có
    private int readerId;
    private String bookIds;

    // Constructor mới dành riêng cho chức năng Sửa
    public BorrowTicket(int id, int readerId, String dueDate, String bookIds) {
        this.id = id;
        this.readerId = readerId;
        this.dueDate = dueDate;
        this.bookIds = bookIds;
    }

    // Đừng quên tạo thêm Getter/Setter cho readerId và bookIds 
    // để trang JSP có thể gọi được ${ticket.readerId} và ${ticket.bookIds}

    public BorrowTicket(int id, String readerName, String bookTitle, String borrowDate, String dueDate, String status) {
        this.id = id;
        this.readerName = readerName;
        this.bookTitle = bookTitle;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.status = status;
    }

	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}

	public String getBookIds() {
		return bookIds;
	}

	public void setBookIds(String bookIds) {
		this.bookIds = bookIds;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReaderName() {
		return readerName;
	}

	public void setReaderName(String readerName) {
		this.readerName = readerName;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBorrowDate() {
		return borrowDate;
	}

	public void setBorrowDate(String borrowDate) {
		this.borrowDate = borrowDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
