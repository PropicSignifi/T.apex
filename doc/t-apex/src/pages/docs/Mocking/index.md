---
title: "Mocking"
description: "Mocking"
layout: "guide"
icon: "code-file"
weight: 2
---

###### {$page.description}

<article id="1">

## Mocking Reference

Mocking is used in unit tests to provide a fake object in order to cut down unnecessary dependencies on other objects.

Here is a typical example of how mock objects are used in T.apex.

```javascript
// Create a mock
Func mock = (Func)T.mock(Func.class);

// Establish mock method behavior
T.when(mock.run(0)).thenReturn(0);

// Run test code
Object val = mock.run(0);
...

// Verify mocks
T.verify(mock, 'run').toHaveBeenCalled();
```

</article>
