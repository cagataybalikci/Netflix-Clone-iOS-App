//
//  APICaller.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 4.05.2022.
//

import Foundation


struct Constants {
    static let API_KEY = "0521010d85f93dc56dac28cbb3e52ab2"
    static let BASE_URL = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToGetData
}


class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie],Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            }catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    func getTrendingTVs(completion: @escaping (Result<[TV],Error>) -> Void ){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    func getUpcomingMovie(completion: @escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch{
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    
    func getPopularMovies(completion: @escaping (Result<[Movie],Error>)-> Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else  {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, Error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

}

