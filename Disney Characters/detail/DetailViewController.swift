import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var characterImageView: UIImageView!    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var shortFilmsLabel: UILabel!
    @IBOutlet weak var tvShowsLabel: UILabel!
    @IBOutlet weak var videoGamesLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImage()
        configLabels()
    }
    
    private func configImage()
    {
        characterImageView.layer.cornerRadius = 8
        characterImageView.layer.masksToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.backgroundColor = .gray
        characterImageView.download(from: character.imageUrl ?? "")
    }
    
    private func configLabels()
    {
        nameLabel.text = character.name
        filmsLabel.text = character.films.joined(separator: ",\n").isEmpty ? "This character don't have any films." : character.films.joined(separator: ",\n")
        shortFilmsLabel.text = character.shortFilms.joined(separator: ",\n").isEmpty ? "This character don't have any short films." : character.shortFilms.joined(separator: ",\n")
        tvShowsLabel.text = character.tvShows.joined(separator: ",\n").isEmpty ? "This character don't have any TV shows." : character.tvShows.joined(separator: ",\n")
        videoGamesLabel.text = character.videoGames.joined(separator: ",\n").isEmpty ? "This character don't have any video games." : character.videoGames.joined(separator: ",\n")
    }
}
