package model;

import java.util.List;

public class Profile {
    private String name;
    private String email;
    private String phone;
    private String location;
    private String title;          // Ví dụ: "Java Developer"
    private String heroSummary;    // Mô tả ngắn ở trang chủ
    private String aboutSummary;   // Mô tả trong About section
    private List<String> aboutDetails; 
    private List<Skill> skills;

    public Profile(String name, String email, String phone, String location, String title,
                   String heroSummary, String aboutSummary, List<String> aboutDetails,
                   List<Skill> skills) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.location = location;
        this.title = title;
        this.heroSummary = heroSummary;
        this.aboutSummary = aboutSummary;
        this.aboutDetails = aboutDetails;
        this.skills = skills;
    }

    // Getter
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getLocation() { return location; }
    public String getTitle() { return title; }
    public String getHeroSummary() { return heroSummary; }
    public String getAboutSummary() { return aboutSummary; }
    public List<String> getAboutDetails() { return aboutDetails; }
    public List<Skill> getSkills() { return skills; }
}
