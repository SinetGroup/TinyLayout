//
//  TinyLayout.swift
//  TinyLayout
//
//  Created by LookForward on 30.07.2018.
//

import UIKit

/// UIEdgeInsets custom initialazers
extension UIEdgeInsets {
    public init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    public init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    public init() {
        self.init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

/// Anchors aliases
extension UIView {
    public var top: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.topAnchor } else { return self.topAnchor }
    }
    
    public var left: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.leftAnchor } else { return self.leftAnchor }
    }
    
    public var leading: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.leadingAnchor } else { return self.leadingAnchor }
    }
    
    public var bottom: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.bottomAnchor } else { return self.bottomAnchor }
    }
    
    public var right: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.rightAnchor } else { return self.rightAnchor }
    }
    
    public var trailing: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.trailingAnchor } else { return self.trailingAnchor }
    }
    
    public var centerX: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.centerXAnchor } else { return self.centerXAnchor }
    }
    
    public var centerY: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.centerYAnchor } else { return self.centerYAnchor }
    }
    
    public var width: NSLayoutDimension {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.widthAnchor } else { return self.widthAnchor }
    }
    
    public var height: NSLayoutDimension {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.heightAnchor } else { return self.heightAnchor }
    }
    
    public var firstBaseline: NSLayoutYAxisAnchor {
        return self.firstBaselineAnchor
    }
    
    public var lastBaseline: NSLayoutYAxisAnchor {
        return self.lastBaselineAnchor
    }
}

public enum UIConstraintRelation {
    case equal, less, greater
}

/// TinyLayout methods
extension UIView {
    
    private func disableTranslatesAutoresizingMaskIntoConstraints() {
        if self.translatesAutoresizingMaskIntoConstraints {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public func constraint(for attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return self.constraints.first { $0.firstAttribute == attribute }
    }
    
    @discardableResult
    public func addTo(_ parentView: UIView) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        parentView.addSubview(self)
        return self
    }
    
    @discardableResult
    public func height(equalTo constant: CGFloat = 0.0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.height.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func height(to anchor: NSLayoutDimension, relation: UIConstraintRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.height.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(equalTo constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.width.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(to anchor: NSLayoutDimension, relation: UIConstraintRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.width.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func top(to anchor: NSLayoutYAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.top.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func bottom(to anchor: NSLayoutYAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.bottom.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    
    @discardableResult
    public func left(to anchor: NSLayoutXAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.left.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func right(to anchor: NSLayoutXAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.right.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerX(to anchor: NSLayoutXAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.centerX.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerY(to anchor: NSLayoutYAxisAnchor, relation: UIConstraintRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.centerY.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    /**
     - Parameter parent: Parent view.
     - Parameter insets: Insets.
     
     - Returns: self.
     */
    @discardableResult
    public func fill(_ parent: UIView, withInsets insets: UIEdgeInsets = UIEdgeInsets()) -> UIView {
        return self
            .top(to: parent.top, constant: insets.top)
            .bottom(to: parent.bottom, constant: insets.bottom)
            .left(to: parent.left, constant: insets.left)
            .right(to: parent.right, constant: insets.right)
    }
    
    /**
     - Parameter width: constant width.
     - Parameter height: constant height.
     
     - Returns: self.
     */
    @discardableResult
    public func size(width: CGFloat, height: CGFloat) -> UIView {
        return self.width(equalTo: width).height(equalTo: height)
    }
    
    /**
     - Parameter constant: constant width and height.
     
     - Returns: self.
     */
    @discardableResult
    public func size(equalTo constant: CGFloat) -> UIView {
        return self.size(width: constant, height: constant)
    }
    
    /**
     - Parameter view: view.
     - Parameter constant: constant.
     
     - Returns: self.
     */
    @discardableResult
    public func size(to view: UIView, constant: CGFloat = 0.0) -> UIView {
        return self.width(to: view.width, constant: constant).height(to: view.height, constant: constant)
    }
    
    /**
     - Parameter parent: Parent view.
     
     - Returns: self.
     */
    @discardableResult
    public func center(in parent: UIView) -> UIView {
        return self.centerX(to: parent.centerX).centerY(to: parent.centerY)
    }
}

/// Borders and shadows
extension UIView {
    
    func border(width: CGFloat, radius: CGFloat, color: UIColor = .gray) {
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
    
    func shadow(opacity: Float, radius: CGFloat, offset: CGSize, color: UIColor = .black) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color.cgColor
    }
}
