//
//  DataCell.swift
//  Pryaniky
//
//  Created by Mikhail Danilov on 29.09.2020.
//

import UIKit
import SDWebImage

class DataCell: UITableViewCell {

    
    @IBOutlet weak var imageViewData: UIImageView!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var segmentData: UISegmentedControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewData.isHidden = true
        labelData.isHidden = true
        segmentData.isHidden = true
        
    }
    
    func setupLabel(dataClass: DataClass){
        labelData.isHidden = false
        labelData.text = dataClass.text
    }
    
    func setupImage(dataClass: DataClass){
        imageViewData.isHidden = false
        labelData.isHidden = false
        labelData.text = dataClass.text
        if let url = dataClass.url{
            imageViewData.sd_setImage(with: URL(string: url))
        }
    }
    
    func setupAudio(dataClass: DataClass){
        imageViewData.isHidden = false
        labelData.isHidden = false
        labelData.text = dataClass.mediaUrl
        if let url = dataClass.coverUrl{
            imageViewData.sd_setImage(with: URL(string: url))
        }
    }
    
    func setupVideo(dataClass: DataClass){
        imageViewData.isHidden = false
        labelData.isHidden = false
        labelData.text = dataClass.mediaUrl
        if let url = dataClass.coverUrl{
            imageViewData.sd_setImage(with: URL(string: url))
        }
    }
    
    func setupSegment(dataClass: DataClass){
        segmentData.isHidden = false
        if let variants = dataClass.variants, let selectedIndex = variants.firstIndex(where: {$0.id == dataClass.selectedID }) {
            segmentData.selectedSegmentIndex = selectedIndex
            variants.enumerated().forEach{ (index, variant) in
            
                segmentData.setTitle(variant.text, forSegmentAt: index)
            }
        }
    }
}
