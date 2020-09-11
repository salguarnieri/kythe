// Checks that Objective-C class properties in protocols ref/call the correct
// field and class.

@interface Obj
@end

@implementation Obj
@end

//- @Box defines/binding BoxDecl
@protocol Box

//- @foo defines/binding FooPropDecl
//- FooPropDecl childof BoxDecl
@property(class) int foo;

@end

//- @I defines/binding IIface
@interface I : Obj<Box>
@end

//- @I defines/binding IImpl
//- @I completes/uniquely IIface
@implementation I
+ (int)foo {
  return 0;
}
+ (void)setFoo:(int)f {
}
@end

int main(int argc, char **argv) {
  // @I ref II?
  //- @foo ref F?
  int i = I.foo;
  return 0;
}

