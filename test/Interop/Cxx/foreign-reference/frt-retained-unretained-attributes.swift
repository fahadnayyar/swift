// RUN: %target-swift-emit-sil -I %S/Inputs -cxx-interoperability-mode=upcoming-swift %s -validate-tbd-against-ir=none -Xcc -fignore-exceptions | %FileCheck %s

import FunctionsAndMethodsReturningFRT

// Testing Global/free C++ functions returning FRT without any attributes
func testFreeFunctionsWithoutAttrubutes() {
    let frtLocalVar1 = global_function_returning_FRT(); // CHECK: function_ref @{{.*}}global_function_returning_FRT{{.*}} : $@convention(c) () -> FRTStruct
    
    // Free/global functions having copy/create in the function name are passed as owned by default
    let frtLocalVar2 = global_function_returning_copy(); // CHECK: function_ref @{{.*}}global_function_returning_copy{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar3 = global_function_returning_create(); // CHECK: function_ref @{{.*}}global_function_returning_create{{.*}} : $@convention(c) () -> @owned FRTStruct
    
    let frtLocalVar4 = global_function_returning_init(); // CHECK: function_ref @{{.*}}global_function_returning_init{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar5 = global_function_returning_clone(); // CHECK: function_ref @{{.*}}global_function_returning_clone{{.*}} : $@convention(c) () -> FRTStruct
}

// Testing Global/free C++ functions returning FRT with attribute swift_attr("returns_retained") or SWIFT_RETURNS_RETAINED
func testFreeFunctionsWithAttrubuteReturnsRetained() {
    let frtLocalVar1 = global_function_returning_FRT_with_attr_returns_retained(); // CHECK: function_ref @{{.*}}global_function_returning_FRT_with_attr_returns_retained{{.*}} : $@convention(c) () -> @owned FRTStruct
    
    let frtLocalVar2 = global_function_returning_copy_with_attr_returns_retained(); // CHECK: function_ref @{{.*}}global_function_returning_copy_with_attr_returns_retained{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar3 = global_function_returning_create_with_attr_returns_retained(); // CHECK: function_ref @{{.*}}global_function_returning_create_with_attr_returns_retained{{.*}} : $@convention(c) () -> @owned FRTStruct
    
    let frtLocalVar4 = global_function_returning_init_with_attr_returns_retained(); // CHECK: function_ref @{{.*}}global_function_returning_init_with_attr_returns_retained{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar5 = global_function_returning_clone_with_attr_returns_retained(); // CHECK: function_ref @{{.*}}global_function_returning_clone_with_attr_returns_retained{{.*}} : $@convention(c) () -> @owned FRTStruct
}

//  Testing Global/free C++ functions returning FRT with attribute swift_attr("returns_unretained") or SWIFT_RETURNS_UNRETAINED
func testFreeFunctionsWithAttrubuteReturnsUnretained() {
    let frtLocalVar1 = global_function_returning_FRT_with_attr_returns_unretained(); // CHECK: function_ref @{{.*}}global_function_returning_FRT_with_attr_returns_unretained{{.*}} : $@convention(c) () -> FRTStruct
    
    let frtLocalVar2 = global_function_returning_copy_with_attr_returns_unretained(); // CHECK: function_ref @{{.*}}global_function_returning_copy_with_attr_returns_unretained{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar3 = global_function_returning_create_with_attr_returns_unretained(); // CHECK: function_ref @{{.*}}global_function_returning_create_with_attr_returns_unretained{{.*}} : $@convention(c) () -> FRTStruct
    
    let frtLocalVar4 = global_function_returning_init_with_attr_returns_unretained(); // CHECK: function_ref @{{.*}}global_function_returning_init_with_attr_returns_unretained{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar5 = global_function_returning_clone_with_attr_returns_unretained(); // CHECK: function_ref @{{.*}}global_function_returning_clone_with_attr_returns_unretained{{.*}} : $@convention(c) () -> FRTStruct
}

//  Testing c++ static methods returning FRT without any attributes
func testStaticMethodsWithoutAttrubutes() {
    let frtLocalVar1 = StructWithStaticMethodsReturningFRTWithoutAttributes.StaticMethodReturningFRT(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar2 = StructWithStaticMethodsReturningFRTWithoutAttributes.StaticMethodReturningFRT_copy(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_copy{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar3 = StructWithStaticMethodsReturningFRTWithoutAttributes.StaticMethodReturningFRT_create(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_create{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar4 = StructWithStaticMethodsReturningFRTWithoutAttributes.StaticMethodReturningFRT_init(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_init{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar5 = StructWithStaticMethodsReturningFRTWithoutAttributes.StaticMethodReturningFRT_clone(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_clone{{.*}} : $@convention(c) () -> FRTStruct
}

//  Testing c++ static methods returning FRT with attribute swift_attr("returns_retained") or SWIFT_RETURNS_RETAINED
func testStaticMethodsWithAttrubuteReturnsRetained() {
    let frtLocalVar1 = StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained.StaticMethodReturningFRT(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar2 = StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained.StaticMethodReturningFRT_copy(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_copy{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar3 = StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained.StaticMethodReturningFRT_create(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_create{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar4 = StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained.StaticMethodReturningFRT_init(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_init{{.*}} : $@convention(c) () -> @owned FRTStruct
    let frtLocalVar5 = StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained.StaticMethodReturningFRT_clone(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_clone{{.*}} : $@convention(c) () -> @owned FRTStruct
}

//  Testing c++ static methods returning FRT with attribute swift_attr("returns_unretained") or SWIFT_RETURNS_UNRETAINED
func testStaticMethodsWithAttrubuteReturnsUnretained() {
    let frtLocalVar1 = StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained.StaticMethodReturningFRT(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar2 = StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained.StaticMethodReturningFRT_copy();// CHECK: function_ref @{{.*}}StaticMethodReturningFRT_copy{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar3 = StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained.StaticMethodReturningFRT_create(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_create{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar4 = StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained.StaticMethodReturningFRT_init(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_init{{.*}} : $@convention(c) () -> FRTStruct
    let frtLocalVar5 = StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained.StaticMethodReturningFRT_clone(); // CHECK: function_ref @{{.*}}StaticMethodReturningFRT_clone{{.*}} : $@convention(c) () -> FRTStruct
}
