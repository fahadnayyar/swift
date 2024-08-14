#pragma once

// FRT or SWIFT_SHARED_REFERENCE type
struct FRTStruct {
}                                        \
  __attribute__((swift_attr("import_reference"))) \
  __attribute__((swift_attr("retain:retainFRTStruct")))  \
  __attribute__((swift_attr("release:releaseFRTStruct")));

// Retain function for the FRT or SWIFT_SHARED_REFERENCE type FRTStruct
void retainFRTStruct(FRTStruct * _Nonnull b) {
}

// Release function for the FRT or SWIFT_SHARED_REFERENCE type FRTStruct
void releaseFRTStruct(FRTStruct * _Nonnull b) {
}

// Global/free C++ functions returning FRT without any attributes
FRTStruct* _Nonnull global_function_returning_FRT();
FRTStruct* _Nonnull global_function_returning_copy();
FRTStruct* _Nonnull global_function_returning_create();
FRTStruct* _Nonnull global_function_returning_init();
FRTStruct* _Nonnull global_function_returning_clone();

// Global/free C++ functions returning FRT with attribute swift_attr("returns_retained") or SWIFT_RETURNS_RETAINED
FRTStruct* _Nonnull global_function_returning_FRT_with_attr_returns_retained() __attribute__((swift_attr("returns_retained"))); 
FRTStruct* _Nonnull global_function_returning_copy_with_attr_returns_retained() __attribute__((swift_attr("returns_retained"))); 
FRTStruct* _Nonnull global_function_returning_create_with_attr_returns_retained() __attribute__((swift_attr("returns_retained")));
FRTStruct* _Nonnull global_function_returning_init_with_attr_returns_retained() __attribute__((swift_attr("returns_retained"))); 
FRTStruct* _Nonnull global_function_returning_clone_with_attr_returns_retained() __attribute__((swift_attr("returns_retained"))); 

// Global/free C++ functions returning FRT with attribute swift_attr("returns_unretained") or SWIFT_RETURNS_UNRETAINED
FRTStruct* _Nonnull global_function_returning_FRT_with_attr_returns_unretained() __attribute__((swift_attr("returns_unretained"))); 
FRTStruct* _Nonnull global_function_returning_copy_with_attr_returns_unretained() __attribute__((swift_attr("returns_unretained"))); 
FRTStruct* _Nonnull global_function_returning_create_with_attr_returns_unretained() __attribute__((swift_attr("returns_unretained")));
FRTStruct* _Nonnull global_function_returning_init_with_attr_returns_unretained() __attribute__((swift_attr("returns_unretained"))); 
FRTStruct* _Nonnull global_function_returning_clone_with_attr_returns_unretained() __attribute__((swift_attr("returns_unretained"))); 

// Struct having static methods returning FRT without any attributes
struct StructWithStaticMethodsReturningFRTWithoutAttributes {
    static FRTStruct* _Nonnull StaticMethodReturningFRT();
    static FRTStruct* _Nonnull StaticMethodReturningFRT_copy();
    static FRTStruct* _Nonnull StaticMethodReturningFRT_create();
    static FRTStruct* _Nonnull StaticMethodReturningFRT_init();
    static FRTStruct* _Nonnull StaticMethodReturningFRT_clone();
};

// Struct having static methods returning FRT with attribute swift_attr("returns_retained") or SWIFT_RETURNS_RETAINED
struct StructWithStaticMethodsReturningFRTWithAttributeReturnsRetained {
    static FRTStruct* _Nonnull StaticMethodReturningFRT() __attribute__((swift_attr("returns_retained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_copy() __attribute__((swift_attr("returns_retained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_create() __attribute__((swift_attr("returns_retained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_init() __attribute__((swift_attr("returns_retained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_clone() __attribute__((swift_attr("returns_retained")));
};

// Struct having static methods returning FRT with attribute swift_attr("returns_unretained") or SWIFT_RETURNS_UNRETAINED
struct StructWithStaticMethodsReturningFRTWithAttributeReturnsUnretained {
    static FRTStruct* _Nonnull StaticMethodReturningFRT() __attribute__((swift_attr("returns_unretained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_copy() __attribute__((swift_attr("returns_unretained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_create() __attribute__((swift_attr("returns_unretained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_init() __attribute__((swift_attr("returns_unretained")));
    static FRTStruct* _Nonnull StaticMethodReturningFRT_clone() __attribute__((swift_attr("returns_unretained")));
};
