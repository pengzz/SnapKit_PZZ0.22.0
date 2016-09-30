//
//  UIView+Swizzling.swift
//  PMGIos
//
//  Created by pengzhizhong on 16/9/23.
//  Copyright © 2016年 chinaDataCom. All rights reserved.
//

import Foundation

import UIKit
import SnapKit_ZZ

public extension UIView {
    //原3.0
    //public var snp: ConstraintViewDSL {
    //    return ConstraintViewDSL(view: self)
    //}
    
    //@available(*, deprecated: 3.0, message:"Use update(offset: ConstraintOffsetTarget) instead.")
    public var snp: ZZInnerStruct {
        //return self
        //dlog()
//        print("\(#file),(#function)[\(#line)]:snp...")
        print("zz:snp...")
        return ZZInnerStruct(view: self)
    }
    
    public var zz_snp: ZZInnerStruct {
        //return self
        //dlog()
//        print("\(#file),(#function)[\(#line)]:snp...")
        print("zz:snp...")
        return ZZInnerStruct(view: self)
    }
    
//    func dlog(_ message: String = "", file: String = #file, function: String = #function, lineNum: Int = #line) {
//        #if DEBUG
//            let file2 = file as NSString
//            //print("FILE: \(file2.pathComponents.last!),FUNC: \(function), LINE: \(lineNum) MESSAGE: \(message)")
//            //print("\(function)[\(lineNum)]:\(message)")
//            print("\(file2.pathComponents.last!),\(function)[\(lineNum)]:\(message)")
//        #else
//            // do nothing
//        #endif
//    }
    
    
    ///一个辅助结构体
    public struct ZZInnerStruct {
        internal let view: View
        
        internal init(view: View) {
            self.view = view
            
        }
        
        /// 一些约束设置方法
        @discardableResult
        public func prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
            //return ConstraintMaker.prepareConstraints(view: self.view, closure: closure)//3.0
            //return ConstraintMaker.prepareConstraints(view: self, file: file, line: line, closure: closure)//0.22.0
            return self.view.zz_snp_prepareConstraints(closure:closure)
        }
        public func makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
            //ConstraintMaker.makeConstraints(view: self.view, closure: closure)//3.0
            self.view.zz_snp_makeConstraints(closure:closure)
        }
        public func remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
            //ConstraintMaker.remakeConstraints(view: self.view, closure: closure)//3.0
            self.view.zz_snp_remakeConstraints(closure:closure)
        }
        public func updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
            //ConstraintMaker.updateConstraints(view: self.view, closure: closure)
            self.view.zz_snp_updateConstraints(closure:closure)
        }
        public func removeConstraints() {
            //ConstraintMaker.removeConstraints(view: self.view)
            self.view.zz_snp_removeConstraints()
        }
        
        
        
        /// left edge
        public var left: ConstraintItem {//类型要与这个(snp_left: ConstraintItem)一致
            //Xreturn ConstraintItem(target: self.target, attributes: ConstraintAttributes.left)//3.0
            //Xreturn ConstraintItem(object: self, attributes: ConstraintAttributes.Left) }//0.22.0 对view
            //return ConstraintItem(object: self.view, attributes: ConstraintAttributes.Left) }//0.22.0
            return self.view.snp_left
        }
        /// top edge
        public var top: ConstraintItem { return self.view.snp_top }
        /// right edge
        public var right: ConstraintItem { return self.view.snp_right }
        /// bottom edge
        public var bottom: ConstraintItem { return self.view.snp_bottom }
        /// leading edge
        public var leading: ConstraintItem { return self.view.snp_leading }
        /// trailing edge
        public var trailing: ConstraintItem { return self.view.snp_trailing }
        /// width dimension
        public var width: ConstraintItem { return self.view.snp_width }
        /// height dimension
        public var height: ConstraintItem { return self.view.snp_height }
        /// centerX position
        public var centerX: ConstraintItem { return self.view.snp_centerX }
        /// centerY position
        public var centerY: ConstraintItem { return self.view.snp_centerY }
        /// baseline position
        public var baseline: ConstraintItem { return self.view.snp_baseline }
        
        
        
        /// 一些约束优先级值
        public var contentHuggingHorizontalPriority: Float {
            get {
                return self.view.contentHuggingPriority(for: .horizontal)
            }
            set {
                self.view.setContentHuggingPriority(newValue, for: .horizontal)
            }
        }
        public var contentHuggingVerticalPriority: Float {
            get {
                return self.view.contentHuggingPriority(for: .vertical)
            }
            set {
                self.view.setContentHuggingPriority(newValue, for: .vertical)
            }
        }
        public var contentCompressionResistanceHorizontalPriority: Float {
            get {
                return self.view.contentCompressionResistancePriority(for: .horizontal)
            }
            set {
                self.view.setContentHuggingPriority(newValue, for: .horizontal)
            }
        }
        public var contentCompressionResistanceVerticalPriority: Float {
            get {
                return self.view.contentCompressionResistancePriority(for: .vertical)
            }
            set {
                self.view.setContentCompressionResistancePriority(newValue, for: .vertical)
            }
        }
    }
    
}










