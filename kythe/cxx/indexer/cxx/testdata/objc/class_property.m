// Checks that Objective-C class properties ref/call the correct field and class.

//- @Box defines/binding BoxDecl
@interface Box

//- @foo defines/binding FooPropDecl
//- FooPropDecl childof BoxDecl
@property(class) int foo;

@end

//- @Box defines/binding BoxDefn
@implementation Box
@dynamic foo;
@end

int main(int argc, char **argv) {
  //- @Box ref BoxDefn
  Box *b;

  // @Box ref BoxDefn
  //- @foo ref A?
  int i = Box.foo;
  return 0;
}

