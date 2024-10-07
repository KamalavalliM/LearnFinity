package com.vast.vo;

public class Course {
	private String coursename;
	private int duration;
	
	public Course(String coursename, int duration) {
		super();
		this.coursename = coursename;
		this.duration = duration;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "Course [coursename=" + coursename + ", duration=" + duration + "]";
	}
}
