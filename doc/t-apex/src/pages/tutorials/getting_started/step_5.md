---
title: "Generate Random Data"
description: "Generate Random Data"
buttonTitle: "Done"
parentId: "getting_started"
layout: "tutorial"
time: 90
weight: 5
---

## {$page.title}

We can generate all kinds of random data in T.apex.

Here is how we can do this:

```javascript
String name = (String)T.create('Name'); // Random person names

String sentence = (String)T.create('Sentence'); // Random sentences

List<String> strList = (List<String>)T.create('List', new Map<String, Object>{
    'type' => 'String',
    'min' => 5
});
// Create a random list that contains at least 5 strings

Account acc = (Account)T.createSObject('Account', new Map<String, Object>{
    'fields' => new List<String>{ 'Description' }
});
// Create a random Account object that include 'Description' field
```
