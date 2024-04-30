//package src.java.entity;
package entity;

import java.util.*;

public class Review {
    private String reviewId;
    private String prodId;
    private String userId;
    private int rating; // 1-5 (star)
    private String comment;
    private Date date;

    public Review() {

    }

    public Review(String reviewId, String prodId, String userId, int rating, String comment, Date date) {
        this.reviewId = reviewId;
        this.prodId = prodId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.date = date;
    }

    // Getter methods
    public String getReviewId() {
        return reviewId;
    }

    public String getProdId() {
        return prodId;
    }

    public String getUserId() {
        return userId;
    }

    public int getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public Date getDate() {
        return date;
    }

    // Setter methods
    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
