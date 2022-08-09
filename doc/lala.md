## PhanAccessExtendsFinalClass

This issue comes up when there is an attempt to extend a user-defined final class.

```
Attempting to extend from final class {CLASS} defined at {FILE}:{LINE}
```

This will be emitted for the following code.

```php
final class FinalClass
class A extends FinalClass {}
```

