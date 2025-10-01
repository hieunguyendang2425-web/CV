package model;

public class Skill {
    private String title;
    private String description;
    private String styleClass;

    public Skill(String title, String description, String styleClass) {
        this.title = title;
        this.description = description;
        this.styleClass = styleClass;
    }

    public String getTitle() {
        return title;
    }
    public String getDescription() {
        return description;
    }
    public String getStyleClass() {
        return styleClass;
    }
}
