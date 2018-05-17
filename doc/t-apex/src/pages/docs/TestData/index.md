---
title: "Test Data"
description: "Generate random test data"
layout: "guide"
icon: "cloud"
weight: 4
---

###### {$page.description}

<article id="1">

## Random Data Generator

A full-featured random data generator is shipped with T.apex. We can use this random data generator to
generate test data.

In test code, we can do this:

```javascript
String s = (String)T.create('String');
```

And this will generate a random string for us.

Also we can use below, which is equivalent to the above.

```javascript
String s = (String)Random.anyString.run();
```

`Random` is just the random data generator in T.apex. **Note** that `T` can only be used in test codes, while `Random`
is just a utility class and can be used anywhere outside test codes.

Therefore, if we want to generate random data outside test codes, please use the latter form.

</article>

<article id="2">

## Generator Options

We can actually pass in options to fine tune how we would like the random data to be generated.

```javascript
String s = (String)T.create('String', new Map<String, Object>{ ... });
```

Or

```javascript
String s = (String)Random.anyString.run(new Map<String, Object>{ ... });
```

are the equivalent. The details of the options rely on the random data we want to generate.

</article>

<article id="3">

## Random Object

We can create a random Object like this:

```javascript
Random.anyObject.run(new Map<String, Object>{
    'type' => 'String',
    'config' => new Map<String, Object>{ 'min' => 5 }
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| type | String | The type of data to create |
| config | Map&lt;String, Object&gt; | The options to create this type of data |

Available types are:

| Name | Description |
| ---- | ----------- |
| Boolean | Boolean |
| Integer | Integer |
| Long | Long |
| Double | Double |
| Decimal | Decimal |
| Char | Character |
| String | String |
| List | List&lt;Object&gt; |
| Set | Set&lt;String&gt; |
| Map | Map&lt;String, Object&gt; |
| SObject | SObject |
| Date | Date |
| Time | Time |
| Datetime | Datetime |
| Syllable | A syllable in the word |
| Word | Word |
| Sentence | Sentence |
| Paragraph | Paragraph |
| Gender | Gender |
| Firstname | Firstname |
| Lastname | Lastname |
| Prefix | Prefix |
| Suffix | Suffix |
| Name | Person name |
| Email | Email |
| Domain | Domain |

For any other types, T.apex will try to find the Type and instantiate it.

</article>

<article id="4">

## Random Boolean

We can create a random Boolean like this:

```javascript
Random.anyBoolean.run(new Map<String, Object>{
    'likelihood' => 60
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| likelihood | Integer | The likelihood of being true, default to 50 |

</article>

<article id="5">

## Random Integer

We can create a random Integer like this:

```javascript
Random.anyInteger.run(new Map<String, Object>{
    'min' => 5,
    'max' => 20
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Integer | The min value, default to Random.MIN_INTEGER |
| max | Integer | The max value, default to Random.MAX_INTEGER |

</article>

<article id="6">

## Random Long

We can create a random Long like this:

```javascript
Random.anyLong.run(new Map<String, Object>{
    'min' => 5,
    'max' => 20
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Long | The min value, default to Random.MIN_LONG |
| max | Long | The max value, default to Random.MAX_LONG |

</article>

<article id="7">

## Random Double

We can create a random Double like this:

```javascript
Random.anyDouble.run(new Map<String, Object>{
    'min' => 5,
    'max' => 20
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Double | The min value, default to Random.MIN_DOUBLE |
| max | Double | The max value, default to Random.MAX_DOUBLE |

</article>

<article id="8">

## Random Decimal

We can create a random Decimal like this:

```javascript
Random.anyDecimal.run(new Map<String, Object>{
    'min' => 5,
    'max' => 20
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Decimal | The min value, default to Random.MIN_DECIMAL |
| max | Decimal | The max value, default to Random.MAX_DECIMAL |

</article>

<article id="9">

## Random Char

We can create a random Char like this:

```javascript
Random.anyChar.run(new Map<String, Object>{
    'alpha' => true
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| casing | String | upper/lower/null, default to all |
| pool | String | The pool to get the character from, default to null |
| alpha | Boolean | Whether to pick only alphabetic, default to false |
| symbols | Boolean | Whether to pick only symbols, default to false |
| numbers | Boolean | Whether to pick only numbers, default to false |

</article>

<article id="10">

## Random String

We can create a random String like this:

```javascript
Random.anyList.run(new Map<String, Object>{
    'type' => 'String',
    'min' => 5
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Integer | The min length, default to 0 |
| max | Integer | The max length, default to 20 |
| * | * | Passed down to Char |

</article>

<article id="11">

## Random List

We can create a random List&lt;Object&gt; like this:

```javascript
Random.anyList.run(new Map<String, Object>{
    'type' => 'String',
    'min' => 5
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Integer | The min length, default to 0 |
| max | Integer | The max length, default to 20 |
| pool | List&lt;Object&gt; | The pool to draw from, default to null |
| type | String | The type of elements in the list, default to null |
| config | Map&lt;String, Object&gt; | The config of the elements to be created, default to null |

`pool` is used as a group while `type` and `config` are used as a group.

</article>

<article id="12">

## Random Set

We can create a random Set&lt;String&gt; like this:

```javascript
Random.anySet.run(new Map<String, Object>{
    'min' => 5
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Integer | The min length, default to 0 |
| max | Integer | The max length, default to 20 |
| pool | Set&lt;String&gt; | The pool to draw from, default to null |
| type | String | Type is fixed to 'String' and can be omitted, default to null |
| config | Map&lt;String, Object&gt; | The config of the elements to be created, default to null |

`pool` is used as a group while `type` and `config` are used as a group.

</article>

<article id="13">

## Random Map

We can create a random Map&lt;String, Object&gt; like this:

```javascript
Random.anyMap.run(new Map<String, Object>{
    'type' => 'String',
    'min' => 5
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Integer | The min length, default to 0 |
| max | Integer | The max length, default to 20 |
| pool | Map&lt;String, Object&gt; | The pool to draw from, default to null |
| type | String | Type is fixed to 'String' and can be omitted, default to null |
| config | Map&lt;String, Object&gt; | The config of the elements to be created, default to null |

`pool` is used as a group while `type` and `config` are used as a group.

</article>

<article id="14">

## Random Date

We can create a random Date like this:

```javascript
Random.anyDate.run(new Map<String, Object>{
    'min' => Datetime.now().getTime(),
    'max' => Datetime.now().addYears(1).getTime()
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Long | The start datetime, default to now |
| max | Long | The end datetime, default to 20 years later |

</article>

<article id="15">

## Random Time

We can create a random Time like this:

```javascript
Random.anyTime.run(new Map<String, Object>{
    'min' => Datetime.now().getTime(),
    'max' => Datetime.now().addYears(1).getTime()
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Long | The start datetime, default to now |
| max | Long | The end datetime, default to 20 years later |

</article>

<article id="16">

## Random Datetime

We can create a random Datetime like this:

```javascript
Random.anyDatetime.run(new Map<String, Object>{
    'min' => Datetime.now().getTime(),
    'max' => Datetime.now().addYears(1).getTime()
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| min | Long | The start datetime, default to now |
| max | Long | The end datetime, default to 20 years later |

</article>

<article id="17">

## Random Syllable

We can create a random Syllable like this:

```javascript
Random.anySyllable.run(new Map<String, Object>{
    'length' => 4
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| length | Integer | The length of the syllable, default to 2 or 3 |
| capitalize | Boolean | Whether to capitalize the word, default to false |

</article>

<article id="18">

## Random Word

We can create a random Word like this:

```javascript
Random.anyWord.run(new Map<String, Object>{
    'syllables' => 4
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| length | Integer | The length of the word, default to null |
| capitalize | Boolean | Whether to capitalize the word, default to false |
| syllables | Integer | The number of syllables, default to 1-3 |

`length` and `syllables` are used separately.

</article>

<article id="19">

## Random Sentence

We can create a random Sentence like this:

```javascript
Random.anySentence.run(new Map<String, Object>{
    'words' => 20
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| words | Integer | The number of words, default to 12-18 |
| punctuation | String | The punctuation to append to the sentence, default to '.' |

</article>

<article id="20">

## Random Paragraph

We can create a random Paragraph like this:

```javascript
Random.anyParagraph.run(new Map<String, Object>{
    'sentences' => 5
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| sentences | Integer | The number of sentences, default to 3-7 |

</article>

<article id="21">

## Random Gender

We can create a random Gender like this:

```javascript
Random.anyGender.run(new Map<String, Object>{
    'extra' => new List<String>{ 'Unisex' }
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| extra | List&lt;String&gt; | The extra list of genders, default to empty list |

</article>

<article id="22">

## Random Firstname

We can create a random Firstname like this:

```javascript
Random.anyFirstname.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| gender | String | Male/Female/null, the gender according to which to pick first names, default to null, which means no specific gender |

</article>

<article id="23">

## Random Lastname

We can create a random Lastname like this:

```javascript
Random.anyLastname.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |

</article>

<article id="24">

## Random Prefix

We can create a random Prefix like this:

```javascript
Random.anyPrefix.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| gender | String | Male/Female/all/null, the gender according to which to pick prefixes, default to null, which means all prefixes |

</article>

<article id="25">

## Random Suffix

We can create a random Suffix like this:

```javascript
Random.anySuffix.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |

</article>

<article id="26">

## Random Name

We can create a random Name like this:

```javascript
Random.anyName.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| middle | Boolean | Whether to generate middle names, default to false |
| middleInitial | Boolean | Whether to generate middle initial names, default to false |
| prefix | Boolean | Whether to generate prefixes, default to false |
| suffix | Boolean | Whether to generate suffixes, default to false |

</article>

<article id="27">

## Random Email

We can create a random Email like this:

```javascript
Random.anyEmail.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| length | Integer | The length of the word before '@', default to null |
| domain | String | The domain of the email, default to be random domain |

</article>

<article id="28">

## Random Domain

We can create a random Domain like this:

```javascript
Random.anyDomain.run()
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |

</article>

<article id="29">

## Random SObject

We can create a random SObject like this:

```javascript
Random.anySObject.run(new Map<String, Object>{
    'type' => 'Account'
})
```

Here are the options:

| Key | Value Type | Description |
| --- | ---------- | ----------- |
| type | String | The type of the SObject, required |
| cascade | Boolean | Whether to generate reference field with SObjects, default to false |
| fields | List&lt;String&gt; or Map&lt;String, Object&gt; | Specify which fields to generate |

When `fields` is of type List, all specified fields in the list will be filled in the generated SObject.

When `fields` is of type Map, according to the value mapped by the field keys, if it is a

- non-Func value, filling the generated SObject field with the value

- Func value, filling the generated SObject field with the value computed using the Func

You can add included fields or excluded fields.

```javascript
Random.addIncludedFields('Account', new Set<String>{ 'Description' });
```

This will impact all the data generation afterwards, adding the 'Description' field when creating Account objects.

</article>
