import UIKit;

class CharacterCell : UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addViewInHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setup(character: Character){
        nameLabel.text = character.name
        detailLabel.text = setupDetailLabel(character)
        characterImageView.download(from: character.imageUrl ?? "")
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
    private func addViewInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(characterImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(detailLabel)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            characterImageView.widthAnchor.constraint(equalToConstant: 90),
            characterImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupDetailLabel(_ character: Character) -> String
    {
        if (character.films.count > 0)
        {
            return "Films: " + character.films.joined(separator: ", ")
        }
        
        if (character.shortFilms.count > 0)
        {
            return "Short Films: " + character.shortFilms.joined(separator: ", ")
        }
        
        if (character.tvShows.count > 0)
        {
            return "TV Shows: " + character.tvShows.joined(separator: ", ")
        }
        
        if (character.videoGames.count > 0)
        {
            return "Video Games: " + character.videoGames.joined(separator: ", ")
        }
        
        return "This character don't have any content"
    }
}
