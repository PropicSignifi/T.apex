---
title: "Mock Creation"
description: "Mock Creation"
layout: "guide"
icon: "code-file"
weight: 1
---

###### {$page.description}

<article id="1">

## How to Create Mocks

We only need one line to create a mock.

```javascript
Func mock = (Func)T.mock(Func.class);
```

</article>

<article id="2">

## Behind the Scenes

We use Salesforce Apex Stub API to create mock objects. All limitations for Stub API also apply here.

</article>
