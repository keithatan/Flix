//
//  Movie.swift
//  Flix
//
//  Created by Keith Tan on 1/14/19.
//  Copyright © 2019 keithatan. All rights reserved.
//

import Foundation

class Movie {
    var vote_count: Int
    var id: Int
    var video: Bool
    var vote_average: Double
    var title: String
    var popularity: Double
    var poster_path: String
    var original_language: String
    var original_title: String
    var genre_ids: [Int]
    var backdrop_path: String
    var adult: Bool
    var overview: String
    var release_date:String
    
    init(vote_count: Int, id: Int, video: Bool, vote_average: Double, title: String, popularity: Double, poster_path: String, original_language: String, original_title: String, genre_ids: [Int], backdrop_path: String, adult: Bool, overview: String, release_date:String) {
        self.vote_count = vote_count
        self.id = id
        self.video = video
        self.vote_average = vote_average
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_language = original_language
        self.original_title = original_title
        self.genre_ids = genre_ids
        self.backdrop_path = backdrop_path
        self.adult = adult
        self.overview = overview
        self.release_date = release_date
    }
    
    func getVoteCount() -> Int {
        return self.vote_count
    }
    func setVoteCount(vc: Int) {
        self.vote_count = vc
    }
    
    func getID() -> Int {
        return self.id
    }
    
    func setID(newID: Int){
        self.id = newID;
    }
    
    func getVideo() -> Bool{
        return self.video
    }
    
    func setVideo(videoVal: Bool){
        self.video = videoVal
    }
    
    func getVoteAverage() -> Double{
        return self.vote_average
    }
    
    func setVoteAverage(avg: Double){
        self.vote_average = avg
    }
    
    func getTitle() -> String{
        return self.title
    }
    
    func setTitle(tit: String){
        self.title = tit
    }
    
    func getPopularity() -> Double{
        return self.popularity
    }
    
    func setPopularity(pop:Double){
        self.popularity = pop
    }
    
    func getPosterPath() -> String{
        return self.poster_path
    }
    
    func setPosterPath(path: String){
        self.poster_path = path
    }
    
    func getOriginalLang() -> String{
        return self.original_language
    }
    
    func setOriginalLang(lang:String){
        self.original_language = lang
    }
    
    func getOriginalTitle() -> String{
        return self.original_title
    }
    
    func setOriginalTitle(title:String){
        self.original_title = title
    }
    
    func getGenreID() -> [Int]{
        return self.genre_ids
    }
    
    // Probably should add a method to either add a genre ID or just a set method
    
    func getBackdropPath() -> String{
        return self.backdrop_path
    }
    
    func setBackdropPath(path:String){
        self.backdrop_path = path
    }
    
    func getIsAdult() -> Bool{
        return self.adult
    }
    
    func setIsAdult(adult:Bool){
        self.adult = adult
    }
    
    func getOverview() ->String{
        return self.overview
    }
    
    func setOverview(ov:String){
        self.overview = ov
    }
    
    func getReleaseDate() -> String{
        return self.release_date
    }
    
    func setReleaseDate(date:String){
        self.release_date = date
    }
    
    
    
    
    
}
