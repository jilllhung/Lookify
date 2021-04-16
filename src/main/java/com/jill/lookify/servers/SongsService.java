package com.jill.lookify.servers;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jill.lookify.models.Song;
import com.jill.lookify.repositories.SongRepository;

@Service
public class SongsService {
	private final SongRepository songRepository;
	public SongsService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	//create or update a song
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	//retrieve all songs
	public List<Song> getAllSongs(){
		return songRepository.findAll();
	}
	//retrieve a song
	public Song getSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		return optionalSong.orElse(null);
	}
	//retrieve songs of a artist
	public List<Song> gestSongsByArtist(String artist){
		return songRepository.findByArtistContaining(artist);
	}
	//retrieve 10 songs with highest rating
	public List<Song> getTop10(){
		return songRepository.findTop10ByOrderByRatingDesc();
	}
	
	//delete a song
	public void deleteSong(Long id) {
    	try {
    		songRepository.deleteById(id);   		
    	}catch(Exception e) {
    		System.out.println("id does not exist, nothing was deleted.");
    	}
	}
}
