---
title: "BDD Style"
description: "BDD Style Assertion"
layout: "guide"
icon: "flash"
weight: 1
---

###### {$page.description}

<article id="1">

## Behavior Driven Development(BDD) Style Assertion

T.apex favors a BDD-style assertion like this:

```javascript
T.expect(result).toBe(true);
```

</article>

<article id="2">

## Matchers

Here is a list of matchers used in T.apex.

| Method | Description |
| ------ | ----------- |
| toBe(Object) | Check equality |
| toEqual(Object) | Check equality |
| toMatch(String) | Check string pattern matching |
| toBeNull() | Check null |
| toBeTrue() | Check True |
| toBeFalse() | Check False |
| toContain(Object) | Check containing |
| toBeLessThan(Object) | Check less than |
| toBeGreaterThan(Object) | Check greater than |

</article>

<article id="3">

## Negate Matchers

Here is how we negate the matchers.

```javascript
T.expect(result).never.toBe(null);
```

</article>

<article id="4">

## Manual Failing

Here is how we manually fail the test.

```javascript
T.fail('Should fail here');
```

</article>

<article id="5">

## Asymmetric Matchers

Asymmetric matchers are a group of matchers that implements `T.IMatcher`, which usually contains
asymmetric equality checking logic.

Here is how we use the asymmetric matchers.

```javascript
T.expect(result).toEqual(T.objectOfAny(String.class));
```

Here is a list of the asymmetric matchers provided by T.apex.

| Method | Description |
| ------ | ----------- |
| objectOfAny(Type) | Matches any object of given Type |
| objectOfAnything() | Matches anything but null |
| mapContaining(Map&lt;String, Object&gt;) | Contains all the key-value pairs |
| listContaining(List&lt;Object&gt;) | Contains all elements from the list |

</article>

<article id="6">

## Custom Asymmetric Matchers

We can also implement our custom asymmetric matchers.

```javascript
public class CustomMatcher implements IMatcher {
    private String word;

    public CustomMatcher(String word) {
        this.word = word;
    }

    public String getMessage(Object other) {
        return 'Custom matcher fails';
    }

    public Boolean matches(Object other) {
        return this.word == other;
    }
}

T.expect(result).toEqual(new CustomMatcher('word'));
```

</article>
