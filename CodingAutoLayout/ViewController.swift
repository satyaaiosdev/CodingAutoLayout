//
//  ViewController.swift
//  SampleApi
//
//  Created by Satyaa Akana on 23/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tblView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI(){
        self.view.addSubview(tblView)
        
        NSLayoutConstraint.activate([
            tblView.topAnchor.constraint(equalTo: view.topAnchor),
            tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell
        cell?.setup()
        return cell!
    }
}


class TableViewCell: UITableViewCell{
    static let identifier = "cell"
    
    private lazy var content: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .white
        return img
    }()
    
    private lazy var stack: UIStackView = {
        let stk = UIStackView()
        stk.translatesAutoresizingMaskIntoConstraints = false
        stk.spacing = 8
        stk.axis = .vertical
        return stk
    }()
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 18, weight: .black)
        return lbl
    }()
    
    private lazy var subTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 16, weight: .medium)
        return lbl
    }()
    
    private lazy var addBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    override func layoutSubviews() {
        self.content.backgroundColor = .gray
        self.content.layer.cornerRadius = 8
        self.content.clipsToBounds = true
    }
    
    func setup(){
        self.contentView.addSubview(content)
        self.content.addSubview(stack)
        self.stack.addArrangedSubview(titleLbl)
        self.stack.addArrangedSubview(subTitleLbl)
        self.content.addSubview(image)
        image.image = UIImage(systemName: "star.fill")
        self.content.addSubview(addBtn)
        addBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        titleLbl.text = "Swift"
        subTitleLbl.text = "It is multiparadigm and protocol oriented programming language..."
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0),
            image.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 6),
            image.centerYAnchor.constraint(equalTo: content.centerYAnchor),
            
            stack.topAnchor.constraint(equalTo: content.topAnchor, constant: 6),
            stack.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -6),
            stack.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 6),
            stack.trailingAnchor.constraint(equalTo: addBtn.leadingAnchor, constant: -6),
            
            addBtn.widthAnchor.constraint(equalToConstant: 40),
            addBtn.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0),
            addBtn.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -12),
            addBtn.centerYAnchor.constraint(equalTo: content.centerYAnchor),
        ])
    }
    
}
