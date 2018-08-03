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
}

/// Anchors aliases
extension UIView {
    /// Safe iOS 11 compatible alias for topAnchor
    public var top: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.topAnchor } else { return self.topAnchor }
    }
    /// Safe iOS 11 compatible alias for leftAnchor
    public var left: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.leftAnchor } else { return self.leftAnchor }
    }
    /// Safe iOS 11 compatible alias for bottomAnchor
    public var bottom: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.bottomAnchor } else { return self.bottomAnchor }
    }
    /// Safe iOS 11 compatible alias for rightAnchor
    public var right: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.rightAnchor } else { return self.rightAnchor }
    }
    /// Safe iOS 11 compatible alias for leadingAnchor
    public var leading: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.leadingAnchor } else { return self.leadingAnchor }
    }
    /// Safe iOS 11 compatible alias for trailingAnchor
    public var trailing: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.trailingAnchor } else { return self.trailingAnchor }
    }
    /// Safe iOS 11 compatible alias for centerXAnchor
    public var centerX: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.centerXAnchor } else { return self.centerXAnchor }
    }
    /// Safe iOS 11 compatible alias for centerYAnchor
    public var centerY: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.centerYAnchor } else { return self.centerYAnchor }
    }
    /// Safe iOS 11 compatible alias for widthAnchor
    public var width: NSLayoutDimension {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.widthAnchor } else { return self.widthAnchor }
    }
    /// Safe iOS 11 compatible alias for heightAnchor
    public var height: NSLayoutDimension {
        if #available(iOS 11.0, *) { return self.safeAreaLayoutGuide.heightAnchor } else { return self.heightAnchor }
    }
    /// Alias for firstBaselineAnchor
    public var firstBaseline: NSLayoutYAxisAnchor {
        return self.firstBaselineAnchor
    }
    /// Alias for lastBaselineAnchor
    public var lastBaseline: NSLayoutYAxisAnchor {
        return self.lastBaselineAnchor
    }
}

/// TinyLayout methods
extension UIView {
    /*
    private static var tinyConstraints = [String: [NSLayoutConstraint]]()

    private var tinyConstraints: [NSLayoutConstraint] {
        get {
            return UIView.tinyConstraints[self.tinyConstraintAddress()] ?? []
        }
        set {
            UIView.tinyConstraints[self.tinyConstraintAddress()] = newValue
        }
    }

    private func tinyConstraintAddress() -> String {
        return "\(unsafeBitCast(self, to: Int.self))"
    }
    */
    
    private struct TinyLayout {
        static var constraints: [NSLayoutConstraint] = []
    }
    
    private var tinyConstraints: [NSLayoutConstraint] {
        get {
            return objc_getAssociatedObject(self, &TinyLayout.constraints) as? [NSLayoutConstraint] ?? []
        }
        set {
            return objc_setAssociatedObject(self, &TinyLayout.constraints, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private func disableTranslatesAutoresizingMaskIntoConstraints() {
        if self.translatesAutoresizingMaskIntoConstraints {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addTinyConstraint(_ constraint: NSLayoutConstraint) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        constraint.isActive = true
        self.tinyConstraints.append(constraint)
    }
    
    public func constraints() -> [NSLayoutConstraint] {
        return self.tinyConstraints
    }
    
    public func constraint(for attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        return self.tinyConstraints.first { $0.firstAttribute == attribute }
    }
    
    @discardableResult
    public func addTo(_ parentView: UIView) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        parentView.addSubview(self)
        return self
    }
    
    @discardableResult
    public func height(equalTo constant: CGFloat = 0.0, relation: NSLayoutRelation = .equal) -> UIView {
        self.addTinyConstraint(self.height.constraint(equalToConstant: constant))
        return self
    }
    
    @discardableResult
    public func height(to anchor: NSLayoutDimension, relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        self.addTinyConstraint(self.height.constraint(equalTo: anchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    @discardableResult
    public func width(equalTo constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.width.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func width(to anchor: NSLayoutDimension, relation: NSLayoutRelation = .equal, multiplier: CGFloat = 1.0, constant: CGFloat = 0.0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.width.constraint(equalTo: anchor, multiplier: multiplier, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func top(to anchor: NSLayoutYAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.top.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func bottom(to anchor: NSLayoutYAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.bottom.constraint(equalTo: anchor, constant: -constant).isActive = true
        return self
    }
    
    @discardableResult
    public func left(to anchor: NSLayoutXAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.left.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func right(to anchor: NSLayoutXAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.addTinyConstraint(self.right.constraint(equalTo: anchor, constant: -constant))
        return self
    }
    
    @discardableResult
    public func centerX(to anchor: NSLayoutXAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.centerX.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    public func centerY(to anchor: NSLayoutYAxisAnchor, relation: NSLayoutRelation = .equal, constant: CGFloat = 0) -> UIView {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.centerY.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    /**
     Fill parent view with ourselves
     
     - Parameter parent: Parent view to be filled.
     - Parameter insets: Insets from parent edges. Default insets are 0.
     
     - Returns: self
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
     
     - Returns: self
     */
    @discardableResult
    public func size(width: CGFloat, height: CGFloat) -> UIView {
        return self.width(equalTo: width).height(equalTo: height)
    }
    
    /**
     - Parameter constant: constant width and height.
     
     - Returns: self
     */
    @discardableResult
    public func size(equalTo constant: CGFloat) -> UIView {
        return self.size(width: constant, height: constant)
    }
    
    /**
     - Parameter view: view.
     - Parameter constant: constant.
     
     - Returns: self
     */
    @discardableResult
    public func size(to view: UIView, constant: CGFloat = 0.0) -> UIView {
        return self.width(to: view.width, constant: constant).height(to: view.height, constant: constant)
    }
    
    /**
     - Parameter parent: Parent view.
     
     - Returns: self
     */
    @discardableResult
    public func center(in parent: UIView, offset: UIOffset = UIOffset()) -> UIView {
        return self.centerX(to: parent.centerX, constant: offset.horizontal).centerY(to: parent.centerY, constant: offset.vertical)
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
