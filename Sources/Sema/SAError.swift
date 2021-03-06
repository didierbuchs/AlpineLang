import AST

/// Enumeration of the possible static analysis errors.
public enum SAError: Error, CustomStringConvertible {

  /// Occurs when when an identifier can't be unambiguously selected.
  case ambiguousIdentifier(identifier: Ident, choices: [Symbol])
  /// Occurs when a type is declared twice in the same scope.
  case duplicateDeclaration(name: String)
  /// Occurs when a symbol is improperly redeclared (e.g. a function overloading a type).
  case invalidRedeclaration(name: String)
  /// Occurs when an non-type identifier is used as a type annotation.
  case invalidTypeIdentifier(name: String)
  /// Occurs when a symbol appears to be not declared in any accessible scope.
  case undefinedSymbol(name: String)
  /// Occurs when the given type constraint seems unsolvable.
  case unsolvableConstraint(constraint: Constraint, cause: SolverResult.FailureKind)

  public var description: String {
    switch self {
    case .ambiguousIdentifier(let identifier, choices: _):
      return "ambiguous identifier '\(identifier.name)'"
    case .duplicateDeclaration(let name):
      return "duplicate declaration '\(name)'"
    case .invalidRedeclaration(let name):
      return "invalid redeclaration '\(name)'"
    case .invalidTypeIdentifier(let name):
      return "invalid type identifier '\(name)'"
    case .undefinedSymbol(let name):
      return "undefined symbol '\(name)'"
    case .unsolvableConstraint:
      return "type error"
    }
  }

}
