#pragma once

#define FRT                                       \
  __attribute__((swift_attr("import_reference"))) \
  __attribute__((swift_attr("retain:immortal")))  \
  __attribute__((swift_attr("release:immortal")))


struct SharedThing {
    // int refCount = 0;
}                                        \
  __attribute__((swift_attr("import_reference"))) \
  __attribute__((swift_attr("retain:retainSharedThing")))  \
  __attribute__((swift_attr("release:releaseSharedThing")));

void retainSharedThing(SharedThing * _Nonnull b) {
    // b->refCount++;
}

void releaseSharedThing(SharedThing * _Nonnull b) {
    // b->refCount--;
    // if(b->refCount == 0) {
    //     delete b;
    // }
}

SharedThing* _Nonnull shared_thing_create();
SharedThing* _Nonnull shared_thing_copy();
SharedThing* _Nonnull shared_thing_func();