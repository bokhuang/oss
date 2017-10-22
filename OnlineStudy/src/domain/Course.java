package domain;

public class Course {
    private Integer course_id;

    private String course_name;


    public Integer getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Integer course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name == null ? null : course_name.trim();
    }
}