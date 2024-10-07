package com.vast.vo;

import java.time.LocalDate;
import java.util.Date;

public class Score {
	private int id;
	private String exam_name;
	private int score;
	private LocalDate date;
	
	public Score(int id, String exam_name, int score, LocalDate date) {
		this.id = id;
		this.exam_name = exam_name;
		this.score = score;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDates(LocalDate date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Score [id=" + id + ", exam_name=" + exam_name + ", score=" + score + ", date=" + date + "]";
	}
}
