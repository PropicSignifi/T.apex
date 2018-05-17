---
title: "Mock Verification"
description: "Mock Verification"
layout: "guide"
icon: "code-file"
weight: 4
---

###### {$page.description}

<article id="1">

## How to Verify Mock Behavior

After the mock has been used, we can verify mock methods have been used as we expected.

```javascript
T.verify(mock, 'run').toHaveBeenCalled();
```

We have three ways to verify mock method behaviors.

| Method | Description |
| ------ | ----------- |
| toHaveBeenCalled() | To verify that the method has been called |
| toHaveBeenCalledTimes(Integer) | To verify that the method has been called N times |
| toHaveBeenCalledWith(List&lt;Object&gt;) | To verify that the method has been called with the given arguments |

</article>