/// 以下 下面这个无用
//下面这个是从3.0中直接取出的类
//public struct ConstraintViewDSL: ConstraintAttributesDSL {
//    
//    @discardableResult
//    public func prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
//        return ConstraintMaker.prepareConstraints(view: self.view, closure: closure)
//    }
//    
//    public func makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
//        ConstraintMaker.makeConstraints(view: self.view, closure: closure)
//    }
//    
//    public func remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
//        ConstraintMaker.remakeConstraints(view: self.view, closure: closure)
//    }
//    
//    public func updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
//        ConstraintMaker.updateConstraints(view: self.view, closure: closure)
//    }
//    
//    public func removeConstraints() {
//        ConstraintMaker.removeConstraints(view: self.view)
//    }
//    
//    
//    
//    public var contentHuggingHorizontalPriority: Float {
//        get {
//            return self.view.contentHuggingPriority(for: .horizontal)
//        }
//        set {
//            self.view.setContentHuggingPriority(newValue, for: .horizontal)
//        }
//    }
//    
//    public var contentHuggingVerticalPriority: Float {
//        get {
//            return self.view.contentHuggingPriority(for: .vertical)
//        }
//        set {
//            self.view.setContentHuggingPriority(newValue, for: .vertical)
//        }
//    }
//    
//    public var contentCompressionResistanceHorizontalPriority: Float {
//        get {
//            return self.view.contentCompressionResistancePriority(for: .horizontal)
//        }
//        set {
//            self.view.setContentHuggingPriority(newValue, for: .horizontal)
//        }
//    }
//    
//    public var contentCompressionResistanceVerticalPriority: Float {
//        get {
//            return self.view.contentCompressionResistancePriority(for: .vertical)
//        }
//        set {
//            self.view.setContentCompressionResistancePriority(newValue, for: .vertical)
//        }
//    }
//    
//    public var target: AnyObject? {
//        return self.view
//    }
//    
//    internal let view: ConstraintView
//    
//    internal init(view: ConstraintView) {
//        self.view = view
//        
//    }
//    
//    internal var layoutConstraints: [LayoutConstraint] {
//        return self.layoutConstraintsHashTable.allObjects
//    }
//    
//    internal func add(layoutConstraints: [LayoutConstraint]) {
//        let hashTable = self.layoutConstraintsHashTable
//        for layoutConstraint in layoutConstraints {
//            hashTable.add(layoutConstraint)
//        }
//    }
//    
//    internal func remove(layoutConstraints: [LayoutConstraint]) {
//        let hashTable = self.layoutConstraintsHashTable
//        for layoutConstraint in layoutConstraints {
//            hashTable.remove(layoutConstraint)
//        }
//    }
//    
//    private var layoutConstraintsHashTable: NSHashTable<LayoutConstraint> {
//        let layoutConstraints: NSHashTable<LayoutConstraint>
//        
//        if let existing = objc_getAssociatedObject(self.view, &layoutConstraintsKey) as? NSHashTable<LayoutConstraint> {
//            layoutConstraints = existing
//        } else {
//            layoutConstraints = NSHashTable<LayoutConstraint>.weakObjects()
//            objc_setAssociatedObject(self.view, &layoutConstraintsKey, layoutConstraints, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        return layoutConstraints
//        
//    }
//    
//}
//private var layoutConstraintsKey: UInt8 = 0



