# T.apex
T.apex is simply the Swiss knife for unit testing in Apex.

## Why T.apex?
T.apex adopts expecting assertion style to make unit test codes more readable. Besides, T.apex provides powerful and easy mocking framework to make unit test easier. And T.apex has a built-in data generator to help you generate all kinds of random test data, including SObjects.

## Dependencies
T.apex has a dependency on [R.apex](https://github.com/Click-to-Cloud/R.apex). Please include R.apex before getting started with T.apex.

## Get Started

### Expectations

```java
T.expect(true).toBe(true);
```

```java
T.expect(5).toEqual(5);
```

```java
T.expect('abc').toMatch('.*b.*');
```

```java
T.expect(null).toBeNull();
```

```java
T.expect(true).toBeTrue();
```

```java
T.expect(false).toBeFalse();
```

```java
T.expect('abc').toContain('b');
```

```java
T.expect(2).toBeLessThan(3);
```

```java
T.expect(3).toBeGreaterThan(2);
```

### Manual Failing
```java
T.fail('Should fail here');
```

### Create Mocks
```java
Func mock = (Func)T.mock(Func.class);
```

### Mock Method By Returning
```java
T.when(mock.run(0)).thenReturn(0);
// When mock calls 'run' with 0, return 0
```

### Mock Method By Throwing
```java
T.when(mock.run(0)).thenThrow(new T.TestException('test'));
// When mock calls 'run' with 0, throw the exception
```

### Mock Method By Answering
```java
T.when(mock.run(0)).thenAnswer(R.inc);
// When mock calls 'run' with 0, apply the answer Func to the arguments
// and return the result
```

### Argument Predicates
```java
T.when(mock.run(T.anyBoolean(R.isNotNull))).thenReturn(0);
// When mock calls 'run' with any Boolean that is not null, return 0
```

### Verify Mock Methods
```java
mock.run(0);

T.verify(mock, 'run').toHaveBeenCalled();
```

### Generate a Random Name
```java
String name = (String)T.create('Name'); // Random person names
```

### Generate a Random Sentence
```java
String sentence = (String)T.create('Sentence'); // Random sentences
```

### Generate a Random List of Strings
```java
List<String> strList = (List<String>)T.create('List', new Map<String, Object>{
    'type' => 'String',
    'min' => 5
});
// Create a random list that contains at least 5 strings
```

### Generate a Random SObject
```java
Account acc = (Account)T.createSObject('Account', new Map<String, Object>{
    'fields' => new List<String>{ 'Description' }
});
// Create a random Account object that include 'Description' field
```
