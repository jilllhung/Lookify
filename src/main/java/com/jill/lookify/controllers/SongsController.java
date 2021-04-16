package com.jill.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jill.lookify.models.Song;
import com.jill.lookify.servers.SongsService;

@Controller
public class SongsController {
	private final SongsService songsService;
	public SongsController(SongsService songsService) {
		this.songsService = songsService;
	}
	@RequestMapping("")
	public String index() {
		return "/lookify/index.jsp";
	}
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songsService.getAllSongs();
		model.addAttribute("songs", songs);
		return "/lookify/dashboard.jsp";
	}
	@RequestMapping("/songs/new")
	public String newSongPage(@ModelAttribute("song") Song song) {
		return "/lookify/newsong.jsp";
	}
	@RequestMapping("/songs/{id}")
	public String show(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
		Song song = songsService.getSong(id);
		if (song == null) {
			redirectAttributes.addFlashAttribute("noSong", "Song dose not exist!");
			return "redirect:/dashboard";
		}
		model.addAttribute("song", song);
		return "/lookify/show.jsp";
	}
	@RequestMapping("/search/{artist}")
	public String searchArtistPage(Model model, @PathVariable String artist) {
		List<Song> searchhits = songsService.gestSongsByArtist(artist);
		model.addAttribute("searchhits", searchhits);
		model.addAttribute("artist", artist);
		return "/lookify/searchartist.jsp";
	}
	
	@RequestMapping("/search/topTen")
	public String topTen(Model model) {
		List<Song> topTenSongs = songsService.getTop10();
		model.addAttribute("songs", topTenSongs);
		return "/lookify/topten.jsp";
	}
	
//	Create New Song
	@RequestMapping(value="/songs", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "/lookify/newsong.jsp";
		}
		songsService.createSong(song);
		return "redirect:/dashboard";
	}
//	Delete New Song
	@RequestMapping(value="/songs/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		Song song = songsService.getSong(id);
		if (song == null) {
			redirectAttributes.addFlashAttribute("noSong", "Song dose not exist! Nothing was deleted.");
			return "redirect:/dashboard";
		}
		songsService.deleteSong(id);
		return "redirect:/dashboard";
	}
// Search By Artist
	@RequestMapping(value="/search/artist", method=RequestMethod.POST)
	public String searchArtist(@RequestParam(value="artist") String artist) {
		return "redirect:/search/" + artist;
	}
	
}

