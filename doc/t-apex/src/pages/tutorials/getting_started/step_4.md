---
title: "Mocking"
description: "Mocking"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 4
---

## {$page.title}

First, we will create a mock of Func.

```javascript
Func mock = (Func)T.mock(Func.class);
```

Then we will establish the mocking method behavior. We can mock by returning a value.

```javascript
T.when(mock.run(0)).thenReturn(0);
// When mock calls 'run' with 0, return 0
```

Or we can mock by throwing an exception.

```javascript
T.when(mock.run(0)).thenThrow(new T.TestException('test'));
// When mock calls 'run' with 0, throw the exception
```

Or we can mock by using a Func as an answer.

```javascript
T.when(mock.run(0)).thenAnswer(R.inc);
// When mock calls 'run' with 0, apply the answer Func to the arguments
// and return the result
```

Besides, we can use argument matcher to capture method invocation more precisely.

```javascript
T.when(mock.run(T.anyBoolean(R.isNotNull))).thenReturn(0);
// When mock calls 'run' with any Boolean that is not null, return 0
```

Finally, let's verify the mocks.

```javascript
mock.run(0);

T.verify(mock, 'run').toHaveBeenCalled();
```
