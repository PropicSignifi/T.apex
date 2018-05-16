/**
 * MIT License
 *
 * Copyright (c) 2018 Click to Cloud Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 **/
@isTest
private class TTest {
    @isTest
    private static void toBeTest() {
        T.expect(true).toBe(true);
        T.expect(false).never.toBe(true);
    }

    @isTest
    private static void toEqualTest() {
        T.expect(true).toEqual(true);
        T.expect(false).never.toEqual(true);
    }

    @isTest
    private static void toMatchTest() {
        T.expect('cat').toMatch('cat');
        T.expect('dog').never.toMatch('cat');
    }

    @isTest
    private static void toBeNullTest() {
        T.expect(null).toBeNull();
        T.expect('abc').never.toBeNull();
    }

    @isTest
    private static void toBeTrueTest() {
        T.expect(true).toBeTrue();
        T.expect(false).never.toBeTrue();
    }

    @isTest
    private static void toBeFalseTest() {
        T.expect(false).toBeFalse();
        T.expect(true).never.toBeFalse();
    }

    @isTest
    private static void toContainTest() {
        T.expect(new List<String>{ 'a', 'b' }).toContain('b');
        T.expect(new List<String>{ 'a', 'b' }).never.toContain('c');
    }

    @isTest
    private static void toBeLessThanTest() {
        T.expect(1).toBeLessThan(2);
        T.expect(3).never.toBeLessThan(2);
    }

    @isTest
    private static void toBeGreaterThanTest() {
        T.expect(3).toBeGreaterThan(2);
        T.expect(1).never.toBeGreaterThan(2);
    }

    @isTest
    private static void defaultMockTest() {
        Func f = (Func)T.mock(Func.class);
        T.expect(f).never.toBeNull();

        Object val = f.run();
        T.expect(val).toBeNull();
    }

