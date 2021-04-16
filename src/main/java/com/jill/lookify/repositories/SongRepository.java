package com.jill.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.jill.lookify.models.Song;

public interface SongRepository extends CrudRepository<Song, Long> {
	// this method retrieves all the books from the database
	List<Song> findAll();

	// this method finds songs with artists containing the search string
	List<Song> findByArtistContaining(String search);
	//IgnoreCase?
	
	// this method should get 10 songs with the highest rating?
	List<Song> findTop10ByOrderByRatingDesc();
	//Pageable
}
