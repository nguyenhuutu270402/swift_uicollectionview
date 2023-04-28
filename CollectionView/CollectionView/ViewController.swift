import UIKit

class CustomCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let testImage: UIImageView = {
        let testimage = UIImageView()
        testimage.image = UIImage(named: "meo")
        testimage.translatesAutoresizingMaskIntoConstraints = false
        testimage.contentMode = .scaleAspectFill
        return testimage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(testImage)
        NSLayoutConstraint.activate([
                testImage.topAnchor.constraint(equalTo: topAnchor),
                testImage.leadingAnchor.constraint(equalTo: leadingAnchor),
                testImage.trailingAnchor.constraint(equalTo: trailingAnchor),
                testImage.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                label.heightAnchor.constraint(equalToConstant: 50),
            ])

        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    func configure(with model: String, color: UIColor) {
        label.text = model
        label.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let models = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10"]
    let colors: [UIColor] = [.red, .green, .blue, .yellow, .purple, .cyan, .magenta, .orange, .brown, .gray]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let model = models[indexPath.item]
        let color = colors[indexPath.item % colors.count]
        cell.configure(with: model, color: color)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 20 // leave 10 points of margin on each side
        let height: CGFloat = 300
        return CGSize(width: width, height: height)
    }
}

