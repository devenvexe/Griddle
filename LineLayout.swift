//
//  LineLayout.swift
//  Griddle
//
//  Created by Matt Durgavich on 9/27/14.
//  Copyright (c) 2014 WymzeeLabs. All rights reserved.
//

import UIKit

public class LineLayout : UIView {
    public enum Direction {
        case Horizontal
        case Vertical
    }
    

    public var direction:Direction = .Vertical
    
    override public func updateConstraints() {
        super.updateConstraints()
        if self.layoutDirty {
            self.removeConstraints(self.constraints())
            
            if self.subviews.count > 0 {
            
                // Build up our constraint strings
                var views: [String:AnyObject] = [:]
                var format = ""
                var last : String? = nil
                for v in self.subviews {
                    v.setTranslatesAutoresizingMaskIntoConstraints(false)
                    let name = "view\(v.hash)" // unique name for this view
                    if last != nil  {
                        format += "[" + name + "(==" + last! + ")]"
                    } else {
                        format += "[" + name + "]"
                    }
                    
                    views[name] = v
                    last = name
                }
            
                let vertical = self.direction == .Vertical
                
                
                let directionStr : String =  {
                    return self.direction == .Vertical ?  "V:|" : "H:|";
                }()
                
                let orthoStr : String = {
                    return self.direction == .Vertical ?  "H:|" : "V:|";
                }()
                

                let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat(directionStr + format + "|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views)
                self.addConstraints( vConstraints )
                
                for pair in views {
                    let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat(orthoStr + "[\(pair.0)]|", options: NSLayoutFormatOptions.allZeros, metrics: nil, views: views)
                    self.addConstraints( hConstraints )
                }
            }
            
            self.layoutDirty = false
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required public init(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    override public func addSubview(view: UIView) {
        super.addSubview(view)
        self.layoutDirty = true
    }
    
    public func layout() {
        self.layoutDirty = true
        self.updateConstraints()
    }
    
    
    private var layoutDirty:Bool = true

}


