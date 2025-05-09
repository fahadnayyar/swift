// REQUIRES: swift_feature_SafeInteropWrappers

// RUN: %target-swift-ide-test -print-module -module-to-print=SizedByNoEscapeClang -plugin-path %swift-plugin-dir -I %S/Inputs -source-filename=x -enable-experimental-feature SafeInteropWrappers | %FileCheck %s

// swift-ide-test doesn't currently typecheck the macro expansions, so run the compiler as well
// RUN: %empty-directory(%t)
// RUN: %target-swift-frontend -emit-module -plugin-path %swift-plugin-dir -o %t/SizedByNoEscape.swiftmodule -I %S/Inputs -enable-experimental-feature SafeInteropWrappers %s

// Check that ClangImporter correctly infers and expands @_SwiftifyImport macros for functions with __sized_by __noescape parameters.
import SizedByNoEscapeClang

// CHECK:      @_alwaysEmitIntoClient public func complexExpr(_ len: Int{{.*}}, _ offset: Int{{.*}}, _ p: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient public func nonnull(_ p: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient public func nullUnspecified(_  p: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient public func nullable(_  p: RawSpan?)
// CHECK-NEXT: @_alwaysEmitIntoClient public func opaque(_  p: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient @_disfavoredOverload public func returnPointer(_ len: Int{{.*}}) -> UnsafeRawBufferPointer
// CHECK-NEXT: @_alwaysEmitIntoClient public func shared(_ len: Int{{.*}}, _ p1: RawSpan, _ p2: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient public func simple(_  p: RawSpan)
// CHECK-NEXT: @_alwaysEmitIntoClient public func swiftAttr(_  p: RawSpan)

@inlinable
public func callComplexExpr(_ p: RawSpan) {
  complexExpr(CInt(p.byteCount), 1, p)
}

@inlinable
public func callNonnull(_ p: RawSpan) {
  nonnull(p)
}

@inlinable
public func callNullUnspecified(_ p: RawSpan) {
  nullUnspecified(p)
}

@inlinable
public func callNullable(_ p: RawSpan?) {
  nullable(p)
}

@inlinable
public func callReturnPointer() {
  let a: UnsafeRawBufferPointer? = returnPointer(4) // call wrapper
  let b: UnsafeRawPointer? = returnPointer(4) // call unsafe interop
}

@inlinable
public func callShared(_ p: RawSpan, _ p2: RawSpan) {
  shared(CInt(p.byteCount), p, p2)
}

@inlinable
public func callSimple(_ p: RawSpan) {
  simple(p)
}

@inlinable
public func callSwiftAttr(_ p: RawSpan) {
  swiftAttr(p)
}