struct Character : Decodable {
    let name: String?
    let imageUrl: String?
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
}
