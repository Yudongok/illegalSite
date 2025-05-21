package mvc.model;

public class LoginDTO {
	private String id;
	private String name;
	private String recommenderCode;
	private String passwd;
	private int balance;

	public LoginDTO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRecommenderCode() {
		return recommenderCode;
	}

	public void setRecommenderCode(String recommenderCode) {
		this.recommenderCode = recommenderCode;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	

}
