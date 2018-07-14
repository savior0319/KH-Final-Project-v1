package spring.kh.diet.model.vo;

public class BMIVO {

	private String age, gender, height, weight, bmi;

	public BMIVO() {
	}

	public BMIVO(String age, String gender, String height, String weight, String bmi) {
		super();
		this.age = age;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.bmi = bmi;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}

}
