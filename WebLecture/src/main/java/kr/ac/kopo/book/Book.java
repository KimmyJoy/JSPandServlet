package kr.ac.kopo.book;

public class Book {
    private String title;

    public Book() {
        // 기본 생성자
    }

    public Book(String title) {
        this.title = title;
    }

    public String title() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