    @isTest
    private static void thenReturnTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(0)).thenReturn(0);
        T.expect(f.run(0)).toBe(0);

        f = (Func)T.mock(Func.class);
        T.when(f.run('input')).thenReturn('abc');
        T.expect(f.run('input')).toBe('abc');
        T.expect(f.run('wrong')).never.toBe('abc');
    }

    @isTest
    private static void matcherTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(T.any(R.isNotNull))).thenReturn(0);

        T.expect(f.run(0)).toBe(0);
        T.expect(f.run(null)).toBe(null);
    }

    @isTest
    private static void matchersTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyBoolean())).thenReturn(0);
        T.expect(f.run(true)).toBe(0);
        T.expect(f.run(1)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyInteger())).thenReturn(0);
        T.expect(f.run(1)).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyLong())).thenReturn(0);
        T.expect(f.run((Long)1)).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyDecimal())).thenReturn(0);
        T.expect(f.run((Decimal)1)).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyDouble())).thenReturn(0);
        T.expect(f.run((Double)1)).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyString())).thenReturn(0);
        T.expect(f.run('abc')).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyList())).thenReturn(0);
        T.expect(f.run(new List<String>())).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anySet())).thenReturn(0);
        T.expect(f.run(new Set<String>())).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyMap())).thenReturn(0);
        T.expect(f.run(new Map<String, Object>())).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anySObject())).thenReturn(0);
        T.expect(f.run(new Account())).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyDate())).thenReturn(0);
        T.expect(f.run(Date.newInstance(2018, 1, 1))).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyTime())).thenReturn(0);
        T.expect(f.run(Time.newInstance(10, 0, 0, 0))).toBe(0);
        T.expect(f.run(true)).toBe(null);

        f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyDatetime())).thenReturn(0);
        T.expect(f.run(Datetime.now())).toBe(0);
        T.expect(f.run(true)).toBe(null);
    }

    @isTest
    private static void thenThrowTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(0)).thenThrow(new T.TestException('test'));

        try {
            f.run(0);

            T.fail('Should fail here');
        }
        catch(Exception e) {
            T.expect(true).toBe(true);
        }
    }

    @isTest
    private static void thenAnswerTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(T.anyDecimal())).thenAnswer(R.multiply.apply(2));

        T.expect(f.run((Decimal)2)).toBe(4);
    }

    @isTest
    private static void verifyTest() {
        Func f = (Func)T.mock(Func.class);
        T.when(f.run(0)).thenReturn(0);

        f.run(0);

        T.verify(f, 'run').toHaveBeenCalled();
        T.verify(f, 'run').toHaveBeenCalledTimes(1);
        T.verify(f, 'run').toHaveBeenCalledWith(new List<Object>{ 0 });
    }

    @isTest
    private static void anyMatcherTest() {
        T.expect(true).toEqual(T.objectOfAny(Boolean.class));
    }

    @isTest
    private static void anythingMatcherTest() {
        T.expect(true).toEqual(T.objectOfAnything());
    }

    @isTest
    private static void mapContainingTest() {
        T.expect(new Map<String, Object>{ 'name' => 'test' }).toEqual(T.mapContaining(new Map<String, Object>{ 'name' => 'test' }));
    }

    @isTest
    private static void listContainingTest() {
        T.expect(new List<Object>{ 1, 2 }).toEqual(T.listContaining(new List<Object>{ 1 }));
    }

    @isTest
    private static void randomBooleanTest() {
        Boolean result = (Boolean)Random.anyBoolean.run(50);
        T.expect(true).toBe(true);
    }

    @isTest
    private static void randomIntegerTest() {
        Integer result = (Integer)Random.anyInteger.run(10, 20);
        T.expect(result).toBeGreaterThan(9);
        T.expect(result).toBeLessThan(20);
    }

    @isTest
    private static void randomLongTest() {
        Long result = (Long)Random.anyLong.run(10, 20);
        T.expect(result).toBeGreaterThan(9);
        T.expect(result).toBeLessThan(20);
    }

    @isTest
    private static void randomDoubleTest() {
        Double result = (Double)Random.anyDouble.run(10, 20);
        T.expect(result).toBeGreaterThan(9);
        T.expect(result).toBeLessThan(20);
    }

    @isTest
    private static void randomDecimalTest() {
        Decimal result = (Decimal)Random.anyDecimal.run(10, 20);
        T.expect(result).toBeGreaterThan(9);
        T.expect(result).toBeLessThan(20);
    }

    @isTest
    private static void randomCharTest() {
        String ch = (String)Random.anyChar.run();
        T.expect(ch).never.toBeNull();
    }

    @isTest
    private static void randomStringTest() {
        String str = (String)Random.anyString.run();
        T.expect(str).never.toBeNull();
    }

    @isTest
    private static void randomTest() {
        Object val = Random.anyObject.run();
        T.expect(val).toBeNull();

        val = Random.anyObject.run(new Map<String, Object>{ 'type' => 'Account' });
        T.expect(val).never.toBeNull();
    }

    @isTest
    private static void randomListTest() {
        List<Object> mList = (List<Object>)Random.anyList.run(new Map<String, Object>{
            'min' => 1,
            'type' => 'String'
        });

        T.expect(mList.get(0) instanceof String).toBe(true);
    }

    @isTest
    private static void randomSetTest() {
        Set<String> mSet = (Set<String>)Random.anySet.run(new Map<String, Object>{
            'min' => 1
        });

        for(String s : mSet) {
            T.expect(s).never.toBeNull();
        }
    }

    @isTest
    private static void randomMapTest() {
        Map<String, Object> mMap = (Map<String, Object>)Random.anyMap.run(new Map<String, Object>{
            'pool' => new Map<String, Object>{ 'name' => 'test' },
            'min' => 1
        });

        T.expect(mMap.size()).toBe(1);
    }

    @isTest
    private static void randomDateTest() {
        Date d = (Date)Random.anyDate.run();

        T.expect(d).never.toBeNull();
    }

    @isTest
    private static void randomTimeTest() {
        Time d = (Time)Random.anyTime.run();

        T.expect(d).never.toBeNull();
    }

    @isTest
    private static void randomDatetimeTest() {
        Datetime d = (Datetime)Random.anyDatetime.run();

        T.expect(d).never.toBeNull();
    }

    @isTest
    private static void randomSyllableTest() {
        String s = (String)Random.anySyllable.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomWordTest() {
        String s = (String)Random.anyWord.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomSentenceTest() {
        String s = (String)Random.anySentence.run();

        T.expect(s).never.toBeNull();
        T.expect(s).toMatch('.*\\.$');
    }

    @isTest
    private static void randomParagraphTest() {
        String s = (String)Random.anyParagraph.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomGenderTest() {
        String s = (String)Random.anyGender.run();

        T.expect(new List<String>{ 'Male', 'Female' }).toContain(s);
    }

    @isTest
    private static void randomFirstnameTest() {
        String s = (String)Random.anyFirstname.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomLastnameTest() {
        String s = (String)Random.anyLastname.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomPrefixTest() {
        String s = (String)Random.anyPrefix.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomSuffixTest() {
        String s = (String)Random.anySuffix.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomNameTest() {
        String s = (String)Random.anyName.run();

        T.expect(s).never.toBeNull();
    }

    @isTest
    private static void randomEmailTest() {
        String s = (String)Random.anyEmail.run();

        T.expect(s).never.toBeNull();
        T.expect(s).toMatch('.*@.*');
    }

    @isTest
    private static void randomSObjectTest() {
        SObject obj = (SObject)Random.anySObject.run(new Map<String, Object>{
            'type' => 'Account'
        });

        T.expect(obj).never.toBeNull();
    }

    @isTest
    private static void createObjectTest() {
        Object obj = T.create('Account');

        T.expect(obj).never.toBeNull();
    }

    @isTest
    private static void fieldOverrideTest() {
        Object obj = T.createSObject('Account', new Map<String, Object>{
            'fields' => new List<String>{ 'Description' }
        });

        T.expect(obj).never.toBeNull();

        obj = T.createSObject('Account', new Map<String, Object>{
            'fields' => new Map<String, Object>{
                'Description' => 'Test desc'
            }
        });

        T.expect(obj).never.toBeNull();
    }
}
