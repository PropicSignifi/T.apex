---
title: "Mock Behavior"
description: "Mock Behavior"
layout: "guide"
icon: "code-file"
weight: 2
---

###### {$page.description}

<article id="1">

## How to Establish Mock Behavior

We have three ways to establish mock method behaviors.

| Name | Description | Scenario |
| ---- | ----------- | -------- |
| Returning | Return a value | When the mocked method simply needs to return something |
| Throwing | Throw an exception | When the mocked method needs to throw an exception |
| Answering | Delegate the call to a Func | When the mocked method needs more than simply returning something |

</article>

<article id="2">

## By Returning

Here is how we establish a mock method behavior by returning.

```javascript
T.when(mock.run(0)).thenReturn(0);
// When mock calls 'run' with 0, return 0
```

</article>

<article id="3">

## By Throwing

Here is how we establish a mock method behavior by throwing.

```javascript
T.when(mock.run(0)).thenThrow(new T.TestException('test'));
// When mock calls 'run' with 0, throw the exception
```

</article>

<article id="4">

## By Answering

Here is how we establish a mock method behavior by answering.

```javascript
T.when(mock.run(0)).thenAnswer(R.inc);
// When mock calls 'run' with 0, apply the answer Func to the arguments
// and return the result
```

</article>
