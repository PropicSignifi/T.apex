---
title: "Expections"
description: "Expections"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 3
---

## {$page.title}

T.apex offers a lot of easy-to-use expectations for your assertions.


```javascript
T.expect(true).toBe(true);
T.expect(5).toEqual(5);
T.expect('abc').toMatch('.*b.*');
T.expect(null).toBeNull();
T.expect(true).toBeTrue();
T.expect(false).toBeFalse();
T.expect('abc').toContain('b');
T.expect(2).toBeLessThan(3);
T.expect(3).toBeGreaterThan(2);
T.fail('Should fail here');
```
