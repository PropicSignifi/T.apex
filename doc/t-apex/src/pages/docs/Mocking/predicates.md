---
title: "Argument Predicates"
description: "Argument Predicates"
layout: "guide"
icon: "code-file"
weight: 3
---

###### {$page.description}

<article id="1">

## What are Argument Predicates?

Argument predicates are used during establishing method behavior to capture method invocations more precisely.

For example,

```javascript
T.when(mock.run(T.anyBoolean(R.isNotNull))).thenReturn(0);
// When mock calls 'run' with any Boolean that is not null, return 0
```

This mock method of 'run' will only get triggered when a Boolean that is not null is passed in.

</article>

<article id="2">

## How to Use Argument Predicates

We can choose appropriate argument predicates according to the parameter type and our needs.

Let's say we want to use argument predicates in this method.

```javascript
mock.setItem(Integer, String)
```

We can establish the method behavior without using argument predicates like this:

```javascript
T.when(mock.setItem(0, 'a')).thenReturn(null);
```

Or we can introduce one at the first parameter.

```javascript
T.when(mock.setItem(T.anyInteger(0), T.anyString('a'))).thenReturn(null);
```

**Note** that if we use argument predicates in any of the parameters, we need to apply them to all of the parameters.

</article>

<article id="3">

## Argument Predicates Usage

We can use argument predicates to represent any object of a specific type, like:

```javascript
T.when(mock.run(T.anyBoolean())).thenReturn(0);
```

This gets triggered whenever a Boolean is passed in.

Or we can use argument predicates to represent an object with the specific value, like:

```javascript
T.when(mock.run(T.anyBoolean(true))).thenReturn(0);
```

This gets triggered only when `true` is passed in.

Or we can use argument predicates to check according to some Funcs, like:

```javascript
T.when(mock.run(T.anyBoolean(R.isNotNull))).thenReturn(0);
```

This gets triggered only when a not-null Boolean is passed in.


</article>

<article id="4">

## Argument Predicate Types

Here is a list of the argument predicate types that we can use in T.apex.

| Method | Description |
| ------ | ----------- |
| any(...) | Matches any Object |
| anyBoolean(...) | Matches any Boolean |
| anyInteger(...) | Matches any Integer |
| anyLong(...) | Matches any Long |
| anyDouble(...) | Matches any Double |
| anyDecimal(...) | Matches any Decimal |
| anyString(...) | Matches any String |
| anyList(...) | Matches any List&lt;Object&gt; |
| anySet(...) | Matches any Set&lt;String&gt; |
| anyMap(...) | Matches any Map&lt;String, Object&gt; |
| anySObject(...) | Matches any SObject |
| anyDate(...) | Matches any Date |
| anyTime(...) | Matches any Time |
| anyDatetime(...) | Matches any Datetime |

</article>
