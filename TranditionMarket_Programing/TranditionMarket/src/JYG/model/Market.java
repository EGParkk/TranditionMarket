package JYG.model;

public class Market {
	private String marketName;
	private String marketType;
	private String marketAddress;
	private String marketPeriod;
	private int marketNo;


	public String getMarketName() {
		return marketName;
	}

	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}

	public String getMarketType() {
		return marketType;
	}

	public void setMarketType(String marketType) {
		this.marketType = marketType;
	}

	public String getMarketAddress() {
		return marketAddress;
	}

	public void setMarketAddress(String marketAddress) {
		this.marketAddress = marketAddress;
	}

	public String getMarketPeriod() {
		return marketPeriod;
	}

	public void setMarketPeriod(String marketPeriod) {
		this.marketPeriod = marketPeriod;
	}

	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}

	public Market() {

	}

	public Market(int mno) {
		this.marketNo = mno;
	}
}
