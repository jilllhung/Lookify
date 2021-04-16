package com.jill.lookify.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
//sets this as a table in the database
@Table(name="songs")
public class Song {
	//fields
		@Id //primary key of entity
		@GeneratedValue(strategy = GenerationType.IDENTITY) //Identity column???
		private Long id;
		
		@NotNull
		@Size(min = 5)
		private String title;
		
		@Size(min = 5, message="Please give you artist a longer name!")
		private String artist;
		
		@Min(1)
		@Max(10)
		private Integer rating;
		
		// This will not allow the createdAt column to be updated after creation
	    @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date createdAt;
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;
	    
	    //runs the method(get dates) right before the object is created
	    @PrePersist 
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	    //runs a method when the object is modified
	    @PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }
	    
	    //Constructor overload
	    public Song() {
	    }
	    public Song(String title, String artist, Integer rating) {
	    	this.title = title;
	    	this.artist = artist;
	    	this.rating = rating;
	    }
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getArtist() {
			return artist;
		}
		public void setArtist(String artist) {
			this.artist = artist;
		}
		public Integer getRating() {
			return rating;
		}
		public void setRating(Integer rating) {
			this.rating = rating;
		}
		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
}
