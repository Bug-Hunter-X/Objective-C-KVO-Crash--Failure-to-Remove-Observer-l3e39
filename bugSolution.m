The solution involves correctly removing the observer in the observed object's `dealloc` method.

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *observedString;
@end

@implementation MyClass
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  // ... handle observation ...
}

- (void)dealloc {
  [self removeObserver:self forKeyPath:@