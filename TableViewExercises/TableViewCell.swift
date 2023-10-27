//
//  TableViewCell.swift
//  TableViewExercises
//
//  Created by Mahmut Senbek on 6.10.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    let label = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configureUI()
    }
   
    func configureUI() {
        addSubview(label)
        label.font = .systemFont(ofSize: 14)
        
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    

}
