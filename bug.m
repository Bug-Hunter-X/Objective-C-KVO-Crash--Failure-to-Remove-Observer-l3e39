In Objective-C, a rare but impactful error arises when dealing with KVO (Key-Value Observing) and memory management.  If an observer is not removed before the observed object is deallocated, a crash can occur. This is especially problematic if the observer is held in a weak reference, as the observed object might deallocate prematurely leading to a dangling pointer.  The crash often manifests as EXC_BAD_ACCESS because the observer attempts to access deallocated memory.

Example:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *observedString;
@end

@implementation MyClass
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  // ... handle observation ...
}

- (void)dealloc {
  // MISSING: removeObserver:forKeyPath:
}
@end
```